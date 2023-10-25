using System;
using System.Linq;
using System.Threading.Tasks;
using Infrastructure;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;


namespace donkeymove.App
{
    public class SysMessageApp : BaseStringApp<SysMessage,donkeymoveDBContext>
    {
        private RevelanceManagerApp _revelanceApp;
        private readonly ILogger<SysMessageApp> _logger;

        /// <summary>
        /// 加載列表
        /// </summary>
        public async Task<TableData> Load(QuerySysMessageListReq request)
        {
            var loginContext = _auth.GetCurrentUser();
            if (loginContext == null)
            {
                throw new CommonException("登錄已過期", Define.INVALID_TOKEN);
            }

            var result = new TableData();
            var objs = UnitWork.Find<SysMessage>(u =>u.ToId == loginContext.User.Id && u.ToStatus != -1);

            if (!string.IsNullOrEmpty(request.key))
            {
                objs = objs.Where(u => u.Title.Contains(request.key) || u.Id.Contains(request.key));
            }
            
            //過濾消息狀態
            if (request.Status != 999)
            {
                objs = objs.Where(u => u.ToStatus == request.Status);
            }

            result.data =await objs.OrderByDescending(u => u.CreateTime)
                .Skip((request.page - 1) * request.limit)
                .Take(request.limit).ToListAsync();
            result.count = await objs.CountAsync();
            return result;
        }

        public void Add(SysMessage obj)
        {
            Repository.Add(obj);
        }

        /// <summary>
        /// 發送指定消息給用戶
        /// </summary>
        /// <param name="user"></param>
        /// <param name="message"></param>
        public void SendMsgTo(string userId, string message)
        {
            User user = null;
            if (userId == Guid.Empty.ToString())
            {
                user = new User
                {
                    Name = Define.SYSTEM_USERNAME,
                    Id = userId
                };
            }
            else
            {
                 user = UnitWork.FirstOrDefault<User>(u => u.Id == userId);
            }
            if (user == null)
            {
                _logger.LogError($"未能找到用戶{userId},不能給該用戶發送消息");
                return;
            }
            Repository.Add(new SysMessage
            {
                ToId = user.Id,
                ToName = user.Name,
                TypeName = "系統消息",
                TypeId ="SYS_MSG",
                FromId = Guid.Empty.ToString(),
                FromName = "系統管理員",
                Content = message,
                CreateTime = DateTime.Now
            });
        }

        /// <summary>
        /// 消息變為已讀
        /// </summary>
        /// <param name="msgid"></param>
        public void Read(ReadMsgReq req)
        {
            UnitWork.Update<SysMessage>(u => u.Id == req.Id, u => new SysMessage
            {
                ToStatus = 1
            });
        }
        /// <summary>
        /// 消息采用邏輯刪除
        /// </summary>
        /// <param name="ids"></param>
        public void Del(string[] ids)
        {
            UnitWork.Update<SysMessage>(u => ids.Contains(u.Id), u => new SysMessage
            {
               ToStatus = -1 //邏輯刪除
            });

        }

        public SysMessageApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<SysMessage,donkeymoveDBContext> repository,
            RevelanceManagerApp app,IAuth auth, ILogger<SysMessageApp> logger) : base(unitWork, repository, auth)
        {
            _revelanceApp = app;
            _logger = logger;
        }
    }
}
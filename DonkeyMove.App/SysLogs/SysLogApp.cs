using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;


namespace donkeymove.App
{
    public class SysLogApp : BaseStringApp<SysLog,donkeymoveDBContext>
    {

        /// <summary>
        /// 加載列表
        /// </summary>
        public async Task<TableData> Load(QuerySysLogListReq request)
        {
            var result = new TableData();
            var objs = UnitWork.Find<SysLog>(null);
            if (!string.IsNullOrEmpty(request.key))
            {
                objs = objs.Where(u => u.Content.Contains(request.key) || u.Id.Contains(request.key));
            }

            result.data = await objs.OrderByDescending(u => u.CreateTime)
                .Skip((request.page - 1) * request.limit)
                .Take(request.limit).ToListAsync();
            result.count = await objs.CountAsync();
            return result;
        }

        public void Add(SysLog obj)
        {
            //程序類型取入口應用的名稱，可以根據自己需要調整
            obj.Application = Assembly.GetEntryAssembly().FullName.Split(',')[0];
            Repository.Add(obj);
        }
        
        public void Update(SysLog obj)
        {
            UnitWork.Update<SysLog>(u => u.Id == obj.Id, u => new SysLog
            {
               //todo:要修改的字段賦值
            });

        }

        public SysLogApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<SysLog,donkeymoveDBContext> repository) : base(unitWork, repository, null)
        {
        }
    }
}
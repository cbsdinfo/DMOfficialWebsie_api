using System.Threading.Tasks;
using Infrastructure;
using Microsoft.EntityFrameworkCore;
using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;


namespace donkeymove.App
{
    public class FrmLeaveReqApp : BaseStringApp<FrmLeaveReq,donkeymoveDBContext>, ICustomerForm
    {
        private RevelanceManagerApp _revelanceApp;

        /// <summary>
        /// 加載列表
        /// </summary>
        public async Task<TableData> Load(QueryFrmLeaveReqListReq request)
        {
             return new TableData
            {
                count = await Repository.CountAsync(null),
                data = await Repository.Find(request.page, request.limit, "Id desc").ToListAsync()
            };
        }

        public void Add(FrmLeaveReq obj)
        {
            Repository.Add(obj);
        }
        
        public FrmLeaveReqApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<FrmLeaveReq,donkeymoveDBContext> repository,
            RevelanceManagerApp app,IAuth auth) : base(unitWork, repository, auth)
        {
            _revelanceApp = app;
        }

        public void Add(string flowInstanceId, string frmData)
        {
            var req = JsonHelper.Instance.Deserialize<FrmLeaveReq>(frmData);
            req.FlowInstanceId = flowInstanceId;
            Add(req);
        }

        public void Update(string flowInstanceId, string frmData)
        {
            var req = JsonHelper.Instance.Deserialize<FrmLeaveReq>(frmData);
            UnitWork.Update<FrmLeaveReq>(u => u.FlowInstanceId == flowInstanceId, u => new FrmLeaveReq
            {
                UserName = req.UserName,
                RequestComment = req.RequestComment,
                RequestType = req.RequestType
                //補充其他需要更新的字段
            });
        }
    }
}
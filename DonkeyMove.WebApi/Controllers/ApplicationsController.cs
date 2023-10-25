using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using donkeymove.App;
using donkeymove.App.Request;
using donkeymove.App.Response;

namespace donkeymove.WebApi.Controllers
{
    /// <summary>
    /// 應用管理
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "應用管理_Applications")]
    public class ApplicationsController : ControllerBase
    {
        private readonly AppManager _app;

        public ApplicationsController(AppManager app) 
        {
            _app = app;
        }
        /// <summary>
        /// 加載應用列表
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<TableData> Load([FromQuery]QueryAppListReq request)
        {
            var applications =await _app.GetList(request);
            return new TableData
            {
                data = applications,
                count = applications.Count
            };
        }

    }
}
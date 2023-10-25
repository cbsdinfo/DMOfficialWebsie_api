using System;
using System.Threading.Tasks;
using Infrastructure;
using Microsoft.AspNetCore.Mvc;
using donkeymove.App;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository.Domain;

namespace donkeymove.WebApi.Controllers
{
    /// <summary>
    /// 系統日志
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "系統日志_SysLogs")]
    public class SysLogsController : ControllerBase
    {
        private readonly SysLogApp _app;
        
        //獲取詳情
        [HttpGet]
        public Response<SysLog> Get(string id)
        {
            var result = new Response<SysLog>();
            try
            {
                result.Result = _app.Get(id);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 添加
        /// </summary>
       [HttpPost]
        public Response Add(SysLog obj)
        {
            var result = new Response();
            try
            {
                _app.Add(obj);

            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }
        
        /// <summary>
        /// 修改日志（建議廢棄）
        /// </summary>
        [HttpPost]
        public Response Update(SysLog obj)
        {
            var result = new Response();
            try
            {
                _app.Update(obj);

            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 加載列表
        /// </summary>
        [HttpGet]
        public async Task<TableData> Load([FromQuery]QuerySysLogListReq request)
        {
            return await _app.Load(request);
        }

        /// <summary>
        /// 批量刪除
        /// </summary>
       [HttpPost]
        public Response Delete([FromBody]string[] ids)
        {
            var result = new Response();
            try
            {
                _app.Delete(ids);

            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        public SysLogsController(SysLogApp app) 
        {
            _app = app;
        }
    }
}

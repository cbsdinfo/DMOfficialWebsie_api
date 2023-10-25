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
    /// 數據權限控制
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "數據權限_DataPrivilegeRules")]
    public class DataPrivilegeRulesController : ControllerBase
    {
        private readonly DataPrivilegeRuleApp _app;
        
        /// <summary>
        /// 獲取數據權限詳情
        /// </summary>
        /// <param name="id">數據權限id</param>
        /// <returns></returns>
        [HttpGet]
        public Response<DataPrivilegeRule> Get(string id)
        {
            var result = new Response<DataPrivilegeRule>();
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
        /// 添加數據權限
        /// </summary>
        /// <returns></returns>
       [HttpPost]
        public Response Add(AddOrUpdateDataPriviReq obj)
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
        /// 修改數據權限
        /// </summary>
        /// <returns></returns>
       [HttpPost]
        public Response Update(AddOrUpdateDataPriviReq obj)
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
        public async Task<TableData> Load([FromQuery]QueryDataPrivilegeRuleListReq request)
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

        public DataPrivilegeRulesController(DataPrivilegeRuleApp app) 
        {
            _app = app;
        }
    }
}

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
    /// 表單操作
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "表單_Forms")]
    public class FormsController : ControllerBase
    {
        private readonly FormApp _app;

        /// <summary>
        /// 獲取表單
        /// </summary>
        /// <param name="id">表單ID</param>
        /// <param name="canWriteFormItemIds">針對動態表單項讀寫控制</param>
        /// <returns></returns>
        [HttpGet]
        public Response<FormResp> Get(string id, string canWriteFormItemIds)
        {
            var result = new Response<FormResp>();
            try
            {
                result.Result = _app.FindSingle(id);

                if (!string.IsNullOrEmpty(canWriteFormItemIds))
                {
                    result.Result.CanWriteFormItemIds = JsonHelper.Instance.Deserialize<string[]>(canWriteFormItemIds);
                }
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        //添加或修改
       [HttpPost]
        public Response Add(Form obj)
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

        //添加或修改
       [HttpPost]
        public Response Update(Form obj)
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
        public async Task<TableData> Load([FromQuery]QueryFormListReq request)
        {
            return await _app.Load(request);
        }

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

        public FormsController(FormApp app) 
        {
            _app = app;
        }
    }
}
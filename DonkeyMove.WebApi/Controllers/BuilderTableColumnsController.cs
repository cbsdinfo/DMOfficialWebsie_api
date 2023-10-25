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
    /// 代碼生成器表字段結構
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "代碼生成器_字段_BuilderTableColumns")]
    public class BuilderTableColumnsController : ControllerBase
    {
        private readonly BuilderTableColumnApp _app;
        
        //獲取詳情
        [HttpGet]
        public Response<BuilderTableColumn> Get(string id)
        {
            var result = new Response<BuilderTableColumn>();
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
        

        //修改
       [HttpPost]
        public Response Update(AddOrUpdateBuilderTableColumnReq obj)
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
        /// 同步數據結構
        /// <para>讀取數據庫結構與當前結構的差異，如果數據庫有新增的字段，則自動加入</para>
        /// </summary>
        [HttpPost]
        public Response Sync(SyncStructureReq obj)
        {
            var result = new Response();
            try
            {
                _app.Sync(obj);

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
        public async Task<TableResp<BuilderTableColumn>> Load([FromQuery]QueryBuilderTableColumnListReq request)
        {
            var tableResp = await _app.Load(request);
            return tableResp;
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

        public BuilderTableColumnsController(BuilderTableColumnApp app) 
        {
            _app = app;
        }
    }
}

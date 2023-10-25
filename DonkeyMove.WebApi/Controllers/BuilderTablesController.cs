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
    /// 代碼生成器相關操作
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "代碼生成器_表_BuilderTables")]
    public class BuilderTablesController : ControllerBase
    {
        private readonly BuilderTableApp _app;
        
        /// <summary>
        /// 創建一個代碼生成的模版
        /// <para>會自動創建字段明細信息，添加成功后使用BuilderTableColumnsController.Load加載字段明細</para>
        /// <returns>返回添加的模版ID</returns>
        /// </summary>
       [HttpPost]
        public Response<string> Add(AddOrUpdateBuilderTableReq obj)
        {
            var result = new Response<string>();
            try
            {
                result.Result = _app.Add(obj);

            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 只修改表信息，不會更新明細
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
       [HttpPost]
        public Response Update(AddOrUpdateBuilderTableReq obj)
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
        public async Task<TableResp<BuilderTable>> Load([FromQuery]QueryBuilderTableListReq request)
        {
            return await _app.Load(request);
        }
        
        /// <summary>
        /// 加載所有的主表（parentId為空的）
        /// </summary>
        [HttpGet]
        public async Task<TableData> AllMain()
        {
            return await _app.AllMain();
        }

        /// <summary>
        /// 批量刪除代碼生成模版和對應的字段信息
        /// </summary>
       [HttpPost]
        public Response Delete([FromBody]string[] ids)
        {
            var result = new Response();
            try
            {
                _app.DelTableAndcolumns(ids);

            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }
        
        /// <summary>
        /// 創建實體
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        [HttpPost]
        public Response CreateEntity(CreateEntityReq obj)
        {
            var result = new Response();
            try
            {
                _app.CreateEntity(obj);

            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }
        
        /// <summary>
        /// 創建業務邏輯層
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        [HttpPost]
        public Response CreateBusiness(CreateBusiReq obj)
        {
            var result = new Response();
            try
            {
                _app.CreateBusiness(obj);

            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }
        
        /// <summary>
        /// 創建vue界面
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        [HttpPost]
        public Response CreateVue(CreateVueReq obj)
        {
            var result = new Response();
            try
            {
                _app.CreateVue(obj);
                _app.CreateVueApi(obj);

            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        public BuilderTablesController(BuilderTableApp app) 
        {
            _app = app;
        }
    }
}

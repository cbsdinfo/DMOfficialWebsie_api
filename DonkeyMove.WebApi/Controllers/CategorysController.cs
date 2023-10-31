using System;
using System.Threading.Tasks;
using Infrastructure;
using Microsoft.AspNetCore.Mvc;
using donkeymove.App;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository.Domain;
using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;

namespace donkeymove.WebApi.Controllers
{
    /// <summary>
    /// 分類（字典）管理
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "分類字典_Categorys")]
    public class CategorysController : ControllerBase
    {
        private readonly CategoryApp _app;

        /// <summary>
        /// 獲取分類詳情
        /// </summary>
        /// <param name="id">分類id</param>
        /// <returns></returns>
        [HttpGet]
        public Response<Category> Get(string id)
        {
            var result = new Response<Category>();
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
        /// 獲取分類集合 By TypdId
        /// </summary>
        /// <param name="TypeId">分類id</param>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        public Response<List<Category>> LoadByTypeId(string TypeId)
        {
            var result = new Response<List<Category>>();
            try
            {
                result.Result = _app.LoadByTypeId(TypeId);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }
        

        /// <summary>
        /// 添加分類
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public Response<string> Add([FromBody] AddOrUpdateCategoryReq obj)
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
        /// 修改分類（字典）
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public Response Update(AddOrUpdateCategoryReq obj)
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
        public async Task<TableData> Load([FromQuery] QueryCategoryListReq request)
        {
            return await _app.Load(request);
        }

        /// <summary>
        /// 批量刪除
        /// </summary>
        [HttpPost]
        public Response Delete([FromBody] string[] ids)
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

        public CategorysController(CategoryApp app)
        {
            _app = app;
        }
    }
}

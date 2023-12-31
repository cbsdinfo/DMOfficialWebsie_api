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
    /// 字典所屬分類管理
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "字典所屬分類_CategoryTypes")]
    public class CategoryTypesController : ControllerBase
    {
        private readonly CategoryTypeApp _app;

        public CategoryTypesController(CategoryTypeApp app)
        {
            _app = app;
        }

        //添加
        [HttpGet]
        [AllowAnonymous]
        public Response<List<CategoryType>> GetList([FromQuery] AddOrUpdateCategoryTypeReq obj)
        {
            var result = new Response<List<CategoryType>>();
            try
            {
                result.Result = _app.GetList(obj);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        //添加
        [HttpPost]
        public Response<string> Add([FromBody]AddOrUpdateCategoryTypeReq obj)
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

        //修改
        [HttpPost]
        public Response Update(AddOrUpdateCategoryTypeReq obj)
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
        public async Task<TableData> Load([FromQuery] QueryCategoryTypeListReq request)
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
    }
}
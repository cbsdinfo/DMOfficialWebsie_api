using System;
using System.Collections.Generic;
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
    /// 角色操作
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "角色管理_Roles")]
    public class RolesController : ControllerBase
    {
        private readonly RoleApp _app;
        private readonly RevelanceManagerApp _revelanceManagerApp;
        public RolesController(RevelanceManagerApp revelanceManagerApp, RoleApp app) 
        {
            _revelanceManagerApp = revelanceManagerApp;
            _app = app;
        }

        [HttpGet]
        public Response<Role> Get(string id)
        {
            var result = new Response<Role>();
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
        /// 添加角色，如果當前登錄用戶不是System，則直接把新角色分配給當前登錄用戶
        /// </summary>
        [HttpPost]
        public Response<RoleView> Add(RoleView obj)
        {
            var result = new Response<RoleView>();
            try
            {
                _app.Add(obj);
                result.Result = obj;

            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }
        
        /// <summary>
        /// 更新角色屬性
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
       [HttpPost]
        public Response Update(RoleView obj)
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
        /// 獲取所有的角色
        /// 為了控制權限，通常只用于流程實例選擇執行角色，其他地方請使用Load
        /// </summary>
        [HttpGet]
        public async Task<TableResp<Role>> LoadAll([FromQuery]QueryRoleListReq request)
        {
            return await _app.LoadAll(request);
        }

        /// <summary>
        /// 獲取登錄用戶可以訪問的角色
        /// </summary>
        [HttpGet]
        public Response<List<Role>> Load([FromQuery]QueryRoleListReq request)
        {
            var result = new Response<List<Role>>();
            try
            {
                result.Result = _app.Load(request);

            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 加載用戶的角色
        /// </summary>
        [HttpGet]
        public Response<List<string>> LoadForUser(string userId)
        {
            var result = new Response<List<string>>();
            try
            {
                result.Result = _revelanceManagerApp.Get(Define.USERROLE, true, userId);
            }
            catch (Exception e)
            {
                result.Code = 500;
                result.Message = e.InnerException?.Message ?? e.Message;
            }

            return result;
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
    }
}
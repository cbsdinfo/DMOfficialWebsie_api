
using System;
using Infrastructure;
using Microsoft.AspNetCore.Mvc;
using donkeymove.App;
using donkeymove.App.Interface;
using donkeymove.App.Request;

namespace donkeymove.WebApi.Controllers
{
    /// <summary>
    /// 分配資源/分配字段等
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "分配資源_AccessObjs")]
    public class AccessObjsController : ControllerBase
    {
        private readonly RevelanceManagerApp _app;
        private readonly IAuth _authUtil;
        public AccessObjsController(IAuth authUtil, RevelanceManagerApp app) 
        {
            _app = app;
            _authUtil = authUtil;
        }

        /// <summary>
        /// 添加關聯
        /// <para>比如給用戶分配資源，那么firstId就是用戶ID，secIds就是資源ID列表</para>
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public Response Assign(AssignReq request)
        {
            var result = new Response();
            try
            {
                _app.Assign(request);
            }
            catch (Exception ex)
            {
                  result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }
        /// <summary>
        /// 取消關聯
        /// </summary>
        [HttpPost]
        public Response UnAssign(AssignReq request)
        {
            var result = new Response();
            try
            {
                _app.UnAssign(request);
            }
            catch (Exception ex)
            {
                  result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }
        
        /// <summary>
        /// 角色分配數據字段權限
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public Response AssignDataProperty(AssignDataReq request)
        {
            var result = new Response();
            try
            {
                _app.AssignData(request);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }
        /// <summary>
        /// 取消角色的數據字段權限
        /// <para>如果Properties為空，則把角色的某一個模塊權限全部刪除</para>
        /// <para>如果moduleId為空，直接把角色的所有授權刪除</para>
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        private static string lockobj = "lock";
        [HttpPost]
        public Response UnAssignDataProperty(AssignDataReq request)
        {
            var result = new Response();
            try
            {
                lock (lockobj)
                {
                    _app.UnAssignData(request);
                }
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }
        
        
        /// <summary>
        /// 角色分配用戶，整體提交，會覆蓋之前的配置
        /// </summary>
        [HttpPost]
        public Response AssignRoleUsers(AssignRoleUsers request)
        {
            var result = new Response();
            try
            {
                _app.AssignRoleUsers(request);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }
        
        /// <summary>
        /// 部門分配用戶，整體提交，會覆蓋之前的配置
        /// </summary>
        [HttpPost]
        public Response AssignOrgUsers(AssignOrgUsers request)
        {
            var result = new Response();
            try
            {
                _app.AssignOrgUsers(request);
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
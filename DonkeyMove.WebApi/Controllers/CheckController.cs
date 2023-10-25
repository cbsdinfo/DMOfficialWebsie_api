using Infrastructure;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using donkeymove.App;
using donkeymove.App.Interface;
using donkeymove.App.Response;
using donkeymove.App.SSO;
using donkeymove.Repository.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using Infrastructure.Helpers;
using Microsoft.Extensions.Logging;
using StackExchange.Profiling;

namespace donkeymove.WebApi.Controllers
{
    /// <inheritdoc />
    /// <summary>
    /// 登錄及與登錄信息獲取相關的接口
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "登錄驗證_Check")]
    public class CheckController : ControllerBase
    {
        private readonly IAuth _authUtil;
        private ILogger _logger;
        private AuthStrategyContext _authStrategyContext;

        public CheckController(IAuth authUtil, ILogger<CheckController> logger)
        {
            _authUtil = authUtil;
            _logger = logger;
            _authStrategyContext = _authUtil.GetCurrentUser();
        }

        /// <summary>
        /// 獲取登錄用戶資料
        /// </summary>
        /// <returns></returns>
        [HttpGet]  
        public Response<UserView> GetUserProfile()
        {
            var resp = new Response<UserView>();
            try
            {
                resp.Result = _authStrategyContext.User.MapTo<UserView>();
            }
            catch (Exception e)
            {
                resp.Code = 500;
                resp.Message = e.Message;
            }

            return resp;
        }

        /// <summary>
        /// 檢驗token是否有效
        /// </summary>
        /// <param name="token">The token.</param>
        /// <param name="requestid">備用參數.</param>
        [HttpGet]
        public Response<bool> GetStatus()
        {
            var result = new Response<bool>();
            try
            {
                result.Result = _authUtil.CheckLogin();
            }
            catch (Exception ex)
            {
                result.Code = Define.INVALID_TOKEN;
                result.Message = ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 獲取登錄用戶的所有可訪問的角色
        /// </summary>
        [HttpGet]
        public Response<List<Role>> GetRoles()
        {
            var result = new Response<List<Role>>();
            try
            {
                result.Result = _authStrategyContext.Roles;
            }
            catch (CommonException ex)
            {
                if (ex.Code == Define.INVALID_TOKEN)
                {
                    result.Code = ex.Code;
                    result.Message = ex.Message;
                }
                else
                {
                    result.Code = 500;
                    result.Message = ex.InnerException != null
                        ? "donkeymove.WebAPI數據庫訪問失敗:" + ex.InnerException.Message
                        : "donkeymove.WebAPI數據庫訪問失敗:" + ex.Message;
                }
            }

            return result;
        }

        /// <summary>
        /// 獲取當前登錄用戶可訪問的字段
        /// </summary>
        /// <param name="moduleCode">模塊的Code，如Category</param>
        /// <returns></returns>
        [HttpGet]
        public Response<List<BuilderTableColumn>> GetProperties(string moduleCode)
        {
            var result = new Response<List<BuilderTableColumn>>();
            try
            {
                result.Result = _authStrategyContext.GetTableColumns(moduleCode);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 獲取登錄用戶的所有可訪問的組織信息
        /// </summary>
        [HttpGet]
        public Response<List<SysOrg>> GetOrgs()
        {
            var result = new Response<List<SysOrg>>();
            try
            {
                result.Result = _authStrategyContext.Orgs;
            }
            catch (CommonException ex)
            {
                if (ex.Code == Define.INVALID_TOKEN)
                {
                    result.Code = ex.Code;
                    result.Message = ex.Message;
                }
                else
                {
                    result.Code = 500;
                    result.Message = ex.InnerException != null
                        ? "donkeymove.WebAPI數據庫訪問失敗:" + ex.InnerException.Message
                        : "donkeymove.WebAPI數據庫訪問失敗:" + ex.Message;
                }
            }

            return result;
        }

        /// <summary>
        /// 加載機構的全部下級機構
        /// </summary>
        /// <param name="orgId">機構ID</param>
        /// <returns></returns>
        [HttpGet]
        public TableData GetSubOrgs(string orgId)
        {
            string cascadeId = ".0.";
            if (!string.IsNullOrEmpty(orgId))
            {
                var org = _authStrategyContext.Orgs.SingleOrDefault(u => u.Id == orgId);
                if (org == null)
                {
                    return new TableData
                    {
                        msg = "未找到指定的節點",
                        code = 500,
                    };
                }
                cascadeId = org.CascadeId;
            }

            var query = _authStrategyContext.Orgs
                .Where(u => u.CascadeId.Contains(cascadeId))
                .OrderBy(u => u.CascadeId);

            return new TableData
            {
                data = query.ToList(),
                count = query.Count(),
            };
        }

        /// <summary>
        /// 獲取登錄用戶的所有可訪問的模塊及菜單，以列表形式返回結果
        /// </summary>
        [HttpGet]
        public Response<List<ModuleView>> GetModules()
        {
            var result = new Response<List<ModuleView>>();
            try
            {
                result.Result = _authStrategyContext.Modules;
            }
            catch (CommonException ex)
            {
                if (ex.Code == Define.INVALID_TOKEN)
                {
                    result.Code = ex.Code;
                    result.Message = ex.Message;
                }
                else
                {
                    result.Code = 500;
                    result.Message = ex.InnerException != null
                        ? "donkeymove.WebAPI數據庫訪問失敗:" + ex.InnerException.Message
                        : "donkeymove.WebAPI數據庫訪問失敗:" + ex.Message;
                }
            }

            return result;
        }

        /// <summary>
        /// 獲取登錄用戶的所有可訪問的模塊及菜單，以樹狀結構返回
        /// </summary>
        [HttpGet]
        public Response<IEnumerable<TreeItem<ModuleView>>> GetModulesTree()
        {
            var result = new Response<IEnumerable<TreeItem<ModuleView>>>();
            try
            {
                result.Result = _authStrategyContext.Modules.GenerateTree(u => u.Id, u => u.ParentId);
            }
            catch (CommonException ex)
            {
                if (ex.Code == Define.INVALID_TOKEN)
                {
                    result.Code = ex.Code;
                    result.Message = ex.Message;
                }
                else
                {
                    result.Code = 500;
                    result.Message = ex.InnerException != null
                        ? "donkeymove.WebAPI數據庫訪問失敗:" + ex.InnerException.Message
                        : "donkeymove.WebAPI數據庫訪問失敗:" + ex.Message;
                }
            }

            return result;
        }

        /// <summary>
        /// 獲取登錄用戶的所有可訪問的資源
        /// </summary>
        [HttpGet]
        public Response<List<Resource>> GetResources()
        {
            var result = new Response<List<Resource>>();
            try
            {
                result.Result = _authStrategyContext.Resources;
            }
            catch (CommonException ex)
            {
                if (ex.Code == Define.INVALID_TOKEN)
                {
                    result.Code = ex.Code;
                    result.Message = ex.Message;
                }
                else
                {
                    result.Code = 500;
                    result.Message = ex.InnerException != null
                        ? "donkeymove.WebAPI數據庫訪問失敗:" + ex.InnerException.Message
                        : "donkeymove.WebAPI數據庫訪問失敗:" + ex.Message;
                }
            }

            return result;
        }

        /// <summary>
        /// 根據token獲取用戶名稱
        /// </summary>
        [HttpGet]
        public Response<string> GetUserName()
        {
            var result = new Response<string>();
            try
            {
                result.Result = _authStrategyContext.User.Account;
            }
            catch (CommonException ex)
            {
                if (ex.Code == Define.INVALID_TOKEN)
                {
                    result.Code = ex.Code;
                    result.Message = ex.Message;
                }
                else
                {
                    result.Code = 500;
                    result.Message = ex.InnerException != null
                        ? ex.InnerException.Message : ex.Message;
                }
            }

            return result;
        }

        /// <summary>
        /// 登錄接口
        /// </summary>
        /// <param name="request">登錄參數</param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        public LoginResult Login([FromBody]PassportLoginRequest request)
        {
            var result = new LoginResult();
            try
            {
                result = _authUtil.Login(request.AppKey, request.Account, request.Password);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 注銷登錄
        /// </summary>
        /// <param name="token"></param>
        /// <param name="requestid">備用參數.</param>
        [HttpPost]
        public Response<bool> Logout()
        {
            var resp = new Response<bool>();
            try
            {
                resp.Result = _authUtil.Logout();
            }
            catch (Exception e)
            {
                resp.Result = false;
                resp.Message = e.Message;
            }

            return resp;
        }
    }
}
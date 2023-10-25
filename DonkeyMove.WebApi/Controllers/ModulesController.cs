using System;
using System.Collections.Generic;
using System.Linq;
using Infrastructure;
using Microsoft.AspNetCore.Mvc;
using donkeymove.App;
using donkeymove.App.Interface;
using donkeymove.Repository.Domain;

namespace donkeymove.WebApi.Controllers
{
    /// <summary>
    /// 模塊及菜單管理
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "模塊菜單_Modules")]
    public class ModulesController : ControllerBase
    {
        private ModuleManagerApp _app;
        private IAuth _authUtil;
        public ModulesController(IAuth authUtil, ModuleManagerApp app)
        {
            _app = app;
            _authUtil = authUtil;
        }


        /// <summary>
        /// 加載角色模塊
        /// </summary>
        /// <param name="firstId">The role identifier.</param>
        /// <returns>System.String.</returns>
        [HttpGet]
        public Response<IEnumerable<Module>> LoadForRole(string firstId)
        {
            var result = new Response<IEnumerable<Module>>();
            try
            {
                result.Result = _app.LoadForRole(firstId);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 根據某角色ID獲取可訪問某模塊的菜單項
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public Response<IEnumerable<ModuleElement>> LoadMenusForRole(string moduleId, string firstId)
        {
            var result = new Response<IEnumerable<ModuleElement>>();
            try
            {
                result.Result = _app.LoadMenusForRole(moduleId, firstId);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
           
        }

        /// <summary>
        /// 獲取角色已經分配的字段
        /// </summary>
        /// <param name="roleId">角色id</param>
        /// <param name="moduleCode">模塊代碼，如Category</param>
        /// <returns></returns>
        [HttpGet]
        public Response<IEnumerable<string>> LoadPropertiesForRole(string roleId, string moduleCode)
        {
            var result = new Response<IEnumerable<string>>();
            try
            {
                result.Result = _app.LoadPropertiesForRole(roleId, moduleCode);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }
            return result;
        }

        /// <summary>
        /// 獲取發起頁面的菜單權限
        /// </summary>
        /// <returns>System.String.</returns>
        [HttpGet]
        public Response<List<ModuleElement>> LoadMenus(string moduleId)
        {
            var result = new Response<List<ModuleElement>>();
            try
            {
                var user = _authUtil.GetCurrentUser();
                if (string.IsNullOrEmpty(moduleId))
                {
                    result.Result = user.ModuleElements;
                }
                else
                {
                    var module = user.Modules.First(u => u.Id == moduleId);
                    if (module == null)
                    {
                        throw new Exception("模塊不存在");
                    }
                    result.Result = module.Elements;
                }
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }


        #region 添加編輯模塊

        //添加或修改
        [HttpPost]
        public Response<Module> Add(Module obj)
        {
            var result = new Response<Module>();
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

        //添加或修改
        [HttpPost]
        public Response Update(Module obj)
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

        #endregion 添加編輯模塊

        /// <summary>
        /// 新增菜單
        /// <para>當前登錄用戶的所有角色會自動分配菜單</para>
        /// </summary>
        [HttpPost]
        public Response<ModuleElement> AddMenu(ModuleElement obj)
        {
            var result = new Response<ModuleElement>();
            try
            {
                _app.AddMenu(obj);
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
        /// 修改菜單屬性
        /// </summary>
        [HttpPost]
        public Response UpdateMenu(ModuleElement obj)
        {
            var result = new Response();
            try
            {
                _app.UpdateMenu(obj);

            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }


        /// <summary>
        /// 刪除菜單
        /// </summary>
        [HttpPost]
        public Response DeleteMenu([FromBody]string[] ids)
        {
            var result = new Response();
            try
            {
                _app.DelMenu(ids);

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
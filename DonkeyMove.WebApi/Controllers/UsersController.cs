using System;
using System.Threading.Tasks;
using Infrastructure;
using Microsoft.AspNetCore.Mvc;
using donkeymove.App;
using donkeymove.App.Request;
using donkeymove.App.Response;

namespace donkeymove.WebApi.Controllers
{
    /// <summary>
    /// 用戶操作
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController] 
    [ApiExplorerSettings(GroupName = "用戶管理_Users")]
    public class UsersController : ControllerBase
    {
        private readonly UserManagerApp _app;

        [HttpGet]
        public Response<UserView> Get(string id)
        {
            var result = new Response<UserView>();
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
        /// 修改用戶資料
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public Response ChangeProfile(ChangeProfileReq request)
        {
            var result = new Response();
            
            try
            {
                _app.ChangeProfile(request);
                result.Message = "修改成功，重新登錄生效";
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 修改密碼
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public Response ChangePassword(ChangePasswordReq request)
        {
            var result = new Response();
            try
            {
                _app.ChangePassword(request);
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
        public Response<string> AddOrUpdate(UpdateUserReq obj)
        {
            var result = new Response<string>();
            try
            {
                _app.AddOrUpdate(obj);
                result.Result = obj.Id;   //返回ID
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
        /// 獲取當前登錄用戶可訪問的一個部門及子部門全部用戶
        /// </summary>
        [HttpGet]
        public async Task<TableData> Load([FromQuery]QueryUserListReq request)
        {
            return await _app.Load(request);
        }
        
        /// <summary>
        /// 獲取所有的用戶
        /// 為了控制權限，通常只用于流程實例選擇執行角色，其他地方請使用Load
        /// </summary>
        [HttpGet]
        public async Task<TableResp<UserView>> LoadAll([FromQuery]QueryUserListReq request)
        {
            return await _app.LoadAll(request);
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

        /// <summary>
        /// 加載指定角色的用戶
        /// </summary>
        [HttpGet]
        public async Task<TableData> LoadByRole([FromQuery]QueryUserListByRoleReq request)
        {
            return await _app.LoadByRole(request);
        }
        
        /// <summary>
        /// 加載指定部門的用戶
        /// 不包含下級部門的用戶
        /// </summary>
        [HttpGet]
        public async Task<TableData> LoadByOrg([FromQuery]QueryUserListByOrgReq request)
        {
            return await _app.LoadByOrg(request);
        }
        
        public UsersController(UserManagerApp app) 
        {
            _app = app;
        }
    }
}
using Infrastructure;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using donkeymove.App;

namespace donkeymove.WebApi.Controllers
{
    /// <summary>
    /// 系統配置信息
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "系統配置_SysConf")]
    public class SysConfController : ControllerBase
    {
        private IOptions<AppSetting> _appConfiguration;

        public SysConfController(IOptions<AppSetting> appConfiguration)
        {
            _appConfiguration = appConfiguration;
        }

        /// <summary>
        /// 是否Identity認證
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpGet]
        public Response<bool> IsIdentityAuth()
        {
            return new Response<bool>
            {
                Result = false
            };
        }
    }
}
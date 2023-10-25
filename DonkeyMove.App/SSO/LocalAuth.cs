using Infrastructure.Cache;
using Microsoft.AspNetCore.Http;
using donkeymove.App.Interface;
using System;
using Infrastructure;
using Microsoft.Extensions.Options;
using donkeymove.Repository.Domain;

namespace donkeymove.App.SSO
{
    /// <summary>
    /// 使用本地登錄。這個注入IAuth時，只需要donkeymove.Mvc一個項目即可，無需webapi的支持
    /// </summary>
    public class LocalAuth : IAuth
    {
        private IHttpContextAccessor _httpContextAccessor;
        private IOptions<AppSetting> _appConfiguration;
        private SysLogApp _logApp;

        private AuthContextFactory _app;
        private LoginParse _loginParse;
        private ICacheContext _cacheContext;

        public LocalAuth(IHttpContextAccessor httpContextAccessor
            , AuthContextFactory app
            , LoginParse loginParse
            , ICacheContext cacheContext, IOptions<AppSetting> appConfiguration, SysLogApp logApp)
        {
            _httpContextAccessor = httpContextAccessor;
            _app = app;
            _loginParse = loginParse;
            _cacheContext = cacheContext;
            _appConfiguration = appConfiguration;
            _logApp = logApp;
        }

        public bool CheckLogin(string token = "", string otherInfo = "")
        {
            if (string.IsNullOrEmpty(token))
            {
                token = GetToken();
            }

            if (string.IsNullOrEmpty(token))
            {
                return false;
            }

            try
            {
                var result = _cacheContext.Get<UserAuthSession>(token) != null;
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// 獲取當前登錄的用戶信息
        /// <para>通過URL中的Token參數或Cookie中的Token</para>
        /// </summary>
        /// <param name="account">The account.</param>
        /// <returns>LoginUserVM.</returns>
        public AuthStrategyContext GetCurrentUser()
        {
            AuthStrategyContext context = null;
            var user = _cacheContext.Get<UserAuthSession>(GetToken());
            if (user != null)
            {
                context = _app.GetAuthStrategyContext(user.Id);
            }
            return context;
        }

        /// <summary>
        /// 獲取當前登錄的用戶名
        /// <para>通過URL中的Token參數或Cookie中的Token</para>
        /// </summary>
        /// <param name="otherInfo">The account.</param>
        /// <returns>System.String.</returns>
        public string GetUserName(string otherInfo = "")
        {
            var user = _cacheContext.Get<UserAuthSession>(GetToken());
            if (user != null)
            {
                return user.Account;
            }

            return "";
        }

        /// <summary>
        /// 登錄接口
        /// </summary>
        /// <param name="appKey">應用程序key.</param>
        /// <param name="username">用戶名</param>
        /// <param name="pwd">密碼</param>
        /// <returns>System.String.</returns>
        public LoginResult Login(string appKey, string username, string pwd)
        {
            var result = _loginParse.Do(new PassportLoginRequest
            {
                AppKey = appKey,
                Account = username,
                Password = pwd
            });

            var log = new SysLog
            {
                Content = $"用戶登錄,結果：{result.Message}",
                Result = result.Code == 200 ? 0 : 1,
                CreateId = username,
                CreateName = username,
                TypeName = "登錄日志"
            };
            _logApp.Add(log);

            return result;
        }

        /// <summary>
        /// 注銷，如果是Identity登錄，需要在controller處理注銷邏輯
        /// </summary>
        public bool Logout()
        {
            var token = GetToken();
            if (String.IsNullOrEmpty(token)) return true;

            try
            {
                _cacheContext.Remove(token);
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// 如果是Identity，則返回信息為用戶賬號
        /// </summary>
        /// <returns></returns>
        private string GetToken()
        {
            string token = _httpContextAccessor.HttpContext.Request.Query[Define.TOKEN_NAME];
            if (!String.IsNullOrEmpty(token)) return token;

            token = _httpContextAccessor.HttpContext.Request.Headers[Define.TOKEN_NAME];
            if (!String.IsNullOrEmpty(token)) return token;

            var cookie = _httpContextAccessor.HttpContext.Request.Cookies[Define.TOKEN_NAME];
            return cookie ?? String.Empty;
        }
    }
}
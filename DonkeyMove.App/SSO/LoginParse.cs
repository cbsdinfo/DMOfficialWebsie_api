/*
 * 登錄解析
 * 處理登錄邏輯，驗證客戶段提交的賬號密碼，保存登錄信息
 */

using System;
using Infrastructure;
using Infrastructure.Cache;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;

namespace donkeymove.App.SSO
{
    public class LoginParse
    {
        //這個地方使用IRepository<User> 而不使用UserManagerApp是防止循環依賴
        public IRepository<User, donkeymoveDBContext> _app;

        private ICacheContext _cacheContext;
        private AppManager _appInfoService;

        public LoginParse(AppManager infoService, ICacheContext cacheContext, IRepository<User, donkeymoveDBContext> userApp)
        {
            _appInfoService = infoService;
            _cacheContext = cacheContext;
            _app = userApp;
        }

        public LoginResult Do(PassportLoginRequest model)
        {
            var result = new LoginResult();
            try
            {
                model.Trim();
                //todo:如果需要判定應用，可以取消該注釋
                // var appInfo = _appInfoService.GetByAppKey(model.AppKey);
                // if (appInfo == null)
                // {
                //     throw  new Exception("應用不存在");
                // }
                //獲取用戶信息
                User userInfo = null;
                if (model.Account == Define.SYSTEM_USERNAME)
                {
                    userInfo = new User
                    {
                        Id = "0000",
                        Account = Define.SYSTEM_USERNAME,
                        Name = "超級管理員",
                        Password = Define.SYSTEM_USERPWD
                    };
                }
                else
                {
                    userInfo = _app.FirstOrDefault(u => u.Account == model.Account);
                }

                if (userInfo == null)
                {
                    throw new Exception("用戶不存在");
                }
                if (userInfo.Password != model.Password)
                {
                    throw new Exception("密碼錯誤");
                }

                if (userInfo.Status != 0)
                {
                    throw new Exception("賬號狀態異常，可能已停用");
                }

                var currentSession = new UserAuthSession
                {
                    Id = userInfo.Id,
                    Account = model.Account,
                    Name = userInfo.Name,
                    Token = Guid.NewGuid().ToString().GetHashCode().ToString("x"),
                    AppKey = model.AppKey,
                    CreateTime = DateTime.Now
                    //    , IpAddress = HttpContext.Current.Request.UserHostAddress
                };

                //創建Session
                _cacheContext.Set(currentSession.Token, currentSession, DateTime.Now.AddDays(10));

                result.Code = 200;
                result.Token = currentSession.Token;
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.Message;
            }

            return result;
        }
    }
}
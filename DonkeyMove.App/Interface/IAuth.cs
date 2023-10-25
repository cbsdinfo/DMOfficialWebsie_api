/*
 *單獨提取這個接口，為了以下幾點：
 * 1、可以方便的實現webapi 和本地登錄相互切換
 * 2、可以方便的使用mock進行單元測試
 */

using donkeymove.App.SSO;

namespace donkeymove.App.Interface
{
    public interface IAuth
    {
        /// <summary>
        /// 檢驗token是否有效
        /// </summary>
        /// <param name="token">token值</param>
        /// <param name="otherInfo"></param>
        /// <returns></returns>
        bool CheckLogin(string token="", string otherInfo = "");
        AuthStrategyContext GetCurrentUser();
        string GetUserName(string otherInfo = "");
        /// <summary>
        /// 登錄接口
        /// </summary>
        /// <param name="appKey">登錄的應用appkey</param>
        /// <param name="username">用戶名</param>
        /// <param name="pwd">密碼</param>
        /// <returns></returns>
        LoginResult Login(string appKey, string username, string pwd);
        /// <summary>
        /// 退出登錄
        /// </summary>
        /// <returns></returns>
        bool Logout();
    }
}

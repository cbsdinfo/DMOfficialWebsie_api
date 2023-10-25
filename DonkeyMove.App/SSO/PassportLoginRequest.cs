using System;

namespace donkeymove.App.SSO
{

    public class PassportLoginRequest
    {
        /// <example>System</example>
        public string Account { get; set; }

        /// <example>123456</example>
        public string Password { get; set; }

        /// <summary>
        /// 應用的AppSecrect，目前沒判定可以隨便填一個。如果需要判定請根據注釋調整LoginParse.Do方法
        /// </summary>
        /// <example>donkeymove</example>
        public string AppKey { get; set; }

        public void Trim()
        {
            if (string.IsNullOrEmpty(Account))
            {
                throw new Exception("用戶名不能為空");
            }

            if (string.IsNullOrEmpty(Password))
            {
                throw new Exception("密碼不能為空");
            }
            Account = Account.Trim();
            Password = Password.Trim();
            if(!string.IsNullOrEmpty(AppKey)) AppKey = AppKey.Trim();
        }
    }
}
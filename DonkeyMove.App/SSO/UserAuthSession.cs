using System;

namespace donkeymove.App.SSO
{
    [Serializable]
    public class UserAuthSession
    {
        public string Id { get; set; }
        public string Token { get; set; }

        public string AppKey { get; set; }

        /// <summary>
        /// 用戶賬號
        /// </summary>
        public string Account { get; set; }

        /// <summary>
        /// 用戶名
        /// </summary>
        public string Name { get; set; }

        public string IpAddress { get; set; }

        public DateTime CreateTime { get; set; }
    }
}
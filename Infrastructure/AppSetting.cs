using System.Collections.Generic;

namespace Infrastructure
{
    /// <summary>
    /// 配置項
    /// </summary>
    public class AppSetting
    {
        public AppSetting()
        {
            SSOPassport = "http://localhost:52789";
            Version = "";
            UploadPath = "";
            IdentityServerUrl = "";
        }

        /// <summary>
        /// SSO地址
        /// </summary>
        public string SSOPassport { get; set; }

        /// <summary>
        /// 版本信息
        /// 如果為demo,則屏蔽Post請求
        /// </summary>
        public string Version { get; set; }

        /// <summary>
        /// 數據庫類型 SqlServer、MySql
        /// </summary>
        public Dictionary<string, string> DbTypes { get; set; }

        /// <summary> 附件上傳路徑</summary>
        public string UploadPath { get; set; }

        //identity授權的地址
        public string IdentityServerUrl { get; set; }

        /// <summary>
        /// Redis服務器配置
        /// </summary>
        public string RedisConf { get; set; }
    }
}
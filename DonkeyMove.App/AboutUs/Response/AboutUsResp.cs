using donkeymove.Repository.Core;
using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.Repository.Domain
{
    public class AboutUsResp 
    {
        /// <summary>
        /// 序號
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// 文章內容
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        public string CreateUserId { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        public System.DateTime UpdateTime { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        public string UpdateUserId { get; set; }
    }
}

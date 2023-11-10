using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Response
{
    public class ServiceTimesResp
    {
        /// <summary>
        /// 序號
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// 服務類型名稱
        /// </summary>
        public string ServiceName { get; set; }

        /// <summary>
        /// 服務次數
        /// </summary>
        public string NumberTimes { get; set; }

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

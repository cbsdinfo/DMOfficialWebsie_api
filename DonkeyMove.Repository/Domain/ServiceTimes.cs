using donkeymove.Repository.Core;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 首頁服務次數管理
    /// </summary>
    [Table("ServiceTimes")]
    public class ServiceTimes : StringEntity
    {
        public ServiceTimes() {
            this.ServiceName = string.Empty;
            this.NumberTimes = string.Empty;            
            this.CreateTime = DateTime.Now;
            this.CreateId = string.Empty;
            this.UpdateTime = DateTime.Now;
            this.UpdateId = string.Empty;
        }

        /// <summary>
        /// 服務類型名稱
        /// </summary>
        [Description("服務類型名稱")]
        public string ServiceName { get; set; }

        /// <summary>
        /// 服務次數
        /// </summary>
        [Description("服務次數")]
        public string NumberTimes { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("創建時間")]
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        [Description("創建人ID")]
        public string CreateId { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("修改時間")]
        public System.DateTime UpdateTime { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        [Description("修改人ID")]
        public string UpdateId { get; set; }
    }
}

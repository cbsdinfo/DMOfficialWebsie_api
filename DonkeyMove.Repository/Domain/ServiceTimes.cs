using donkeymove.Repository.Core;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 首頁服務次數管理
    /// </summary>
    [Table("ServiceTimes")]
    public partial class ServiceTimes : StringEntity
    {
        public ServiceTimes() {
            this.ServiceName = string.Empty;
            this.NumberTimes = string.Empty;            
            this.CreateTime = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.UpdateTime = DateTime.Now;
            this.UpdateUserId = string.Empty;
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
        public string CreateUserId { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("修改時間")]
        public System.DateTime UpdateTime { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        [Description("修改人ID")]
        public string UpdateUserId { get; set; }
    }
}

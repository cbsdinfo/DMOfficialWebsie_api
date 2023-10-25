using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 工作流實例操作記錄
    /// </summary>
    [Table("FlowInstanceOperationHistory")]
    public partial class FlowInstanceOperationHistory : StringEntity
    {
        public FlowInstanceOperationHistory()
        {
            this.InstanceId = string.Empty;
            this.Content = string.Empty;
            this.CreateDate = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.CreateUserName = string.Empty;
        }

        /// <summary>
        /// 實例進程Id
        /// </summary>
        [Description("實例進程Id")]
        public string InstanceId { get; set; }

        /// <summary>
        /// 操作內容
        /// </summary>
        [Description("操作內容")]
        public string Content { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("創建時間")]
        public System.DateTime CreateDate { get; set; }

        /// <summary>
        /// 創建用戶主鍵
        /// </summary>
        [Description("創建用戶主鍵")]
        public string CreateUserId { get; set; }

        /// <summary>
        /// 創建用戶
        /// </summary>
        [Description("創建用戶")]
        public string CreateUserName { get; set; }
    }
}
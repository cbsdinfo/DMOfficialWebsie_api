using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using Infrastructure.Const;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 工作流實例流轉歷史記錄
    /// </summary>
    [Table("FlowInstanceTransitionHistory")]
    public partial class FlowInstanceTransitionHistory : StringEntity
    {
        public FlowInstanceTransitionHistory()
        {
            this.InstanceId = string.Empty;
            this.FromNodeId = string.Empty;
            this.FromNodeName = string.Empty;
            this.ToNodeId = string.Empty;
            this.ToNodeName = string.Empty;
            this.TransitionSate = 0;
            this.IsFinish = FlowInstanceStatus.Running;
            this.CreateDate = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.CreateUserName = string.Empty;
        }

        /// <summary>
        /// 實例Id
        /// </summary>
        [Description("實例Id")]
        public string InstanceId { get; set; }

        /// <summary>
        /// 開始節點Id
        /// </summary>
        [Description("開始節點Id")]
        public string FromNodeId { get; set; }

        /// <summary>
        /// 開始節點類型
        /// </summary>
        [Description("開始節點類型")]
        public int? FromNodeType { get; set; }

        /// <summary>
        /// 開始節點名稱
        /// </summary>
        [Description("開始節點名稱")]
        public string FromNodeName { get; set; }

        /// <summary>
        /// 結束節點Id
        /// </summary>
        [Description("結束節點Id")]
        public string ToNodeId { get; set; }

        /// <summary>
        /// 結束節點類型
        /// </summary>
        [Description("結束節點類型")]
        public int? ToNodeType { get; set; }

        /// <summary>
        /// 結束節點名稱
        /// </summary>
        [Description("結束節點名稱")]
        public string ToNodeName { get; set; }

        /// <summary>
        /// 轉化狀態
        /// </summary>
        [Description("轉化狀態")]
        public int TransitionSate { get; set; }

        /// <summary>
        /// 是否結束
        /// </summary>
        [Description("是否結束")]
        public int IsFinish { get; set; }

        /// <summary>
        /// 轉化時間
        /// </summary>
        [Description("轉化時間")]
        public System.DateTime CreateDate { get; set; }

        /// <summary>
        /// 操作人Id
        /// </summary>
        [Description("操作人Id")]
        public string CreateUserId { get; set; }

        /// <summary>
        /// 操作人名稱
        /// </summary>
        [Description("操作人名稱")]
        public string CreateUserName { get; set; }
    }
}
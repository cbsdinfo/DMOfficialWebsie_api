using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
	/// 定時任務
	/// </summary>
    [Table("OpenJob")]
    public partial class OpenJob : StringEntity
    {
        public OpenJob()
        {
            this.JobName = string.Empty;
            this.RunCount = 0;
            this.ErrorCount = 0;
            this.NextRunTime = DateTime.Now;
            this.LastRunTime = DateTime.Now;
            this.LastErrorTime = DateTime.Now;
            this.JobType = 0;
            this.JobCall = string.Empty;
            this.JobCallParams = string.Empty;
            this.Cron = string.Empty;
            this.Status = 0;
            this.Remark = string.Empty;
            this.CreateTime = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.CreateUserName = string.Empty;
            this.UpdateTime = DateTime.Now;
            this.UpdateUserId = string.Empty;
            this.UpdateUserName = string.Empty;
            this.OrgId = string.Empty;
        }

        /// <summary>
        /// 任務名稱
        /// </summary>
        [Description("任務名稱")]
        public string JobName { get; set; }

        /// <summary>
        /// 任務執行次數
        /// </summary>
        [Description("任務執行次數")]
        public int RunCount { get; set; }

        /// <summary>
        /// 異常次數
        /// </summary>
        [Description("異常次數")]
        public int ErrorCount { get; set; }

        /// <summary>
        /// 下次執行時間
        /// </summary>
        [Description("下次執行時間")]
        public System.DateTime? NextRunTime { get; set; }

        /// <summary>
        /// 最后一次執行時間
        /// </summary>
        [Description("最后一次執行時間")]
        public System.DateTime? LastRunTime { get; set; }

        /// <summary>
        /// 最后一次失敗時間
        /// </summary>
        [Description("最后一次失敗時間")]
        public System.DateTime? LastErrorTime { get; set; }

        /// <summary>
        /// 任務執行方式0：本地任務；1：外部接口任務
        /// </summary>
        [Description("任務執行方式0：本地任務；1：外部接口任務")]
        public int JobType { get; set; }

        /// <summary>
        /// 任務地址
        /// </summary>
        [Description("任務地址")]
        public string JobCall { get; set; }

        /// <summary>
        /// 任務參數，JSON格式
        /// </summary>
        [Description("任務參數，JSON格式")]
        public string JobCallParams { get; set; }

        /// <summary>
        /// CRON表達式
        /// </summary>
        [Description("CRON表達式")]
        public string Cron { get; set; }

        /// <summary>
        /// 任務運行狀態（0：停止，1：正在運行，2：暫停）
        /// </summary>
        [Description("任務運行狀態（0：停止，1：正在運行，2：暫停）")]
        public int Status { get; set; }

        /// <summary>
        /// 備注
        /// </summary>
        [Description("備注")]
        public string Remark { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("創建時間")]
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 創建人ID
        /// </summary>
        [Description("創建人ID")]
        [Browsable(false)]
        public string CreateUserId { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        [Description("創建人")]
        public string CreateUserName { get; set; }

        /// <summary>
        /// 最后更新時間
        /// </summary>
        [Description("最后更新時間")]
        public System.DateTime? UpdateTime { get; set; }

        /// <summary>
        /// 最后更新人ID
        /// </summary>
        [Description("最后更新人ID")]
        [Browsable(false)]
        public string UpdateUserId { get; set; }

        /// <summary>
        /// 最后更新人
        /// </summary>
        [Description("最后更新人")]
        public string UpdateUserName { get; set; }

        /// <summary>
        /// 所屬部門
        /// </summary>
        [Description("所屬部門")]
        [Browsable(false)]
        public string OrgId { get; set; }
    }
}
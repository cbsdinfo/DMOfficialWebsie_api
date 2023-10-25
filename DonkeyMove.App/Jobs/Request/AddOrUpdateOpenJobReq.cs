using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using donkeymove.Repository.Core;

namespace donkeymove.App.Request
{
    /// <summary>
	/// 定時任務
	/// </summary>
    [Table("OpenJob")]
    public partial class AddOrUpdateOpenJobReq
    {
        /// <summary>
        /// Id
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// 任務名稱
        /// </summary>
        public string JobName { get; set; }

        /// <summary>
        /// 任務執行方式0：本地任務；1：外部接口任務
        /// </summary>
        public int JobType { get; set; }

        /// <summary>
        /// 任務地址
        /// </summary>
        public string JobCall { get; set; }

        /// <summary>
        /// 任務參數，JSON格式
        /// </summary>
        public string JobCallParams { get; set; }

        /// <summary>
        /// CRON表達式
        /// </summary>
        public string Cron { get; set; }

        /// <summary>
        /// 任務運行狀態（0：停止，1：正在運行，2：暫停）
        /// </summary>
        public int Status { get; set; }

        /// <summary>
        /// 備注
        /// </summary>
        public string Remark { get; set; }
    }
}
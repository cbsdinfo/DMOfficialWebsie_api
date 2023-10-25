using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 系統日志
    /// </summary>
    [Table("SysLog")]
    public partial class SysLog : StringEntity
    {
        public SysLog()
        {
            this.Content = string.Empty;
            this.TypeName = string.Empty;
            this.TypeId = string.Empty;
            this.Href = string.Empty;
            this.CreateTime = DateTime.Now;
            this.CreateId = string.Empty;
            this.CreateName = string.Empty;
            this.Ip = string.Empty;
            this.Application = string.Empty;
            this.Result = 0;
        }

        /// <summary>
        /// 日志內容
        /// </summary>
        [Description("日志內容")]
        public string Content { get; set; }

        /// <summary>
        /// 分類名稱
        /// </summary>
        [Description("分類名稱")]
        public string TypeName { get; set; }

        /// <summary>
        /// 分類ID
        /// </summary>
        [Description("分類ID")]
        public string TypeId { get; set; }

        /// <summary>
        /// 操作所屬模塊地址
        /// </summary>
        [Description("操作所屬模塊地址")]
        public string Href { get; set; }

        /// <summary>
        /// 記錄時間
        /// </summary>
        [Description("記錄時間")]
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 操作人ID
        /// </summary>
        [Description("操作人ID")]
        public string CreateId { get; set; }

        /// <summary>
        /// 操作人
        /// </summary>
        [Description("操作人")]
        public string CreateName { get; set; }

        /// <summary>
        /// 操作機器的IP地址
        /// </summary>
        [Description("操作機器的IP地址")]
        public string Ip { get; set; }

        /// <summary>
        /// 操作的結果：0：成功；1：失敗；
        /// </summary>
        [Description("操作的結果：0：成功；1：失敗；")]
        public int Result { get; set; }

        public string Application { get; set; }
    }
}
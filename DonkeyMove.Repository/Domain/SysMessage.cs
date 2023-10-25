using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 系統消息表
    /// </summary>
    [Table("SysMessage")]
    public partial class SysMessage : StringEntity
    {
        public SysMessage()
        {
            this.TypeName = string.Empty;
            this.TypeId = string.Empty;
            this.FromId = string.Empty;
            this.ToId = string.Empty;
            this.FromName = string.Empty;
            this.ToName = string.Empty;
            this.FromStatus = 0;
            this.ToStatus = 0;
            this.Href = string.Empty;
            this.Title = string.Empty;
            this.Content = string.Empty;
            this.CreateTime = DateTime.Now;
            this.CreateId = string.Empty;
        }

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
        /// 消息源頭
        /// </summary>
        [Description("消息源頭")]
        public string FromId { get; set; }

        /// <summary>
        /// 到達
        /// </summary>
        [Description("到達")]
        public string ToId { get; set; }

        /// <summary>
        /// 消息源頭名稱
        /// </summary>
        [Description("消息源頭名稱")]
        public string FromName { get; set; }

        /// <summary>
        /// 消息到達名稱
        /// </summary>
        [Description("消息到達名稱")]
        public string ToName { get; set; }

        /// <summary>
        /// -1:已刪除；0:默認
        /// </summary>
        [Description("-1:已刪除；0:默認")]
        public int FromStatus { get; set; }

        /// <summary>
        /// -1:已刪除；0:默認未讀；1：已讀
        /// </summary>
        [Description("-1:已刪除；0:默認未讀；1：已讀")]
        public int ToStatus { get; set; }

        /// <summary>
        /// 點擊消息跳轉的頁面等
        /// </summary>
        [Description("點擊消息跳轉的頁面等")]
        public string Href { get; set; }

        /// <summary>
        /// 消息標題
        /// </summary>
        [Description("消息標題")]
        public string Title { get; set; }

        /// <summary>
        /// 消息內容
        /// </summary>
        [Description("消息內容")]
        public string Content { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("創建時間")]
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 創建人ID
        /// </summary>
        [Description("創建人ID")]
        public string CreateId { get; set; }
    }
}
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 功能模塊表
    /// </summary>
    [Table("Module")]
    public partial class Module : TreeEntity
    {
        public Module()
        {
            this.CascadeId = string.Empty;
            this.Name = string.Empty;
            this.Url = string.Empty;
            this.HotKey = string.Empty;
            this.IconName = string.Empty;
            this.Status = 0;
            this.ParentName = string.Empty;
            this.Vector = string.Empty;
            this.SortNo = 0;
            this.ParentId = string.Empty;
            this.Code = string.Empty;
        }

        /// <summary>
        /// 主頁面URL
        /// </summary>
        [Description("主頁面URL")]
        public string Url { get; set; }

        /// <summary>
        /// 熱鍵
        /// </summary>
        [Description("熱鍵")]
        public string HotKey { get; set; }

        /// <summary>
        /// 是否葉子節點
        /// </summary>
        [Description("是否葉子節點")]
        public bool IsLeaf { get; set; }

        /// <summary>
        /// 是否自動展開
        /// </summary>
        [Description("是否自動展開")]
        public bool IsAutoExpand { get; set; }

        /// <summary>
        /// 節點圖標文件名稱
        /// </summary>
        [Description("節點圖標文件名稱")]
        public string IconName { get; set; }

        /// <summary>
        /// 當前狀態，0：正常，-1：隱藏，不在導航列表中顯示
        /// </summary>
        [Description("當前狀態")]
        public int Status { get; set; }

        /// <summary>
        /// 矢量圖標
        /// </summary>
        [Description("矢量圖標")]
        public string Vector { get; set; }

        /// <summary>
        /// 排序號
        /// </summary>
        [Description("排序號")]
        public int SortNo { get; set; }

        /// <summary>
        /// 模塊標識
        /// </summary>
        [Description("模塊標識")]
        public string Code { get; set; }

        /// <summary>
        /// 是否系統模塊
        /// </summary>
        [Description("是否系統模塊")]
        public bool IsSys { get; set; }
    }
}
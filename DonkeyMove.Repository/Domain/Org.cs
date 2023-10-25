using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 組織表
    /// </summary>
    [Table("Org")]
    public partial class SysOrg : TreeEntity
    {
        public SysOrg()
        {
            this.CascadeId = string.Empty;
            this.Name = string.Empty;
            this.HotKey = string.Empty;
            this.ParentName = string.Empty;
            this.IconName = string.Empty;
            this.Status = 0;
            this.BizCode = string.Empty;
            this.CustomCode = string.Empty;
            this.CreateTime = DateTime.Now;
            this.CreateId = 0;
            this.SortNo = 0;
            this.ParentId = null;
            this.TypeName = string.Empty;
            this.TypeId = string.Empty;
        }

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
        /// 當前狀態
        /// </summary>
        [Description("當前狀態")]
        public int Status { get; set; }

        /// <summary>
        /// 業務對照碼
        /// </summary>
        [Description("業務對照碼")]
        public string BizCode { get; set; }

        /// <summary>
        /// 自定義擴展碼
        /// </summary>
        [Description("自定義擴展碼")]
        public string CustomCode { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("創建時間")]
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 創建人ID
        /// </summary>
        [Description("創建人ID")]
        public int CreateId { get; set; }

        /// <summary>
        /// 排序號
        /// </summary>
        [Description("排序號")]
        public int SortNo { get; set; }

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
    }
}
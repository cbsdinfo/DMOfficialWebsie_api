using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 模塊元素表(需要權限控制的按鈕)
    /// </summary>
    [Table("ModuleElement")]
    public partial class ModuleElement : StringEntity
    {
        public ModuleElement()
        {
            this.DomId = string.Empty;
            this.Name = string.Empty;
            this.Attr = string.Empty;
            this.Script = string.Empty;
            this.Icon = string.Empty;
            this.Class = string.Empty;
            this.Remark = string.Empty;
            this.Sort = 0;
            this.ModuleId = string.Empty;
            this.TypeName = string.Empty;
            this.TypeId = string.Empty;
        }

        /// <summary>
        /// DOM ID
        /// </summary>
        [Description("DOM ID")]
        public string DomId { get; set; }

        /// <summary>
        /// 名稱
        /// </summary>
        [Description("名稱")]
        public string Name { get; set; }

        /// <summary>
        /// 元素附加屬性
        /// </summary>
        [Description("元素附加屬性")]
        public string Attr { get; set; }

        /// <summary>
        /// 元素調用腳本
        /// </summary>
        [Description("元素調用腳本")]
        public string Script { get; set; }

        /// <summary>
        /// 元素圖標
        /// </summary>
        [Description("元素圖標")]
        public string Icon { get; set; }

        /// <summary>
        /// 元素樣式
        /// </summary>
        [Description("元素樣式")]
        public string Class { get; set; }

        /// <summary>
        /// 備注
        /// </summary>
        [Description("備注")]
        public string Remark { get; set; }

        /// <summary>
        /// 排序字段
        /// </summary>
        [Description("排序字段")]
        public int Sort { get; set; }

        /// <summary>
        /// 功能模塊Id
        /// </summary>
        [Description("功能模塊Id")]
        public string ModuleId { get; set; }

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
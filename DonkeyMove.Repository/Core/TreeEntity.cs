using System.ComponentModel;

namespace donkeymove.Repository.Core
{
    /// <summary>
    /// 樹狀結構實體
    /// </summary>
    public abstract class TreeEntity: StringEntity
    {
        /// <summary>
        /// 節點語義ID
        /// </summary>
        [Description("節點語義ID")]
        public string CascadeId { get; set; }
        /// <summary>
        /// 功能模塊名稱
        /// </summary>
        [Description("名稱")]
        public string Name { get; set; }

        /// <summary>
        /// 父節點流水號
        /// </summary>
        [Description("父節點流水號")]
        public string ParentId { get; set; }
        /// <summary>
        /// 父節點名稱
        /// </summary>
        [Description("父節點名稱")]
        public string ParentName { get; set; }

    }

}

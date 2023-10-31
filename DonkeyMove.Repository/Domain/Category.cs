using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
	/// 分類表，也可用作數據字典。表示一個全集，比如：男、女、未知。關聯的分類類型表示按什么進行的分類，如：按照性別對人類對象集
	/// </summary>
    [Table("Category")]
    public partial class Category : StringEntity
    {
        public Category()
        {
            this.Name = string.Empty;
            this.DtCode = string.Empty;
            this.DtValue = string.Empty;
            this.SortNo = 0;
            this.Description = string.Empty;
            this.TypeId = string.Empty;
            this.CreateTime = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.UpdateTime = DateTime.Now;
            this.UpdateUserId = string.Empty;
        }

        /// <summary>
        /// 名稱
        /// </summary>
        [Description("名稱")]
        public string Name { get; set; }

        /// <summary>
        /// 代碼
        /// </summary>
        [Description("代碼")]
        public string DtCode { get; set; }

        /// <summary>
        /// 通常與字典代碼標識一致，但萬一有不一樣的情況呢？
        /// </summary>
        [Description("值")]
        public string DtValue { get; set; }

        /// <summary>
        /// 是否可用
        /// </summary>
        [Description("是否可用")]
        public bool Enable { get; set; }

        /// <summary>
        /// 排序號
        /// </summary>
        [Description("排序號")]
        public int SortNo { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [Description("描述")]
        public string Description { get; set; }

        /// <summary>
        /// 分類ID
        /// </summary>
        [Description("分類標識")]
        public string TypeId { get; set; }


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
        
    }
}
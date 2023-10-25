using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 分類類型
    /// </summary>
    [Table("CategoryType")]
    public partial class CategoryType : StringEntity
    {
        public CategoryType()
        {
            this.Name = string.Empty;
            this.CreateTime = DateTime.Now;
        }

        /// <summary>
        /// 名稱
        /// </summary>
        [Description("名稱")]
        public string Name { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("創建時間")]
        public System.DateTime CreateTime { get; set; }
    }
}
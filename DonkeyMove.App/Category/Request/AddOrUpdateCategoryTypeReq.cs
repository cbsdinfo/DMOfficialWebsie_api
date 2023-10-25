using System.ComponentModel.DataAnnotations.Schema;

namespace donkeymove.App.Request
{
    /// <summary>
	/// 分類類型
	/// </summary>
    [Table("CategoryType")]
    public partial class AddOrUpdateCategoryTypeReq
    {
        /// <summary>
        /// 分類表ID
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// 名稱
        /// </summary>
        public string Name { get; set; }
    }
}
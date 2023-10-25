namespace donkeymove.App.Request
{
    /// <summary>
	/// 分類表，也可用作數據字典。表示一個全集，比如：男、女、未知。關聯的分類類型表示按什么進行的分類，如：按照性別對人類對象集
	/// </summary>
    public class AddOrUpdateCategoryReq
    {
        public string Id { get; set; }

        /// <summary>
        /// 分類名稱或描述
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 分類標識
        /// </summary>
        public string DtCode { get; set; }

        /// <summary>
        /// 通常與分類標識一致，但萬一有不一樣的情況呢？
        /// </summary>
        public string DtValue { get; set; }

        /// <summary>
        ///
        /// </summary>
        public bool Enable { get; set; }

        /// <summary>
        /// 排序號
        /// </summary>
        public int SortNo { get; set; }

        /// <summary>
        /// 詳細說明，基本沒啥用
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 分類的ID
        /// </summary>
        public string TypeId { get; set; }
    }
}
namespace donkeymove.Repository.QueryObj
{
    /// <summary>
    /// 系統表列信息
    /// </summary>
     public class SysTableColumn 
    {
        /// <summary>
        /// 列名
        /// </summary>
        public string ColumnName { get; set; }
        /// <summary>
        /// 列注釋
        /// </summary>
        public string Comment { get; set; }
        /// <summary>
        /// 類型，已轉為.net類型
        /// </summary>
        public string ColumnType { get; set; }
        /// <summary>
        /// 最大長度
        /// </summary>
        public int? MaxLength { get; set; }
        /// <summary>
        /// 是否可空
        /// </summary>
        public int? IsNull { get; set; }
        /// <summary>
        /// 是否顯示
        /// </summary>
        public int? IsDisplay { get; set; }
        /// <summary>
        /// 是否主鍵
        /// </summary>
        public int? IsKey { get; set; }
        public string EntityType { get; set; }
    }
}
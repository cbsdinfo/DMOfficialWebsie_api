namespace donkeymove.App.Request
{
    /// <summary>
	/// 同步表結構
	/// </summary>
    public class SyncStructureReq
    {
        /// <summary>
        /// Id為空則為添加
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// 表英文全稱
        /// </summary>
        public string TableName { get; set; }
    }
}
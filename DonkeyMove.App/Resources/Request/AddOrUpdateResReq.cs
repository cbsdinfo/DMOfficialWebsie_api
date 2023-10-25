namespace donkeymove.Repository.Domain
{
    /// <summary>
	/// 資源表
	/// </summary>
    public class AddOrUpdateResReq
    {
        public string Id { get; set; }

        /// <summary>
        /// 節點語義ID
        /// </summary>
        public string CascadeId { get; set; }

        /// <summary>
        /// 名稱
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 排序號
        /// </summary>
        public int SortNo { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 父節點名稱
        /// </summary>
        public string ParentName { get; set; }

        /// <summary>
        /// 父節點流ID
        /// </summary>
        public string ParentId { get; set; }

        /// <summary>
        /// 資源所屬應用ID
        /// </summary>
        public string AppId { get; set; }

        /// <summary>
        /// 所屬應用名稱
        /// </summary>
        public string AppName { get; set; }

        /// <summary>
        /// 分類名稱
        /// </summary>
        public string TypeName { get; set; }

        /// <summary>
        /// 分類ID
        /// </summary>
        public string TypeId { get; set; }

        /// <summary>
        /// 是否可用
        /// </summary>
        public bool Disable { get; set; }
    }
}
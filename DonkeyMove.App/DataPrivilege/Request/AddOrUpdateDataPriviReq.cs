namespace donkeymove.App.Request
{
    public class AddOrUpdateDataPriviReq
    {
        public string Id { get; set; }

        /// <summary>
        /// 資源標識（模塊編號）
        /// </summary>
        public string SourceCode { get; set; }

        /// <summary>
        /// 二級資源標識
        /// </summary>
        public string SubSourceCode { get; set; }

        /// <summary>
        /// 權限描述
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 排序號
        /// </summary>
        public int SortNo { get; set; }

        /// <summary>
        /// 權限規則
        /// </summary>
        public string PrivilegeRules { get; set; }

        /// <summary>
        /// 是否可用
        /// </summary>
        public bool Enable { get; set; }
    }
}
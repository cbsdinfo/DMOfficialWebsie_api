namespace donkeymove.App.Request
{
    /// <summary>
    /// 為角色分配數據字段權限
    /// </summary>
    public class AssignDataReq
    {
        /// <summary>
        /// 角色ID
        /// </summary>
        public string RoleId { get; set; }
        /// <summary>
        /// 模塊的Code,比如Category/Resource
        /// </summary>
        public string ModuleCode { get; set; }
        /// <summary>
        /// 字段名稱列表
        /// </summary>
        public string[] Properties { get; set; }
    }
}
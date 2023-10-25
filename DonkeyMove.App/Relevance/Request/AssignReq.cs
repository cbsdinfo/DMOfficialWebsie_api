namespace donkeymove.App.Request
{
    /// <summary>
    /// 比如給用戶分配資源，那么firstId就是用戶ID，secIds就是資源ID列表
    /// </summary>
    public class AssignReq
    {
        /// <summary>
        /// 分配的關鍵字，比如：UserRole
        /// </summary>
        public string type { get; set; }
        /// <summary>
        /// 比如給用戶分配角色，那么firstId就是用戶ID，secIds就是角色ID列表
        /// </summary>
        public string firstId { get; set; }
        public string[] secIds { get; set; }
    }
}
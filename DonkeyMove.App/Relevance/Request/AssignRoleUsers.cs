namespace donkeymove.App.Request
{
    /// <summary>
    /// 角色分配用戶
    /// </summary>
    public class AssignRoleUsers
    {
        /// <summary>
        /// 角色id
        /// </summary>
        public string RoleId { get; set; }
        /// <summary>
        /// 用戶id列表
        /// </summary>
        public string[] UserIds { get; set; }
    }
}
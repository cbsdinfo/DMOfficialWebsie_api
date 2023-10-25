namespace donkeymove.App.Request
{
    /// <summary>
    /// 部門分配用戶
    /// </summary>
    public class AssignOrgUsers
    {
        /// <summary>
        /// 部門id
        /// </summary>
        public string OrgId { get; set; }
        /// <summary>
        /// 用戶id列表
        /// </summary>
        public string[] UserIds { get; set; }
    }
}
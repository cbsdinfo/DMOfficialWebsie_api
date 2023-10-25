using Infrastructure;
using donkeymove.Repository.Domain;

namespace donkeymove.App.Response
{
    public partial class RoleView
    {
        /// <summary>
        /// 用戶ID
        /// </summary>
        /// <returns></returns>
        public string Id { get; set; }

        /// <summary>
        /// 名稱
        /// </summary>
        /// <returns></returns>
        public string Name { get; set; }

        /// <summary>
        /// 當前狀態
        /// </summary>
        public int Status { get; set; }

        /// <summary>
	    /// 角色類型
	    /// </summary>
        public int Type { get; set; }

        /// <summary>
        ///是否屬于某用戶
        /// </summary>
        public bool Checked { get; set; }

        public static implicit operator RoleView(Role role)
        {
            return role.MapTo<RoleView>();
        }

        public static implicit operator Role(RoleView rolevm)
        {
            return rolevm.MapTo<Role>();
        }
    }
}
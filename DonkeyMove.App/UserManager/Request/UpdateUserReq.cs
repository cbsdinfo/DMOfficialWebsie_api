using System.ComponentModel.DataAnnotations;
using Infrastructure;
using donkeymove.Repository.Domain;

namespace donkeymove.App.Request
{
    /// <summary>
    /// 添加或修改用戶信息的請求
    /// </summary>
    public  class UpdateUserReq
    {
        /// <summary>
        /// 用戶ID
        /// </summary>
        /// <returns></returns>
        public string Id { get; set; }


        /// <summary>
        /// </summary>
        /// <returns></returns>
        [Required(ErrorMessage = "賬號肯定不能為空啊~~")]
        public string Account { get; set; }
        
        /// <summary>
        /// </summary>
        /// <returns></returns>
        public string Password { get; set; }


        /// <summary>
        /// 用戶姓名
        /// </summary>
        /// <returns></returns>
        [Required(ErrorMessage="姓名不能為空")]
        public string Name { get; set; }


        /// <summary>
        /// </summary>
        /// <returns></returns>
        public int Sex { get; set; }


        /// <summary>
        /// 當前狀態
        /// </summary>
        /// <returns></returns>
        public int Status { get; set; }


        /// <summary>
        /// 所屬組織Id，多個可用，分隔
        /// </summary>
        /// <value>The organizations.</value>
        [Required(ErrorMessage = "請為用戶分配機構")]
        public string OrganizationIds { get; set; }

        public static implicit operator UpdateUserReq(User user)
        {
            return user.MapTo<UpdateUserReq>();
        }

        public static implicit operator User(UpdateUserReq view)
        {
            return view.MapTo<User>();
        }

        public UpdateUserReq()
        {
            OrganizationIds = string.Empty;
        }
    }
}

using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 用戶基本信息表
    /// </summary>
    [Table("User")]
    public partial class User : StringEntity
    {
        public User()
        {
            this.Account = string.Empty;
            this.Password = string.Empty;
            this.Name = string.Empty;
            this.Sex = 0;
            this.Status = 0;
            this.BizCode = string.Empty;
            this.CreateTime = DateTime.Now;
            this.CreateId = string.Empty;
            this.TypeName = string.Empty;
            this.TypeId = string.Empty;
        }

        /// <summary>
        /// 用戶登錄帳號
        /// </summary>
        [Description("用戶登錄帳號")]
        public string Account { get; set; }

        /// <summary>
        /// 密碼
        /// </summary>
        [Description("密碼")]
        public string Password { get; set; }

        /// <summary>
        /// 用戶姓名
        /// </summary>
        [Description("用戶姓名")]
        public string Name { get; set; }

        /// <summary>
        /// 性別
        /// </summary>
        [Description("性別")]
        public int Sex { get; set; }

        /// <summary>
        /// 用戶狀態
        /// </summary>
        [Description("用戶狀態")]
        public int Status { get; set; }

        /// <summary>
        /// 業務對照碼
        /// </summary>
        [Description("業務對照碼")]
        public string BizCode { get; set; }

        /// <summary>
        /// 經辦時間
        /// </summary>
        [Description("經辦時間")]
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        [Description("創建人")]
        public string CreateId { get; set; }

        /// <summary>
        /// 分類名稱
        /// </summary>
        [Description("分類名稱")]
        public string TypeName { get; set; }

        /// <summary>
        /// 分類ID
        /// </summary>
        [Description("分類ID")]
        public string TypeId { get; set; }
    }
}
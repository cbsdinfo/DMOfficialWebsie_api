using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
	/// 系統授權規制表
	/// </summary>
    [Table("DataPrivilegeRule")]
    public partial class DataPrivilegeRule : StringEntity
    {
        public DataPrivilegeRule()
        {
            this.SourceCode = string.Empty;
            this.SubSourceCode = string.Empty;
            this.Description = string.Empty;
            this.SortNo = 0;
            this.PrivilegeRules = string.Empty;
            this.CreateTime = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.CreateUserName = string.Empty;
            this.UpdateTime = DateTime.Now;
            this.UpdateUserId = string.Empty;
            this.UpdateUserName = string.Empty;
        }

        /// <summary>
        /// 資源標識（模塊編號）
        /// </summary>
        [Description("模塊編號")]
        public string SourceCode { get; set; }

        /// <summary>
        /// 二級資源標識
        /// </summary>
        [Description("二級資源標識")]
        [Browsable(false)]
        public string SubSourceCode { get; set; }

        /// <summary>
        /// 權限描述
        /// </summary>
        [Description("權限描述")]
        public string Description { get; set; }

        /// <summary>
        /// 排序號
        /// </summary>
        [Description("排序號")]
        public int SortNo { get; set; }

        /// <summary>
        /// 權限規則
        /// </summary>
        [Description("權限規則")]
        public string PrivilegeRules { get; set; }

        /// <summary>
        /// 是否可用
        /// </summary>
        [Description("是否可用")]
        public bool Enable { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("創建時間")]
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 創建人ID
        /// </summary>
        [Description("創建人ID")]
        [Browsable(false)]
        public string CreateUserId { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        [Description("創建人")]
        public string CreateUserName { get; set; }

        /// <summary>
        /// 最后更新時間
        /// </summary>
        [Description("最后更新時間")]
        public System.DateTime? UpdateTime { get; set; }

        /// <summary>
        /// 最后更新人ID
        /// </summary>
        [Description("最后更新人ID")]
        [Browsable(false)]
        public string UpdateUserId { get; set; }

        /// <summary>
        /// 最后更新人
        /// </summary>
        [Description("最后更新人")]
        public string UpdateUserName { get; set; }
    }
}
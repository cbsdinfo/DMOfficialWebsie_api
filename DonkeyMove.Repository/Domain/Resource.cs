using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
	/// 資源表
	/// </summary>
    [Table("Resource")]
    public partial class Resource : TreeEntity
    {
        public Resource()
        {
            this.Name = string.Empty;
            this.SortNo = 0;
            this.Description = string.Empty;
            this.AppId = string.Empty;
            this.AppName = string.Empty;
            this.TypeName = string.Empty;
            this.TypeId = string.Empty;
            this.CreateTime = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.CreateUserName = string.Empty;
            this.UpdateTime = DateTime.Now;
            this.UpdateUserId = string.Empty;
            this.UpdateUserName = string.Empty;
        }

        /// <summary>
        /// 排序號
        /// </summary>
        [Description("排序號")]
        public int SortNo { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [Description("描述")]
        public string Description { get; set; }

        /// <summary>
        /// 資源所屬應用ID
        /// </summary>
        [Description("資源所屬應用ID")]
        [Browsable(false)]
        public string AppId { get; set; }

        /// <summary>
        /// 所屬應用名稱
        /// </summary>
        [Description("所屬應用名稱")]
        public string AppName { get; set; }

        /// <summary>
        /// 分類名稱
        /// </summary>
        [Description("分類名稱")]
        public string TypeName { get; set; }

        /// <summary>
        /// 分類ID
        /// </summary>
        [Description("分類ID")]
        [Browsable(false)]
        public string TypeId { get; set; }

        /// <summary>
        /// 是否可用
        /// </summary>
        [Description("是否可用")]
        public bool Disable { get; set; }

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
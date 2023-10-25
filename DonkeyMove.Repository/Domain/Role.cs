using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 角色表
    /// </summary>
    [Table("Role")]
    public partial class Role : StringEntity
    {
        public Role()
        {
            this.Name = string.Empty;
            this.Status = 0;
            this.CreateTime = DateTime.Now;
            this.CreateId = string.Empty;
            this.TypeName = string.Empty;
            this.TypeId = string.Empty;
        }

        /// <summary>
        /// 角色名稱
        /// </summary>
        [Description("角色名稱")]
        public string Name { get; set; }

        /// <summary>
        /// 當前狀態
        /// </summary>
        [Description("當前狀態")]
        public int Status { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("創建時間")]
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 創建人ID
        /// </summary>
        [Description("創建人ID")]
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
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 應用
    /// </summary>
    [Table("Application")]
    public partial class Application : StringEntity
    {
        public Application()
        {
            this.Name = string.Empty;
            this.AppSecret = string.Empty;
            this.Description = string.Empty;
            this.Icon = string.Empty;
            this.CreateTime = DateTime.Now;
            this.CreateUser = string.Empty;
        }

        /// <summary>
        /// 應用名稱
        /// </summary>
        [Description("應用名稱")]
        public string Name { get; set; }

        /// <summary>
        /// 應用密鑰
        /// </summary>
        [Description("應用密鑰")]
        public string AppSecret { get; set; }

        /// <summary>
        /// 應用描述
        /// </summary>
        [Description("應用描述")]
        public string Description { get; set; }

        /// <summary>
        /// 應用圖標
        /// </summary>
        [Description("應用圖標")]
        public string Icon { get; set; }

        /// <summary>
        /// 是否可用
        /// </summary>
        [Description("是否可用")]
        public bool Disable { get; set; }

        /// <summary>
        /// 創建日期
        /// </summary>
        [Description("創建日期")]
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        [Description("創建人")]
        public string CreateUser { get; set; }
    }
}
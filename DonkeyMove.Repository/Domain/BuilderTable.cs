using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
	/// 代碼生成器的表信息
	/// </summary>
    [Table("BuilderTable")]
    public partial class BuilderTable : StringEntity
    {
        public BuilderTable()
        {
            this.TableName = string.Empty;
            this.Comment = string.Empty;
            this.DetailTableName = string.Empty;
            this.DetailComment = string.Empty;
            this.ClassName = string.Empty;
            this.Namespace = string.Empty;
            this.ModuleCode = string.Empty;
            this.ModuleName = string.Empty;
            this.Folder = string.Empty;
            this.Options = string.Empty;
            this.TypeId = string.Empty;
            this.TypeName = string.Empty;
            this.CreateTime = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.UpdateTime = DateTime.Now;
            this.UpdateUserId = string.Empty;
            this.UpdateUserName = string.Empty;
            this.CreateUserName = string.Empty;
        }

        /// <summary>
        /// 表英文全稱
        /// </summary>
        [Description("表英文全稱")]
        public string TableName { get; set; }

        /// <summary>
        /// 表描述、中文名稱
        /// </summary>
        [Description("表描述、中文名稱")]
        public string Comment { get; set; }

        /// <summary>
        /// 子表英文全稱
        /// </summary>
        [Description("子表英文全稱")]
        public string DetailTableName { get; set; }

        /// <summary>
        /// 子表描述、中文名稱
        /// </summary>
        [Description("子表描述、中文名稱")]
        public string DetailComment { get; set; }

        /// <summary>
        /// 實體類名稱
        /// </summary>
        [Description("實體類名稱")]
        public string ClassName { get; set; }

        /// <summary>
        /// 命名空間
        /// </summary>
        [Description("命名空間")]
        public string Namespace { get; set; }

        /// <summary>
        /// 模塊標識
        /// </summary>
        [Description("模塊標識")]
        public string ModuleCode { get; set; }

        /// <summary>
        /// 模塊名稱
        /// </summary>
        [Description("模塊名稱")]
        public string ModuleName { get; set; }

        /// <summary>
        /// 代碼相對文件夾路徑
        /// </summary>
        [Description("代碼相對文件夾路徑")]
        public string Folder { get; set; }

        /// <summary>
        /// 其它生成選項
        /// </summary>
        [Description("其它生成選項")]
        public string Options { get; set; }

        /// <summary>
        /// 分類ID
        /// </summary>
        [Description("分類ID")]
        [Browsable(false)]
        public string TypeId { get; set; }

        /// <summary>
        /// 分類名稱
        /// </summary>
        [Description("分類名稱")]
        public string TypeName { get; set; }

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
        /// 修改時間
        /// </summary>
        [Description("修改時間")]
        public System.DateTime? UpdateTime { get; set; }

        /// <summary>
        /// 修改人ID
        /// </summary>
        [Description("修改人ID")]
        [Browsable(false)]
        public string UpdateUserId { get; set; }

        /// <summary>
        /// 修改人姓名
        /// </summary>
        [Description("修改人姓名")]
        public string UpdateUserName { get; set; }

        /// <summary>
        /// 創建人姓名
        /// </summary>
        [Description("創建人姓名")]
        public string CreateUserName { get; set; }

        /// <summary>
        /// 是否動態加載表頭信息
        /// </summary>
        [Description("是否動態加載表頭信息")]
        public bool IsDynamicHeader { get; set; }

        /// <summary>
        /// 字表外鍵
        /// </summary>
        [Description("字表外鍵")]
        public string ForeignKey { get; set; }

        /// <summary>
        /// 主表ID，如果為空表示為主表
        /// </summary>
        [Description("主表ID，如果為空表示為主表")]
        public string ParentTableId { get; set; }
    }
}
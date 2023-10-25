using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
	/// 代碼生成器的字段信息
	/// </summary>
    [Table("BuilderTableColumn")]
    public partial class BuilderTableColumn : StringEntity
    {
        public BuilderTableColumn()
        {
            this.TableId = string.Empty;
            this.TableName = string.Empty;
            this.ColumnName = string.Empty;
            this.Comment = string.Empty;
            this.ColumnType = string.Empty;
            this.EntityType = string.Empty;
            this.EntityName = string.Empty;
            this.QueryType = string.Empty;
            this.HtmlType = string.Empty;
            this.EditType = string.Empty;
            this.Sort = 0;
            this.CreateTime = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.UpdateTime = DateTime.Now;
            this.UpdateUserId = string.Empty;
            this.UpdateUserName = string.Empty;
            this.CreateUserName = string.Empty;
        }

        /// <summary>
        /// 歸屬表編號
        /// </summary>
        [Description("歸屬表編號")]
        [Browsable(false)]
        public string TableId { get; set; }

        /// <summary>
        /// 表名稱
        /// </summary>
        [Description("表名稱")]
        public string TableName { get; set; }

        /// <summary>
        /// 列名稱
        /// </summary>
        [Description("列名稱")]
        public string ColumnName { get; set; }

        /// <summary>
        /// 列描述
        /// </summary>
        [Description("列描述")]
        public string Comment { get; set; }

        /// <summary>
        /// 列類型
        /// </summary>
        [Description("列類型")]
        public string ColumnType { get; set; }

        /// <summary>
        /// 實體類型
        /// </summary>
        [Description("實體類型")]
        public string EntityType { get; set; }

        /// <summary>
        /// 實體名稱
        /// </summary>
        [Description("實體名稱")]
        public string EntityName { get; set; }

        /// <summary>
        /// 是否主鍵
        /// </summary>
        [Description("是否主鍵")]
        public bool IsKey { get; set; }

        /// <summary>
        /// 是否自增
        /// </summary>
        [Description("是否自增")]
        public bool IsIncrement { get; set; }

        /// <summary>
        /// 是否必填
        /// </summary>
        [Description("是否必填")]
        public bool IsRequired { get; set; }

        /// <summary>
        /// 是否為插入字段
        /// </summary>
        [Description("是否為插入字段")]
        public bool IsInsert { get; set; }

        /// <summary>
        /// 是否編輯字段
        /// </summary>
        [Description("是否編輯字段")]
        public bool IsEdit { get; set; }

        /// <summary>
        /// 是否列表字段
        /// </summary>
        [Description("是否列表字段")]
        public bool IsList { get; set; }

        /// <summary>
        /// 是否查詢字段
        /// </summary>
        [Description("是否查詢字段")]
        public bool IsQuery { get; set; }

        /// <summary>
        /// 查詢方式（等于、不等于、大于、小于、范圍）
        /// </summary>
        [Description("查詢方式（等于、不等于、大于、小于、范圍）")]
        public string QueryType { get; set; }

        /// <summary>
        /// 顯示類型（文本框、文本域、下拉框、復選框、單選框、日期控件）
        /// </summary>
        [Description("顯示類型（文本框、文本域、下拉框、復選框、單選框、日期控件）")]
        public string HtmlType { get; set; }

        /// <summary>
        /// 編輯類型（文本框、文本域、下拉框、復選框、單選框、日期控件）
        /// </summary>
        [Description("編輯類型（文本框、文本域、下拉框、復選框、單選框、日期控件）")]
        public string EditType { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Description("排序")]
        public int Sort { get; set; }

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
        /// 修改時的行位置
        /// </summary>
        [Description("修改時的行位置")]
        public int? EditRow { get; set; }

        /// <summary>
        /// 修改時的列位置
        /// </summary>
        [Description("修改時的列位置")]
        public int? EditCol { get; set; }

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
        /// 最大長度
        /// </summary>
        [Description("最大長度")]
        public int? MaxLength { get; set; }

        /// <summary>
        /// 數據源（用于下拉框、復選框等取值）
        /// </summary>
        [Description("數據源（用于下拉框、復選框等取值）")]
        public string DataSource { get; set; }
    }
}
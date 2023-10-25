using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using donkeymove.Repository.Core;

namespace donkeymove.App.Request
{
    /// <summary>
	/// 代碼生成器的字段信息
	/// </summary>
    [Table("BuilderTableColumn")]
    public partial class AddOrUpdateBuilderTableColumnReq
    {
        /// <summary>
        /// 編號
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// 歸屬表編號
        /// </summary>
        public string TableId { get; set; }

        /// <summary>
        /// 表名稱
        /// </summary>
        public string TableName { get; set; }

        /// <summary>
        /// 列名稱
        /// </summary>
        public string ColumnName { get; set; }

        /// <summary>
        /// 列描述
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// 列類型
        /// </summary>
        public string ColumnType { get; set; }

        /// <summary>
        /// 實體類型
        /// </summary>
        public string EntityType { get; set; }

        /// <summary>
        /// 實體名稱
        /// </summary>
        public string EntityName { get; set; }

        /// <summary>
        /// 是否主鍵
        /// </summary>
        public bool IsKey { get; set; }

        /// <summary>
        /// 是否自增
        /// </summary>
        public bool IsIncrement { get; set; }

        /// <summary>
        /// 是否必填
        /// </summary>
        public bool IsRequired { get; set; }

        /// <summary>
        /// 是否為插入字段
        /// </summary>
        public bool IsInsert { get; set; }

        /// <summary>
        /// 是否編輯字段
        /// </summary>
        public bool IsEdit { get; set; }

        /// <summary>
        /// 是否列表字段
        /// </summary>
        public bool IsList { get; set; }

        /// <summary>
        /// 是否查詢字段
        /// </summary>
        public bool IsQuery { get; set; }

        /// <summary>
        /// 查詢方式（等于、不等于、大于、小于、范圍）
        /// </summary>
        public string QueryType { get; set; }

        /// <summary>
        /// 顯示類型（文本框、文本域、下拉框、復選框、單選框、日期控件）
        /// </summary>
        public string HtmlType { get; set; }

        /// <summary>
        /// 編輯類型（文本框、文本域、下拉框、復選框、單選框、日期控件）
        /// </summary>
        public string EditType { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        public int Sort { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 創建人ID
        /// </summary>
        public string CreateUserId { get; set; }

        /// <summary>
        /// 修改時間
        /// </summary>
        public System.DateTime? UpdateTime { get; set; }

        /// <summary>
        /// 修改人ID
        /// </summary>
        public string UpdateUserId { get; set; }

        /// <summary>
        /// 修改時的行位置
        /// </summary>
        public int? EditRow { get; set; }

        /// <summary>
        /// 修改時的列位置
        /// </summary>
        public int? EditCol { get; set; }

        /// <summary>
        /// 修改人姓名
        /// </summary>
        public string UpdateUserName { get; set; }

        /// <summary>
        /// 創建人姓名
        /// </summary>
        public string CreateUserName { get; set; }

        /// <summary>
        /// 最大長度
        /// </summary>
        public int? MaxLength { get; set; }

        /// <summary>
        /// 數據源（用于下拉框、復選框等取值）
        /// </summary>
        public string DataSource { get; set; }

        //todo:添加自己的請求字段
    }
}
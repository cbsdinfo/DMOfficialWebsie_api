using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 表單模板表
    /// </summary>
    [Table("Form")]
    public partial class Form : StringEntity
    {
        public Form()
        {
            this.Name = string.Empty;
            this.FrmType = 0;
            this.WebId = string.Empty;
            this.Fields = 0;
            this.ContentData = string.Empty;
            this.ContentParse = string.Empty;
            this.Content = string.Empty;
            this.SortCode = 0;
            this.DeleteMark = 0;
            this.DbName = string.Empty;
            this.Disabled = 0;
            this.Description = string.Empty;
            this.CreateDate = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.CreateUserName = string.Empty;
            this.ModifyDate = DateTime.Now;
            this.ModifyUserId = string.Empty;
            this.ModifyUserName = string.Empty;
        }

        /// <summary>
        /// 表單名稱
        /// </summary>
        [Description("表單名稱")]
        public string Name { get; set; }

        /// <summary>
        /// 表單類型，0：默認動態表單；1：Web自定義表單
        /// </summary>
        [Description("表單類型，0：默認動態表單；1：Web自定義表單")]
        public int FrmType { get; set; }

        /// <summary>
        /// 系統頁面標識，當表單類型為用Web自定義的表單時，需要標識加載哪個頁面
        /// </summary>
        [Description("系統頁面標識，當表單類型為用Web自定義的表單時，需要標識加載哪個頁面")]
        public string WebId { get; set; }

        /// <summary>
        /// 字段個數
        /// </summary>
        [Description("字段個數")]
        public int Fields { get; set; }

        /// <summary>
        /// 表單中的控件屬性描述
        /// </summary>
        [Description("表單中的控件屬性描述")]
        public string ContentData { get; set; }

        /// <summary>
        /// 表單控件位置模板
        /// </summary>
        [Description("表單控件位置模板")]
        public string ContentParse { get; set; }

        /// <summary>
        /// 表單原html模板未經處理的
        /// </summary>
        [Description("表單原html模板未經處理的")]
        public string Content { get; set; }

        /// <summary>
        /// 排序碼
        /// </summary>
        [Description("排序碼")]
        public int SortCode { get; set; }

        /// <summary>
        /// 刪除標記
        /// </summary>
        [Description("刪除標記")]
        public int DeleteMark { get; set; }

        /// <summary>
        /// 數據庫名稱
        /// </summary>
        [Description("數據庫名稱")]
        public string DbName { get; set; }

        /// <summary>
        /// 有效
        /// </summary>
        [Description("有效")]
        public int Disabled { get; set; }

        /// <summary>
        /// 備注
        /// </summary>
        [Description("備注")]
        public string Description { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("創建時間")]
        public System.DateTime CreateDate { get; set; }

        /// <summary>
        /// 創建用戶主鍵
        /// </summary>
        [Description("創建用戶主鍵")]
        public string CreateUserId { get; set; }

        /// <summary>
        /// 創建用戶
        /// </summary>
        [Description("創建用戶")]
        public string CreateUserName { get; set; }

        /// <summary>
        /// 修改時間
        /// </summary>
        [Description("修改時間")]
        public System.DateTime? ModifyDate { get; set; }

        /// <summary>
        /// 修改用戶主鍵
        /// </summary>
        [Description("修改用戶主鍵")]
        public string ModifyUserId { get; set; }

        /// <summary>
        /// 修改用戶
        /// </summary>
        [Description("修改用戶")]
        public string ModifyUserName { get; set; }

        /// <summary>
        /// 所屬部門
        /// </summary>
        [Description("所屬部門")]
        public string OrgId { get; set; }
    }
}
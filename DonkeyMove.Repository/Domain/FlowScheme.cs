using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 工作流模板信息表
    /// </summary>
    [Table("FlowScheme")]
    public partial class FlowScheme : StringEntity
    {
        public FlowScheme()
        {
            this.SchemeCode = string.Empty;
            this.SchemeName = string.Empty;
            this.SchemeType = string.Empty;
            this.SchemeVersion = string.Empty;
            this.SchemeCanUser = string.Empty;
            this.SchemeContent = string.Empty;
            this.FrmId = string.Empty;
            this.FrmType = 0;
            this.AuthorizeType = 0;
            this.SortCode = 0;
            this.DeleteMark = 0;
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
        /// 流程編號
        /// </summary>
        [Description("流程編號")]
        public string SchemeCode { get; set; }

        /// <summary>
        /// 流程名稱
        /// </summary>
        [Description("流程名稱")]
        public string SchemeName { get; set; }

        /// <summary>
        /// 流程分類
        /// </summary>
        [Description("流程分類")]
        public string SchemeType { get; set; }

        /// <summary>
        /// 流程內容版本
        /// </summary>
        [Description("流程內容版本")]
        public string SchemeVersion { get; set; }

        /// <summary>
        /// 流程模板使用者
        /// </summary>
        [Description("流程模板使用者")]
        public string SchemeCanUser { get; set; }

        /// <summary>
        /// 流程內容
        /// </summary>
        [Description("流程內容")]
        public string SchemeContent { get; set; }

        /// <summary>
        /// 表單ID
        /// </summary>
        [Description("表單ID")]
        public string FrmId { get; set; }

        /// <summary>
        /// 表單類型
        /// </summary>
        [Description("表單類型")]
        public int FrmType { get; set; }

        /// <summary>
        /// 模板權限類型：0完全公開,1指定部門/人員
        /// </summary>
        [Description("模板權限類型：0完全公開,1指定部門/人員")]
        public int AuthorizeType { get; set; }

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
using System.ComponentModel;

namespace donkeymove.App.Request
{
    /// <summary>
	/// 創建工作流請求
	/// </summary>
    public class AddFlowInstanceReq : NodeDesignateReq
    {
        /// <summary>
        /// 實例編號
        /// </summary>
        [Description("實例編號")]
        public string Code { get; set; }

        /// <summary>
        /// 自定義名稱
        /// </summary>
        [Description("自定義名稱")]
        public string CustomName { get; set; }

        /// <summary>
        /// 流程模板內容
        /// </summary>
        [Description("流程模板內容")]
        public string SchemeContent { get; set; }

        /// <summary>
	    /// 流程模板ID
	    /// </summary>
        public string SchemeId { get; set; }

        /// <summary>
        /// 流程模板自定義編號
        /// </summary>
        public string SchemeCode { get; set; }

        /// <summary>
        /// 數據庫名稱
        /// </summary>
        [Description("數據庫名稱")]
        public string DbName { get; set; }

        /// <summary>
        /// 表單數據
        /// </summary>
        [Description("表單數據")]
        public string FrmData { get; set; }

        /// <summary>
        /// 表單類型
        /// </summary>
        [Description("表單類型")]
        public int FrmType { get; set; }

        /// <summary>
        /// 表單中的控件屬性描述
        /// </summary>
        [Description("表單中的控件屬性描述")]
        public string FrmContentData { get; set; }

        /// <summary>
        /// 表單控件位置模板
        /// </summary>
        [Description("表單控件位置模板")]
        public string FrmContentParse { get; set; }

        /// <summary>
        /// 表單ID
        /// </summary>
        [Description("表單ID")]
        public string FrmId { get; set; }

        /// <summary>
        /// 所屬部門
        /// </summary>
        [Description("所屬部門")]
        public string OrgId { get; set; }

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
        /// 實例備注
        /// </summary>
        [Description("實例備注")]
        public string Description { get; set; }
    }
}
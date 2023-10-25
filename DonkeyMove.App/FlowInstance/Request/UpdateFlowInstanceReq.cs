using System.ComponentModel;

namespace donkeymove.App.Request
{
    /// <summary>
	/// 創建工作流請求
	/// </summary>
    public class UpdateFlowInstanceReq : NodeDesignateReq
    {
        /// <summary>
        /// 待更改的流程實例ID
        /// </summary>
        public string Id { get; set; }

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
        /// 所屬部門
        /// </summary>
        [Description("所屬部門")]
        public string OrgId { get; set; }

        /// <summary>
        /// 實例備注
        /// </summary>
        [Description("實例備注")]
        public string Description { get; set; }
    }
}
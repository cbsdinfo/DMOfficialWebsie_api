using donkeymove.Repository.Domain;

namespace donkeymove.App.Response
{
    public class FlowVerificationResp :FlowInstance
    {
        /// <summary>
        /// 預覽表單數據
        /// </summary>
        public string FrmPreviewHtml
        {
            get { return FormUtil.Preview(this); }
        }

        /// <summary>
        /// 預覽表單數據表單項包含讀寫控制權限）
        /// </summary>
        public string FrmHtml
        {
            get
            {
                if (this.FrmType != 0)  //只有開原版動態表單才需要轉換
                {
                    return string.Empty;
                }

                return FormUtil.GetHtml(this.FrmContentData, this.FrmContentParse, this.FrmData, "",this.CanWriteFormItemIds);
            }
        }
        
        /// <summary>
        /// 下個節點的執行權限方式
        /// </summary>
        public string NextNodeDesignateType { get; set; }
        
        /// <summary>
        /// 當前節點的可寫表單Id
        /// </summary>
        public string[] CanWriteFormItemIds { get; set; }
    }
}

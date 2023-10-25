using System.Collections.Generic;

namespace donkeymove.App.Request
{
    public class VerificationReq : NodeDesignateReq
    {
        public string FlowInstanceId { get; set; }
        /// <summary>
        /// 1:同意；2：不同意；3：駁回
        /// </summary>
        public string VerificationFinally { get; set; }

        /// <summary>
        /// 審核意見
        /// </summary>
        public string VerificationOpinion { get; set; }

        /// <summary>
        /// 駁回的步驟，即駁回到的節點ID
        /// </summary>
        public string NodeRejectStep { get; set; }
        
        /// <summary>
        /// 駁回類型。null:使用節點配置的駁回類型/0:前一步/1:第一步/2：指定節點，使用NodeRejectStep
        /// </summary>
        public string NodeRejectType { get; set; }
        
        /// <summary>
        /// 新的表單數據
        /// 如果該節點有可以修改的表單項時，會提交表單數據信息
        /// </summary>
        public string FrmData { get; set; }
        
    }
}

namespace donkeymove.App.Request
{
    /// <summary>
    /// 召回、撤銷流程
    /// </summary>
    public class RecallFlowInstanceReq
    {
        /// <summary>
        /// 召回、撤銷的流程實例ID
        /// </summary>
        public string FlowInstanceId { get; set; }
        /// <summary>
        /// 撤回備注
        /// </summary>
        public string Description { get; set; }
        
    }
}

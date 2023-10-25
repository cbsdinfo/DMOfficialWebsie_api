namespace Infrastructure.Const
{
    /// <summary>
    /// 流程狀態
    /// </summary>
    public struct FlowInstanceStatus
    {
        /// <summary>
        /// 撤銷、召回
        /// </summary>
        public const int Draft = -1; 
        /// <summary>
        /// 正在運行
        /// </summary>
        public const int Running = 0; 
        /// <summary>
        /// 完成
        /// </summary>
        public const int Finished = 1; 
        /// <summary>
        /// 不同意
        /// </summary>
        public const int Disagree = 3;  
        /// <summary>
        /// 駁回
        /// </summary>
        public const int Rejected = 4; 
        
    }
}
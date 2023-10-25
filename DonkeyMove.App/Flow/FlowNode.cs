namespace donkeymove.App.Flow
{
    /// <summary>
    /// 流程節點
    /// </summary>
    public class FlowNode
    {
        public const string START = "start round mix";
        public const string END = "end round";
        public const string NODE = "node";
        public const string FORK = "fork"; //會簽開始節點
        public const string JOIN = "join"; //會簽結束節點

        public string id { get; set; }

        public string name { get; set; }

        public string type { get; set; }

        public int left { get; set; }
        public int top { get; set; }

        public int width { get; set; }
        public int height { get; set; }
        public bool alt { get; set; }

        /// <summary>
        /// 節點的附加數據項
        /// </summary>
        /// <value>The set information.</value>
        public Setinfo setInfo { get; set; }
    }

    public class Setinfo
    {
        public const string ALL_USER = "ALL_USER"; //所有用戶
        public const string SPECIAL_ROLE = "SPECIAL_ROLE"; //指定角色
        public const string SPECIAL_USER = "SPECIAL_USER"; //指定用戶

        public const string RUNTIME_SPECIAL_ROLE = "RUNTIME_SPECIAL_ROLE"; //運行時指定角色
        public const string RUNTIME_SPECIAL_USER = "RUNTIME_SPECIAL_USER"; //運行時指定用戶

        /// <summary>
        /// 節點執行權限類型
        /// </summary>
        public string NodeDesignate { get; set; }

        public Nodedesignatedata NodeDesignateData { get; set; }
        public string NodeCode { get; set; }
        public string NodeName { get; set; }

        /// <summary>
        ///  流程執行時，三方回調的URL地址
        /// </summary>
        public string ThirdPartyUrl { get; set; }

        /// <summary>
        /// 駁回節點0"前一步"1"第一步"2"某一步" 3"不處理"
        /// </summary>
        public string NodeRejectType { get; set; }

        public int? Taged { get; set; }
        public string UserName { get; set; }
        public string UserId { get; set; }
        public string Description { get; set; }
        public string TagedTime { get; set; }

        //節點會簽方式，
        //all/空：默認為全部通過
        //one ：至少有一個通過
        public string NodeConfluenceType { get; set; }

        /// <summary>
        /// 會簽通過的個數
        /// </summary>
        public int? ConfluenceOk { get; set; }

        /// <summary>
        /// 會簽拒絕的個數
        /// </summary>
        public int? ConfluenceNo { get; set; }
        
        /// <summary>
        /// 可寫的表單項ID
        /// </summary>
        public string[] CanWriteFormItemIds { get; set; }
    }

    /// <summary>
    /// 節點執行人
    /// </summary>
    public class Nodedesignatedata
    {
        public string[] users { get; set; }
        public string[] roles { get; set; }
        public string[] orgs { get; set; }
    }

    /// <summary>
    /// 節點執行結果標簽
    /// </summary>
    public class Tag
    {
        /// <summary>
        ///  1: 通過
        ///  2：不通過
        ///  3：駁回
        /// </summary>
        public int Taged { get; set; }

        public string UserId { get; set; }
        public string UserName { get; set; }
        public string Description { get; set; }
        public string TagedTime { get; set; }
    }

    /// <summary>
    ///  1: 通過
    ///  2：不通過
    ///  3：駁回
    /// </summary>
    public enum TagState
    {
        Ok = 1,
        No,
        Reject
    }
}
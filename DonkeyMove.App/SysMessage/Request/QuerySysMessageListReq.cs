namespace donkeymove.App.Request
{
    public class QuerySysMessageListReq : PageReq
    {
        /// <summary>
        /// 消息狀態 0:未讀；1：已讀； 999:全部
        /// </summary>
        public int Status { get; set; }
    }
}
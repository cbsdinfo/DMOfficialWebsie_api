namespace Infrastructure
{
    public class Response
    {
        /// <summary>
        /// 操作消息【當Status不為 200時，顯示詳細的錯誤信息】
        /// </summary>
        public string Message { get; set; }

        /// <summary>
        /// 操作狀態碼，200為正常
        /// </summary>
        public int Code { get; set; }

        public Response()
        {
            Code = 200;
            Message = "操作成功";
        }
    }


    /// <summary>
    /// WEBAPI通用返回泛型基類
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class Response<T> : Response
    {
        /// <summary>
        /// 回傳的結果
        /// </summary>
        public T Result { get; set; }
    }
}

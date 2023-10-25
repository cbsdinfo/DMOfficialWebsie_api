namespace donkeymove.App.Request
{
    /// <summary>
    /// 請求參數中只有Id
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class IdRequest<T>
    {
        /// <summary>
        /// 操作Id
        /// </summary>
        public T Id { get; set; }
    }
}

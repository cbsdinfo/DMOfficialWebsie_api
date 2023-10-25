namespace Infrastructure
{
    public class KeyDescription
    {
        /// <summary>
        /// 鍵值
        /// </summary>
        public string Key { get; set; }
        /// <summary>
        /// 鍵的描述
        /// </summary>
        public string Description { get; set; }
        
        /// <summary>
        /// 前端是否顯示
        /// </summary>
        public bool Browsable { get; set; }
        
        /// <summary>
        /// 字段類型
        /// </summary>
        public string Type { get; set; }
    }
}

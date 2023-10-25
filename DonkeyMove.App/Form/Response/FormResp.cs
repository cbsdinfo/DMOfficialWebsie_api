namespace donkeymove.App.Response
{
    /// <summary>
	/// 表單模板表
	/// </summary>
    public class FormResp
    {
        /// <summary>
	    /// 表單名稱
	    /// </summary>
        public string Id { get; set; }

        /// <summary>
	    /// 表單名稱
	    /// </summary>
        public string Name { get; set; }

        /// <summary>
	    /// 字段個數
	    /// </summary>
        public int Fields { get; set; }

        /// <summary>
        /// 表單類型，0：默認動態表單；1：Web自定義表單
        /// </summary>
        public int FrmType { get; set; }

        /// <summary>
        /// 系統頁面標識，當表單類型為用Web自定義的表單時，需要標識加載哪個頁面
        /// </summary>
        public string WebId { get; set; }

        /// <summary>
	    /// 表單中的字段數據
	    /// </summary>
        public string ContentData { get; set; }

        /// <summary>
	    /// 表單替換的模板 經過處理
	    /// </summary>
        public string ContentParse { get; set; }

        /// <summary>
	    /// 表單原html模板未經處理的
	    /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 表單的數據
        /// </summary>
        public string FrmData { get; set; }

        /// <summary>
        /// 排序碼
        /// </summary>
        public int SortCode { get; set; }

        public string Description { get; set; }

        /// <summary>
	    /// 數據庫名稱
	    /// </summary>
        public string DbName { get; set; }

        /// <summary>
        /// 用戶顯示
        /// </summary>
        public string Html
        {
            get { return FormUtil.GetHtml(this); }
        }

        public string[] CanWriteFormItemIds { get; set; }

        /// <summary>
        /// 用戶顯示（表單項包含讀寫控制權限）
        /// </summary>
        public string HtmlWithCanWriteIds
        {
            get
            {
                if (this.FrmType != 0)  //只有開原版動態表單才需要轉換
                {
                    return string.Empty;
                }
                return FormUtil.GetHtml(this.ContentData, this.ContentParse, this.FrmData, "", this.CanWriteFormItemIds);
            }
        }
    }
}
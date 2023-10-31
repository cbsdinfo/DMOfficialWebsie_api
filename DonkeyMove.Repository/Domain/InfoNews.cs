using donkeymove.Repository.Core;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 首頁服務次數管理
    /// </summary>
    [Table("InfoNews")]
    public partial class InfoNews : StringEntity
    {
        public InfoNews() {

            this.ClInfoNewsType = string.Empty;
            this.ReleaseTime = DateTime.Now;
            this.ImagePath = string.Empty;
            this.Title = string.Empty;
            this.Content = string.Empty;
            this.Link = string.Empty;
            this.PhotoAuthorPath = string.Empty;
            this.AboutAuthor = string.Empty;
            this.CreateTime = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.UpdateTime = DateTime.Now;
            this.UpdateUserId = string.Empty;
        }

        /// <summary>
        /// 文章類別 參考 CategoryType.Name = InfoNewsType
        /// </summary>
        [Description("文章類別")]
        public string ClInfoNewsType { get; set; }

        /// <summary>
        /// 發布日期
        /// </summary>
        [Description("發布日期")]
        public DateTime ReleaseTime { get; set; }

        /// <summary>
        /// 圖片路徑
        /// </summary>
        [Description("圖片路徑")]
        public string ImagePath { get; set; }

        /// <summary>
        /// 標題
        /// </summary>
        [Description("標題")]
        public string Title { get; set; }

        /// <summary>
        /// 文章內容
        /// </summary>
        [Description("文章內容")]
        public string Content { get; set; }

        /// <summary>
        /// 連結
        /// </summary>
        [Description("連結")]
        public string Link { get; set; }

        /// <summary>
        /// 作者照片
        /// </summary>
        [Description("作者照片")]
        public string PhotoAuthorPath { get; set; }

        /// <summary>
        /// 作者介紹
        /// </summary>
        [Description("作者介紹")]
        public string AboutAuthor { get; set; }

        /// <summary>
        /// 狀態（是否顯示於前台）
        /// </summary>
        [Description("狀態（是否顯示於前台）")]
        public bool Status { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("創建時間")]
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        [Description("創建人ID")]
        public string CreateUserId { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("修改時間")]
        public System.DateTime UpdateTime { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        [Description("修改人ID")]
        public string UpdateUserId { get; set; }
    }
}

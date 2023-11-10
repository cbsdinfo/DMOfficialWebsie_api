using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 社會實踐單元管理
    /// </summary>
    [Table("SocialPractice")]
    public partial class SocialPractice : StringEntity
    {
        public SocialPractice()
        {
            this.Title = string.Empty;
            this.YoutubeUrl = string.Empty;
            this.Abstract = string.Empty;
            this.SubTitle1 = string.Empty;
            this.SubTitle2 = string.Empty;
            this.SubTitle3 = string.Empty;
            this.Display = true;
            this.Status = true;
            this.CreateTime = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.UpdateTime = DateTime.Now;
            this.UpdateUserId = string.Empty;
        }

        /// <summary>
        /// 標題名稱
        /// </summary>
        [Description("標題名稱")]
        public string Title { get; set; }

        /// <summary>
        /// Youtube連結
        /// </summary>
        [Description("Youtube連結")]
        public string YoutubeUrl { get; set; }

        /// <summary>
        /// 影片摘要
        /// </summary>
        [Description("影片摘要")]
        public string Abstract { get; set; }

        /// <summary>
        /// 首頁區塊小標1
        /// </summary>
        [Description("首頁區塊小標1")]
        public string SubTitle1 { get; set; }

        /// <summary>
        /// 首頁區塊小標2
        /// </summary>
        [Description("首頁區塊小標2")]
        public string SubTitle2 { get; set; }

        /// <summary>
        /// 首頁區塊小標3
        /// </summary>
        [Description("首頁區塊小標3")]
        public string SubTitle3 { get; set; }

        /// <summary>
        /// 是否顯示於首頁
        /// </summary>
        [Description("是否顯示於首頁")]
        public bool Display { get; set; }

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
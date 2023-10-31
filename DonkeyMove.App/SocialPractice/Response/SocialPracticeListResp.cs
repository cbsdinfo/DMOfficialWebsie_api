using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Response
{
    public class SocialPracticeListResp
    {
        /// <summary>
        /// 序號
        /// </summary>
        public string Id {  get; set; }

        /// <summary>
        /// 標題名稱
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// Youtube連結
        /// </summary>
        public string YoutubeUrl { get; set; }

        /// <summary>
        /// 影片摘要
        /// </summary>
        public string Abstract { get; set; }

        /// <summary>
        /// 首頁區塊小標1
        /// </summary>
        public string SubTitle1 { get; set; }

        /// <summary>
        /// 首頁區塊小標2
        /// </summary>
        public string SubTitle2 { get; set; }

        /// <summary>
        /// 首頁區塊小標3
        /// </summary>
        public string SubTitle3 { get; set; }

        /// <summary>
        /// 是否顯示於首頁
        /// </summary>
        public bool Display { get; set; }

        /// <summary>
        /// 狀態（是否顯示於前台）
        /// </summary>
        public bool Status { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        public string CreateUserId { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        public System.DateTime UpdateTime { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        public string UpdateUserId { get; set; }
    }
}

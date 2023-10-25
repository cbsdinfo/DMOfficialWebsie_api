using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.SocialPractice.Request
{
    public class AddOrUpdateSocialPracticeReq
    {
        /// <summary>
        /// 流水號
        /// </summary>
        public string Id { get; set; }

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
        public int Display { get; set; }

        /// <summary>
        /// 是否顯示於首頁
        /// </summary>
        public int Status { get; set; }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Request
{
    public class AddSocialPracticeReq
    {
        /// <summary>
        /// 標題名稱
        /// </summary>
        /// <example>食醫助行-台東1919惜食運輸</example>
        public string Title { get; set; }

        /// <summary>
        /// Youtube連結
        /// </summary>
        /// <example>https://www.youtube.com/watch?v=_JFnLwWs_Yw</example>
        public string YoutubeUrl { get; set; }

        /// <summary>
        /// 影片摘要
        /// </summary>
        /// <example>一趟239公里的惜食物資接力運送任務，將食物、物資及愛從高雄大寮一路送到台東長濱，支持偏鄉長輩們的生活。</example>
        public string Abstract { get; set; }

        /// <summary>
        /// 首頁區塊小標1
        /// </summary>
        /// <example>震災發生後，以服務支持在地</example>
        public string SubTitle1 { get; set; }

        /// <summary>
        /// 首頁區塊小標2
        /// </summary>
        /// <example>行駛239公里</example>
        public string SubTitle2 { get; set; }

        /// <summary>
        /// 首頁區塊小標3
        /// </summary>
        /// <example>總節約28090公斤碳排放量</example>
        public string SubTitle3 { get; set; }

        /// <summary>
        /// 是否顯示於首頁
        /// </summary>
        /// <example>true</example>
        public bool Display { get; set; }

        /// <summary>
        /// 是否顯示於首頁
        /// </summary>
        /// <example>true</example>
        public bool Status { get; set; }

    }
}

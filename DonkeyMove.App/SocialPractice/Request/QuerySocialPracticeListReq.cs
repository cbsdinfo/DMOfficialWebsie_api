using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Request
{
    public class QuerySocialPracticeListReq
    {
        /// <summary>
        /// 標題名稱
        /// </summary>        
        public string Title { get; set; }

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
        /// 顯示於首頁（是/否）
        /// </summary>        
        public bool? Display { get; set; }

        /// <summary>
        /// 狀態（啟用/隱藏）
        /// </summary>        
        public bool? Status { get; set; }
    }
}

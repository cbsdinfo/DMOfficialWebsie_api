using donkeymove.Repository.Core;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace donkeymove.App.Request
{
    
    public partial class QueryInfoNewsReq
    {
        
        /// <summary>
        /// 文章類別 參考 CategoryType.Name = InfoNewsType
        /// </summary>
        public string ClInfoNewsType { get; set; }

        /// <summary>
        /// 發布日期區間最下限
        /// </summary>
        public DateTime ReleaseTimeLb { get; set; }

        /// <summary>
        /// 發布日期區間上限
        /// </summary>
        public DateTime ReleaseTimeUb { get; set; }
                
        /// <summary>
        /// 標題
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 文章內容
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 連結
        /// </summary>
        public string Link { get; set; }

        /// <summary>
        /// 作者介紹
        /// </summary>
        public string AboutAuthor { get; set; }

        /// <summary>
        /// 狀態（是否顯示於前台）
        /// </summary>
        public bool? Status { get; set; }
    }
}

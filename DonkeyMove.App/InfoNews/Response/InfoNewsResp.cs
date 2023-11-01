using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Response
{
    public class InfoNewsResp
    {
        /// <summary>
        /// 序號
        /// </summary>
        public string Id {  get; set; }

        /// <summary>
        /// 文章類別 參考 CategoryType.Name = InfoNewsType
        /// </summary>
        public string ClInfoNewsType { get; set; }

        /// <summary>
        /// 文章類別 參考 CategoryType.Name = InfoNewsType
        /// </summary>
        public string InfoNewsTypeName { get; set; }

        /// <summary>
        /// 發布日期
        /// </summary>
        public DateTime ReleaseTime { get; set; }

        /// <summary>
        /// 圖片路徑
        /// </summary>
        public string Image { get; set; }

        /// <summary>
        /// 圖片明細
        /// </summary>
        public UploadFileResp ImageDetail { get; set; }

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
        /// 作者照片
        /// </summary>
        public string PhotoAuthor { get; set; }

        /// <summary>
        /// 作者照片
        /// </summary>
        public UploadFileResp PhotoAuthorDetail { get; set; }

        /// <summary>
        /// 作者介紹
        /// </summary>
        public string AboutAuthor { get; set; }

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

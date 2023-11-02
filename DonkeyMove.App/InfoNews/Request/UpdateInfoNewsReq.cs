using donkeymove.Repository.Core;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace donkeymove.App.Request
{
    
    public partial class UpdateInfoNewsReq
    {
        /// <summary>
        /// 序號
        /// </summary>
        [Required]
        public string Id { get; set; }

        /// <summary>
        /// 文章類別 參考 CategoryType.Name = InfoNewsType
        /// </summary>
        [Required]
        public string ClInfoNewsType { get; set; }


        /// <summary>
        /// 發布日期
        /// </summary>
        [Required]
        [DataType(DataType.Date)] 
        public DateTime ReleaseTime { get; set; }

        /// <summary>
        /// 圖片Id（UploadFile後取得Id填入）
        /// </summary>
        [Required]
        public string Image { get; set; }

        /// <summary>
        /// 標題
        /// </summary>
        [Required]
        public string Title { get; set; }

        /// <summary>
        /// 文章內容
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 連結
        /// </summary>
        [Url]
        public string Link { get; set; }

        /// <summary>
        /// 作者照片（UploadFile後取得Id填入）
        /// </summary>
        public string PhotoAuthor { get; set; }

        /// <summary>
        /// 作者介紹
        /// </summary>
        public string AboutAuthor { get; set; }

        /// <summary>
        /// 狀態（啟用/隱藏）
        /// </summary>
        [Required]
        public bool Status { get; set; }
    }
}

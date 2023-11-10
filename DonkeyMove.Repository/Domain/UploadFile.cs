using System;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
	/// 文件
	/// </summary>
    [Table("UploadFile")]
    public partial class UploadFile : StringEntity
    {
        public UploadFile()
        {
            this.FileName = string.Empty;
            this.FilePath = string.Empty;
            this.Description = string.Empty;
            this.FileType = string.Empty;
            this.Extension = string.Empty;
            this.SortCode = 0;
            this.CreateUserId = string.Empty;
            this.CreateUserName = string.Empty;
            this.CreateTime = DateTime.Now;
            this.Thumbnail = string.Empty;
            this.BelongApp = string.Empty;
            this.BelongAppId = string.Empty;
        }

        /// <summary>
	    /// 文件名稱
	    /// </summary>
        public string FileName { get; set; }

        /// <summary>
	    /// 文件路徑
	    /// </summary>
        public string FilePath { get; set; }

        /// <summary>
	    /// 描述
	    /// </summary>
        public string Description { get; set; }

        /// <summary>
	    /// 文件類型
	    /// </summary>
        public string FileType { get; set; }

        /// <summary>
	    /// 文件大小
	    /// </summary>
        public int? FileSize { get; set; }

        /// <summary>
	    /// 擴展名稱
	    /// </summary>
        public string Extension { get; set; }

        /// <summary>
	    /// 是否可用
	    /// </summary>
        public bool Enable { get; set; }

        /// <summary>
	    /// 排序
	    /// </summary>
        public int SortCode { get; set; }

        /// <summary>
	    /// 刪除標識
	    /// </summary>
        public bool DeleteMark { get; set; }

        /// <summary>
	    /// 上傳人
	    /// </summary>
        public string CreateUserId { get; set; }

        /// <summary>
	    /// 上傳人姓名
	    /// </summary>
        public string CreateUserName { get; set; }

        /// <summary>
	    /// 上傳時間
	    /// </summary>
        public System.DateTime CreateTime { get; set; }

        /// <summary>
	    /// 縮略圖
	    /// </summary>
        public string Thumbnail { get; set; }

        /// <summary>
	    /// 所屬應用
	    /// </summary>
        public string BelongApp { get; set; }

        /// <summary>
	    /// 所屬應用ID
	    /// </summary>
        public string BelongAppId { get; set; }
    }
}
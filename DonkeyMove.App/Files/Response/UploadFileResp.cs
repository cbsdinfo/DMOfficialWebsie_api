using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Response
{
    public class UploadFileResp
    {
        /// <summary>
        /// 序號
        /// </summary>
        public string Id { get; set; }

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

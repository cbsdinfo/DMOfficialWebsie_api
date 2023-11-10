using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Response
{
    public class KeyVisualResp
    {
        /// <summary>
        /// 序號
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// 單元名稱
        /// </summary>
        public string UnitName { get; set; }

        /// <summary>
        /// 圖片
        /// </summary>
        public string Image { get; set; }

        /// <summary>
        /// 圖片明細
        /// </summary>
        public UploadFileResp ImageDetail { get; set; }

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

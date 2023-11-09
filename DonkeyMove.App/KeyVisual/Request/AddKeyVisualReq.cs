using donkeymove.App.VaildationAttributes;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Request
{
    public class AddKeyVisualReq
    {
        /// <summary>
        /// 單元名稱
        /// </summary>
        [Required]
        public string UnitName { get; set; }

        /// <summary>
        /// 圖片 Id（UploadFile 後取得 Id 填入）
        /// </summary>
        [Required]
        [IsVaildFilesId]
        public string Image { get; set; }
    }
}

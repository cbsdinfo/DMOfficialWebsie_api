using donkeymove.Repository.Core;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 關於我們單元管理
    /// </summary>
    [Table("AboutUs")]
    public class AboutUs : StringEntity
    {
        public AboutUs() { 
            this.Content = string.Empty;
            this.CreateTime = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.UpdateTime = DateTime.Now;
            this.UpdateUserId = string.Empty;
        }

        /// <summary>
        /// 文章內容
        /// </summary>
        [Description("文章內容")]
        public string Content { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("創建時間")]
        public System.DateTime CreateTime { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        [Description("創建人ID")]
        public string CreateUserId { get; set; }

        /// <summary>
        /// 創建時間
        /// </summary>
        [Description("修改時間")]
        public System.DateTime UpdateTime { get; set; }

        /// <summary>
        /// 創建人
        /// </summary>
        [Description("修改人ID")]
        public string UpdateUserId { get; set; }
    }
}

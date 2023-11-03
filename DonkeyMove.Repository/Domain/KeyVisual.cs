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
    /// 主視覺管理
    /// </summary>
    [Table("KeyVisual")]
    public class KeyVisual : StringEntity
    {
        public KeyVisual() {
            this.UnitName = string.Empty;
            this.Image = string.Empty;
            this.CreateTime = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.UpdateTime = DateTime.Now;
            this.UpdateUserId = string.Empty;
        }

        /// <summary>
        /// 單元名稱
        /// </summary>
        [Description("單元名稱")]
        public string UnitName {  get; set; }

        /// <summary>
        /// 圖片
        /// </summary>
        [Description("圖片")]
        public string Image {  get; set; }

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

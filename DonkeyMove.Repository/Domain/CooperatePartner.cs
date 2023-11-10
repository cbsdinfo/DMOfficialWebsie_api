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
    /// 合作夥伴單元管理
    /// </summary>
    [Table("CooperatePartner")]
    public class CooperatePartner : StringEntity
    {

        public CooperatePartner() {
            this.Name = string.Empty;
            this.Status = true;
            this.CreateTime = DateTime.Now;
            this.CreateUserId = string.Empty;
            this.UpdateTime = DateTime.Now;
            this.UpdateUserId = string.Empty;
        }

        /// <summary>
        /// 夥伴名稱
        /// </summary>
        [Description("夥伴名稱")]
        public string Name { get; set; }

        /// <summary>
        /// 圖檔 
        /// <see cref="UploadFile.Id"/>
        /// </summary> 
        [Description("圖檔")]
        public string Image { get; set; }

        /// <summary>
        /// 狀態（上架/下架）
        /// </summary>
        [Description("狀態（上架/下架）")]
        public bool Status { get; set; }
        
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

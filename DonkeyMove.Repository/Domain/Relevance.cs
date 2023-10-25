using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using donkeymove.Repository.Core;

namespace donkeymove.Repository.Domain
{
    /// <summary>
    /// 多對多關系集中映射
    /// </summary>
    [Table("Relevance")]
    public partial class Relevance : StringEntity
    {
        public Relevance()
        {
            this.Description = string.Empty;
            this.Key = string.Empty;
            this.Status = 0;
            this.OperateTime = DateTime.Now;
            this.OperatorId = string.Empty;
            this.FirstId = string.Empty;
            this.SecondId = string.Empty;
            this.ThirdId = string.Empty;
            this.ExtendInfo = string.Empty;
        }

        /// <summary>
        /// 描述
        /// </summary>
        [Description("描述")]
        public string Description { get; set; }

        /// <summary>
        /// 映射標識
        /// </summary>
        [Description("映射標識")]
        public string Key { get; set; }

        /// <summary>
        /// 狀態
        /// </summary>
        [Description("狀態")]
        public int Status { get; set; }

        /// <summary>
        /// 授權時間
        /// </summary>
        [Description("授權時間")]
        public System.DateTime OperateTime { get; set; }

        /// <summary>
        /// 授權人
        /// </summary>
        [Description("授權人")]
        public string OperatorId { get; set; }

        /// <summary>
        /// 第一個表主鍵ID
        /// </summary>
        [Description("第一個表主鍵ID")]
        public string FirstId { get; set; }

        /// <summary>
        /// 第二個表主鍵ID
        /// </summary>
        [Description("第二個表主鍵ID")]
        public string SecondId { get; set; }

        /// <summary>
        /// 第三個主鍵
        /// </summary>
        [Description("第三個主鍵")]
        public string ThirdId { get; set; }

        /// <summary>
        /// 擴展信息
        /// </summary>
        [Description("擴展信息")]
        public string ExtendInfo { get; set; }
    }
}
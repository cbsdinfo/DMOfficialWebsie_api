using donkeymove.Repository.Core;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace donkeymove.App.Request
{

    public partial class QueryInfoNewsReq : IValidatableObject
    {

        /// <summary>
        /// 文章類別 參考 CategoryType.TypeId = "b6f5998e-9bef-46c6-9d84-b1b1862350c7" 取 dtCode or dtValue
        /// </summary>
        public string ClInfoNewsType { get; set; }

        /// <summary>
        /// 發布日期區間最下限
        /// </summary>
        public DateTime ReleaseTimeLb { get; set; }

        /// <summary>
        /// 發布日期區間上限
        /// </summary>
        public DateTime ReleaseTimeUb { get; set; }

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
        /// 作者介紹
        /// </summary>
        public string AboutAuthor { get; set; }

        /// <summary>
        /// 狀態（是否顯示於前台）
        /// </summary>
        public bool? Status { get; set; }

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if (ReleaseTimeLb.Date != DateTime.Parse("0001-01-01") && ReleaseTimeUb.Date != DateTime.Parse("0001-01-01"))
            {
                if (ReleaseTimeLb > ReleaseTimeUb)
                {
                    yield return new ValidationResult("發布日期「下限」不得大於「上限」", new string[] { "ReleaseTimeLb", "ReleaseTimeUb" });
                }
            }
        }
    }
}

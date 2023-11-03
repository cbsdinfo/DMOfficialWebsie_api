using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Request
{
    public class UpdateServiceTimesReq
    {
        /// <summary>
        /// 序號
        /// </summary>
        [Required]
        public string Id { get; set; }


        /// <summary>
        /// 服務次數
        /// </summary>        
        [Required]
        [RegularExpression(@"^\d{1,3}(,\d{3})*(\.\d+)?$")]
        public string NumberTimes { get; set; }
    }
}

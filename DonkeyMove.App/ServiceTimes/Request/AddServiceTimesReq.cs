using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Request
{
    public class AddServiceTimesReq
    {
        /// <summary>
        /// 服務類型名稱
        /// </summary>
        [Required]
        public string ServiceName { get; set; }

        /// <summary>
        /// 服務次數
        /// </summary>        
        [Required]
        public string NumberTimes { get; set; }        
    }
}

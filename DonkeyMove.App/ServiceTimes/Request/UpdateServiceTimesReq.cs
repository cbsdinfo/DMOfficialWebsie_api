using System;
using System.Collections.Generic;
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
        public string Id { get; set; }

        /// <summary>
        /// 服務次數
        /// </summary>        
        public string NumberTimes { get; set; }        
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.ServiceTimes.Request
{
    public class AddServiceTimesReq
    {
        /// <summary>
        /// 序號
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// 服務類型名稱
        /// </summary>
        public string ServiceName { get; set; }

        /// <summary>
        /// 服務次數
        /// </summary>        
        public string NumberTimes { get; set; }        
    }
}

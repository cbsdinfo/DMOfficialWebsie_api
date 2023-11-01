using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Request
{
    public class QueryServiceTimesReq
    {
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

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Request
{
    public class QueryKeyVisualReq
    {
        /// <summary>
        /// 單元名稱
        /// </summary>
        [Required]
        public string UnitName { get; set; }

    }
}

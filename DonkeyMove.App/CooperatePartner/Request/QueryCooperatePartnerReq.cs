using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Request
{
    public class QueryCooperatePartnerReq
    {
        /// <summary>
        /// 夥伴名稱
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 狀態（上架/下架）
        /// </summary>
        public bool? Status { get; set; }

    }
}

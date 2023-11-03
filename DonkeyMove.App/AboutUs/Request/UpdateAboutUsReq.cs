using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.Request
{
    public class UpdateAboutUsReq
    {
        /// <summary>
        /// 序號
        /// </summary>
        [Required]
        public string Id { get; set; }

        /// <summary>
        /// 文章內容
        /// </summary>
        [Required]
        public string Content { get; set; }
    }
}

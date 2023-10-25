using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using donkeymove.Repository.Core;

namespace donkeymove.App.Request
{
    /// <summary>
	/// 代碼生成器的表信息
	/// </summary>
    public class CreateVueReq
    {
        /// <summary>
        /// 代碼生成模版Id
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// vue項目所在的根目錄，如：D:\donkeymove.Pro\Client
        /// </summary>
        public string VueProjRootPath { get; set; }
    }
}
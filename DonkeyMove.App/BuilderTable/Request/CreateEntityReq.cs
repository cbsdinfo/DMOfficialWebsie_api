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
    public class CreateEntityReq
    {
        /// <summary>
        /// 代碼生成模版Id
        /// </summary>
        public string Id { get; set; }
    }
}
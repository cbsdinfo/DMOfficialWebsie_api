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
    public partial class AddOrUpdateBuilderTableReq
    {
        /// <summary>
        /// Id為空則為添加
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// 表英文全稱
        /// </summary>
        public string TableName { get; set; }

        /// <summary>
        /// 表描述、中文名稱
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// 父表ID
        /// </summary>
        public string ParentTableId { get; set; }

        /// <summary>
        /// 實體類名稱
        /// </summary>
        public string ClassName { get; set; }

        /// <summary>
        /// 命名空間
        /// </summary>
        public string Namespace { get; set; }

        /// <summary>
        /// 模塊標識
        /// </summary>
        public string ModuleCode { get; set; }

        /// <summary>
        /// 模塊名稱
        /// </summary>
        public string ModuleName { get; set; }

        /// <summary>
        /// 代碼相對文件夾路徑
        /// </summary>
        public string Folder { get; set; }

        /// <summary>
        /// 其它生成選項
        /// </summary>
        public string Options { get; set; }

        /// <summary>
        /// 分類ID
        /// </summary>
        public string TypeId { get; set; }

        /// <summary>
        /// 分類名稱
        /// </summary>
        public string TypeName { get; set; }

        /// <summary>
        /// 是否動態加載表頭信息
        /// </summary>
        public bool IsDynamicHeader { get; set; }

        /// <summary>
        /// 子表外鍵
        /// </summary>
        public string ForeignKey { get; set; }
    }
}
using System;
using System.Collections.Generic;
using Infrastructure;
using donkeymove.Repository.Domain;

namespace donkeymove.App.Response
{
    /// <summary>
    /// table的返回數據
    /// </summary>
    public class TableData
    {
        /// <summary>
        ///  返回的表格列定義
        /// 該屬性基于代碼生成使用的列定義
        /// </summary>
        public List<BuilderTableColumn> columnFields;

        public TableData()
        {
            code = 200;
            msg = "加載成功";
            columnFields = new List<BuilderTableColumn>();
        }

        /// <summary>
        /// 狀態碼
        /// </summary>
        public int code { get; set; }

        /// <summary>
        /// 操作消息
        /// </summary>
        public string msg { get; set; }

        /// <summary>
        /// 總記錄條數
        /// </summary>
        public int count { get; set; }

        /// <summary>
        /// 數據內容
        /// </summary>
        public dynamic data { get; set; }
    }


    /// <summary>
    /// table的返回數據
    /// </summary>
    public class TableData<T>
    {
        /// <summary>
        ///  返回的表格列定義
        /// 該屬性基于代碼生成使用的列定義
        /// </summary>
        public List<BuilderTableColumn> columnFields;

        public TableData()
        {
            code = 200;
            msg = "加載成功";
            columnFields = new List<BuilderTableColumn>();
        }

        /// <summary>
        /// 狀態碼
        /// </summary>
        public int code { get; set; }

        /// <summary>
        /// 操作消息
        /// </summary>
        public string msg { get; set; }

        /// <summary>
        /// 總記錄條數
        /// </summary>
        public int count { get; set; }

        /// <summary>
        /// 數據內容
        /// </summary>
        public IEnumerable<T> data { get; set; }
    }
}
using System.Collections.Generic;
using Infrastructure;

namespace donkeymove.App.Response
{
    /// <summary>
    /// 返回確定類型的表格數據，可以為swagger提供精準的注釋
    /// </summary>
    public class TableResp<T>
    {
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
        public List<T> data { get; set; }
        
        /// <summary>
        ///  返回的列表頭信息
        /// </summary>
        public List<KeyDescription> columnHeaders { get; set; }

        public TableResp()
        {
            code = 200;
            msg = "加載成功";
            columnHeaders = new List<KeyDescription>();
        }
    }
}
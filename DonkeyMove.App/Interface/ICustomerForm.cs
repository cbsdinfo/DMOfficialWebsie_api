namespace donkeymove.App.Interface
{
    /// <summary>
    /// 開發者自定義表單的統一接口
    /// <para>例如：FrmLeaveReqApp為請假表單對應的應用層，實現該接口，可以自動向數據庫中插入對應的記錄</para>
    /// </summary>
    public interface  ICustomerForm
    {
        /// <summary>
        /// 該接口定義自定義表單模式時需實現向數據庫寫入表單數據
        /// </summary>
        /// <param name="flowInstanceId">表單對應的流程實例ID</param>
        /// <param name="frmData">表單數據</param>
        void Add(string flowInstanceId, string frmData);
        
        /// <summary>
        /// 該接口定義流程自定義表單模式時需實現向數據庫更新表單數據
        /// </summary>
        /// <param name="flowInstanceId">更新的時候前端沒有存儲Id，需要用流程實例ID來關聯，如果前端設計了Id字段，則可以不用</param>
        /// <param name="frmData">表單數據</param>
        void Update(string flowInstanceId, string frmData);
    }
}

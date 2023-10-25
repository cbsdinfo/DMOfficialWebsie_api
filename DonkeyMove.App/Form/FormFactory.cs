using System;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;

namespace donkeymove.App
{
    public class FormFactory
    {
        public static IForm CreateForm(Form form, IUnitWork<donkeymoveDBContext> unitWork)
        {
            if (form.FrmType == 0)
            {
                return new LeipiForm(unitWork);
            }else if (form.FrmType == 1)
            {
                throw new Exception("自定義表單不需要創建數據庫表");
            }
            else
            {
                return new DragForm(unitWork);
            }
        }
    }
}
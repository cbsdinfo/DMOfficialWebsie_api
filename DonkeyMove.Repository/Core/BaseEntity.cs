namespace donkeymove.Repository.Core
{
    public abstract class BaseEntity
    {
        /// <summary>
        /// 判斷主鍵是否為空，常用做判定操作是【添加】還是【編輯】
        /// </summary>
        /// <returns></returns>
        public abstract bool KeyIsNull();

        /// <summary>
        /// 創建默認的主鍵值
        /// </summary>
        public abstract void GenerateDefaultKeyVal();

        public BaseEntity()
        {
            if (KeyIsNull())
            {
                GenerateDefaultKeyVal();
            }
        }
    }
}
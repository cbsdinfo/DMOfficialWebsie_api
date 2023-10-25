using System;
using System.ComponentModel;

namespace donkeymove.Repository.Core
{
    /// <summary>
    /// 主鍵為字符串的實體基類，為系統默認的實體類型
    /// </summary>
    public class StringEntity : BaseEntity
    {
        [Browsable(false)]
        public string Id { get; set; }
        
        /// <summary>
        /// 判斷主鍵是否為空，常用做判定操作是【添加】還是【編輯】
        /// </summary>
        /// <returns></returns>
        public override bool KeyIsNull()
        {
            return string.IsNullOrEmpty(Id);
        }

        /// <summary>
        /// 創建默認的主鍵值
        /// </summary>
        public override void GenerateDefaultKeyVal()
        {
            Id = Guid.NewGuid().ToString();
        }
    }
}

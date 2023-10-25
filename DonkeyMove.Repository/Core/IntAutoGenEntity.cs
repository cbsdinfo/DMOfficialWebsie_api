using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace donkeymove.Repository.Core
{
    /// <summary>
    /// 數據庫Id為numberic且為數據庫自動生成的數據實體使用該基類，用法同Entity
    /// <para>該場景通常為SqlServer的自動增長類型和Oracle自帶的Sequence</para>
    /// </summary>
    public class IntAutoGenEntity :BaseEntity
    {
        [Browsable(false)]
        [Key,DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public override bool KeyIsNull()
        {
            return Id == 0;
        }

        public override void GenerateDefaultKeyVal()
        {
            //主鍵自動增長類型，可以不用該方法生成主鍵，設置該方法為空方法即可
            //當DbContext執行SaveChanges()后，如果添加成功，可以直接獲取對象的Id
        }
    }
}
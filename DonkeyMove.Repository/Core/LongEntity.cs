using System.ComponentModel;
using Yitter.IdGenerator;

namespace donkeymove.Repository.Core
{
    /// <summary>
    /// 數據庫Id為numberic類型的數據實體使用該基類，用法同Entity
    /// 數據庫Id字段為numberic(16,0)或以上長度的整型，采用雪花算法生成Id。
    /// </summary>
    public class LongEntity :BaseEntity
    {
        [Browsable(false)]
        public decimal Id { get; set; }
        public override bool KeyIsNull()
        {
            return Id == 0;
        }
        
        static LongEntity()
        {
            //設置參數，程序初始化時執行一次
            var options = new IdGeneratorOptions()
            {
                Method = 1,
                WorkerId = 1
            };
            
            YitIdHelper.SetIdGenerator(options);
        }

        /// <summary>
        /// 采用雪花算法計算Id
        /// </summary>
        public override void GenerateDefaultKeyVal()
        {
            Id = YitIdHelper.NextId();
        }
    }
}
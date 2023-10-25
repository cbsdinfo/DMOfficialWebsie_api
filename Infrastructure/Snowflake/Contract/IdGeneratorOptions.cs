/*
 * 版權屬于：yitter(yitter@126.com)
 * 開源地址：https://gitee.com/yitter/idgenerator
 * 版權協議：MIT
 * 版權說明：只要保留本版權，你可以免費使用、修改、分發本代碼。
 * 免責條款：任何因為本代碼產生的系統、法律、政治、宗教問題，均與版權所有者無關。
 * 
 */

using System;
using System.Collections.Generic;
using System.Text;

namespace Yitter.IdGenerator
{
    public class IdGeneratorOptions
    {
        /// <summary>
        /// 雪花計算方法
        /// （1-漂移算法|2-傳統算法），默認1
        /// </summary>
        public virtual short Method { get; set; } = 1;

        /// <summary>
        /// 基礎時間（UTC格式）
        /// 不能超過當前系統時間
        /// </summary>
        public virtual DateTime BaseTime { get; set; } = new DateTime(2020, 2, 20, 2, 20, 2, 20, DateTimeKind.Utc);

        /// <summary>
        /// 機器碼
        /// 與 WorkerIdBitLength 有關系
        /// （ushort類型，最大值65535，如果有更高要求，請修改數據類型，或聯系作者)
        /// </summary>
        public virtual ushort WorkerId { get; set; } = 0;

        /// <summary>
        /// 機器碼位長
        /// 范圍：1-21（要求：序列數位長+機器碼位長不超過22）。
        /// 建議范圍：6-12。
        /// </summary>
        public virtual byte WorkerIdBitLength { get; set; } = 6;//10;

        /// <summary>
        /// 序列數位長
        /// 范圍：2-21（要求：序列數位長+機器碼位長不超過22）。
        /// 建議范圍：6-14。
        /// </summary>
        public virtual byte SeqBitLength { get; set; } = 6;//10;

        /// <summary>
        /// 最大序列數（含）
        /// （由SeqBitLength計算的最大值）
        /// </summary>
        public virtual int MaxSeqNumber { get; set; } = 0;

        /// <summary>
        /// 最小序列數（含）
        /// 默認5，不小于1，不大于MaxSeqNumber
        /// </summary>
        public virtual ushort MinSeqNumber { get; set; } = 5;

        /// <summary>
        /// 最大漂移次數（含），
        /// 默認2000，推薦范圍500-10000（與計算能力有關）
        /// </summary>
        public virtual int TopOverCostCount { get; set; } = 2000;


        public IdGeneratorOptions()
        {

        }

        public IdGeneratorOptions(ushort workerId)
        {
            WorkerId = workerId;
        }
    }
}

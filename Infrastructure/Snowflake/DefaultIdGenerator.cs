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
using System.Threading;

namespace Yitter.IdGenerator
{
    /// <summary>
    /// 默認實現
    /// </summary>
    public class DefaultIdGenerator : IIdGenerator
    {
        private ISnowWorker _SnowWorker { get; set; }

        public Action<OverCostActionArg> GenIdActionAsync
        {
            get => _SnowWorker.GenAction;
            set => _SnowWorker.GenAction = value;
        }


        public DefaultIdGenerator(IdGeneratorOptions options)
        {
            if (options == null)
            {
                throw new ApplicationException("options error.");
            }

            if (options.BaseTime < DateTime.Now.AddYears(-50) || options.BaseTime > DateTime.Now)
            {
                throw new ApplicationException("BaseTime error.");
            }

            if (options.WorkerIdBitLength <= 0)
            {
                throw new ApplicationException("WorkerIdBitLength error.(range:[1, 21])");
            }
            if (options.SeqBitLength + options.WorkerIdBitLength > 22)
            {
                throw new ApplicationException("error：WorkerIdBitLength + SeqBitLength <= 22");
            }

            var maxWorkerIdNumber = (1 << options.WorkerIdBitLength) - 1;
            if (options.WorkerId < 0 || options.WorkerId > maxWorkerIdNumber)
            {
                throw new ApplicationException("WorkerId error. (range:[0, " + (maxWorkerIdNumber > 0 ? maxWorkerIdNumber : 63) + "]");
            }

            if (options.SeqBitLength < 2 || options.SeqBitLength > 21)
            {
                throw new ApplicationException("SeqBitLength error. (range:[2, 21])");
            }

            var maxSeqNumber = (1 << options.SeqBitLength) - 1;
            if (options.MaxSeqNumber < 0 || options.MaxSeqNumber > maxSeqNumber)
            {
                throw new ApplicationException("MaxSeqNumber error. (range:[1, " + maxSeqNumber + "]");
            }

            var maxValue = maxSeqNumber;
            if (options.MinSeqNumber < 1 || options.MinSeqNumber > maxValue)
            {
                throw new ApplicationException("MinSeqNumber error. (range:[1, " + maxValue + "]");
            }

            switch (options.Method)
            {
                case 1:
                    _SnowWorker = new SnowWorkerM1(options);
                    break;
                case 2:
                    _SnowWorker = new SnowWorkerM2(options);
                    break;
                default:
                    _SnowWorker = new SnowWorkerM1(options);
                    break;
            }

            if (options.Method == 1)
            {
                Thread.Sleep(500);
            }
        }


        public long NewLong()
        {
            return _SnowWorker.NextId();
        }
    }
}

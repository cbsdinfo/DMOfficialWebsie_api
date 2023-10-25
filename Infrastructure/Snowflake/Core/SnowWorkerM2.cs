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
    /// <summary>
    /// 常規雪花算法
    /// </summary>
    internal class SnowWorkerM2 : SnowWorkerM1
    {
        public SnowWorkerM2(IdGeneratorOptions options) : base(options)
        {

        }

        public override long NextId()
        {
            lock (_SyncLock)
            {
                long currentTimeTick = GetCurrentTimeTick();

                if (_LastTimeTick == currentTimeTick)
                {
                    if (_CurrentSeqNumber++ > MaxSeqNumber)
                    {
                        _CurrentSeqNumber = MinSeqNumber;
                        currentTimeTick = GetNextTimeTick();
                    }
                }
                else
                {
                    _CurrentSeqNumber = MinSeqNumber;
                }

                if (currentTimeTick < _LastTimeTick)
                {
                    throw new Exception(string.Format("Time error for {0} milliseconds", _LastTimeTick - currentTimeTick));
                }

                _LastTimeTick = currentTimeTick;
                var result = ((currentTimeTick << _TimestampShift) + ((long)WorkerId << SeqBitLength) + (uint)_CurrentSeqNumber);

                return result;
            }
        }

    }
}

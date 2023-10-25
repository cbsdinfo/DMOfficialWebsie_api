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
    /// Id生成時回調參數
    /// </summary>
    public class OverCostActionArg
    {
        /// <summary>
        /// 事件類型
        /// 1-開始，2-結束，8-漂移
        /// </summary>
        public virtual int ActionType { get; set; }
        /// <summary>
        /// 時間戳
        /// </summary>
        public virtual long TimeTick { get; set; }
        /// <summary>
        /// 機器碼
        /// </summary>
        public virtual ushort WorkerId { get; set; }
        /// <summary>
        /// 漂移計算次數
        /// </summary>
        public virtual int OverCostCountInOneTerm { get; set; }
        /// <summary>
        /// 漂移期間生產ID個數
        /// </summary>
        public virtual int GenCountInOneTerm { get; set; }
        /// <summary>
        /// 漂移周期
        /// </summary>
        public virtual int TermIndex { get; set; }

        public OverCostActionArg(ushort workerId, long timeTick, int actionType = 0, int overCostCountInOneTerm = 0, int genCountWhenOverCost = 0, int index = 0)
        {
            ActionType = actionType;
            TimeTick = timeTick;
            WorkerId = workerId;
            OverCostCountInOneTerm = overCostCountInOneTerm;
            GenCountInOneTerm = genCountWhenOverCost;
            TermIndex = index;
        }
    }
}

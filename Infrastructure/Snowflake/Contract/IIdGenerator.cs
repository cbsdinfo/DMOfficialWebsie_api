/*
 * 版權屬于：yitter(yitter@126.com)
 * 開源地址：https://gitee.com/yitter/idgenerator
 * 版權協議：MIT
 * 版權說明：只要保留本版權，你可以免費使用、修改、分發本代碼。
 * 免責條款：任何因為本代碼產生的系統、法律、政治、宗教問題，均與版權所有者無關。
 * 
 */

using System;

namespace Yitter.IdGenerator
{
    public interface IIdGenerator
    {
        /// <summary>
        /// 生成過程中產生的事件
        /// </summary>
        Action<OverCostActionArg> GenIdActionAsync { get; set; }

        /// <summary>
        /// 生成新的long型Id
        /// </summary>
        /// <returns></returns>
        long NewLong();

        // Guid NewGuid();
    }
}

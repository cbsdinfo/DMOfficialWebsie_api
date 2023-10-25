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
    /// 這是一個調用的例子，默認情況下，單機集成者可以直接使用 NextId()。
    /// </summary>
    public class YitIdHelper
    {
        private static IIdGenerator _IdGenInstance = null;

        public static IIdGenerator IdGenInstance => _IdGenInstance;

        /// <summary>
        /// 設置參數，建議程序初始化時執行一次
        /// </summary>
        /// <param name="options"></param>
        public static void SetIdGenerator(IdGeneratorOptions options)
        {
            _IdGenInstance = new DefaultIdGenerator(options);
        }

        /// <summary>
        /// 生成新的Id
        /// 調用本方法前，請確保調用了 SetIdGenerator 方法做初始化。
        /// 否則將會初始化一個WorkerId為1的對象。
        /// </summary>
        /// <returns></returns>
        public static long NextId()
        {
            if (_IdGenInstance == null)
            {
                _IdGenInstance = new DefaultIdGenerator(
                    new IdGeneratorOptions() { WorkerId = 1 }
                    );
            }

            return _IdGenInstance.NewLong();
        }

    }
}

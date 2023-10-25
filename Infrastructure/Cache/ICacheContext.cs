using System;

namespace Infrastructure.Cache
{
    /// <summary>
    /// 緩存接口
    /// </summary>
    public abstract class ICacheContext 
    {
        /// <summary>
        /// 獲取緩存項
        /// </summary>
        /// <typeparam name="T">緩存對象類型</typeparam>
        /// <param name="key">鍵</param>
        /// <returns>緩存對象</returns>
        public abstract T Get<T>(string key) ;

        /// <summary>
        /// 設置緩存項
        /// </summary>
        /// <typeparam name="T">緩存對象類型</typeparam>
        /// <param name="key">鍵</param>
        /// <param name="t">緩存對象</param>
        /// <returns>true成功,false失敗</returns>
        public abstract bool Set<T>(string key, T t, DateTime expire);

        /// <summary>
        /// 移除一個緩存項
        /// </summary>
        /// <param name="key">緩存項key</param>
        /// <returns>true成功,false失敗</returns>
        public abstract bool Remove(string key);

    }
}
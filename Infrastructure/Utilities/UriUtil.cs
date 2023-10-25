using System;
using System.Collections.Specialized;
using System.Web;

namespace Infrastructure.Utilities
{
    /// <summary>
    /// URl幫助類
    /// </summary>
    public class UriUtil
    {
        /// <summary>
        /// 在URL后面追加參數
        /// </summary>
        /// <param name="url"></param>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string GetAppendedQueryString(string url, string key, string value)
        {
            if (url.Contains("?"))
            {
                url = string.Format("{0}&{1}={2}", url, key, value);
            }
            else
            {
                url = string.Format("{0}?{1}={2}", url, key, value);
            }

            return url;
        }

        public static string RemoveParameter(string url, string key)
        {
            url = url.ToLower();
            key = key.ToLower();
            if (!url.Contains(key + "=")) return url;

            Uri uri = new Uri(url);
            NameValueCollection collection = HttpUtility.ParseQueryString(uri.Query);
            if (collection.Count == 0) return url;

            var val = collection[key];
            string fragmentToRemove = string.Format("{0}={1}", key, val);

            String result = url.ToLower().Replace("&" + fragmentToRemove, string.Empty).Replace("?" + fragmentToRemove, string.Empty);
            return result;
        }
    }
}
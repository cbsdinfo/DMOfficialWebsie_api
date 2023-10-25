using System;

namespace Infrastructure.Extensions
{
  public static class DateTimeExtension
  {
    /// <summary>
    /// 實現由C# 的時間到 Javascript 的時間的轉換
    /// returns the number of milliseconds since Jan 1, 1970 (useful for converting C# dates to JS dates)  
    /// </summary>
    /// <param name="dt"></param>
    /// <returns></returns>
    public static double UnixTicks(this DateTime dt)
    {
      DateTime d1 = new DateTime(1970, 1, 1); 
      DateTime d2 = dt.AddHours(8).ToUniversalTime(); 
      TimeSpan ts = new TimeSpan(d2.Ticks - d1.Ticks);
      return ts.TotalMilliseconds;
    }

    /// <summary>
    /// 將毫秒值轉成 C#  DateTime 類型
    /// </summary>
    /// <param name="time"></param>
    /// <returns></returns>
    public static DateTime ConvertTime(this long time)
    {
      DateTime timeStamp = new DateTime(1970, 1, 1); //得到1970年的時間戳    
      long t = (time + 8 * 60 * 60) * 10000000 + timeStamp.Ticks;
      DateTime dt = new DateTime(t);
      return dt;
    }
  }
}

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;

namespace Infrastructure.Middleware
{
    /// <summary>
    /// 請求與返回中間件
    /// </summary>
    public class RequestResponseLoggingMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<RequestResponseLoggingMiddleware> _log;

        /// <summary>
        /// 
        /// </summary> 
        public RequestResponseLoggingMiddleware(RequestDelegate next, ILogger<RequestResponseLoggingMiddleware> log)
        {
            _next = next;
            _log = log;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public async Task Invoke(HttpContext context)
        {
            #region 這里可以加入正則驗證context.Path。 過濾不需要記錄日志的api

            var path = context.Request.Path.ToString().ToLower();

            if (path.Contains("/index") || path.Contains("/check") ||
                path.Contains("/swagger") || path.Contains("/getsysdatas") || path.Contains("/load"))
            {
                await CatchNext(context);
                return;
            }

            #endregion

            // 啟用耗時 日志記錄
            var stopwatch = new Stopwatch();
            stopwatch.Start();
            var logData = new Dictionary<string, object>();
            var request = context.Request;
            logData.Add("request.url", request.Path.ToString());
            logData.Add("request.headers",
                request.Headers.ToDictionary(x => x.Key, v => string.Join(";", v.Value.ToList())));
            logData.Add("request.method", request.Method);
            logData.Add("request.executeStartTime", DateTimeOffset.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));
            //追蹤實別器
            logData.Add("traceIdentifier", context.TraceIdentifier);
            // 獲取請求body內容
            if (request.Method.ToLower().Equals("post"))
            {
                // 啟用倒帶功能，就可以讓 Request.Body 可以再次讀取
                request.EnableBuffering();
                // 文件上傳 記錄文件信息
                if (path.Contains("/upload"))
                {
                    var content = string.Join(",", request.Form.Files.Select(item => item.FileName));
                    logData.Add("request.body", $"收到上傳文件:{content}");
                }
                else
                {
                    var sr = new StreamReader(request.Body, Encoding.UTF8);
                    //string content = sr.ReadToEnd();  //.Net Core 3.0 默認不再支持
                    var content = sr.ReadToEndAsync().Result;
                    logData.Add("request.body", content);
                    request.Body.Position = 0;
                }
            }
            else if (request.Method.ToLower().Equals("get"))
            {
                logData.Add("request.body", request.QueryString.Value);
            }

            // 獲取Response.Body內容
            var originalBodyStream = context.Response.Body;
            using (var responseBody = new MemoryStream())
            {
                context.Response.Body = responseBody;
                await CatchNext(context);
                if (!logData.ContainsKey("response.body"))
                {
                    logData.Add("response.body", await GetResponse(context.Response));
                }

                logData.Add("response.executeEndTime", DateTimeOffset.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));
                logData.Add("response.statusCode", context.Response.StatusCode);
                await responseBody.CopyToAsync(originalBodyStream);
            }

            // 響應完成記錄時間和存入日志
            context.Response.OnCompleted(() =>
            {
                try
                {
                    stopwatch.Stop();
                    logData.Add("elapsedTime", stopwatch.ElapsedMilliseconds + "ms");
                    var json = JsonHelper.Instance.Serialize(logData);
                    _log.LogInformation(json);
                    return Task.CompletedTask;
                }
                catch (Exception ex)
                {
                    return Task.FromException(ex);
                }
            });
        }

        private async Task CatchNext(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                _log.LogError(ex, "系統錯誤日志,管道捕獲");
                context.Response.StatusCode = 200;
                context.Response.ContentType = "application/json; charset=utf-8";
                var result = new { code = 500, message = ex.Message ?? "系統錯誤,請稍后再試" };
                await context.Response.WriteAsync(JsonHelper.Instance.Serialize(result));
            }
        }

        /// <summary>
        /// 獲取響應內容
        /// </summary>
        /// <param name="response"></param>
        /// <returns></returns>
        private static async Task<string> GetResponse(HttpResponse response)
        {
            response.Body.Seek(0, SeekOrigin.Begin);
            var text = await new StreamReader(response.Body).ReadToEndAsync();
            response.Body.Seek(0, SeekOrigin.Begin);
            return text;
        }
    }
}
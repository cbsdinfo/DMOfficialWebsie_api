using System;
using System.Net.Http;
using System.Net.Http.Headers;
using Autofac;
using Infrastructure;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.DependencyInjection;
using NUnit.Framework;
using donkeymove.App;
using donkeymove.App.SSO;

namespace donkeymove.WebApi.Test
{
    /// <summary>
    /// 模擬HTTP請求測試
    /// 用于測試模型綁定，看看一次客戶端的請求是否能被正確解析，亦或者測試WebAPI入口的一些Filter AOP等是否被正確觸發。
    /// 詳情參考：https://www.cnblogs.com/yubaolee/p/DotNetCoreUnitTest.html
    /// </summary>
    public class TestHttpRequest
    {
        private HttpClient _client;

        [SetUp]
        public void Init()
        {
           
        }

        /// <summary>
        /// 模擬一次登錄
        /// </summary>
        [Test]
        public LoginResult TestLogin()
        {
            var loginreq = new PassportLoginRequest
            {
                Account = "System",
                Password = "123456",
                AppKey = "donkeymove"
            };

            var request = new StringContent(JsonHelper.Instance.Serialize(loginreq));
            request.Headers.ContentType = MediaTypeHeaderValue.Parse("application/json");
            var response = _client.PostAsync("http://localhost:52789/api/Check/Login", request);

            string result = response.Result.Content.ReadAsStringAsync().Result;
            var loginresult = JsonHelper.Instance.Deserialize<LoginResult>(result);

            Console.WriteLine($"登錄結果:{result}");
            return loginresult;
        }

        /// <summary>
        /// 模擬加載字典列表
        /// </summary>
        [Test]
        public void TestLoad()
        {
            _client.DefaultRequestHeaders.Add("X-Token", TestLogin().Token);
            var response = _client.GetAsync("http://localhost:52789/api/categorys/load?page=1&limit=20");

            string result = response.Result.Content.ReadAsStringAsync().Result;
            Console.WriteLine($"獲取分類列表:{result}");
        }

        private void ConfigureTestServices(IServiceCollection services)
        {
        }

        private void ConfigureTestContainer(ContainerBuilder builder)
        {
            AutofacExt.InitAutofac(builder);
        }
    }
}
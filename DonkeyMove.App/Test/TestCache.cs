using System;
using System.Linq;
using Infrastructure;
using Infrastructure.Cache;
using Microsoft.AspNetCore.Http;
using NUnit.Framework;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using donkeymove.App.Request;
using donkeymove.App.SSO;
using donkeymove.Repository.Domain;

namespace donkeymove.App.Test
{
    public class TestCache : TestBase
    {
        public override ServiceCollection GetService()
        {
            var services = new ServiceCollection();

            var delservices = services.Where(u => u.ServiceType == typeof(ICacheContext)).ToList();
            for (int i = 0; i < delservices.Count(); i++)
            {
                services.Remove(delservices[i]);
            }
            services.AddScoped(typeof(ICacheContext), typeof(RedisCacheContext));

            return services;
        }

        /// <summary>
        /// 測試字符串
        /// </summary>
        [Test]
        public void SetString()
        {
            var app = _autofacServiceProvider.GetService<ICacheContext>();
            app.Set("123", "ok", DateTime.Now.AddDays(1));

            var result = app.Get<string>("yubaolee");
            Console.WriteLine($"redis結果:{result}");
        }

        /// <summary>
        /// 測試對象
        /// </summary>
        [Test]
        public void SetObj()
        {
            var app = _autofacServiceProvider.GetService<ICacheContext>();
            app.Set("user:info", new User
            {
                Name = "測試",
                Account = "Test",
                BizCode = "0.1.1"
            }, DateTime.Now.AddDays(1));

            var result = app.Get<User>("user:info");
            Console.WriteLine($"redis結果:{JsonHelper.Instance.Serialize(result)}");
        }

        /// <summary>
        /// 測試獲取不存在的key
        /// </summary>
        [Test]
        public void GetNoExistKey()
        {
            var app = _autofacServiceProvider.GetService<ICacheContext>();

            var result = app.Get<User>("noexistkey");
            Console.WriteLine($"redis結果:{JsonHelper.Instance.Serialize(result)}");
        }
    }
}
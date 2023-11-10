// <copyright file="UserSessionControllerTest.cs" company="donkeymove.Mvc">
//     Copyright (c) http://www.donkeymove.net.cn. All rights reserved.
// </copyright>
// <summary>
// 測試加載用戶菜單
// </summary>
// ***********************************************************************

using System;
using System.Diagnostics;
using Infrastructure;
using Infrastructure.Cache;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using NUnit.Framework;
using donkeymove.App;
using donkeymove.App.SSO;
using donkeymove.App.Test;
using donkeymove.WebApi.Controllers;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using donkeymove.App.Request;

namespace donkeymove.WebApi.Test
{
    public class InfoNewsUnitManagerControllerTest : TestBase
    {

        //如果要測試controller，則要重寫
        public override ServiceCollection GetService()
        {
            var services = new ServiceCollection();

            var cachemock = new Mock<ICacheContext>();
            cachemock.Setup(x => x.Get<UserAuthSession>("tokentest")).Returns(new UserAuthSession { Account = "admin" });
            services.AddScoped(x => cachemock.Object);

            services.AddMvc().AddControllersAsServices();
            services.AddScoped<CheckController>();

            //讀取配置文件
            IConfigurationBuilder configurationBuilder = new ConfigurationBuilder();
            // Duplicate here any configuration sources you use.
            configurationBuilder.AddJsonFile("AppSettings.json");
            IConfiguration configuration = configurationBuilder.Build();
            services.Configure<AppSetting>(configuration.GetSection("AppSetting"));

            services.AddLogging();

            return services;
        }


        [Test]
        public void TestGet()
        {
            var controller = _autofacServiceProvider.GetService<InfoNewsUnitManagerController>();

            try
            {
                Stopwatch watch = Stopwatch.StartNew();
                var result = controller.Get("ac7c7607-61a4-4edc-bb38-77ca48903498");
                Console.WriteLine(JsonHelper.Instance.Serialize(result));
                watch.Stop();
                Console.WriteLine($"總耗時:{watch.ElapsedMilliseconds}");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        [Test]
        public void TestGetList()
        {
            var controller = _autofacServiceProvider.GetService<InfoNewsUnitManagerController>();

            try
            {
                Stopwatch watch = Stopwatch.StartNew();
                var result = controller.GetList(new QueryInfoNewsReq());
                Console.WriteLine(JsonHelper.Instance.Serialize(result));
                watch.Stop();
                Console.WriteLine($"總耗時:{watch.ElapsedMilliseconds}");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        [Test]
        public void TestAdd()
        {
            var controller = _autofacServiceProvider.GetService<InfoNewsUnitManagerController>();
            try
            {
                Stopwatch watch = Stopwatch.StartNew();
                var result = controller.Add(new AddInfoNewsReq()
                {
                    Title = "測試標題",
                    ClInfoNewsType = "測試類型",
                    ReleaseTime = DateTime.Now,
                    Image = "08f41bf6-4388-4b1e-bd3e-2ff538b44b1b",
                    Status = true
                });
                Console.WriteLine(JsonHelper.Instance.Serialize(result));
                watch.Stop();
                Console.WriteLine($"總耗時:{watch.ElapsedMilliseconds}");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        [Test]
        public void TestUpdate()
        {
            var controller = _autofacServiceProvider.GetService<InfoNewsUnitManagerController>();

            try
            {
                Stopwatch watch = Stopwatch.StartNew();
                var result = controller.Update(new UpdateInfoNewsReq
                {
                    Id = "08f41bf6-4388-4b1e-bd3e-2ff538b44b1b",
                    Title = "測試標題",
                    ClInfoNewsType = "測試類型",
                    ReleaseTime = DateTime.Now,
                    Image = "08f41bf6-4388-4b1e-bd3e-2ff538b44b1b",
                    Status = true
                });
                Console.WriteLine(JsonHelper.Instance.Serialize(result));
                watch.Stop();
                Console.WriteLine($"總耗時:{watch.ElapsedMilliseconds}");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        [Test]
        public void TestDelete()
        {
            var controller = _autofacServiceProvider.GetService<InfoNewsUnitManagerController>();

            try
            {
                Stopwatch watch = Stopwatch.StartNew();
                var result = controller.Delete(new string[] { "08f41bf6-4388-4b1e-bd3e-2ff538b44b1b", "08f41bf6-4388-4b1e-bd3e-2ff538b44b1b" });
                Console.WriteLine(JsonHelper.Instance.Serialize(result));
                watch.Stop();
                Console.WriteLine($"總耗時:{watch.ElapsedMilliseconds}");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}

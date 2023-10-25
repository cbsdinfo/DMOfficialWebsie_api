using System;
using System.IO;
using System.Linq;
using Autofac.Extensions.DependencyInjection;
using Infrastructure;
using Infrastructure.Extensions.AutofacManager;
using Infrastructure.Utilities;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Moq;
using NUnit.Framework;
using donkeymove.Repository;

namespace donkeymove.App.Test
{
    public class TestBase
    {
        protected AutofacServiceProvider _autofacServiceProvider;

        [SetUp]
        public void Init()
        {
            var serviceCollection = GetService();
            serviceCollection.AddMemoryCache();
            serviceCollection.AddOptions();
            //讀取donkeymove.WebApi的配置文件用于單元測試
            var path = AppContext.BaseDirectory;
            int pos = path.IndexOf("donkeymove.App");
            if (pos == -1) //如果測試入口是donkeymove.WebApi
            {
                pos = path.IndexOf("donkeymove.WebApi");
            }
            var basepath = Path.Combine(path.Substring(0,pos) ,"donkeymove.WebApi");
            IConfiguration config = new ConfigurationBuilder()
                .SetBasePath(basepath)
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .AddJsonFile("appsettings.Development.json", optional: true)
                .AddEnvironmentVariables()
                .Build();
           
            serviceCollection.Configure<AppSetting>(config.GetSection("AppSetting"));
            //添加log4net
            serviceCollection.AddLogging(builder =>
            {
                builder.ClearProviders(); //去掉默認的日志
                builder.AddConfiguration(config.GetSection("Logging"));  //讀取配置文件中的Logging配置
                builder.AddLog4Net();
            });
            //注入donkeymove.WebApi配置文件
            serviceCollection.AddScoped(x => config);

            //模擬HTTP請求
            var httpContextAccessorMock = new Mock<IHttpContextAccessor>();
            httpContextAccessorMock.Setup(x => x.HttpContext.Request.Query[Define.TOKEN_NAME]).Returns("tokentest");
            httpContextAccessorMock.Setup(x => x.HttpContext.Request.Query[Define.TENANT_ID]).Returns("donkeymoveDBContext");
            serviceCollection.AddScoped(x => httpContextAccessorMock.Object);
            
            serviceCollection.AddDbContext<donkeymoveDBContext>();
            
            var container = AutofacExt.InitForTest(serviceCollection);
            _autofacServiceProvider = new AutofacServiceProvider(container);
            AutofacContainerModule.ConfigServiceProvider(_autofacServiceProvider);
            
            var dbtypes = config.GetSection("AppSetting:DbTypes").GetChildren()
                .ToDictionary(x => x.Key, x => x.Value);
            
            Console.WriteLine($"單元測試數據庫信息:{dbtypes[httpContextAccessorMock.Object.GetTenantId()]}/{config.GetSection("ConnectionStrings")["donkeymoveDBContext"]}");

        }

        /// <summary>
        /// 測試框架默認只注入了緩存Cache，配置Option；
        /// 如果在測試的過程中需要模擬登錄用戶，cookie等信息，需要重寫該方法，可以參考TestFlow的寫法
        /// </summary>
        public virtual ServiceCollection GetService()
        {
            return  new ServiceCollection();
        }
    }
}

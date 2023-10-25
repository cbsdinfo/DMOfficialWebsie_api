using System;
using System.IO;
using System.Linq;
using System.Reflection;
using Autofac;
using Autofac.Extensions.DependencyInjection;
using Infrastructure;
using Infrastructure.Utilities;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Moq;
using NUnit.Framework;
using donkeymove.Repository.Interface;

namespace donkeymove.Repository.Test
{
    /// <summary>
    /// Repository測試基類
    /// 測試用于測試DbContext、UnitWork、Repository，如果需要測試業務邏輯，請使用donkeymove.App里面的單元測試
    /// </summary>
    public class TestBase
    {
        protected AutofacServiceProvider _autofacServiceProvider;

        [SetUp]
        public void Init()
        {
            var serviceCollection = GetService();
            serviceCollection.AddMemoryCache();
            serviceCollection.AddOptions();
            serviceCollection.AddLogging();
            serviceCollection.AddScoped(typeof(IRepository<,>), typeof(BaseRepository<,>));
            serviceCollection.AddScoped(typeof(IUnitWork<>), typeof(UnitWork<>));

            //模擬配置文件
            //讀取donkeymove.WebApi的配置文件用于單元測試
            var path = AppContext.BaseDirectory;
            int pos =  path.LastIndexOf("donkeymove.");
            var basepath = Path.Combine(path.Substring(0,pos) ,"donkeymove.WebApi");
            IConfiguration config = new ConfigurationBuilder()
                .SetBasePath(basepath)
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .AddJsonFile("appsettings.Development.json", optional: true)
                .AddEnvironmentVariables()
                .Build();
         
            //添加log4net
            serviceCollection.AddLogging(builder =>
            {
                builder.ClearProviders(); //去掉默認的日志
                builder.AddConfiguration(config.GetSection("Logging"));  //讀取配置文件中的Logging配置
            });
            //注入donkeymove.WebApi配置文件
            serviceCollection.AddScoped(x => config);
            

            var httpContextAccessorMock = new Mock<IHttpContextAccessor>();
            httpContextAccessorMock.Setup(x => x.HttpContext.Request.Query[Define.TOKEN_NAME]).Returns("tokentest");
            httpContextAccessorMock.Setup(x => x.HttpContext.Request.Query[Define.TENANT_ID]).Returns("donkeymoveDBContext");

            serviceCollection.AddScoped(x => httpContextAccessorMock.Object);

            serviceCollection.AddDbContext<donkeymoveDBContext>();

            var builder = new ContainerBuilder();

            //注冊repository層
            builder.RegisterAssemblyTypes(Assembly.GetExecutingAssembly());

            builder.Populate(serviceCollection);
          
            var _container = builder.Build();
            _autofacServiceProvider = new AutofacServiceProvider(_container);
            
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

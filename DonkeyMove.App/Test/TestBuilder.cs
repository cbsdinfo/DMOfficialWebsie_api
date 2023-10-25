using System.IO;
using System.Net.Http;
using System.Reflection;
using Infrastructure;
using Infrastructure.Cache;
using Infrastructure.Provider;
using Microsoft.AspNetCore.Http;
using NUnit.Framework;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Hosting;
using Moq;
using donkeymove.App.Request;
using donkeymove.App.SSO;

namespace donkeymove.App.Test
{
    [TestFixture]
    public class TestBuilder :TestBase
    {
        //測試流程需要模擬登錄用戶
        public override ServiceCollection GetService()
        {
            var services = new ServiceCollection();

            var cachemock = new Mock<ICacheContext>();
            cachemock.Setup(x => x.Get<UserAuthSession>("tokentest")).Returns(new UserAuthSession { Account = "test3" });
            services.AddScoped(x => cachemock.Object);

            //模擬服務端httpContext
            var httpContextAccessorMock = new Mock<IHttpContextAccessor>();
            httpContextAccessorMock.Setup(x => x.HttpContext.Request.Query[Define.TOKEN_NAME]).Returns("tokentest");
            services.AddScoped(x => httpContextAccessorMock.Object);
            
            //模擬httpclientfactory
            var mockHttpFac = new Mock<IHttpClientFactory>();
            services.AddScoped(x => mockHttpFac.Object);

            //模擬路徑
            var path = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location)
                .Replace("\\donkeymove.App\\bin\\Debug\\netcoreapp3.1","");
            var mockPathProvider = new Mock<IPathProvider>();
            mockPathProvider.Setup(x => x.MapPath("",false)).Returns(path);
            services.AddScoped(x => mockHttpFac.Object);
            
            var host = new Mock<IHostEnvironment>();
            host.Setup(x => x.ContentRootPath).Returns(Path.Combine(path, "donkeymove.WebApi"));
            services.AddScoped(x => host.Object);
            return services;
        }


        [Test]
        public void add()
        {
            var app = _autofacServiceProvider.GetService<BuilderTableApp>();
            app.Add(new AddOrUpdateBuilderTableReq()
            {
               TableName = "Stock",
               Comment = "這是一個普通的應用管理生成模版",
               ClassName = "Stock",
               Namespace = "donkeymove.Repository.Domain",
               ModuleCode = "StockApp",
               ModuleName = "倉儲管理"
            });
        }

        [Test]
        public void CreateEntity()
        {
             var app = _autofacServiceProvider.GetService<BuilderTableApp>();
            
            app.CreateEntity(new CreateEntityReq
            {
                Id = "98dcbefb-8460-421f-b513-71618228a631"
            });
        }

        [Test]
        public void CheckModule()
        {
            var app = _autofacServiceProvider.GetService<BuilderTableApp>();
            app.CheckExistsModule("Application");
        }
        
        [Test]
        public void CreateBusiness()
        {
            var app = _autofacServiceProvider.GetService<BuilderTableApp>();
            
            app.CreateBusiness(new CreateBusiReq
            {
                Id = "f4464610-8c5c-441f-8825-13d6073e4385"
            });
        }
        
        [Test]
        public void CreateVue()
        {
            var app = _autofacServiceProvider.GetService<BuilderTableApp>();
            
            app.CreateVue(new CreateVueReq()
            {
                Id = "f4464610-8c5c-441f-8825-13d6073e4385",
                VueProjRootPath = "D:\\donkeymove.Pro\\Client"
            });
            app.CreateVueApi(new CreateVueReq()
            {
                Id = "f4464610-8c5c-441f-8825-13d6073e4385",
                VueProjRootPath = "D:\\donkeymove.Pro\\Client"
            });
        }
    }
}

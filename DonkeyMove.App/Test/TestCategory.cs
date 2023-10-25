using System;
using Infrastructure;
using Infrastructure.Cache;
using Microsoft.AspNetCore.Http;
using NUnit.Framework;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using donkeymove.App.Request;
using donkeymove.App.SSO;

namespace donkeymove.App.Test
{
    public class TestCategory :TestBase
    {
        //測試流程需要模擬登錄用戶
        public override ServiceCollection GetService()
        {
            var services = new ServiceCollection();

            var cachemock = new Mock<ICacheContext>();
            cachemock.Setup(x => x.Get<UserAuthSession>("tokentest")).Returns(new UserAuthSession { Account = "test" });
            services.AddScoped(x => cachemock.Object);

            var httpContextAccessorMock = new Mock<IHttpContextAccessor>();
            httpContextAccessorMock.Setup(x => x.HttpContext.Request.Query[Define.TOKEN_NAME]).Returns("tokentest");

            services.AddScoped(x => httpContextAccessorMock.Object);

            return services;
        }


        [Test]
        public void TestLoadCategories()
        {
            var app = _autofacServiceProvider.GetService<CategoryApp>();
           var result =  app.Load(new QueryCategoryListReq
           {
               limit = 10,
               page = 1
           });
            Console.WriteLine(JsonHelper.Instance.Serialize(result));
        }


        [Test]
        public void TestAssign()
        {
            var app = _autofacServiceProvider.GetService<RevelanceManagerApp>();
            
          app.AssignData(new AssignDataReq
          {
              ModuleCode = "Category",
              RoleId = "09ee2ffa-7463-4938-ae0b-1cb4e80c7c13",  //管理員
              Properties = new []{"Id", "Name" }
          });
        }
    }
}

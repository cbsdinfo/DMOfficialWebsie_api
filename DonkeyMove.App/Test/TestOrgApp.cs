using System;
using Infrastructure;
using Infrastructure.Cache;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using NUnit.Framework;
using donkeymove.App.SSO;
using donkeymove.Repository.Domain;

namespace donkeymove.App.Test
{
    class TestOrgApp :TestBase
    {
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
        public void TestAdd()
        {
            var orgname = "user_" + DateTime.Now.ToString("yyyy_MM_dd HH:mm:ss");
            Console.WriteLine(orgname);
            var app = _autofacServiceProvider.GetService<OrgManagerApp>();

            var id = app.Add(new SysOrg
            {
                Name = orgname,
                ParentId = ""
            });

            var org = app.Get(id);
            Console.WriteLine(JsonHelper.Instance.Serialize(org));
        }

        /// <summary>
        /// 測試刪除華東、中部片區
        /// </summary>
        [Test]
        public void TestDel()
        {
            var app = _autofacServiceProvider.GetService<OrgManagerApp>();
            app.DelOrgCascade(new []{"66386671-0494-4e83-8346-fbcf73283f7b","182dac38-64a0-414c-990c-7c9b7558a367"});
        }
        
        
        [Test]
        public void TestUpdate()
        {
            var orgname = "user_" + DateTime.Now.ToString("yyyy_MM_dd HH:mm:ss");
            Console.WriteLine(orgname);
            var app = _autofacServiceProvider.GetService<OrgManagerApp>();

            var id = app.Update(new SysOrg
            {
                Id="543a9fcf-4770-4fd9-865f-030e562be238",
                Name = orgname,
                ParentId = ""
            });

            var org = app.Get(id);
            Console.WriteLine(JsonHelper.Instance.Serialize(org));
        }
    }
}

using System;
using Infrastructure;
using Infrastructure.Cache;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using NUnit.Framework;
using donkeymove.App.Request;
using donkeymove.App.SSO;

namespace donkeymove.App.Test
{
    class TestUserApp :TestBase
    {
        public override ServiceCollection GetService()
        {
            var services = new ServiceCollection();

            var cachemock = new Mock<ICacheContext>();
            cachemock.Setup(x => x.Get<UserAuthSession>("tokentest")).Returns(new UserAuthSession { Account = Define.SYSTEM_USERNAME});
            services.AddScoped(x => cachemock.Object);

            var httpContextAccessorMock = new Mock<IHttpContextAccessor>();
            httpContextAccessorMock.Setup(x => x.HttpContext.Request.Query[Define.TOKEN_NAME]).Returns("tokentest");

            services.AddScoped(x => httpContextAccessorMock.Object);

            return services;
        }
        
        /// <summary>
        /// 測試添加用戶時，數據校驗。
        /// 因為請求數據沒有Account，Name等，該測試會提示異常
        /// </summary>
        [Test]
        public void TestValidation()
        {
            var app = _autofacServiceProvider.GetService<UserManagerApp>();
            try
            {
                app.AddOrUpdate(new UpdateUserReq
                {
                    OrganizationIds = "08f41bf6-4388-4b1e-bd3e-2ff538b44b1b",
                });
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
        
        [Test]
        public void TestAdd()
        {
            var account = "user_" + DateTime.Now.ToString("yyyy_MM_dd HH:mm:ss");
            Console.WriteLine(account);
            var app = _autofacServiceProvider.GetService<UserManagerApp>();

            var newuser = new UpdateUserReq
            {
                Account = account,
                Name = account,
                OrganizationIds = "08f41bf6-4388-4b1e-bd3e-2ff538b44b1b,543a9fcf-4770-4fd9-865f-030e562be238",
            };
            app.AddOrUpdate(newuser);

            app.AddOrUpdate(new UpdateUserReq
            {
                Id = newuser.Id,
                Password = "newpassword",
                Account = account,
                Name = "新名字",
                OrganizationIds = "08f41bf6-4388-4b1e-bd3e-2ff538b44b1b",
            });
        }
        
        [Test]
        public void TestLoad()
        {
            var app = _autofacServiceProvider.GetService<UserManagerApp>();
            var result = app.Load(new QueryUserListReq()
            {
                page = 1,
                limit = 10,
                orgId = "08f41bf6-4388-4b1e-bd3e-2ff538b44b1b"
            });
            
            Console.WriteLine(JsonHelper.Instance.Serialize(result));
        }

        [Test]
        public void TestLoadByOrg()
        {
            var app = _autofacServiceProvider.GetService<UserManagerApp>();
            var result = app.LoadByOrg(new QueryUserListByOrgReq
            {
                page = 1,
                limit = 10,
                orgId = "08f41bf6-4388-4b1e-bd3e-2ff538b44b1b"
            });
            
            Console.WriteLine(JsonHelper.Instance.Serialize(result));
        }
    }
}

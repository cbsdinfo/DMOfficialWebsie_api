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
    class TestSocialPracticeApp : TestBase
    {
        public override ServiceCollection GetService()
        {
            var services = new ServiceCollection();

            var cachemock = new Mock<ICacheContext>();
            cachemock.Setup(x => x.Get<UserAuthSession>("tokentest")).Returns(new UserAuthSession { Account = Define.SYSTEM_USERNAME });
            services.AddScoped(x => cachemock.Object);

            var httpContextAccessorMock = new Mock<IHttpContextAccessor>();
            httpContextAccessorMock.Setup(x => x.HttpContext.Request.Query[Define.TOKEN_NAME]).Returns("tokentest");

            services.AddScoped(x => httpContextAccessorMock.Object);

            return services;
        }

        //[Test]
        //public void TestGet()
        //{
        //    var app = _autofacServiceProvider.GetService<SocialPracticeApp>();

        //    try
        //    {
        //        var result = app.Get("ac7c7607-61a4-4edc-bb38-77ca48903498");
        //        Console.WriteLine(JsonHelper.Instance.Serialize(result));
        //    }
        //    catch (Exception e)
        //    {
        //        Console.WriteLine(e.Message);
        //    }
        //}

        [Test]
        public void TestGetById()
        {
            var app = _autofacServiceProvider.GetService<SocialPracticeApp>();

            try
            {
                var result = app.GetById("ac7c7607-61a4-4edc-bb38-77ca48903498");
                Console.WriteLine(JsonHelper.Instance.Serialize(result));
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        [Test]
        public void TestGetList()
        {            
            var app = _autofacServiceProvider.GetService<SocialPracticeApp>();
            var query = new QuerySocialPracticeReq();
            try
            {
                var result = app.GetList(query);
                Console.WriteLine(JsonHelper.Instance.Serialize(result));
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        [Test]
        public void TestAdd()
        {
            var app = _autofacServiceProvider.GetService<SocialPracticeApp>();
            try
            {
                var result = app.Add(new AddSocialPracticeReq()
                {
                    Title = "測試標題",
                    YoutubeUrl = "https://www.youtube.com/watch?v=6-ft-_fL-mU",
                    Abstract = "測試摘要",
                    SubTitle1 = "測試小標1",
                    SubTitle2 = "測試小標2",
                    SubTitle3 = "測試小標3",
                    Display = true,
                    Status = true,
                });
                Console.WriteLine(JsonHelper.Instance.Serialize(result));
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        [Test]
        public void TestUpate()
        {
            var app = _autofacServiceProvider.GetService<SocialPracticeApp>();
            try
            {
                app.Update(new UpdateSocialPracticeReq
                {
                    Id = "08f41bf6-4388-4b1e-bd3e-2ff538b44b1b",
                    Title = "測試標題",
                    YoutubeUrl = "https://www.youtube.com/watch?v=6-ft-_fL-mU",
                    Abstract = "測試摘要",
                    SubTitle1 = "測試小標1",
                    SubTitle2 = "測試小標2",
                    SubTitle3 = "測試小標3",
                    Display = true,
                    Status = true,
                });
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}

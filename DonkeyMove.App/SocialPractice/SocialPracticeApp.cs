using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Castle.Core.Internal;
using Infrastructure;
using Infrastructure.Extensions;
using Microsoft.EntityFrameworkCore;
using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;
using donkeymove.App.SocialPractice.Request;

namespace donkeymove.App.SocialPractice
{
    public class SocialPracticeApp : BaseStringApp<Repository.Domain.SocialPractice, donkeymoveDBContext>
    {
        private RevelanceManagerApp _revelanceApp;

        public SocialPracticeApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<Repository.Domain.SocialPractice, donkeymoveDBContext> repository, 
            RevelanceManagerApp app, IAuth auth) : base(unitWork, repository, auth)
        {
            _revelanceApp = app;

        }


        public string Add(AddOrUpdateSocialPracticeReq socialPractice)
        {
            var obj = socialPractice.MapTo<Repository.Domain.SocialPractice>();
            obj.GenerateDefaultKeyVal();
            obj.CreateTime = DateTime.Now;
            var user = _auth.GetCurrentUser().User;
            obj.CreateId = user.Id;            
            Repository.Add(obj);
            return obj.Id;
        }

        public void Update(AddOrUpdateSocialPracticeReq socialPractice)
        {
            var user = _auth.GetCurrentUser().User;
            UnitWork.Update<Repository.Domain.SocialPractice>(u => u.Id == socialPractice.Id, u => new Repository.Domain.SocialPractice
            {
                Title = socialPractice.Title,
                YoutubeUrl = socialPractice.YoutubeUrl,
                Abstract = socialPractice.Abstract,
                SubTitle1 = socialPractice.SubTitle1,
                SubTitle2 = socialPractice.SubTitle2,
                SubTitle3 = socialPractice.SubTitle3,
                Display = socialPractice.Display,
                Status = socialPractice.Status,
                UpdateTime = DateTime.Now,
                UpdateId = user.Id,
                //todo:要修改的字段賦值
            });
        }

        public List<Repository.Domain.SocialPractice> GetList()
        {
            return UnitWork.Find<Repository.Domain.SocialPractice>(null).ToList();
        }
    }
}

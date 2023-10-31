using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;
using Infrastructure;
using Infrastructure.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;

namespace donkeymove.App
{
    public class SocialPracticeApp : BaseStringApp<SocialPractice, donkeymoveDBContext>
    {
        public SocialPracticeApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<SocialPractice, donkeymoveDBContext> repository, 
            IAuth auth) : base(unitWork, repository, auth)
        {
        }


        public string Add(AddOrUpdateSocialPracticeReq socialPractice)
        {
            var obj = socialPractice.MapTo<Repository.Domain.SocialPractice>();
            obj.CreateTime = DateTime.Now;
            var user = _auth.GetCurrentUser().User;
            obj.CreateUserId = user.Id;
            obj.UpdateUserId = user.Id;
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
                UpdateUserId = user.Id,
                //todo:要修改的字段賦值
            });
        }

        public List<Repository.Domain.SocialPractice> GetList(QuerySocialPracticeListReq obj)
        {
            var result = UnitWork.Find<Repository.Domain.SocialPractice>(null);

            if (!obj.Title.IsNullOrEmpty())
            {
                result = result.Where(s => s.Title.IndexOf(obj.Title) != -1);    
            }

            if (!obj.Abstract.IsNullOrEmpty())
            {
                result = result.Where(s => s.Abstract.IndexOf(obj.Abstract) != -1);
            }

            if (!obj.SubTitle1.IsNullOrEmpty())
            {
                result = result.Where(s => s.SubTitle1.IndexOf(obj.SubTitle1) != -1);
            }

            if (!obj.SubTitle2.IsNullOrEmpty())
            {
                result = result.Where(s => s.SubTitle2.IndexOf(obj.SubTitle2) != -1);
            }
            if (!obj.SubTitle3.IsNullOrEmpty())
            {
                result = result.Where(s => s.SubTitle3.IndexOf(obj.SubTitle3) != -1);
            }
            if (obj.Display != null)
            {
                result = result.Where(s => s.Display.Equals(obj.Display));
            }
            if(obj.Status != null)
            {
                result = result.Where(s=> s.Status.Equals(obj.Status));
            }

            result = result.OrderByDescending(s => s.CreateTime);

            return result.ToList();
        }
    }
}

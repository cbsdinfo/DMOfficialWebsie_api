using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.App.Response;
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


        public SocialPracticeResp GetById(string id)
        {
            var result = UnitWork.Find<SocialPractice>(u => u.Id == id).Select(x => new SocialPracticeResp
            {
                Id = x.Id,                
                Title = x.Title,
                YoutubeUrl = x.YoutubeUrl,
                Abstract = x.Abstract,
                SubTitle1 = x.SubTitle1,
                SubTitle2 = x.SubTitle2,
                SubTitle3 = x.SubTitle3,
                Display = x.Display,
                UpdateTime = x.UpdateTime,
                UpdateUserId = x.UpdateUserId,
                CreateTime = x.CreateTime,
                CreateUserId = x.CreateUserId
            }).FirstOrDefault();
            return result;
        }

        public string Add(AddSocialPracticeReq request)
        {
            var obj = request.MapTo<SocialPractice>();
            obj.CreateTime = DateTime.Now;
            var user = _auth.GetCurrentUser().User;
            obj.CreateUserId = user.Id;
            obj.UpdateUserId = user.Id;
            Repository.Add(obj);
            return obj.Id;
        }

        public void Update(UpdateSocialPracticeReq request)
        {
            var user = _auth.GetCurrentUser().User;
            UnitWork.Update<SocialPractice>(u => u.Id == request.Id, u => new SocialPractice
            {
                Title = request.Title,
                YoutubeUrl = request.YoutubeUrl,
                Abstract = request.Abstract,
                SubTitle1 = request.SubTitle1,
                SubTitle2 = request.SubTitle2,
                SubTitle3 = request.SubTitle3,
                Display = request.Display,
                Status = request.Status,
                UpdateTime = DateTime.Now,
                UpdateUserId = user.Id,
                //todo:要修改的字段賦值
            });
        }

        public List<SocialPracticeListResp> GetList(QuerySocialPracticeListReq obj)
        {
            var result = UnitWork.Find<SocialPractice>(null);

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


            return result.Select(x => new SocialPracticeListResp() { 
                Id = x.Id,
                Title = x.Title,
                YoutubeUrl = x.YoutubeUrl,
                Abstract = x.Abstract,
                SubTitle1 = x.SubTitle1,
                SubTitle2 = x.SubTitle2,
                SubTitle3 = x.SubTitle3,
                Display = x.Display,
                UpdateTime = x.UpdateTime,
                UpdateUserId = x.UpdateUserId,
                CreateTime = x.CreateTime,
                CreateUserId = x.CreateUserId
            }).ToList();
        }
    }
}

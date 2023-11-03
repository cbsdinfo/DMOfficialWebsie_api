using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;
using Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App
{
    public class AboutUsApp : BaseStringApp<AboutUs, donkeymoveDBContext>
    {
        public AboutUsApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<AboutUs, donkeymoveDBContext> repository, IAuth auth) : base(unitWork, repository, auth)
        {

        }

        public string Add(AddAboutUsReq request)
        {
            var obj = request.MapTo<AboutUs>();
            obj.CreateTime = DateTime.Now;
            var user = _auth.GetCurrentUser().User;
            obj.CreateUserId = user.Id;
            obj.UpdateTime = DateTime.Now;
            obj.UpdateUserId = user.Id;
            Repository.Add(obj);
            return obj.Id;
        }

        public void Update(UpdateAboutUsReq request)
        {
            var user = _auth.GetCurrentUser().User;
            UnitWork.Update<AboutUs>(u => u.Id == request.Id, u => new AboutUs
            {                
                Content = request.Content,                
                UpdateTime = DateTime.Now,
                UpdateUserId = user.Id,
            });
        }

        public AboutUsResp GetById(string id)
        {
            var result = UnitWork.Find<AboutUs>(u => u.Id == id).Select(x => new AboutUsResp
            {
                Id = x.Id,
                Content = x.Content,
                UpdateTime = x.UpdateTime,
                UpdateUserId = x.UpdateUserId,
                CreateTime = x.CreateTime,
                CreateUserId = x.CreateUserId
            }).FirstOrDefault();
            return result;
        }
    }
}

using donkeymove.App.Interface;
using donkeymove.App.ServiceTimes.Request;
using donkeymove.App.SocialPractice.Request;
using donkeymove.Repository;
using donkeymove.Repository.Interface;
using Infrastructure;
using Infrastructure.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.ServiceTimes
{
    public class ServiceTimesApp : BaseStringApp<Repository.Domain.ServiceTimes, donkeymoveDBContext>
    {
        public ServiceTimesApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<Repository.Domain.ServiceTimes, 
            donkeymoveDBContext> repository, IAuth auth) : base(unitWork, repository, auth)
        {
            
        }

        public string Add(AddServiceTimesReq serviceTimes)
        {
            var obj = serviceTimes.MapTo<Repository.Domain.ServiceTimes>();
            obj.CreateTime = DateTime.Now;
            var user = _auth.GetCurrentUser().User;
            obj.CreateUserId = user.Id;
            obj.UpdateUserId = user.Id;
            Repository.Add(obj);
            return obj.Id;
        }

        public void Update(UpdateServiceTimesReq serviceTimes)
        {
            var user = _auth.GetCurrentUser().User;
            UnitWork.Update<Repository.Domain.ServiceTimes>(u => u.Id == serviceTimes.Id, u => new Repository.Domain.ServiceTimes
            {
                NumberTimes = serviceTimes.NumberTimes,                
                UpdateTime = DateTime.Now,
                UpdateUserId = user.Id,                
            });
        }

        public List<Repository.Domain.ServiceTimes> GetList(QueryServiceTimesListReq obj)
        {
            var result = UnitWork.Find<Repository.Domain.ServiceTimes>(null);

            if (!obj.ServiceName.IsNullOrEmpty())
            {
                result = result.Where(s => s.ServiceName.IndexOf(obj.ServiceName) != -1);
            }

            if (!obj.NumberTimes.IsNullOrEmpty())
            {
                result = result.Where(s => s.NumberTimes.IndexOf(obj.NumberTimes) != -1);
            }
            return result.ToList();
        }
    }
}

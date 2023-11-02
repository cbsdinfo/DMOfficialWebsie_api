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
    public class ServiceTimesApp : BaseStringApp<ServiceTimes, donkeymoveDBContext>
    {
        public ServiceTimesApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<Repository.Domain.ServiceTimes,
            donkeymoveDBContext> repository, IAuth auth) : base(unitWork, repository, auth)
        {

        }

        public ServiceTimesResp GetById(string id)
        {
            var result = UnitWork.Find<ServiceTimes>(u => u.Id == id).Select(x => new ServiceTimesResp
            {
                Id = x.Id,
                ServiceName = x.ServiceName,
                NumberTimes = x.NumberTimes,
                UpdateTime = x.UpdateTime,
                UpdateUserId = x.UpdateUserId,
                CreateTime = x.CreateTime,
                CreateUserId = x.CreateUserId
            }).FirstOrDefault();
            return result;
        }

        public string Add(AddServiceTimesReq serviceTimes)
        {
            var obj = serviceTimes.MapTo<ServiceTimes>();
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
            UnitWork.Update<ServiceTimes>(u => u.Id == serviceTimes.Id, u => new ServiceTimes
            {
                NumberTimes = serviceTimes.NumberTimes,
                UpdateTime = DateTime.Now,
                UpdateUserId = user.Id,
            });
        }

        public List<ServiceTimesListResp> GetList(QueryServiceTimesReq obj)
        {
            var result = UnitWork.Find<ServiceTimes>(null);

            if (!obj.ServiceName.IsNullOrEmpty())
            {
                result = result.Where(s => s.ServiceName.IndexOf(obj.ServiceName) != -1);
            }

            if (!obj.NumberTimes.IsNullOrEmpty())
            {
                result = result.Where(s => s.NumberTimes.IndexOf(obj.NumberTimes) != -1);
            }
            return result.Select(x => new ServiceTimesListResp()
            {
                Id = x.Id,
                ServiceName = x.ServiceName,
                NumberTimes = x.NumberTimes,
                UpdateTime = x.UpdateTime,
                UpdateUserId = x.UpdateUserId,
                CreateTime = x.CreateTime,
                CreateUserId = x.CreateUserId
            }).ToList();
        }
    }
}

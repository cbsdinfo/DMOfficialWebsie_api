using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;

namespace donkeymove.App
{
    /// <summary>
    /// 分類管理
    /// </summary>
    public class AppManager : BaseStringApp<Application, donkeymoveDBContext>
    {
        public AppManager(IUnitWork<donkeymoveDBContext> unitWork, IRepository<Application, donkeymoveDBContext> repository) : base(unitWork, repository, null)
        {
        }

        public void Add(Application Application)
        {
            if (string.IsNullOrEmpty(Application.Id))
            {
                Application.Id = Guid.NewGuid().ToString();
            }

            Repository.Add(Application);
        }

        public void Update(Application Application)
        {
            Repository.Update(Application);
        }


        public async Task<List<Application>> GetList(QueryAppListReq request)
        {
            var applications = UnitWork.Find<Application>(null);

            return await applications.ToListAsync();
        }


        public Application GetByAppKey(string modelAppKey)
        {
            return Repository.FirstOrDefault(u => u.AppSecret == modelAppKey);
        }
    }
}
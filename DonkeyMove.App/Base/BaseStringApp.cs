using System;
using System.Linq;
using Infrastructure;
using Microsoft.EntityFrameworkCore;
using donkeymove.App.Interface;
using donkeymove.Repository.Core;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;
using donkeymove.Repository;

namespace donkeymove.App
{
    /// <summary>
    /// 業務層基類，UnitWork用于事務操作，Repository用于普通的數據庫操作
    /// <para>如用戶管理：Class UserManagerApp:BaseApp&lt;User&gt;</para>
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <typeparam name="TDbContext"></typeparam>
    public class BaseStringApp<T, TDbContext> :BaseApp<T,TDbContext> where T : StringEntity where TDbContext: DbContext
    {
        private IUnitWork<donkeymoveDBContext> unitWork;
        private IRepository<User, donkeymoveDBContext> repository;
        private IAuth auth;

        public BaseStringApp(IUnitWork<TDbContext> unitWork, IRepository<T,TDbContext> repository, IAuth auth) : base(unitWork, repository, auth)
        {
        }

        /// <summary>
        /// 按id批量刪除
        /// </summary>
        /// <param name="ids"></param>
        public virtual void Delete(string[] ids)
        {
            Repository.Delete(u => ids.Contains(u.Id));
        }

        public T Get(string id)
        {
            return Repository.FirstOrDefault(u => u.Id == id);
        }

    }
}
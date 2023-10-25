using System;
using System.Linq;
using Infrastructure;
using Microsoft.EntityFrameworkCore;
using donkeymove.App.Interface;
using donkeymove.Repository.Core;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;

namespace donkeymove.App
{
    /// <summary>
    /// ??數據庫Id為numberic類型的數據表相關業務使用該基類??
    /// 業務層基類，UnitWork用于事務操作，Repository用于普通的數據庫操作
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <typeparam name="TDbContext"></typeparam>
    public class BaseLongApp<T, TDbContext> :BaseApp<T,TDbContext> where T : LongEntity where TDbContext: DbContext
    {


        public BaseLongApp(IUnitWork<TDbContext> unitWork, IRepository<T,TDbContext> repository, IAuth auth) : base(unitWork, repository,auth)
        {
        }
        

        /// <summary>
        /// 按id批量刪除
        /// </summary>
        /// <param name="ids"></param>
        public void Delete(decimal[] ids)
        {
            Repository.Delete(u => ids.Contains(u.Id));
        }

        public T Get(decimal id)
        {
            return Repository.FirstOrDefault(u => u.Id == id);
        }
    }
}
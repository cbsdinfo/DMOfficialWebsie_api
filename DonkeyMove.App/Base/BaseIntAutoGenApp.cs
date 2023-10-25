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
    /// 數據庫Id為numberic且為數據庫自動生成的業務類型
    /// <para>該場景通常為SqlServer的自動增長類型和Oracle自帶的Sequence</para>
    /// 業務層基類，UnitWork用于事務操作，Repository用于普通的數據庫操作
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <typeparam name="TDbContext"></typeparam>
    public class BaseIntAutoGenApp<T, TDbContext> :BaseApp<T,TDbContext> where T : IntAutoGenEntity where TDbContext: DbContext
    {
        public BaseIntAutoGenApp(IUnitWork<TDbContext> unitWork, IRepository<T,TDbContext> repository, IAuth auth) : base(unitWork, repository, auth)
        {
        }

        /// <summary>
        /// 按id批量刪除
        /// </summary>
        /// <param name="ids"></param>
        public void Delete(int[] ids)
        {
            Repository.Delete(u => ids.Contains(u.Id));
        }

        public T Get(int id)
        {
            return Repository.FirstOrDefault(u => u.Id == id);
        }
    }
}
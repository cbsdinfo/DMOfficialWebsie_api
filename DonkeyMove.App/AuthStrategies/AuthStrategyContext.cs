using System;
using System.Collections.Generic;
using Infrastructure;
using donkeymove.App.Response;
using donkeymove.Repository.Domain;

namespace donkeymove.App
{
    /// <summary>
    ///  授權策略上下文，一個典型的策略模式
    /// </summary>
    public class AuthStrategyContext
    {
        private readonly IAuthStrategy _strategy;

        public AuthStrategyContext(IAuthStrategy strategy)
        {
            this._strategy = strategy;
        }

        public User User
        {
            get { return _strategy.User; }
        }

        public List<ModuleView> Modules
        {
            get { return _strategy.Modules; }
        }

        public List<ModuleElement> ModuleElements
        {
            get { return _strategy.ModuleElements; }
        }

        public List<Role> Roles
        {
            get { return _strategy.Roles; }
        }

        public List<Resource> Resources
        {
            get { return _strategy.Resources; }
        }

        public List<SysOrg> Orgs
        {
            get { return _strategy.Orgs; }
        }

        /// <summary>
        /// 獲取角色可以訪問的字段信息
        /// </summary>
        /// <param name="moduleCode"></param>
        /// <returns></returns>
        public List<BuilderTableColumn> GetTableColumns(string moduleCode)
        {
            return _strategy.GetTableColumns(moduleCode);
        }

        /// <summary>
        /// 獲取角色可訪問的字段信息，因為MVC版本沒有代碼生成器，所以只能通過直接讀取數據庫表結構的方式
        /// </summary>
        /// <param name="moduleCode"></param>
        /// <returns></returns>
        [Obsolete("獲取角色可訪問的字段信息，因為MVC版本沒有代碼生成器，所以只能通過直接讀取數據庫表結構的方式")]
        public List<BuilderTableColumn> GetTableColumnsFromDb(string moduleCode)
        {
            return _strategy.GetTableColumnsFromDb(moduleCode);
        }
    }
}
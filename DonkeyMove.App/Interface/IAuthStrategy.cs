using System;
using System.Collections.Generic;
using Infrastructure;
using donkeymove.App.Response;
using donkeymove.Repository.Domain;

namespace donkeymove.App
{
    public interface IAuthStrategy
    {
        List<ModuleView> Modules { get; }

        List<ModuleElement> ModuleElements { get; }

        List<Role> Roles { get; }

        List<Resource> Resources { get; }

        List<SysOrg> Orgs { get; }

        User User
        {
            get; set;
        }

        /// <summary>
        /// 獲取角色可以訪問的字段信息
        /// </summary>
        /// <param name="moduleCode"></param>
        /// <returns></returns>
        List<BuilderTableColumn> GetTableColumns(string moduleCode);

        /// <summary>
        /// 獲取角色可訪問的字段信息，因為MVC版本沒有代碼生成器，所以只能通過直接讀取數據庫表結構的方式
        /// </summary>
        /// <param name="moduleCode"></param>
        /// <returns></returns>
        [Obsolete("獲取角色可訪問的字段信息，因為MVC版本沒有代碼生成器，所以只能通過直接讀取數據庫表結構的方式")]
        List<BuilderTableColumn> GetTableColumnsFromDb(string moduleCode);
    }
}
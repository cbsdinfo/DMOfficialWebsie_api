using System;
using System.Collections.Generic;
using System.Linq;
using Infrastructure;
using donkeymove.App.Response;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;

namespace donkeymove.App
{
    /// <summary>
    /// 領域服務
    /// <para>超級管理員權限</para>
    /// <para>超級管理員使用guid.empty為ID，可以根據需要修改</para>
    /// </summary>
    public class SystemAuthStrategy : BaseStringApp<User, donkeymoveDBContext>, IAuthStrategy
    {
        protected User _user;
        private DbExtension _dbExtension;

        public SystemAuthStrategy(IUnitWork<donkeymoveDBContext> unitWork, IRepository<User, donkeymoveDBContext> repository, DbExtension dbExtension) : base(unitWork, repository, null)
        {
            _dbExtension = dbExtension;
            _user = new User
            {
                Account = Define.SYSTEM_USERNAME,
                Name = "超級管理員",
                Id = Guid.Empty.ToString()
            };
        }

        public List<ModuleView> Modules
        {
            get
            {
                var modules = (from module in UnitWork.Find<Module>(null)
                               select new ModuleView
                               {
                                   SortNo = module.SortNo,
                                   Name = module.Name,
                                   Id = module.Id,
                                   CascadeId = module.CascadeId,
                                   Code = module.Code,
                                   IconName = module.IconName,
                                   Url = module.Url,
                                   ParentId = module.ParentId,
                                   ParentName = module.ParentName,
                                   IsSys = module.IsSys,
                                   Status = module.Status
                               }).ToList();

                foreach (var module in modules)
                {
                    module.Elements = UnitWork.Find<ModuleElement>(u => u.ModuleId == module.Id).ToList();
                }

                return modules;
            }
        }

        public List<Role> Roles
        {
            get { return UnitWork.Find<Role>(null).ToList(); }
        }

        public List<ModuleElement> ModuleElements
        {
            get { return UnitWork.Find<ModuleElement>(null).ToList(); }
        }

        public List<Resource> Resources
        {
            get { return UnitWork.Find<Resource>(null).ToList(); }
        }

        public List<SysOrg> Orgs
        {
            get { return UnitWork.Find<SysOrg>(null).ToList(); }
        }

        public User User
        {
            get { return _user; }
            set   //禁止外部設置
            {
                throw new Exception("超級管理員，禁止設置用戶");
            }
        }

        public List<BuilderTableColumn> GetTableColumns(string moduleCode)
        {
            return UnitWork.Find<BuilderTableColumn>(u => u.TableName.ToLower() == moduleCode.ToLower()).ToList();
        }

        public List<BuilderTableColumn> GetTableColumnsFromDb(string moduleCode)
        {
            return _dbExtension.GetTableColumnsFromDb(moduleCode);
        }
    }
}
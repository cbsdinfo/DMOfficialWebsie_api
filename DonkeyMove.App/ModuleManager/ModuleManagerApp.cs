using System.Collections.Generic;
using System.Linq;
using Infrastructure;
using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;

namespace donkeymove.App
{
    public class ModuleManagerApp : BaseTreeApp<Module,donkeymoveDBContext>
    {
        private RevelanceManagerApp _revelanceApp;

        public void Add(Module model)
        {
            var loginContext = _auth.GetCurrentUser();
            if (loginContext == null)
            {
                throw new CommonException("登錄已過期", Define.INVALID_TOKEN);
            }

            CaculateCascade(model);

            Repository.Add(model);

            AddDefaultMenus(model);
            //當前登錄用戶的所有角色自動分配模塊
            loginContext.Roles.ForEach(u =>
            {
                _revelanceApp.Assign(new AssignReq
                {
                    type = Define.ROLEMODULE,
                    firstId = u.Id,
                    secIds = new[] {model.Id}
                });
            });
        }

        public void Update(Module obj)
        {
            UpdateTreeObj(obj);
        }


        #region 用戶/角色分配模塊

        /// <summary>
        /// 加載特定角色的模塊
        /// </summary>
        /// <param name="roleId">The role unique identifier.</param>
        public IEnumerable<Module> LoadForRole(string roleId)
        {
            var moduleIds = UnitWork.Find<Relevance>(u => u.FirstId == roleId && u.Key == Define.ROLEMODULE)
                .Select(u => u.SecondId);
            return UnitWork.Find<Module>(u => moduleIds.Contains(u.Id)).OrderBy(u => u.SortNo);
        }

        //獲取角色可訪問的模塊字段
        public IEnumerable<string> LoadPropertiesForRole(string roleId, string moduleCode)
        {
            return _revelanceApp.Get(Define.ROLEDATAPROPERTY, roleId, moduleCode);
        }

        /// <summary>
        /// 根據某角色ID獲取可訪問某模塊的菜單項
        /// </summary>
        public IEnumerable<ModuleElement> LoadMenusForRole(string moduleId, string roleId)
        {
            var elementIds = _revelanceApp.Get(Define.ROLEELEMENT, true, roleId);
            var query = UnitWork.Find<ModuleElement>(u => elementIds.Contains(u.Id));
            if (!string.IsNullOrEmpty(moduleId))
            {
                query = query.Where(u => u.ModuleId == moduleId);
            }

            return query;
        }

        #endregion 用戶/角色分配模塊


        #region 菜單操作

        /// <summary>
        /// 刪除指定的菜單
        /// </summary>
        /// <param name="ids"></param>
        public void DelMenu(string[] ids)
        {
            UnitWork.Delete<ModuleElement>(u => ids.Contains(u.Id));
            UnitWork.Save();
        }


        /// <summary>
        /// 新增菜單
        /// <para>當前登錄用戶的所有角色會自動分配菜單</para>
        /// </summary>
        public void AddMenu(ModuleElement model)
        {
            var loginContext = _auth.GetCurrentUser();
            if (loginContext == null)
            {
                throw new CommonException("登錄已過期", Define.INVALID_TOKEN);
            }

            UnitWork.ExecuteWithTransaction(() =>
            {
                UnitWork.Add(model);

                //當前登錄用戶的所有角色自動分配菜單
                loginContext.Roles.ForEach(u =>
                {
                    _revelanceApp.Assign(new AssignReq
                    {
                        type = Define.ROLEELEMENT,
                        firstId = u.Id,
                        secIds = new[] {model.Id}
                    });
                });
                UnitWork.Save();
            });
        }

        public void UpdateMenu(ModuleElement model)
        {
            UnitWork.Update<ModuleElement>(model);
            UnitWork.Save();
        }

        //添加默認按鈕
        private void AddDefaultMenus(Module module)
        {
            AddMenu(new ModuleElement
            {
                ModuleId = module.Id,
                DomId = "btnAdd",
                Script = "add()",
                Name = "添加",
                Sort = 1,
                Icon = "xinzeng",
                Class = "success",
                Remark = "新增" + module.Name
            });
            AddMenu(new ModuleElement
            {
                ModuleId = module.Id,
                DomId = "btnEdit",
                Script = "edit()",
                Name = "編輯",
                Sort = 2,
                Icon = "bianji-copy",
                Class = "primary",
                Remark = "修改" + module.Name
            });
            AddMenu(new ModuleElement
            {
                ModuleId = module.Id,
                DomId = "btnDel",
                Script = "del()",
                Name = "刪除",
                Sort = 3,
                Icon = "shanchu",
                Class = "danger",
                Remark = "刪除" + module.Name
            });

            //todo:可以自己添加更多默認按鈕
        }

        #endregion


        public ModuleManagerApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<Module,donkeymoveDBContext> repository
            , RevelanceManagerApp app, IAuth auth) : base(unitWork, repository, auth)
        {
            _revelanceApp = app;
        }
    }
}
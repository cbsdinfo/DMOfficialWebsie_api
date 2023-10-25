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
    public abstract class BaseApp<T, TDbContext> where T : class where TDbContext: DbContext
    {
        /// <summary>
        /// 用于普通的數據庫操作
        /// </summary>
        protected IRepository<T, TDbContext> Repository;

        /// <summary>
        /// 用于事務操作
        /// <para>使用詳見：http://doc.donkeymove.net.cn/core/unitwork.html</para>
        /// </summary>
        protected IUnitWork<TDbContext> UnitWork;

        protected IAuth _auth;

        public BaseApp(IUnitWork<TDbContext> unitWork, IRepository<T,TDbContext> repository, IAuth auth)
        {
            UnitWork = unitWork;
            Repository = repository;
            _auth = auth;
        }

        /// <summary>
        ///  獲取當前登錄用戶的數據訪問權限
        /// </summary>
        /// <param name="parametername">linq表達式參數的名稱，如u=>u.name中的"u"</param>
        /// <returns></returns>
        protected IQueryable<T> GetDataPrivilege(string parametername)
        {
            var loginUser = _auth.GetCurrentUser();
            if (loginUser.User.Account == Define.SYSTEM_USERNAME) return UnitWork.Find<T>(null);  //超級管理員特權
            
            var moduleName = typeof(T).Name;
            var rule = UnitWork.FirstOrDefault<DataPrivilegeRule>(u => u.SourceCode == moduleName);
            if (rule == null) return UnitWork.Find<T>(null); //沒有設置數據規則，那么視為該資源允許被任何主體查看
            if (rule.PrivilegeRules.Contains(Define.DATAPRIVILEGE_LOGINUSER) ||
                                             rule.PrivilegeRules.Contains(Define.DATAPRIVILEGE_LOGINROLE)||
                                             rule.PrivilegeRules.Contains(Define.DATAPRIVILEGE_LOGINORG))
            {
                
                //即把{loginUser} =='xxxxxxx'換為 loginUser.User.Id =='xxxxxxx'，從而把當前登錄的用戶名與當時設計規則時選定的用戶id對比
                rule.PrivilegeRules = rule.PrivilegeRules.Replace(Define.DATAPRIVILEGE_LOGINUSER, loginUser.User.Id);
                
                var roles = loginUser.Roles.Select(u => u.Id).ToList();
                roles.Sort(); //按字母排序,這樣可以進行like操作
                rule.PrivilegeRules = rule.PrivilegeRules.Replace(Define.DATAPRIVILEGE_LOGINROLE, 
                    string.Join(',',roles));
                
                var orgs = loginUser.Orgs.Select(u => u.Id).ToList();
                orgs.Sort(); 
                rule.PrivilegeRules = rule.PrivilegeRules.Replace(Define.DATAPRIVILEGE_LOGINORG, 
                    string.Join(',',orgs));
            }
            return UnitWork.Find<T>(null).GenerateFilter(parametername,
                JsonHelper.Instance.Deserialize<FilterGroup>(rule.PrivilegeRules));
        }
        
        /// <summary>
        /// 計算實體更新的層級信息
        /// </summary>
        /// <typeparam name="U">U必須是一個繼承TreeEntity的結構</typeparam>
        /// <param name="entity"></param>
        public void CaculateCascade<U>(U entity) where U : TreeEntity
        {
            if (entity.ParentId == "") entity.ParentId = null;
            string cascadeId;
            int currentCascadeId = 1; //當前結點的級聯節點最后一位
            var sameLevels = UnitWork.Find<U>(o => o.ParentId == entity.ParentId && o.Id != entity.Id);
            foreach (var obj in sameLevels)
            {
                int objCascadeId = int.Parse(obj.CascadeId.TrimEnd('.').Split('.').Last());
                if (currentCascadeId <= objCascadeId) currentCascadeId = objCascadeId + 1;
            }

            if (!string.IsNullOrEmpty(entity.ParentId))
            {
                var parentOrg = UnitWork.FirstOrDefault<U>(o => o.Id == entity.ParentId);
                if (parentOrg != null)
                {
                    cascadeId = parentOrg.CascadeId + currentCascadeId + ".";
                    entity.ParentName = parentOrg.Name;
                }
                else
                {
                    throw new Exception("未能找到該組織的父節點信息");
                }
            }
            else
            {
                cascadeId = ".0." + currentCascadeId + ".";
                entity.ParentName = "根節點";
            }

            entity.CascadeId = cascadeId;
        }
    }
}
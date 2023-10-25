using System;
using System.Collections.Generic;
using donkeymove.App.Interface;
using donkeymove.App.Response;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;
using System.Linq;
using System.Threading.Tasks;
using Infrastructure;
using Microsoft.EntityFrameworkCore;
using donkeymove.App.Request;
using donkeymove.Repository;

namespace donkeymove.App
{
    public class RoleApp : BaseStringApp<Role,donkeymoveDBContext>
    {
        private RevelanceManagerApp _revelanceApp;

        /// <summary>
        /// 加載當前登錄用戶可訪問的全部角色
        /// </summary>
        public List<Role> Load(QueryRoleListReq request)
        {
            var loginUser = _auth.GetCurrentUser();
            var roles = loginUser.Roles;
            if (!string.IsNullOrEmpty(request.key))
            {
                roles = roles.Where(u => u.Name.Contains(request.key)).ToList();
            }

            return roles;
        }
        
        /// <summary>
        /// 獲取所有的角色
        /// 為了控制權限，通常只用于流程實例選擇執行角色，其他地方請使用Load
        /// </summary>
        public async Task<TableResp<Role>> LoadAll(QueryRoleListReq request)
        {
            var result = new TableResp<Role>();
            var objs = UnitWork.Find<Role>(null);
            if (!string.IsNullOrEmpty(request.key))
            {
                objs = objs.Where(u => u.Name.Contains(request.key));
            }

            result.data = await objs.OrderBy(u => u.Name)
                .Skip((request.page - 1) * request.limit)
                .Take(request.limit).ToListAsync();
            result.count = await objs.CountAsync();
            return result;
        }


        /// <summary>
        /// 添加角色，如果當前登錄用戶不是System，則直接把新角色分配給當前登錄用戶
        /// </summary>
        public void Add(RoleView obj)
        {
           UnitWork.ExecuteWithTransaction(() =>
           {
               Role role = obj;
               role.CreateTime = DateTime.Now;
               UnitWork.Add(role);
               UnitWork.Save();
               obj.Id = role.Id;   //要把保存后的ID存入view
           
               //如果當前賬號不是SYSTEM，則直接分配
               var loginUser = _auth.GetCurrentUser();
               if (loginUser.User.Account != Define.SYSTEM_USERNAME)
               {
                   _revelanceApp.Assign(new AssignReq
                   {
                       type = Define.USERROLE,
                       firstId = loginUser.User.Id,
                       secIds = new[] {role.Id}
                   });
               }
           });
        }
        
        /// <summary>
        /// 刪除角色時，需要刪除角色對應的權限
        /// </summary>
        /// <param name="ids"></param>
        public override void Delete(string[] ids)
        {
            UnitWork.ExecuteWithTransaction(() =>
            {
                UnitWork.Delete<Relevance>(u=>(u.Key == Define.ROLEMODULE || u.Key == Define.ROLEELEMENT) && ids.Contains(u.FirstId));
                UnitWork.Delete<Relevance>(u=>u.Key == Define.USERROLE && ids.Contains(u.SecondId));
                UnitWork.Delete<Role>(u =>ids.Contains(u.Id));
                UnitWork.Save();
            });
        }
        
        /// <summary>
        /// 更新角色屬性
        /// </summary>
        /// <param name="obj"></param>
        public void Update(RoleView obj)
        {
            Role role = obj;

            UnitWork.Update<Role>(u => u.Id == obj.Id, u => new Role
            {
                Name = role.Name,
                Status = role.Status
            });

        }


        public RoleApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<Role,donkeymoveDBContext> repository,
            RevelanceManagerApp app,IAuth auth) : base(unitWork, repository, auth)
        {
            _revelanceApp = app;
        }

        
    }
}
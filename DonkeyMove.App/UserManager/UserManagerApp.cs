using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Castle.Core.Internal;
using Infrastructure;
using Infrastructure.Extensions;
using Microsoft.EntityFrameworkCore;
using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;


namespace donkeymove.App
{
    public class UserManagerApp : BaseStringApp<User,donkeymoveDBContext>
    {
        private RevelanceManagerApp _revelanceApp;
        private OrgManagerApp _orgManagerApp;
        
        public UserManagerApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<User,donkeymoveDBContext> repository,
            RevelanceManagerApp app,IAuth auth, OrgManagerApp orgManagerApp) : base(unitWork, repository, auth)
        {
            _revelanceApp = app;
            _orgManagerApp = orgManagerApp;
        }

        public User GetByAccount(string account)
        {
            return Repository.FirstOrDefault(u => u.Account == account);
        }

        /// <summary>
        /// 加載當前登錄用戶可訪問的一個部門及子部門全部用戶
        /// 如果請求的request.OrgId為空，則可以獲取到已被刪除機構的用戶（即：沒有分配任何機構的用戶）
        /// </summary>
        public async Task<TableData> Load(QueryUserListReq request)
        {
            var loginUser = _auth.GetCurrentUser();
            
            IQueryable<User> query = UnitWork.Find<User>(null);
            if (!string.IsNullOrEmpty(request.key))
            {
                query = UnitWork.Find<User>(u => u.Name.Contains(request.key) || u.Account.Contains(request.key));
            }

            var userOrgs = from user in query
                join relevance in UnitWork.Find<Relevance>(u => u.Key == "UserOrg")
                    on user.Id equals relevance.FirstId into temp
                from r in temp.DefaultIfEmpty()
                join org in UnitWork.Find<SysOrg>(null)
                    on r.SecondId equals org.Id into orgtmp
                from o in orgtmp.DefaultIfEmpty()
                select new
                {
                    user.Account,
                    user.Name,
                    user.Id,
                    user.Sex,
                    user.Status,
                    user.BizCode,
                    user.CreateId,
                    user.CreateTime,
                    user.TypeId,
                    user.TypeName,
                    r.Key,
                    r.SecondId,
                    OrgId = o.Id,
                    OrgName = o.Name
                };

            //如果請求的orgId不為空
            if (!string.IsNullOrEmpty(request.orgId))
            {
                var org = loginUser.Orgs.SingleOrDefault(u => u.Id == request.orgId);
                var cascadeId = org.CascadeId;
                
                var orgIds = loginUser.Orgs.Where(u => u.CascadeId.Contains(cascadeId)).Select(u => u.Id).ToArray();
            
                //只獲取機構里面的用戶
                userOrgs = userOrgs.Where(u => u.Key == Define.USERORG && orgIds.Contains(u.OrgId));
            }
            else  //todo:如果請求的orgId為空，即為跟節點，這時可以額外獲取到機構已經被刪除的用戶，從而進行機構分配。可以根據自己需求進行調整
            {
                var orgIds = loginUser.Orgs.Select(u => u.Id).ToArray();
            
                //獲取用戶可以訪問的機構的用戶和沒有任何機構關聯的用戶（機構被刪除后，沒有刪除這里面的關聯關系）
                userOrgs = userOrgs.Where(u => (u.Key == Define.USERORG && orgIds.Contains(u.OrgId)) || (u.OrgId == null));
            }

           
            
            var userViews = (await userOrgs.ToListAsync()).GroupBy(b => b.Account)
                .Select(u =>new UserView
            {
                Id = u.First().Id,
                Account = u.Key,
                Name = u.First().Name,
                Sex = u.First().Sex,
                Status = u.First().Status,
                CreateTime = u.First().CreateTime,
                CreateUser = u.First().CreateId,
                OrganizationIds = string.Join(",", u.Select(x=>x.OrgId))
                ,Organizations = string.Join(",", u.Select(x=>x.OrgName))
                
            });

            return new TableData
            {
                count =userViews.Count(),
                data =userViews.OrderBy(u => u.Name)
                    .Skip((request.page - 1) * request.limit)
                    .Take(request.limit),
            };
        }
        
        /// <summary>
        /// 獲取所有的用戶
        /// 為了控制權限，通常只用于流程實例選擇執行角色，其他地方請使用Load
        /// </summary>
        public async Task<TableResp<UserView>> LoadAll(QueryUserListReq request)
        {
           IQueryable<User> query = UnitWork.Find<User>(null);
           if (!string.IsNullOrEmpty(request.key))
           {
               query = UnitWork.Find<User>(u => u.Name.Contains(request.key) || u.Account.Contains(request.key));
           }

           var userOrgs = from user in query
               join relevance in UnitWork.Find<Relevance>(u => u.Key == "UserOrg")
                   on user.Id equals relevance.FirstId into temp
               from r in temp.DefaultIfEmpty()
               join org in UnitWork.Find<SysOrg>(null)
                   on r.SecondId equals org.Id into orgtmp
               from o in orgtmp.DefaultIfEmpty()
               select new
               {
                   user.Account,
                   user.Name,
                   user.Id,
                   user.Sex,
                   user.Status,
                   user.BizCode,
                   user.CreateId,
                   user.CreateTime,
                   user.TypeId,
                   user.TypeName,
                   r.Key,
                   r.SecondId,
                   OrgId = o.Id,
                   OrgName = o.Name
               };

            //如果請求的orgId不為空
            if (!string.IsNullOrEmpty(request.orgId))
            {
                userOrgs = userOrgs.Where(u => u.Key == Define.USERORG && u.OrgId == request.orgId);
            }

            var userViews = (await userOrgs.ToListAsync()).GroupBy(b => b.Account).Select(u =>new UserView
            {
                Id = u.First().Id,
                Account = u.Key,
                Name = u.First().Name,
                Sex = u.First().Sex,
                Status = u.First().Status,
                CreateTime = u.First().CreateTime,
                CreateUser = u.First().CreateId,
                OrganizationIds = string.Join(",", u.Select(x=>x.OrgId))
                ,Organizations = string.Join(",", u.Select(x=>x.OrgName))
                
            });

            return new TableResp<UserView>()
            {
                count = userViews.Count(),
                data = userViews.OrderBy(u => u.Name)
                    .Skip((request.page - 1) * request.limit)
                    .Take(request.limit).ToList()
            };
        }
        
        public void AddOrUpdate(UpdateUserReq request)
        {
            request.ValidationEntity(u => new {u.Account,u.Name, u.OrganizationIds});
            
            if (string.IsNullOrEmpty(request.OrganizationIds))
                throw new Exception("請為用戶分配機構");
            User requser = request;
            requser.CreateId = _auth.GetCurrentUser().User.Id;
            
            UnitWork.ExecuteWithTransaction(() =>
            {
                if (string.IsNullOrEmpty(request.Id))
                {
                    if (UnitWork.Any<User>(u => u.Account == request.Account))
                    {
                        throw new Exception("用戶賬號已存在");
                    }

                    if (string.IsNullOrEmpty(requser.Password))
                    {
                        requser.Password = requser.Account;   //如果客戶端沒提供密碼，默認密碼同賬號
                    }

                    requser.CreateTime = DateTime.Now;

                    UnitWork.Add(requser);
                    request.Id = requser.Id; //要把保存后的ID存入view
                }
                else
                {
                    UnitWork.Update<User>(u => u.Id == request.Id, u => new User
                    {
                        Account = requser.Account,
                        BizCode = requser.BizCode,
                        Name = requser.Name,
                        Sex = requser.Sex,
                        Status = requser.Status
                    });
                    if (!string.IsNullOrEmpty(requser.Password))  //密碼為空的時候，不做修改
                    {
                        UnitWork.Update<User>(u => u.Id == request.Id, u => new User
                        {
                            Password = requser.Password
                        });
                    }
                }

                UnitWork.Save();
                string[] orgIds = request.OrganizationIds.Split(',').ToArray();

                _revelanceApp.DeleteBy(Define.USERORG, requser.Id);
                _revelanceApp.Assign(Define.USERORG, orgIds.ToLookup(u => requser.Id));
            });
            
        }
        
        /// <summary>
        /// 刪除用戶,包含用戶與組織關系、用戶與角色關系
        /// </summary>
        /// <param name="ids"></param>
        public override void Delete(string[] ids)
        {
            UnitWork.ExecuteWithTransaction(() =>
            {
                UnitWork.Delete<Relevance>(u =>(u.Key == Define.USERROLE || u.Key == Define.USERORG) 
                                               && ids.Contains(u.FirstId));
                UnitWork.Delete<User>(u => ids.Contains(u.Id));
                UnitWork.Save();
            });
           
        }
        

        /// <summary>
        /// 修改密碼
        /// </summary>
        /// <param name="request"></param>
        public void ChangePassword(ChangePasswordReq request)
        {
            Repository.Update(u => u.Account == request.Account, user => new User
            {
                Password = request.Password
            });
        }
        
       
        /// <summary>
        /// 獲取指定角色包含的用戶列表
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public async Task<TableData> LoadByRole(QueryUserListByRoleReq request)
        {
            var users = from userRole in UnitWork.Find<Relevance>(u =>
                    u.SecondId == request.roleId && u.Key == Define.USERROLE)
                join user in UnitWork.Find<User>(null) on userRole.FirstId equals user.Id into temp
                from c in temp.Where(u =>u.Id != null)
                select c;

            return new TableData
            {
                count =await users.CountAsync(),
                data =await users.Skip((request.page - 1) * request.limit).Take(request.limit).ToListAsync()
            };
        }
        
        /// <summary>
        /// 獲取指定機構包含的用戶列表
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public async Task<TableData> LoadByOrg(QueryUserListByOrgReq request)
        {
            var users = from userOrg in UnitWork.Find<Relevance>(u =>
                    u.SecondId == request.orgId && u.Key == Define.USERORG)
                join user in UnitWork.Find<User>(null) on userOrg.FirstId equals user.Id into temp
                from c in temp.Where(u =>u.Id != null)
                select c;

            return new TableData
            {
                count =await users.CountAsync(),
                data =await users.Skip((request.page - 1) * request.limit).Take(request.limit).ToListAsync()
            };
        }

        /// <summary>
        /// 修改用戶資料
        /// </summary>
        /// <param name="request"></param>
        public void ChangeProfile(ChangeProfileReq request)
        {
            if (request.Account == Define.SYSTEM_USERNAME)
            {
                throw new Exception("不能修改超級管理員信息");
            }
            
            Repository.Update(u => u.Account == request.Account, user => new User
                        {
                            Name = request.Name,
                            Sex = request.Sex
                        });
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using Infrastructure;
using Microsoft.Extensions.Logging;
using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;

namespace donkeymove.App
{
    public class RevelanceManagerApp : BaseStringApp<Relevance,donkeymoveDBContext>
    {
        private readonly ILogger<RevelanceManagerApp> _logger;
        public RevelanceManagerApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<Relevance,donkeymoveDBContext> repository, IAuth auth, ILogger<RevelanceManagerApp> logger) : base(unitWork,
            repository, auth)
        {
            _logger = logger;
        }

        /// <summary>
        /// 添加關聯
        /// <para>比如給用戶分配資源，那么firstId就是用戶ID，secIds就是資源ID列表</para>
        /// </summary>
        /// <param name="type">關聯的類型，如Define.USERRESOURCE</param>
        public void Assign(AssignReq request)
        {
            Assign(request.type, request.secIds.ToLookup(u => request.firstId));
        }

        /// <summary>
        /// 添加關聯，需要人工刪除以前的關聯
        /// </summary>
        /// <param name="key"></param>
        /// <param name="idMaps"></param>
        public void Assign(string key, ILookup<string, string> idMaps)
        {
            UnitWork.BatchAdd((from sameVals in idMaps
                from value in sameVals
                select new Relevance
                {
                    Key = key,
                    FirstId = sameVals.Key,
                    SecondId = value,
                    OperateTime = DateTime.Now
                }).ToArray());
            UnitWork.Save();
        }

        /// <summary>
        /// 取消關聯
        /// </summary>
        /// <param name="type">關聯的類型，如Define.USERRESOURCE</param>
        /// <param name="firstId">The first identifier.</param>
        /// <param name="secIds">The sec ids.</param>
        public void UnAssign(AssignReq req)
        {
            if (req.secIds == null || req.secIds.Length == 0)
            {
                DeleteBy(req.type, req.firstId);
            }
            else
            {
                DeleteBy(req.type, req.secIds.ToLookup(u => req.firstId));
            }
        }

        /// <summary>
        /// 刪除關聯
        /// </summary>
        /// <param name="key">關聯標識</param>
        /// <param name="idMaps">關聯的&lt;firstId, secondId&gt;數組</param>
        private void DeleteBy(string key, ILookup<string, string> idMaps)
        {
            foreach (var sameVals in idMaps)
            {
                foreach (var value in sameVals)
                {
                    _logger.LogInformation($"start=> delete {key} {sameVals.Key} {value}");
                    try
                    {
                        UnitWork.Delete<Relevance>(u => u.Key == key && u.FirstId == sameVals.Key && u.SecondId == value);
                    }
                    catch (Exception e)
                    {
                        _logger.LogError(e,e.Message);
                    }
                    _logger.LogInformation($"end=> {key} {sameVals.Key} {value}");
                }
            }
        }

        public void DeleteBy(string key, params string[] firstIds)
        {
            UnitWork.Delete<Relevance>(u => firstIds.Contains(u.FirstId) && u.Key == key);
        }


        /// <summary>
        /// 根據關聯表的一個鍵獲取另外鍵的值
        /// </summary>
        /// <param name="key">映射標識</param>
        /// <param name="returnSecondIds">返回的是否為映射表的第二列，如果不是則返回第一列</param>
        /// <param name="ids">已知的ID列表</param>
        /// <returns>List&lt;System.String&gt;.</returns>
        public List<string> Get(string key, bool returnSecondIds, params string[] ids)
        {
            if (returnSecondIds)
            {
                return Repository.Find(u => u.Key == key
                                            && ids.Contains(u.FirstId)).Select(u => u.SecondId).ToList();
            }
            else
            {
                return Repository.Find(u => u.Key == key
                                            && ids.Contains(u.SecondId)).Select(u => u.FirstId).ToList();
            }
        }

        /// <summary>
        /// 根據key ,firstId,secondId獲取thirdId
        /// </summary>
        /// <param name="key"></param>
        /// <param name="firstId"></param>
        /// <param name="secondId"></param>
        /// <returns></returns>
        public List<string> Get(string key, string firstId, string secondId)
        {
            return Repository.Find(u => u.Key == key && u.FirstId == firstId && u.SecondId == secondId)
                .Select(u => u.ThirdId).ToList();
        }

        /// <summary>
        /// 分配數據字段權限
        /// </summary>
        /// <param name="request"></param>
        public void AssignData(AssignDataReq request)
        {
            if (!request.Properties.Any())
            {
                return;
            }

            var relevances = new List<Relevance>();
            foreach (var requestProperty in request.Properties)
            {
                relevances.Add(new Relevance
                {
                    Key = Define.ROLEDATAPROPERTY,
                    FirstId = request.RoleId,
                    SecondId = request.ModuleCode,
                    ThirdId = requestProperty,
                    OperateTime = DateTime.Now
                });
            }

            UnitWork.BatchAdd(relevances.ToArray());
            UnitWork.Save();
        }

        /// <summary>
        /// 取消數據字段分配
        /// </summary>
        /// <param name="request"></param>
        public void UnAssignData(AssignDataReq request)
        {
            if (request.Properties == null || request.Properties.Length == 0)
            {
                if (string.IsNullOrEmpty(request.ModuleCode)) //模塊為空，直接把角色的所有授權刪除
                {
                    DeleteBy(Define.ROLEDATAPROPERTY, request.RoleId);
                }
                else //把角色的某一個模塊權限全部刪除
                {
                    DeleteBy(Define.ROLEDATAPROPERTY, new[] {request.ModuleCode}.ToLookup(u => request.RoleId));
                }
            }
            else //按具體的id刪除
            {
                foreach (var property in request.Properties)
                {
                    UnitWork.Delete<Relevance>(u => u.Key == Define.ROLEDATAPROPERTY
                                                    && u.FirstId == request.RoleId
                                                    && u.SecondId == request.ModuleCode
                                                    && u.ThirdId == property);
                }
            }
        }

        /// <summary>
        /// 為角色分配用戶，需要統一提交，會刪除以前該角色的所有用戶
        /// </summary>
        /// <param name="request"></param>
        public void AssignRoleUsers(AssignRoleUsers request)
        {
            UnitWork.ExecuteWithTransaction(() =>
            {
                //刪除以前的所有用戶
                UnitWork.Delete<Relevance>(u => u.SecondId == request.RoleId && u.Key == Define.USERROLE);
                //批量分配用戶角色
                UnitWork.BatchAdd((from firstId in request.UserIds
                    select new Relevance
                    {
                        Key = Define.USERROLE,
                        FirstId = firstId,
                        SecondId = request.RoleId,
                        OperateTime = DateTime.Now
                    }).ToArray());
                UnitWork.Save();
            });
        }

        /// <summary>
        /// 為部門分配用戶，需要統一提交，會刪除以前該部門的所有用戶
        /// </summary>
        /// <param name="request"></param>
        public void AssignOrgUsers(AssignOrgUsers request)
        {
            UnitWork.ExecuteWithTransaction(() =>
            {
                //刪除以前的所有用戶
                UnitWork.Delete<Relevance>(u => u.SecondId == request.OrgId && u.Key == Define.USERORG);
                //批量分配用戶角色
                UnitWork.BatchAdd((from firstId in request.UserIds
                    select new Relevance
                    {
                        Key = Define.USERORG,
                        FirstId = firstId,
                        SecondId = request.OrgId,
                        OperateTime = DateTime.Now
                    }).ToArray());
                UnitWork.Save();
            });
        }
    }
}
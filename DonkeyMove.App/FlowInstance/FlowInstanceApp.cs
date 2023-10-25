using Infrastructure;
using donkeymove.App.Flow;
using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Net.Http;
using System.Threading.Tasks;
using Infrastructure.Const;
using Infrastructure.Helpers;
using Microsoft.EntityFrameworkCore;
using donkeymove.Repository;

namespace donkeymove.App
{
    /// <summary>
    /// 工作流實例表操作
    /// </summary>
    public class FlowInstanceApp : BaseStringApp<FlowInstance, donkeymoveDBContext>
    {
        private RevelanceManagerApp _revelanceApp;
        private FlowSchemeApp _flowSchemeApp;
        private FormApp _formApp;
        private IHttpClientFactory _httpClientFactory;
        private IServiceProvider _serviceProvider;
        private SysMessageApp _messageApp;

        public FlowInstanceApp(IUnitWork<donkeymoveDBContext> unitWork,
            IRepository<FlowInstance, donkeymoveDBContext> repository
            , RevelanceManagerApp app, FlowSchemeApp flowSchemeApp, FormApp formApp,
            IHttpClientFactory httpClientFactory, IAuth auth, IServiceProvider serviceProvider,
            SysMessageApp messageApp)
            : base(unitWork, repository, auth)
        {
            _revelanceApp = app;
            _flowSchemeApp = flowSchemeApp;
            _formApp = formApp;
            _httpClientFactory = httpClientFactory;
            _serviceProvider = serviceProvider;
            _messageApp = messageApp;
        }

        #region 流程處理API

        /// <summary>
        /// 創建一個實例
        /// </summary>
        /// <returns></returns>
        public bool CreateInstance(AddFlowInstanceReq addFlowInstanceReq)
        {
            CheckNodeDesignate(addFlowInstanceReq);
            FlowScheme scheme = null;
            if (!string.IsNullOrEmpty(addFlowInstanceReq.SchemeId))
            {
                scheme = _flowSchemeApp.Get(addFlowInstanceReq.SchemeId);
            }

            if ((scheme == null) && !string.IsNullOrEmpty(addFlowInstanceReq.SchemeCode))
            {
                scheme = _flowSchemeApp.FindByCode(addFlowInstanceReq.SchemeCode);
            }

            if (scheme == null)
            {
                throw new Exception("該流程模板已不存在，請重新設計流程");
            }

            addFlowInstanceReq.SchemeContent = scheme.SchemeContent;

            var form = _formApp.FindSingle(scheme.FrmId);
            if (form == null)
            {
                throw new Exception("該流程模板對應的表單已不存在，請重新設計流程");
            }

            addFlowInstanceReq.FrmContentData = form.ContentData;
            addFlowInstanceReq.FrmContentParse = form.ContentParse;
            addFlowInstanceReq.FrmType = form.FrmType;
            addFlowInstanceReq.FrmId = form.Id;

            var flowInstance = addFlowInstanceReq.MapTo<FlowInstance>();

            //創建運行實例
            var wfruntime = new FlowRuntime(flowInstance);
            var user = _auth.GetCurrentUser();

            #region 根據運行實例改變當前節點狀態

            flowInstance.ActivityId = wfruntime.nextNodeId;
            flowInstance.ActivityType = wfruntime.GetNextNodeType();
            flowInstance.ActivityName = wfruntime.nextNode.name;
            flowInstance.PreviousId = wfruntime.currentNodeId;
            flowInstance.CreateUserId = user.User.Id;
            flowInstance.CreateUserName = user.User.Account;
            flowInstance.MakerList = (wfruntime.GetNextNodeType() != 4 ? GetNextMakers(wfruntime, addFlowInstanceReq) : "");
            flowInstance.IsFinish = (wfruntime.GetNextNodeType() == 4
                ? FlowInstanceStatus.Finished
                : FlowInstanceStatus.Running);

            UnitWork.Add(flowInstance);
            wfruntime.flowInstanceId = flowInstance.Id;

            if (flowInstance.FrmType == 1) //如果是開發者自定義的表單
            {
                var t = Type.GetType("donkeymove.App." + flowInstance.DbName + "App");
                ICustomerForm icf = (ICustomerForm)_serviceProvider.GetService(t);
                icf.Add(flowInstance.Id, flowInstance.FrmData);
            }

            #endregion 根據運行實例改變當前節點狀態

            #region 流程操作記錄

            FlowInstanceOperationHistory processOperationHistoryEntity = new FlowInstanceOperationHistory
            {
                InstanceId = flowInstance.Id,
                CreateUserId = user.User.Id,
                CreateUserName = user.User.Name,
                CreateDate = DateTime.Now,
                Content = "【創建】"
                          + user.User.Name
                          + "創建了一個流程進程【"
                          + addFlowInstanceReq.Code + "/"
                          + addFlowInstanceReq.CustomName + "】"
            };
            UnitWork.Add(processOperationHistoryEntity);

            #endregion 流程操作記錄

            AddTransHistory(wfruntime);
            UnitWork.Save();
            return true;
        }

        /// <summary>
        /// 更新流程
        /// <para>更新時可以修改表單內容，可以修改流程基本信息，但不能更換表單模版</para>
        /// </summary>
        /// <param name="req"></param>
        public void Update(UpdateFlowInstanceReq req)
        {
            var flowinstance = Get(req.Id);

            if (flowinstance.IsFinish != FlowInstanceStatus.Draft &&
                flowinstance.IsFinish != FlowInstanceStatus.Rejected)
            {
                throw new Exception("只能修改【草稿】和【駁回】狀態的流程");
            }

            flowinstance.Description = req.Description;
            flowinstance.Code = req.Code;
            flowinstance.FrmData = req.FrmData;
            flowinstance.DbName = req.DbName;
            flowinstance.CustomName = req.CustomName;
            Repository.Update(flowinstance);
        }

        /// <summary>
        /// 節點審核
        /// </summary>
        /// <param name="instanceId"></param>
        /// <returns></returns>
        public bool NodeVerification(VerificationReq request)
        {
            var user = _auth.GetCurrentUser().User;
            var instanceId = request.FlowInstanceId;

            var tag = new Tag
            {
                UserName = user.Name,
                UserId = user.Id,
                Description = request.VerificationOpinion,
                Taged = Int32.Parse(request.VerificationFinally)
            };

            FlowInstance flowInstance = Get(instanceId);

            if (flowInstance.MakerList != "1" && !flowInstance.MakerList.Contains(user.Id))
            {
                throw new Exception("當前用戶沒有審批該節點權限");
            }

            FlowInstanceOperationHistory flowInstanceOperationHistory = new FlowInstanceOperationHistory
            {
                InstanceId = instanceId,
                CreateUserId = tag.UserId,
                CreateUserName = tag.UserName,
                CreateDate = DateTime.Now
            }; //操作記錄
            FlowRuntime wfruntime = new FlowRuntime(flowInstance);

            #region 會簽

            if (flowInstance.ActivityType == 0) //當前節點是會簽節點
            {
                //會簽時的【當前節點】一直是會簽開始節點
                //TODO: 標記會簽節點的狀態，這個地方感覺怪怪的
                wfruntime.MakeTagNode(wfruntime.currentNodeId, tag);

                string canCheckId = ""; //尋找當前登錄用戶可審核的節點Id
                foreach (string fromForkStartNodeId in wfruntime.FromNodeLines[wfruntime.currentNodeId]
                    .Select(u => u.to))
                {
                    var fromForkStartNode = wfruntime.Nodes[fromForkStartNodeId]; //與會前開始節點直接連接的節點
                    canCheckId = GetOneForkLineCanCheckNodeId(fromForkStartNode, wfruntime, tag);
                    if (!string.IsNullOrEmpty(canCheckId)) break;
                }

                if (canCheckId == "")
                {
                    throw (new Exception("審核異常,找不到審核節點"));
                }

                flowInstanceOperationHistory.Content = "【" + wfruntime.Nodes[canCheckId].name
                                                           + "】【" + DateTime.Now.ToString("yyyy-MM-dd HH:mm")
                                                           + "】" + (tag.Taged == 1 ? "同意" : "不同意") + ",備注："
                                                           + tag.Description;

                wfruntime.MakeTagNode(canCheckId, tag); //標記審核節點狀態
                string res = wfruntime.NodeConfluence(canCheckId, tag);
                if (res == TagState.No.ToString("D"))
                {
                    flowInstance.IsFinish = FlowInstanceStatus.Disagree;
                }
                else if (!string.IsNullOrEmpty(res))
                {
                    flowInstance.PreviousId = flowInstance.ActivityId;
                    flowInstance.ActivityId = wfruntime.nextNodeId;
                    flowInstance.ActivityType = wfruntime.nextNodeType;
                    flowInstance.ActivityName = wfruntime.nextNode.name;
                    flowInstance.IsFinish = (wfruntime.nextNodeType == 4
                        ? FlowInstanceStatus.Finished
                        : FlowInstanceStatus.Running);
                    flowInstance.MakerList =
                        (wfruntime.nextNodeType == 4 ? "" : GetNextMakers(wfruntime));

                    AddTransHistory(wfruntime);
                }
                else
                {
                    //會簽過程中，需要更新用戶
                    flowInstance.MakerList = GetForkNodeMakers(wfruntime, wfruntime.currentNodeId);
                    AddTransHistory(wfruntime);
                }
            }

            #endregion 會簽

            #region 一般審核

            else
            {
                wfruntime.MakeTagNode(wfruntime.currentNodeId, tag);
                if (tag.Taged == (int)TagState.Ok)
                {
                    flowInstance.PreviousId = flowInstance.ActivityId;
                    flowInstance.ActivityId = wfruntime.nextNodeId;
                    flowInstance.ActivityType = wfruntime.nextNodeType;
                    flowInstance.ActivityName = wfruntime.nextNode.name;
                    flowInstance.MakerList = wfruntime.nextNodeType == 4 ? "" : GetNextMakers(wfruntime, request);
                    flowInstance.IsFinish = (wfruntime.nextNodeType == 4
                        ? FlowInstanceStatus.Finished
                        : FlowInstanceStatus.Running);
                }
                else
                {
                    flowInstance.IsFinish = FlowInstanceStatus.Disagree; //表示該節點不同意
                    wfruntime.nextNodeId = "-1";
                    wfruntime.nextNodeType = 4;
                }

                AddTransHistory(wfruntime);

                flowInstanceOperationHistory.Content = "【" + wfruntime.currentNode.name
                                                           + "】【" + DateTime.Now.ToString("yyyy-MM-dd HH:mm")
                                                           + "】" + (tag.Taged == 1 ? "同意" : "不同意") + ",備注："
                                                           + tag.Description;
            }

            #endregion 一般審核

            flowInstance.SchemeContent = JsonHelper.Instance.Serialize(wfruntime.ToSchemeObj());

            if (!string.IsNullOrEmpty(request.FrmData))
            {
                flowInstance.FrmData = request.FrmData;

                if (flowInstance.FrmType == 1) //如果是開發者自定義的表單,更新對應數據庫表數據
                {
                    var t = Type.GetType("donkeymove.App." + flowInstance.DbName + "App");
                    ICustomerForm icf = (ICustomerForm)_serviceProvider.GetService(t);
                    icf.Update(flowInstance.Id, flowInstance.FrmData);
                }
            }

            UnitWork.Update(flowInstance);
            UnitWork.Add(flowInstanceOperationHistory);

            //給流程創建人發送通知信息
            _messageApp.SendMsgTo(flowInstance.CreateUserId,
                $"你的流程[{flowInstance.CustomName}]已被{user.Name}處理。處理情況如下:{flowInstanceOperationHistory.Content}");

            UnitWork.Save();

            wfruntime.NotifyThirdParty(_httpClientFactory.CreateClient(), tag);
            return true;
        }

        /// <summary>
        /// 駁回
        /// 如果NodeRejectStep不為空，優先使用；否則按照NodeRejectType駁回
        /// </summary>
        /// <returns></returns>
        public bool NodeReject(VerificationReq reqest)
        {
            var user = _auth.GetCurrentUser().User;
            FlowInstance flowInstance = Get(reqest.FlowInstanceId);
            if (flowInstance.MakerList != "1" && !flowInstance.MakerList.Contains(user.Id))
            {
                throw new Exception("當前用戶沒有駁回該節點權限");
            }

            FlowRuntime wfruntime = new FlowRuntime(flowInstance);

            string rejectNode = ""; //駁回的節點
            rejectNode = string.IsNullOrEmpty(reqest.NodeRejectStep)
                ? wfruntime.RejectNode(reqest.NodeRejectType)
                : reqest.NodeRejectStep;

            var tag = new Tag
            {
                Description = reqest.VerificationOpinion,
                Taged = (int)TagState.Reject,
                UserId = user.Id,
                UserName = user.Name
            };

            wfruntime.MakeTagNode(wfruntime.currentNodeId, tag);
            flowInstance.IsFinish = FlowInstanceStatus.Rejected; //4表示駁回（需要申請者重新提交表單）
            if (rejectNode != "")
            {
                flowInstance.PreviousId = flowInstance.ActivityId;
                flowInstance.ActivityId = rejectNode;
                flowInstance.ActivityType = wfruntime.GetNodeType(rejectNode);
                flowInstance.ActivityName = wfruntime.Nodes[rejectNode].name;
                flowInstance.MakerList = GetNodeMarkers(wfruntime.Nodes[rejectNode], flowInstance.CreateUserId);

                AddTransHistory(wfruntime);
            }

            UnitWork.Update(flowInstance);

            UnitWork.Add(new FlowInstanceOperationHistory
            {
                InstanceId = reqest.FlowInstanceId,
                CreateUserId = user.Id,
                CreateUserName = user.Name,
                CreateDate = DateTime.Now,
                Content = "【"
                          + wfruntime.currentNode.name
                          + "】【" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "】駁回,備注："
                          + reqest.VerificationOpinion
            });

            //給流程創建人發送通知信息
            _messageApp.SendMsgTo(flowInstance.CreateUserId,
                $"你的流程[{flowInstance.CustomName}]已被{user.Name}駁回。備注信息:{reqest.VerificationOpinion}");

            UnitWork.Save();

            wfruntime.NotifyThirdParty(_httpClientFactory.CreateClient(), tag);

            return true;
        }

        //會簽時，獲取一條會簽分支上面是否有用戶可審核的節點
        private string GetOneForkLineCanCheckNodeId(FlowNode fromForkStartNode, FlowRuntime wfruntime, Tag tag)
        {
            string canCheckId = "";
            var node = fromForkStartNode;
            do //沿一條分支線路執行，直到遇到會簽結束節點
            {
                var makerList = GetNodeMarkers(node);

                if (node.setInfo.Taged == null && !string.IsNullOrEmpty(makerList) &&
                    makerList.Split(',').Any(one => tag.UserId == one))
                {
                    canCheckId = node.id;
                    break;
                }

                node = wfruntime.GetNextNode(node.id);
            } while (node.type != FlowNode.JOIN);

            return canCheckId;
        }

        #endregion 流程處理API

        #region 獲取各種節點的流程審核者

        /// <summary>
        /// 尋找下一步的執行人
        /// 一般用于本節點審核完成后，修改流程實例的當前執行人，可以做到通知等功能
        /// </summary>
        /// <returns></returns>
        private string GetNextMakers(FlowRuntime wfruntime, NodeDesignateReq request = null)
        {
            string makerList = "";
            if (wfruntime.nextNodeId == "-1")
            {
                throw (new Exception("無法尋找到下一個節點"));
            }

            if (wfruntime.nextNodeType == 0) //如果是會簽節點
            {
                makerList = GetForkNodeMakers(wfruntime, wfruntime.nextNodeId);
            }
            else if (wfruntime.nextNode.setInfo.NodeDesignate == Setinfo.RUNTIME_SPECIAL_ROLE)
            { //如果是運行時指定角色
                if (wfruntime.nextNode.setInfo.NodeDesignate != request.NodeDesignateType)
                {
                    throw new Exception("前端提交的節點權限類型異常，請檢查流程");
                }
                var users = _revelanceApp.Get(Define.USERROLE, false, request.NodeDesignates);
                makerList = GenericHelpers.ArrayToString(users, makerList);
            }
            else if (wfruntime.nextNode.setInfo.NodeDesignate == Setinfo.RUNTIME_SPECIAL_USER)
            {  //如果是運行時指定用戶
                if (wfruntime.nextNode.setInfo.NodeDesignate != request.NodeDesignateType)
                {
                    throw new Exception("前端提交的節點權限類型異常，請檢查流程");
                }
                makerList = GenericHelpers.ArrayToString(request.NodeDesignates, makerList);
            }
            else
            {
                makerList = GetNodeMarkers(wfruntime.nextNode);
                if (string.IsNullOrEmpty(makerList))
                {
                    throw (new Exception("無法尋找到節點的審核者,請查看流程設計是否有問題!"));
                }
            }

            return makerList;
        }

        /// <summary>
        /// 獲取會簽開始節點的所有可執行者
        /// </summary>
        /// <param name="forkNodeId">會簽開始節點</param>
        /// <returns></returns>
        private string GetForkNodeMakers(FlowRuntime wfruntime, string forkNodeId)
        {
            string makerList = "";
            foreach (string fromForkStartNodeId in wfruntime.FromNodeLines[forkNodeId].Select(u => u.to))
            {
                var fromForkStartNode = wfruntime.Nodes[fromForkStartNodeId]; //與會前開始節點直接連接的節點
                if (makerList != "")
                {
                    makerList += ",";
                }

                makerList += GetOneForkLineMakers(fromForkStartNode, wfruntime);
            }

            return makerList;
        }

        //獲取會簽一條線上的審核者,該審核者應該是已審核過的節點的下一個人
        private string GetOneForkLineMakers(FlowNode fromForkStartNode, FlowRuntime wfruntime)
        {
            string markers = "";
            var node = fromForkStartNode;
            do //沿一條分支線路執行，直到遇到第一個沒有審核的節點
            {
                if (node.setInfo != null && node.setInfo.Taged != null)
                {
                    if (node.type != FlowNode.FORK && node.setInfo.Taged != (int)TagState.Ok) //如果節點是不同意或駁回，則不用再找了
                    {
                        break;
                    }

                    node = wfruntime.GetNextNode(node.id); //下一個節點
                    continue;
                }

                var marker = GetNodeMarkers(node);
                if (marker == "")
                {
                    throw (new Exception($"節點{node.name}沒有審核者,請檢查!"));
                }

                if (marker == "1")
                {
                    throw (new Exception($"節點{node.name}是會簽節點，不能用所有人,請檢查!"));
                }

                if (markers != "")
                {
                    markers += ",";
                }

                markers += marker;
                break;
            } while (node.type != FlowNode.JOIN);

            return markers;
        }

        /// <summary>
        /// 尋找該節點執行人
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private string GetNodeMarkers(FlowNode node, string flowinstanceCreateUserId = "")
        {
            string makerList = "";
            if (node.type == FlowNode.START && (!string.IsNullOrEmpty(flowinstanceCreateUserId))) //如果是開始節點，通常情況下是駁回到開始了
            {
                makerList = flowinstanceCreateUserId;
            }
            else if (node.setInfo != null)
            {
                if (node.setInfo.NodeDesignate == Setinfo.ALL_USER) //所有成員
                {
                    makerList = "1";
                }
                else if (node.setInfo.NodeDesignate == Setinfo.SPECIAL_USER) //指定成員
                {
                    makerList = GenericHelpers.ArrayToString(node.setInfo.NodeDesignateData.users, makerList);
                }
                else if (node.setInfo.NodeDesignate == Setinfo.SPECIAL_ROLE) //指定角色
                {
                    var users = _revelanceApp.Get(Define.USERROLE, false, node.setInfo.NodeDesignateData.roles);
                    makerList = GenericHelpers.ArrayToString(users, makerList);
                }
                else if (node.setInfo.NodeDesignate == Setinfo.RUNTIME_SPECIAL_ROLE
                         || node.setInfo.NodeDesignate == Setinfo.RUNTIME_SPECIAL_USER)
                {
                    //如果是運行時選定的用戶，則暫不處理。由上個節點審批時選定
                }
            }
            else //如果沒有設置節點信息，默認所有人都可以審核
            {
                makerList = "1";
            }

            return makerList;
        }

        #endregion 獲取各種節點的流程審核者

        /// <summary>
        /// 審核流程
        /// <para>李玉寶于2017-01-20 15:44:45</para>
        /// </summary>
        public void Verification(VerificationReq request)
        {
            //如果是同意，需要判斷是否為運行時選定下一步執行角色/執行人
            if (request.VerificationFinally == "1")
            {
                CheckNodeDesignate(request);
            }
            bool isReject = TagState.Reject.Equals((TagState)Int32.Parse(request.VerificationFinally));
            if (isReject) //駁回
            {
                NodeReject(request);
            }
            else
            {
                NodeVerification(request);
            }
        }

        /// <summary>
        /// 返回用于處理流程節點
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public FlowVerificationResp GetForVerification(string id)
        {
            var flowinstance = Get(id);
            var resp = flowinstance.MapTo<FlowVerificationResp>();
            var runtime = new FlowRuntime(flowinstance);
            if (runtime.currentNode != null && runtime.currentNode.setInfo != null)
            {
                resp.CanWriteFormItemIds = runtime.currentNode.setInfo.CanWriteFormItemIds;
            }

            if (runtime.nextNode != null && runtime.nextNode.setInfo != null && runtime.nextNodeType != 4)
            {
                resp.NextNodeDesignateType = runtime.nextNode.setInfo.NodeDesignate;
                resp.CanWriteFormItemIds = runtime.currentNode.setInfo.CanWriteFormItemIds;
            }
            return resp;
        }

        public async Task<TableData> Load(QueryFlowInstanceListReq request)
        {
            var result = new TableData();
            var user = _auth.GetCurrentUser();

            if (request.type == "wait") //待辦事項
            {
                Expression<Func<FlowInstance, bool>> waitExp = u => (u.MakerList == "1"
                                                                     || u.MakerList.Contains(user.User.Id)) &&
                                                                    (u.IsFinish == FlowInstanceStatus.Running ||
                                                                     u.IsFinish == FlowInstanceStatus.Rejected);

                // 加入搜索自定義標題
                if (!string.IsNullOrEmpty(request.key))
                {
                    waitExp = waitExp.And(t => t.CustomName.Contains(request.key));
                }

                result.count = await UnitWork.Find(waitExp).CountAsync();

                result.data = await UnitWork.Find(request.page, request.limit, "CreateDate descending", waitExp).ToListAsync();
            }
            else if (request.type == "disposed") //已辦事項（即我參與過的流程）
            {
                var instances = UnitWork.Find<FlowInstanceTransitionHistory>(u => u.CreateUserId == user.User.Id)
                    .Select(u => u.InstanceId).Distinct();
                var query = from ti in instances
                            join ct in UnitWork.Find<FlowInstance>(null) on ti equals ct.Id
                            select ct;

                // 加入搜索自定義標題
                if (!string.IsNullOrEmpty(request.key))
                {
                    query = query.Where(t => t.CustomName.Contains(request.key));
                }

                result.data = await query.OrderByDescending(u => u.CreateDate)
                    .Skip((request.page - 1) * request.limit)
                    .Take(request.limit).ToListAsync();
                result.count = await instances.CountAsync();
            }
            else //我的流程
            {
                Expression<Func<FlowInstance, bool>> myFlowExp = u => u.CreateUserId == user.User.Id;

                // 加入搜索自定義標題
                if (!string.IsNullOrEmpty(request.key))
                {
                    myFlowExp = myFlowExp.And(t => t.CustomName.Contains(request.key));
                }

                result.count = await UnitWork.Find(myFlowExp).CountAsync();
                result.data = await UnitWork.Find(request.page, request.limit,
                    "CreateDate descending", myFlowExp).ToListAsync();
            }

            return result;
        }

        public List<FlowInstanceOperationHistory> QueryHistories(QueryFlowInstanceHistoryReq request)
        {
            return UnitWork.Find<FlowInstanceOperationHistory>(u => u.InstanceId == request.FlowInstanceId)
                .OrderByDescending(u => u.CreateDate).ToList();
        }

        /// <summary>
        /// 召回流程
        /// </summary>
        public void ReCall(RecallFlowInstanceReq request)
        {
            var user = _auth.GetCurrentUser().User;
            FlowInstance flowInstance = Get(request.FlowInstanceId);
            if (flowInstance.IsFinish == FlowInstanceStatus.Draft
                || flowInstance.IsFinish == FlowInstanceStatus.Finished)
            {
                throw new Exception("當前流程狀態不能召回");
            }

            FlowRuntime wfruntime = new FlowRuntime(flowInstance);

            string startNodeId = wfruntime.startNodeId; //起始節點

            wfruntime.ReCall();

            flowInstance.IsFinish = FlowInstanceStatus.Draft;
            flowInstance.PreviousId = flowInstance.ActivityId;
            flowInstance.ActivityId = startNodeId;
            flowInstance.ActivityType = wfruntime.GetNodeType(startNodeId);
            flowInstance.ActivityName = wfruntime.Nodes[startNodeId].name;
            flowInstance.MakerList = GetNodeMarkers(wfruntime.Nodes[startNodeId], flowInstance.CreateUserId);

            AddTransHistory(wfruntime);

            UnitWork.Update(flowInstance);

            UnitWork.Add(new FlowInstanceOperationHistory
            {
                InstanceId = request.FlowInstanceId,
                CreateUserId = user.Id,
                CreateUserName = user.Name,
                CreateDate = DateTime.Now,
                Content = $"【撤銷】由{user.Name}撤銷,備注：{request.Description}"
            });

            UnitWork.Save();
        }

        /// <summary>啟動流程</summary>
        /// <remarks> 通常是對狀態為【草稿】的流程進行操作，進入運行狀態 </remarks>
        public void Start(StartFlowInstanceReq request)
        {
            FlowInstance flowInstance = Get(request.FlowInstanceId);
            if (flowInstance.IsFinish != FlowInstanceStatus.Draft)
            {
                throw new Exception("當前流程不是草稿狀態，不能啟動");
            }
            var wfruntime = new FlowRuntime(flowInstance);
            var user = _auth.GetCurrentUser();

            if (wfruntime.nextNode.setInfo.NodeDesignate == Setinfo.RUNTIME_SPECIAL_USER
                || wfruntime.nextNode.setInfo.NodeDesignate == Setinfo.RUNTIME_SPECIAL_ROLE)
            {
                throw new Exception("暫不支持【第二執行節點為運行時指定角色/賬號執行】的流程恢復");
            }

            #region 根據運行實例改變當前節點狀態

            flowInstance.ActivityId = wfruntime.nextNodeId;
            flowInstance.ActivityType = wfruntime.GetNextNodeType();
            flowInstance.ActivityName = wfruntime.nextNode.name;
            flowInstance.PreviousId = wfruntime.currentNodeId;
            flowInstance.CreateUserId = user.User.Id;
            flowInstance.CreateUserName = user.User.Account;
            flowInstance.MakerList = (wfruntime.GetNextNodeType() != 4 ? GetNextMakers(wfruntime) : "");
            flowInstance.IsFinish = (wfruntime.GetNextNodeType() == 4
                ? FlowInstanceStatus.Finished
                : FlowInstanceStatus.Running);

            UnitWork.Update(flowInstance);

            #endregion 根據運行實例改變當前節點狀態

            #region 流程操作記錄

            FlowInstanceOperationHistory processOperationHistoryEntity = new FlowInstanceOperationHistory
            {
                InstanceId = flowInstance.Id,
                CreateUserId = user.User.Id,
                CreateUserName = user.User.Name,
                CreateDate = DateTime.Now,
                Content = $"【啟動】由用戶{user.User.Name}啟動"
            };
            UnitWork.Add(processOperationHistoryEntity);

            #endregion 流程操作記錄

            AddTransHistory(wfruntime);
            UnitWork.Save();
        }

        /// <summary>
        /// 判定節點需要選擇執行人或執行角色
        /// </summary>
        /// <param name="request"></param>
        /// <exception cref="Exception"></exception>
        private void CheckNodeDesignate(NodeDesignateReq request)
        {
            if ((request.NodeDesignateType == Setinfo.RUNTIME_SPECIAL_ROLE
                 || request.NodeDesignateType == Setinfo.RUNTIME_SPECIAL_USER) && request.NodeDesignates.Length == 0)
            {
                throw new Exception("下個節點需要選擇執行人或執行角色");
            }
        }

        /// <summary>
        /// 添加扭轉記錄
        /// </summary>
        private void AddTransHistory(FlowRuntime wfruntime)
        {
            var tag = _auth.GetCurrentUser().User;
            UnitWork.Add(new FlowInstanceTransitionHistory
            {
                InstanceId = wfruntime.flowInstanceId,
                CreateUserId = tag.Id,
                CreateUserName = tag.Name,
                FromNodeId = wfruntime.currentNodeId,
                FromNodeName = wfruntime.currentNode.name,
                FromNodeType = wfruntime.currentNodeType,
                ToNodeId = wfruntime.nextNodeId,
                ToNodeName = wfruntime.nextNode?.name,
                ToNodeType = wfruntime.nextNodeType,
                IsFinish = wfruntime.nextNodeType == 4 ? FlowInstanceStatus.Finished : FlowInstanceStatus.Running,
                TransitionSate = 0
            });
        }
    }
}
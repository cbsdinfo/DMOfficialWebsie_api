using Infrastructure;
using Newtonsoft.Json.Linq;
using donkeymove.Repository.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using Castle.Core.Internal;
using Infrastructure.Extensions;

namespace donkeymove.App.Flow
{
    public class FlowRuntime
    {
        /// <summary>
        /// 構造函數
        /// </summary>
        public FlowRuntime(FlowInstance instance)
        {
            dynamic schemeContentJson = instance.SchemeContent.ToJson();//獲取工作流模板內容的json對象;

            InitLines(schemeContentJson);
            InitNodes(schemeContentJson);

            currentNodeId = (instance.ActivityId == "" ? startNodeId : instance.ActivityId);
            currentNodeType = GetNodeType(currentNodeId);
            FrmData = instance.FrmData;
            title = schemeContentJson.title;
            initNum = schemeContentJson.initNum ?? 0;
            previousId = instance.PreviousId;
            flowInstanceId = instance.Id;

            //會簽開始節點和流程結束節點沒有下一步
            if (currentNodeType == 0 || currentNodeType == 4)
            {
                nextNodeId = "-1";
                nextNodeType = -1;
            }
            else
            {
                nextNodeId = GetNextNodeId();//下一個節點
                nextNodeType = GetNodeType(nextNodeId);
            }
        }

        #region 私有方法

        /// <summary>
        /// 獲取工作流節點的字典列表:key節點id
        /// </summary>
        /// <param name="schemeContentJson"></param>
        /// <returns></returns>
        private void InitNodes(dynamic schemeContentJson)
        {
            Nodes = new Dictionary<string, FlowNode>();
            foreach (JObject item in schemeContentJson.nodes)
            {
                var node = item.ToObject<FlowNode>();
                if (!Nodes.ContainsKey(node.id))
                {
                    Nodes.Add(node.id, node);
                }
                if (node.type == FlowNode.START)
                {
                    this.startNodeId = node.id;
                }
            }
        }

        private void InitLines(dynamic schemeContentJson)
        {
            Lines = new List<FlowLine>();
            FromNodeLines = new Dictionary<string, List<FlowLine>>();
            ToNodeLines = new Dictionary<string, List<FlowLine>>();
            foreach (JObject item in schemeContentJson.lines)
            {
                var line = item.ToObject<FlowLine>();
                Lines.Add(line);

                if (!FromNodeLines.ContainsKey(line.from))
                {
                    List<FlowLine> d = new List<FlowLine> { line };
                    FromNodeLines.Add(line.from, d);
                }
                else
                {
                    FromNodeLines[line.from].Add(line);
                }

                if (!ToNodeLines.ContainsKey(line.to))
                {
                    List<FlowLine> d = new List<FlowLine> { line };
                    ToNodeLines.Add(line.to, d);
                }
                else
                {
                    ToNodeLines[line.to].Add(line);
                }
            }
        }

        /// <summary>
        /// 獲取下一個節點
        /// </summary>
        private string GetNextNodeId(string nodeId = null)
        {
            var lines = nodeId == null ? FromNodeLines[currentNodeId] : FromNodeLines[nodeId];
            if (lines.Count == 0)
            {
                throw new Exception("無法尋找到下一個節點");
            }

            if (FrmData == "") return lines[0].to;

            FrmData = FrmData.ToLower();//統一轉小寫
            var frmDataJson = FrmData.ToJObject();//獲取數據內容

            foreach (var l in lines)
            {
                if (!(l.Compares.IsNullOrEmpty()) && l.Compare(frmDataJson))
                {
                    return l.to;
                }
            }

            return lines[0].to;
        }

        #endregion 私有方法

        #region 共有方法

        //獲取下一個節點
        public FlowNode GetNextNode(string nodeId = null)
        {
            return Nodes[GetNextNodeId(nodeId)];
        }

        /// <summary>
        /// 獲取實例接下來運行的狀態
        /// </summary>
        /// <returns>-1無法運行,0會簽開始,1會簽結束,2一般節點,4流程運行結束</returns>
        public int GetNextNodeType()
        {
            if (nextNodeId != "-1")
            {
                return GetNodeType(nextNodeId);
            }
            return -1;
        }

        /// <summary>
        /// 獲取節點類型 0會簽開始,1會簽結束,2一般節點,開始節點,4流程運行結束
        /// </summary>
        /// <param name="nodeId"></param>
        /// <returns></returns>
        public int GetNodeType(string nodeId)
        {
            switch (Nodes[nodeId].type)
            {
                //會簽開始節點
                case FlowNode.FORK:
                    return 0;
                //會簽結束節點
                case FlowNode.JOIN:
                    return 1;
                //結束節點
                case FlowNode.END:
                    return 4;
                //開始節點
                case FlowNode.START:
                    return 3;

                default:
                    return 2;
            }
        }

        /// <summary>
        /// 節點會簽審核
        /// </summary>
        /// <param name="nodeId">會簽時，currentNodeId是會簽開始節點。這個表示當前正在處理的節點</param>
        /// <param name="tag"></param>
        /// <returns>-1不通過,1等待,其它通過</returns>
        public string NodeConfluence(string nodeId, Tag tag)
        {
            var forkNode = Nodes[currentNodeId];  //會簽開始節點
            FlowNode nextNode = GetNextNode(nodeId); //獲取當前處理的下一個節點

            int forkNumber = FromNodeLines[currentNodeId].Count;   //直接與會簽節點連接的點，即會簽分支數目
            string res = string.Empty;  //記錄會簽的結果,默認正在會簽
            if (forkNode.setInfo.NodeConfluenceType == "one") //有一個步驟通過即可
            {
                if (tag.Taged == (int)TagState.Ok)
                {
                    if (nextNode.type == FlowNode.JOIN)  //下一個節點是會簽結束，則該線路結束
                    {
                        res = GetNextNodeId(nextNode.id);
                    }
                }
                else if (tag.Taged == (int)TagState.No)
                {
                    if (forkNode.setInfo.ConfluenceNo == null)
                    {
                        forkNode.setInfo.ConfluenceNo = 1;
                    }
                    else if (forkNode.setInfo.ConfluenceNo == (forkNumber - 1))
                    {
                        res = TagState.No.ToString("D");
                    }
                    else
                    {
                        bool isFirst = true;  //是不是從會簽開始到現在第一個
                        var preNode = GetPreNode(nodeId);
                        while (preNode.id != forkNode.id) //反向一直到會簽開始節點
                        {
                            if (preNode.setInfo != null && preNode.setInfo.Taged == (int)TagState.No)
                            {
                                isFirst = false;
                                break;
                            }
                        }

                        if (isFirst)
                        {
                            forkNode.setInfo.ConfluenceNo++;
                        }
                    }
                }
            }
            else //默認所有步驟通過
            {
                if (tag.Taged == (int)TagState.No)  //只要有一個不同意，那么流程就結束
                {
                    res = TagState.No.ToString("D");
                }
                else if (tag.Taged == (int)TagState.Ok)
                {
                    if (nextNode.type == FlowNode.JOIN)  //這種模式下只有堅持到【會簽結束】節點之前才有意義，是否需要判定這條線所有的節點都通過，不然直接執行這個節點？？
                    {
                        if (forkNode.setInfo.ConfluenceOk == null)
                        {
                            forkNode.setInfo.ConfluenceOk = 1;
                        }
                        else if (forkNode.setInfo.ConfluenceOk == (forkNumber - 1))  //會簽成功
                        {
                            res = GetNextNodeId(nextNode.id);
                        }
                        else
                        {
                            forkNode.setInfo.ConfluenceOk++;
                        }
                    }
                }
            }

            if (res == TagState.No.ToString("D"))
            {
                tag.Taged = (int)TagState.No;
                MakeTagNode(nextNode.id, tag);
            }
            else if (!string.IsNullOrEmpty(res)) //會簽結束，標記合流節點
            {
                tag.Taged = (int)TagState.Ok;
                MakeTagNode(nextNode.id, tag);
                nextNodeId = res;
                nextNodeType = GetNodeType(res);
            }
            else
            {
                nextNodeId = nextNode.id;
                nextNodeType = GetNodeType(nextNode.id);
            }
            return res;
        }

        /// <summary>
        /// 駁回
        /// </summary>
        /// <param name="rejectType">駁回類型。null:使用節點配置的駁回類型/0:前一步/1:第一步/2：指定節點，使用NodeRejectStep</param>
        /// <returns></returns>
        public string RejectNode(string rejectType)
        {
            dynamic node = Nodes[currentNodeId];
            if (node.setInfo != null && string.IsNullOrEmpty(rejectType))
            {
                rejectType = node.setInfo.NodeRejectType;
            }

            if (rejectType == "0")
            {
                return previousId;
            }
            if (rejectType == "1")
            {
                return GetNextNodeId(startNodeId);
            }
            return previousId;
        }

        /// <summary>
        /// 撤銷流程，清空所有節點
        /// </summary>
        public void ReCall()
        {
            foreach (var item in Nodes)
            {
                item.Value.setInfo = null;
            }
        }

        ///<summary>
        /// 標記節點1通過，-1不通過，0駁回
        /// </summary>
        /// <param name="nodeId"></param>
        public void MakeTagNode(string nodeId, Tag tag)
        {
            foreach (var item in Nodes)
            {
                if (item.Key == nodeId)
                {
                    if (item.Value.setInfo == null)
                    {
                        item.Value.setInfo = new Setinfo();
                    }
                    item.Value.setInfo.Taged = tag.Taged;
                    item.Value.setInfo.UserId = tag.UserId;
                    item.Value.setInfo.UserName = tag.UserName;
                    item.Value.setInfo.Description = tag.Description;
                    item.Value.setInfo.TagedTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
                    break;
                }
            }
        }

        public object ToSchemeObj()
        {
            return new
            {
                title = this.title,
                initNum = this.initNum,
                lines = Lines,
                nodes = Nodes.Select(u => u.Value),
                areas = new string[0]
            };
        }

        /// <summary>
        /// 通知三方系統，節點執行情況
        /// </summary>
        public void NotifyThirdParty(HttpClient client, Tag tag)
        {
            if (currentNode.setInfo == null || string.IsNullOrEmpty(currentNode.setInfo.ThirdPartyUrl))
            {
                return;
            }

            var postData = new
            {
                flowInstanceId,
                nodeName = currentNode.name,
                nodeId = currentNodeId,
                userId = tag.UserId,
                userName = tag.UserName,
                result = tag.Taged, //1：通過;2：不通過；3駁回
                description = tag.Description,
                execTime = tag.TagedTime,
                isFinish = currentNodeType == 4
            };

            using (HttpContent httpContent = new StringContent(JsonHelper.Instance.Serialize(postData), Encoding.UTF8))
            {
                httpContent.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("application/json");
                client.PostAsync(currentNode.setInfo.ThirdPartyUrl, httpContent);
            }
        }

        //獲取上一個節點
        private FlowNode GetPreNode(string nodeId = null)
        {
            var lines = nodeId == null ? ToNodeLines[currentNodeId] : ToNodeLines[nodeId];
            if (lines.Count == 0)
            {
                throw new Exception("無法找到上一個點");
            }
            return Nodes[lines[0].from];
        }

        #endregion 共有方法

        #region 屬性

        public string title { get; set; }

        public int initNum { get; set; }

        /// <summary>
        /// 運行實例的Id
        /// </summary>
        public string flowInstanceId { get; set; }

        /// <summary>
        /// 開始節點的ID
        /// </summary>
        public string startNodeId { get; set; }

        /// <summary>
        /// 當前節點的ID
        /// </summary>
        public string currentNodeId { get; set; }

        /// <summary>
        /// 當前節點類型 0會簽開始,1會簽結束,2一般節點,開始節點,4流程運行結束
        /// </summary>
        public int currentNodeType { get; set; }

        /// <summary>
        /// 當前節點的對象
        /// </summary>
        public FlowNode currentNode => Nodes[currentNodeId];

        /// <summary>
        /// 下一個節點
        /// </summary>
        public string nextNodeId { get; set; }

        /// <summary>
        /// 下一個節點類型 -1無法運行,0會簽開始,1會簽結束,2一般節點,4流程運行結束
        /// </summary>
        /// <value>The type of the next node.</value>
        public int nextNodeType { get; set; }

        /// <summary>
        /// 下一個節點對象
        /// </summary>
        public FlowNode nextNode => nextNodeId != "-1" ? Nodes[nextNodeId] : null;

        /// <summary>
        /// 上一個節點
        /// </summary>
        public string previousId { get; set; }

        /// <summary>
        /// 實例節點集合
        /// </summary>
        public Dictionary<string, FlowNode> Nodes { get; set; }

        /// <summary>
        /// 流程實例中所有的線段
        /// </summary>
        public List<FlowLine> Lines { get; set; }

        /// <summary>
        /// 從節點發出的線段集合
        /// </summary>
        public Dictionary<string, List<FlowLine>> FromNodeLines { get; set; }

        /// <summary>
        /// 到達節點的線段集合
        /// </summary>
        public Dictionary<string, List<FlowLine>> ToNodeLines { get; set; }

        /// <summary>
        /// 表單數據
        /// </summary>
        public string FrmData { get; set; }

        #endregion 屬性
    }
}
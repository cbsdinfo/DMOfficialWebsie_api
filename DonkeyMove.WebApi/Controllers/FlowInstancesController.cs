// <summary>流程實例控制器</summary>

using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Infrastructure;
using Microsoft.AspNetCore.Mvc;
using donkeymove.App;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository.Domain;

namespace donkeymove.WebApi.Controllers
{
    /// <summary>
    /// 流程實例
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "流程實例_FlowInstances")]
    public class FlowInstancesController : ControllerBase
    {
        private readonly FlowInstanceApp _app;

        public FlowInstancesController(FlowInstanceApp app)
        {
            _app = app;
        }

        [HttpGet]
        public Response<FlowVerificationResp> Get(string id)
        {
            var result = new Response<FlowVerificationResp>();
            try
            {
                result.Result = _app.GetForVerification(id);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 獲取一個流程實例的操作歷史記錄
        /// </summary>
        [HttpGet]
        public Response<List<FlowInstanceOperationHistory>> QueryHistories([FromQuery] QueryFlowInstanceHistoryReq request)
        {
            var result = new Response<List<FlowInstanceOperationHistory>>();
            try
            {
                result.Result = _app.QueryHistories(request);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>創建一個新的流程實例</summary>
        /// <remarks> www.cnblogs.com/yubaolee, 2019-03-06. </remarks>
        [HttpPost]
        public Response Add([FromBody] AddFlowInstanceReq obj)
        {
            var result = new Response();
            try
            {
                _app.CreateInstance(obj);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>召回流程</summary>
        /// <remarks> 召回后流程狀態為【草稿】狀態，可以再次發起流程。所有的流程節點狀態還原，但保留審批記錄 </remarks>
        [HttpPost]
        public Response ReCall(RecallFlowInstanceReq obj)
        {
            var result = new Response();
            try
            {
                _app.ReCall(obj);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>啟動流程</summary>
        /// <remarks> 通常是對狀態為【草稿】的流程進行操作，進入運行狀態 </remarks>
        [HttpPost]
        public Response Start(StartFlowInstanceReq obj)
        {
            var result = new Response();
            try
            {
                _app.Start(obj);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 更新流程
        /// </summary>
        /// <para>更新時可以修改表單內容，可以修改流程基本信息，但不能更換表單模版</para>
        /// <returns></returns>
        [HttpPost]
        public Response Update(UpdateFlowInstanceReq obj)
        {
            var result = new Response();
            try
            {
                _app.Update(obj);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 流程節點審批
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public Response Verification(VerificationReq request)
        {
            var response = new Response();
            try
            {
                _app.Verification(request);
            }
            catch (Exception ex)
            {
                response.Code = 500;
                response.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return response;
        }

        /// <summary>
        /// 加載列表
        /// </summary>
        [HttpGet]
        public async Task<TableData> Load([FromQuery] QueryFlowInstanceListReq request)
        {
            return await _app.Load(request);
        }

        [HttpPost]
        public Response Delete([FromBody] string[] ids)
        {
            var result = new Response();
            try
            {
                _app.Delete(ids);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }
    }
}
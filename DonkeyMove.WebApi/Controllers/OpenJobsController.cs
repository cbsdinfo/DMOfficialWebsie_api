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
    /// 定時任務操作
    /// 【系統模塊】
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "定時任務_OpenJobs")]
    public class OpenJobsController : ControllerBase
    {
        private readonly OpenJobApp _app;

        public OpenJobsController(OpenJobApp app)
        {
            _app = app;
        }

        //獲取詳情
        [HttpGet]
        public Response<OpenJob> Get(string id)
        {
            var result = new Response<OpenJob>();
            try
            {
                result.Result = _app.Get(id);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        [HttpPost]
        public Response Add(AddOrUpdateOpenJobReq obj)
        {
            var result = new Response();
            try
            {
                _app.Add(obj);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        [HttpPost]
        public Response Update(AddOrUpdateOpenJobReq obj)
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
        /// 加載列表
        /// </summary>
        [HttpGet]
        public async Task<TableData> Load([FromQuery] QueryOpenJobListReq request)
        {
            return await _app.Load(request);
        }

        /// <summary>
        /// 批量刪除
        /// </summary>
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

        /// <summary>
        /// 獲取本地可執行的任務列表
        /// </summary>
        [HttpPost]
        public Response<List<string>> QueryLocalHandlers()
        {
            var result = new Response<List<string>>();
            try
            {
                result.Result = _app.QueryLocalHandlers();
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        /// <summary>
        /// 改變任務狀態，啟動/停止
        /// </summary>
        [HttpPost]
        public Response ChangeStatus(ChangeJobStatusReq req)
        {
            var result = new Response();
            try
            {
                _app.ChangeJobStatus(req);
                result.Message = "切換成功，可以在系統日志中查看運行結果";
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
using donkeymove.App;
using donkeymove.App.Request;
using donkeymove.Repository.Domain;
using Infrastructure;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace donkeymove.WebApi.Controllers
{
    /// <summary>
    /// 首頁服務次數管理
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "首頁服務次數管理_ServiceTimesManager")]
    public class ServiceTimesManagerController : ControllerBase
    {
        private readonly ServiceTimesApp _app;

        public ServiceTimesManagerController(ServiceTimesApp app)
        {
            _app = app;
        }

        [HttpGet]
        [AllowAnonymous]
        public Response<ServiceTimes> Get(string id)
        {
            var result = new Response<ServiceTimes>();
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

        [HttpGet]
        [AllowAnonymous]
        public Response<List<ServiceTimes>> GetList([FromQuery] QueryServiceTimesListReq obj)
        {
            var result = new Response<List<ServiceTimes>>();
            try
            {
                var res = _app.GetList(obj);
                result.Result = res;
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.InnerException?.Message ?? ex.Message;
            }

            return result;
        }

        [HttpPost]
        public Response<string> Add([FromBody] AddServiceTimesReq obj)
        {
            var resp = new Response<string>();
            try
            {
                resp.Result = _app.Add(obj);
            }
            catch (Exception e)
            {
                resp.Code = 500;
                resp.Message = e.Message;
            }
            return resp;
        }

        [HttpPost]
        public Response Update([FromBody] UpdateServiceTimesReq obj)
        {
            Response resp = new Response();
            try
            {
                _app.Update(obj);
            }
            catch (Exception e)
            {
                resp.Code = 500;
                resp.Message = e.Message;
            }
            return resp;
        }

        [HttpPost]
        public Response Delete([FromBody] string[] ids)
        {
            Response resp = new Response();
            try
            {
                _app.Delete(ids);
            }
            catch (Exception e)
            {
                resp.Code = 500;
                resp.Message = e.Message;
            }
            return resp;
        }
    }
}

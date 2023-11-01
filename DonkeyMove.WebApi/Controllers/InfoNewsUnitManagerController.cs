using donkeymove.App;
using donkeymove.App.Request;
using donkeymove.App.Response;
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
    /// 最新消息單元管理
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "最新消息單元管理_InfoNewsUnitManager")]

    public class InfoNewsUnitManagerController : ControllerBase
    {
        private readonly InfoNewsApp _app;

        public InfoNewsUnitManagerController(InfoNewsApp app)
        {
            _app = app;
        }

        [HttpGet]
        [AllowAnonymous]
        public Response<InfoNewsResp> Get(string id)
        {
            var result = new Response<InfoNewsResp>();
            try
            {
                result.Result = _app.GetById(id);
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
        public Response<List<InfoNewsListResp>> GetList([FromQuery] QueryInfoNewsReq obj)
        {
            var result = new Response<List<InfoNewsListResp>>();
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
        public Response<string> Add([FromBody] AddInfoNewsReq obj)
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
        public Response Update([FromBody] UpdateInfoNewsReq obj)
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

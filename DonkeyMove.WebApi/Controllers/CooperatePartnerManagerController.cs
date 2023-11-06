using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.App;
using Infrastructure;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace donkeymove.WebApi.Controllers
{
    /// <summary>
    /// 合作夥伴管理
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "合作夥伴管理_CooperatePartnerManager")]

    public class CooperatePartnerManagerController : ControllerBase
    {
        private readonly CooperatePartnerApp _app;

        public CooperatePartnerManagerController(CooperatePartnerApp app)
        {
            _app = app;
        }

        [HttpGet]
        [AllowAnonymous]
        public Response<CooperatePartnerResp> Get(string id)
        {
            var result = new Response<CooperatePartnerResp>();
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
        public Response<List<CooperatePartnerListResp>> GetList([FromQuery] QueryCooperatePartnerReq obj)
        {
            var result = new Response<List<CooperatePartnerListResp>>();
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
        public Response<string> Add([FromBody] AddCooperatePartnerReq obj)
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
        public Response Update([FromBody] UpdateCooperatePartnerReq obj)
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

using donkeymove.App.Interface;
using donkeymove.App.SocialPractice;
using donkeymove.App.SocialPractice.Request;
using donkeymove.Repository.Domain;
using Infrastructure;
using Infrastructure.Extensions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace donkeymove.WebApi.Controllers
{
    /// <summary>
    /// 社會實踐單元管理
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "社會實踐單元_SocialPracticeUnit")]

    public class SocialPracticeUnitController : ControllerBase
    {
        private readonly SocialPracticeApp _app;

        public SocialPracticeUnitController(IAuth authUtil, SocialPracticeApp app)
        {
            _app = app;
        }

        //// GET: api/<SocialPracticeController>
        //[HttpGet]
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        [HttpGet]
        [AllowAnonymous]
        public Response<SocialPractice> Get(string id)
        {
            var result = new Response<SocialPractice>();
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
        public Response<List<SocialPractice>> GetList([FromQuery] QuerySocialPracticeListReq obj)
        {
            var result = new Response<List<SocialPractice>>();
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
        public Response<string> Add([FromBody] AddOrUpdateSocialPracticeReq obj)
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
        public Response Update([FromBody] AddOrUpdateSocialPracticeReq obj)
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

using Microsoft.AspNetCore.Mvc;
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
        // GET: api/<SocialPracticeController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<SocialPracticeController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<SocialPracticeController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<SocialPracticeController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<SocialPracticeController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}

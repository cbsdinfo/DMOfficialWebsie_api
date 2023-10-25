using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Infrastructure;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using donkeymove.App;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository.Domain;

namespace donkeymove.WebApi.Controllers
{
    /// <summary>  文件上傳</summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiExplorerSettings(GroupName = "文件管理_Files")]
    public class FilesController : ControllerBase
    {
        private FileApp _app;

        public FilesController(FileApp app)
        {
            _app = app;
        }

        /// <summary>
        /// 加載附件列表
        /// </summary>
        [HttpGet]
        public async Task<TableData> Load([FromQuery] QueryFileListReq request)
        {
            return await _app.Load(request);
        }

        /// <summary>
        /// 刪除附件
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
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
        ///  批量上傳文件接口
        /// <para>客戶端文本框需設置name='files'</para>
        /// </summary>
        /// <param name="files"></param>
        /// <returns>服務器存儲的文件信息</returns>
        [HttpPost]
        public Response<IList<UploadFile>> Upload(IFormFileCollection files)
        {
            var result = new Response<IList<UploadFile>>();
            try
            {
                result.Result = _app.Add(files);
            }
            catch (Exception ex)
            {
                result.Code = 500;
                result.Message = ex.Message;
            }

            return result;
        }
    }
}
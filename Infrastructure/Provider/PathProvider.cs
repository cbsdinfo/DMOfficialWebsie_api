using System.IO;
using Infrastructure.Extensions;
using Infrastructure.Extensions.AutofacManager;
using Microsoft.Extensions.Hosting;

namespace Infrastructure.Provider
{
    public interface IPathProvider : IDependency
    {
        string MapPath(string path);
        string MapPath(string path, bool rootPath);
        IHostEnvironment GetHostingEnvironment();
    }

    public class PathProvider : IPathProvider
    {
        private IHostEnvironment _hostingEnvironment;

        public PathProvider(IHostEnvironment environment)
        {
            _hostingEnvironment = environment;
        }
        public IHostEnvironment GetHostingEnvironment()
        {
            return _hostingEnvironment;
        }

        /// <summary>
        /// 獲取服務器文件路徑
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public string MapPath(string path)
        {
            return MapPath(path, false);
        }
        /// <summary>
        /// 獲取wwwroot路徑
        /// </summary>
        /// <param name="path"></param>
        /// <param name="rootPath">是否獲取wwwroot路徑</param>
        /// <returns></returns>
        public string MapPath(string path, bool rootPath)
        {
            if (rootPath)
            {
                return Path.Combine(_hostingEnvironment.ContentRootPath,"wwwroot").ReplacePath();
            }
            return Path.Combine(_hostingEnvironment.ContentRootPath, path).ReplacePath();
        }
    }
}

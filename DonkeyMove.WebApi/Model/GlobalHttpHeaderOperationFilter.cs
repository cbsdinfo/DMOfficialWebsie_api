using System.Collections.Generic;
using System.Linq;
using Infrastructure;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Options;
using Microsoft.OpenApi.Models;
using donkeymove.App;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace donkeymove.WebApi.Model
{
    public class GlobalHttpHeaderOperationFilter : IOperationFilter
    {
        private IOptions<AppSetting> _appConfiguration;

        public GlobalHttpHeaderOperationFilter(IOptions<AppSetting> appConfiguration)
        {
            _appConfiguration = appConfiguration;
        }

        public void Apply(OpenApiOperation operation, OperationFilterContext context)
        {
            //如果是Identity認證方式，不需要界面添加x-token得輸入框

            if (operation.Parameters == null)
            {
                operation.Parameters = new List<OpenApiParameter>();
            }

            var actionAttrs = context.ApiDescription.ActionDescriptor.EndpointMetadata;
            var isAnony = actionAttrs.Any(a => a.GetType() == typeof(AllowAnonymousAttribute));

            //不是匿名，則添加默認的X-Token
            if (!isAnony)
            {
                operation.Parameters.Add(new OpenApiParameter
                {
                    Name = Define.TOKEN_NAME,
                    In = ParameterLocation.Header,
                    Description = "當前登錄用戶登錄token",
                    Required = false
                });
            }
        }
    }
}
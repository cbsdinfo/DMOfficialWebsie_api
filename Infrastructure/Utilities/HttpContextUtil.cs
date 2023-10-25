using Infrastructure.Extensions.AutofacManager;
using Microsoft.AspNetCore.Http;

namespace Infrastructure.Utilities
{
    public static class HttpContextUtil
    {
        private static IHttpContextAccessor _accessor=AutofacContainerModule.GetService<IHttpContextAccessor>();

        public static Microsoft.AspNetCore.Http.HttpContext Current => _accessor.HttpContext;
        
        /// <summary>
        /// 獲取租戶ID
        /// </summary>
        /// <returns></returns>
        public static string GetTenantId(this IHttpContextAccessor accessor)
        {
            string tenantId = "donkeymoveDBContext";
            
            if (accessor != null && accessor.HttpContext != null)
            {
                //讀取多租戶ID
                var httpTenantId = accessor.HttpContext.Request.Query[Define.TENANT_ID];
                if (string.IsNullOrEmpty(httpTenantId))
                {
                    httpTenantId = accessor.HttpContext.Request.Headers[Define.TENANT_ID];
                }
                
                //如果沒有租戶id，或租戶用的是默認的donkeymoveDBContext,則不做任何調整
                if (!string.IsNullOrEmpty(httpTenantId))
                {
                    tenantId = httpTenantId;
                }
            }

            return tenantId;
        }
        
    }
}

using Infrastructure.Extensions;
using Infrastructure.Helpers;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;

using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using donkeymove.WebApi.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;

namespace donkeymove.WebApi
{
    public static class StartupSetup
    {
        /// <summary>
        ///效能分析服務
        /// </summary>
        /// <param name="services"></param>
        /// <exception cref="ArgumentNullException"></exception>
        public static void AddMiniProfilerSetup(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));
            if (ConfigHelper.App(new string[] { "Startup", "MiniProfiler", "Enabled" }).ToBool())
            {
                services.AddMiniProfiler(options =>
                {
                    // 設定訪問分析結果URL的路由基地址
                    options.RouteBasePath = "/profiler";
                    options.ColorScheme = StackExchange.Profiling.ColorScheme.Auto;
                    options.PopupRenderPosition = StackExchange.Profiling.RenderPosition.BottomLeft;
                    options.PopupShowTimeWithChildren = true;
                    options.PopupShowTrivial = true;
                    options.SqlFormatter = new StackExchange.Profiling.SqlFormatters.InlineFormatter();
                    //  options.IgnoredPaths.Add("/swagger/");
                }).AddEntityFramework(); //顯示SQL語句及耗時
            }
        }

        /// <summary>
        ///Cors 服務
        /// </summary>
        /// <param name="services"></param>
        /// <exception cref="ArgumentNullException"></exception>
        public static void AddCorsSetup(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));
            services.AddCors(c =>
            {
                if (!ConfigHelper.App(new string[] { "Startup", "Cors", "EnableAllIPs" }).ToBool())
                {
                    c.AddPolicy(ConfigHelper.App(new string[] { "Startup", "Cors", "PolicyName" }),

                        policy =>
                        {
                            policy
                            .WithOrigins(ConfigHelper.App(new string[] { "Startup", "Cors", "IPs" }).Split(','))
                            .AllowAnyHeader()//Ensures that the policy allows any header.
                            .AllowAnyMethod();
                        });
                }
                else
                {
                    //允许任意跨域请求
                    c.AddPolicy(ConfigHelper.App(new string[] { "Startup", "Cors", "PolicyName" }),
                        policy =>
                        {
                            policy
                            .SetIsOriginAllowed((host) => true)
                            .AllowAnyMethod()
                            .AllowAnyHeader()
                            .AllowCredentials();
                        });
                }
            });
        }

        /// <summary>
        ///全域
        /// </summary>
        /// <param name="services"></param>
        /// <exception cref="ArgumentNullException"></exception>
        public static void AddGlobalControllerSetup(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));
            services.AddControllers(option =>
            {
                option.Filters.Add(new AuthorizeFilter());
                option.Filters.Add<donkeymoveFilter>();
            }).ConfigureApiBehaviorOptions(options =>
            {
                // 禁用自動模態驗證
                // options.SuppressModelStateInvalidFilter = true;
                //啟動WebAPI自動模態驗證，處理返回值
                options.InvalidModelStateResponseFactory = context =>
                {
                    var problems = new CustomBadRequest(context);

                    return new BadRequestObjectResult(problems);
                };
            }).AddNewtonsoftJson(options =>
            {
                //忽略循環引用
                options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
                //不使用駝峰樣式的key
                //options.SerializerSettings.ContractResolver = new DefaultContractResolver();
                options.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
            });
        }

        /// <summary>
        ///Swagger 服務
        /// </summary>
        /// <param name="services"></param>
        /// <exception cref="ArgumentNullException"></exception>
        public static void AddSwaggerSetup(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));
            services.AddAuthentication(options =>
            {
                options.DefaultScheme = TokenAuthOption.Scheme;
                options.DefaultAuthenticateScheme = TokenAuthOption.Scheme;
            }).AddApiKeySupport();

            services.AddSwaggerGen(option =>
            {

                foreach (var controller in GetControllers())
                {
                    var groupname = GetSwaggerGroupName(controller);

                    option.SwaggerDoc(groupname, new OpenApiInfo
                    {
                        Version = "v1",
                        Title = groupname,
                        Description = "by vic"
                    });
                }

                foreach (var name in Directory.GetFiles(AppContext.BaseDirectory, "*.*",
                    SearchOption.AllDirectories).Where(f => Path.GetExtension(f).ToLower() == ".xml"))
                {
                    option.IncludeXmlComments(name, includeControllerXmlComments: true);
                }
                option.DocumentFilter<HiddenApiFilter>();//過濾的核心filter
                option.OperationFilter<GlobalHttpHeaderOperationFilter>(); // 添加httpHeader參數
            });
        }

        /// <summary>
        /// 獲取控制器對應的swagger分組值
        /// </summary>
        public static string GetSwaggerGroupName(Type controller)
        {
            var groupname = controller.Name.Replace("Controller", "");
            var apisetting = controller.GetCustomAttribute(typeof(ApiExplorerSettingsAttribute));
            if (apisetting != null)
            {
                groupname = ((ApiExplorerSettingsAttribute)apisetting).GroupName;
            }

            return groupname;
        }

        /// <summary>
        /// 獲取所有的控制器
        /// </summary>
        public static List<Type> GetControllers()
        {
            Assembly asm = Assembly.GetExecutingAssembly();

            var controlleractionlist = asm.GetTypes()
                .Where(type => typeof(ControllerBase).IsAssignableFrom(type))
                .OrderBy(x => x.Name).ToList();
            return controlleractionlist;
        }
    }
}
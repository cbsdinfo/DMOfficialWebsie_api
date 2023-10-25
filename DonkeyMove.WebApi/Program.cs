using System;
using System.IO;
using System.Linq;
using System.Reflection;
using Autofac;
using Autofac.Core;
using Autofac.Extensions.DependencyInjection;
using Infrastructure;
using Infrastructure.Extensions.AutofacManager;
using Infrastructure.Helpers;
using Infrastructure.Middleware;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using donkeymove.App;
using donkeymove.App.HostedService;
using donkeymove.Repository;
using donkeymove.WebApi;
using Swashbuckle.AspNetCore.SwaggerUI;

var builder = WebApplication.CreateBuilder(args);
ConfigurationManager Configuration = builder.Configuration;
IServiceCollection services = builder.Services;

builder.Host.UseServiceProviderFactory(new AutofacServiceProviderFactory());
builder.Host.ConfigureContainer<ContainerBuilder>(builder =>
{
    // Declare your services with proper lifetime
    AutofacExt.InitAutofac(builder);
});



var loggerFactory = LoggerFactory.Create(builder => { builder.AddLog4Net(); });
ILogger logger = loggerFactory.CreateLogger<Program>();

services.AddSingleton(new ConfigHelper(Configuration));

// 添加MiniProfiler服務
services.AddMiniProfilerSetup();

//添加swagger
services.AddSwaggerSetup();

services.Configure<AppSetting>(Configuration.GetSection("AppSetting"));

services.AddGlobalControllerSetup();

services.AddMemoryCache();

services.AddCorsSetup();

//在startup里面只能通過這種方式獲取到appsettings里面的值，不能用IOptions??
var dbtypes = ((ConfigurationSection)Configuration.GetSection("AppSetting:DbTypes")).GetChildren()
    .ToDictionary(x => x.Key, x => x.Value);
var connectionString = Configuration.GetConnectionString("donkeymoveDBContext");
logger.LogInformation($"系統配置的數據庫類型：{JsonHelper.Instance.Serialize(dbtypes)}，連接字符串：{connectionString}");
services.AddDbContext<donkeymoveDBContext>();

services.AddHttpClient();

services.AddDataProtection().PersistKeysToFileSystem(new DirectoryInfo(Configuration["DataProtection"]));

//設置定時啟動的任務
services.AddHostedService<QuartzService>();

// Using a custom DI container.




var app = builder.Build();
if (!app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.UseMiniProfiler();

//可以訪問根目錄下面的靜態文件
var staticfile = new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(AppContext.BaseDirectory),
    OnPrepareResponse = (ctx) =>
    {
        //可以在這里為靜態文件添加其他http頭信息，默認添加跨域信息
        ctx.Context.Response.Headers["Access-Control-Allow-Origin"] = "*";
    }
};
app.UseStaticFiles(staticfile);

//todo:測試可以允許任意跨域，正式環境要加權限
app.UseCors(builder => builder.AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader());

app.UseRouting();
app.UseAuthentication();

// 啟用日志追蹤記錄和異常友好提示
app.UseLogMiddleware();

app.UseEndpoints(endpoints => { endpoints.MapControllers(); });
//配置ServiceProvider
AutofacContainerModule.ConfigServiceProvider(app.Services);

app.UseSwagger();

// Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.),
// specifying the Swagger JSON endpoint.
var swaggerParh = ConfigHelper.App(new string[] { "Startup", "SwaggerPath" });
Console.WriteLine(swaggerParh);

app.UseSwaggerUI(c =>
{
    c.IndexStream = () =>
        MethodBase.GetCurrentMethod().DeclaringType.Assembly.GetManifestResourceStream("donkeymove.WebApi.index.html");

    foreach (var controller in StartupSetup.GetControllers())
    {
        var groupname = StartupSetup.GetSwaggerGroupName(controller);

        c.SwaggerEndpoint($"{swaggerParh}/swagger/{groupname}/swagger.json", groupname);
    }

    c.DocExpansion(DocExpansion.List); //默認展開列表
    c.OAuthClientId("donkeymove.WebApi"); //oauth客戶端名稱
    c.OAuthAppName("開源版webapi認證"); // 描述
});
// Configure the HTTP request pipeline.

app.Run();
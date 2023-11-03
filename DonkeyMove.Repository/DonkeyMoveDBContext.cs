using System;
using System.Collections.Generic;
using System.Linq;
using Infrastructure;
using Infrastructure.Extensions;
using Infrastructure.Utilities;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using donkeymove.Repository.Domain;
using donkeymove.Repository.QueryObj;

namespace donkeymove.Repository
{
    public partial class donkeymoveDBContext : DbContext
    {
        private ILoggerFactory _LoggerFactory;
        private IHttpContextAccessor _httpContextAccessor;
        private IConfiguration _configuration;
        private IOptions<AppSetting> _appConfiguration;

        public donkeymoveDBContext(DbContextOptions<donkeymoveDBContext> options, ILoggerFactory loggerFactory,
            IHttpContextAccessor httpContextAccessor, IConfiguration configuration, IOptions<AppSetting> appConfiguration)
            : base(options)
        {
            _LoggerFactory = loggerFactory;
            _httpContextAccessor = httpContextAccessor;
            _configuration = configuration;
            _appConfiguration = appConfiguration;
        }

        public virtual DbSet<Application> Applications { get; set; }

        public virtual DbSet<Category> Categories { get; set; }

        public virtual DbSet<CategoryType> CategoryTypes { get; set; }

        public virtual DbSet<FlowInstance> FlowInstances { get; set; }

        public virtual DbSet<FlowInstanceOperationHistory> FlowInstanceOperationHistorys { get; set; }

        public virtual DbSet<FlowInstanceTransitionHistory> FlowInstanceTransitionHistorys { get; set; }

        public virtual DbSet<FlowScheme> FlowSchemes { get; set; }

        public virtual DbSet<Form> Forms { get; set; }

        public virtual DbSet<Module> Modules { get; set; }

        public virtual DbSet<ModuleElement> ModuleElements { get; set; }

        public virtual DbSet<SysOrg> Orgs { get; set; }

        public virtual DbSet<Relevance> Relevances { get; set; }

        public virtual DbSet<Resource> Resources { get; set; }

        public virtual DbSet<Role> Roles { get; set; }

        public virtual DbSet<User> Users { get; set; }

        public virtual DbSet<UploadFile> UploadFiles { get; set; }

        public virtual DbSet<FrmLeaveReq> FrmLeaveReqs { get; set; }

        public virtual DbSet<SysLog> SysLogs { get; set; }

        public virtual DbSet<SysMessage> SysMessages { get; set; }

        public virtual DbSet<DataPrivilegeRule> DataPrivilegeRules { get; set; }

        public virtual DbSet<OpenJob> OpenJobs { get; set; }

        public virtual DbSet<BuilderTable> BuilderTables { get; set; }

        public virtual DbSet<BuilderTableColumn> BuilderTableColumns { get; set; }

        public virtual DbSet<SocialPractice> SocialPractices { get; set; }

        public virtual DbSet<ServiceTimes> ServiceTimes { get; set; }

        public virtual DbSet<InfoNews> InfoNews { get; set; }

        public virtual DbSet<AboutUs> AboutUs { get; set; }

        //非數據庫表格
        public virtual DbSet<QueryStringObj> QueryStringObjs { get; set; }

        public virtual DbSet<SysTableColumn> SysTableColumns { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.EnableSensitiveDataLogging(true);  //允許打印參數
            optionsBuilder.UseLoggerFactory(_LoggerFactory);
            InitTenant(optionsBuilder);
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DataPrivilegeRule>()
                .HasKey(c => new { c.Id });
            modelBuilder.Entity<SysTableColumn>().HasNoKey();
            modelBuilder.Entity<QueryStringObj>().HasNoKey();
        }

        //初始化多租戶信息，根據租戶id調整數據庫
        private void InitTenant(DbContextOptionsBuilder optionsBuilder)
        {
            var tenantId = _httpContextAccessor.GetTenantId();
            string connect = _configuration.GetConnectionString(tenantId);
            if (string.IsNullOrEmpty(connect))
            {
                throw new Exception($"未能找到租戶{tenantId}對應的連接字符串信息");
            }

            //這個地方如果用IOption，在單元測試的時候會獲取不到AppSetting的值??
            var dbtypes = _configuration.GetSection("AppSetting:DbTypes").GetChildren()
                .ToDictionary(x => x.Key, x => x.Value);

            var dbType = dbtypes[tenantId];
            if (dbType == Define.DBTYPE_SQLSERVER)
            {
                optionsBuilder.UseSqlServer(connect);
            }
            else if (dbType == Define.DBTYPE_MYSQL)  //mysql
            {
                optionsBuilder.UseMySql(connect, new MySqlServerVersion(new Version(8, 0, 11)));
            }
            else
            {
                optionsBuilder.UseOracle(connect, options => options.UseOracleSQLCompatibility("11"));
            }
        }
    }
}
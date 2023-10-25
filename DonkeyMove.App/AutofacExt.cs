using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.Loader;
using Autofac;
using Autofac.Extensions.DependencyInjection;
using Autofac.Extras.Quartz;
using Infrastructure.Cache;
using Infrastructure.Extensions.AutofacManager;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyModel;
using donkeymove.App.Interface;
using donkeymove.App.SSO;
using donkeymove.Repository;
using donkeymove.Repository.Interface;
using IContainer = Autofac.IContainer;

namespace donkeymove.App
{
    public static class AutofacExt
    {
        private static IContainer _container;

        public static IContainer InitForTest(IServiceCollection services)
        {
            var builder = new ContainerBuilder();

            //注冊數據庫基礎操作和工作單元
            services.AddScoped(typeof(IRepository<,>), typeof(BaseRepository<,>));
            services.AddScoped(typeof(IUnitWork<>), typeof(UnitWork<>));

            //注入授權
            builder.RegisterType(typeof(LocalAuth)).As(typeof(IAuth));

            //注冊app層
            builder.RegisterAssemblyTypes(Assembly.GetExecutingAssembly());

            //防止單元測試時已經注入
            if (services.All(u => u.ServiceType != typeof(ICacheContext)))
            {
                services.AddScoped(typeof(ICacheContext), typeof(CacheContext));
            }

            if (services.All(u => u.ServiceType != typeof(IHttpContextAccessor)))
            {
                services.AddScoped(typeof(IHttpContextAccessor), typeof(HttpContextAccessor));
            }

            InitDependency(builder);

            builder.RegisterModule(new QuartzAutofacFactoryModule());

            builder.Populate(services);

            _container = builder.Build();
            return _container;
        }

        public static void InitAutofac(ContainerBuilder builder)
        {
            //注冊數據庫基礎操作和工作單元
            builder.RegisterGeneric(typeof(BaseRepository<,>)).As(typeof(IRepository<,>));
            builder.RegisterGeneric(typeof(UnitWork<>)).As(typeof(IUnitWork<>));
            //注入授權
            builder.RegisterType(typeof(LocalAuth)).As(typeof(IAuth));

            //注冊app層
            builder.RegisterAssemblyTypes(Assembly.GetExecutingAssembly());

            builder.RegisterType(typeof(CacheContext)).As(typeof(ICacheContext));
            builder.RegisterType(typeof(HttpContextAccessor)).As(typeof(IHttpContextAccessor));

            InitDependency(builder);

            builder.RegisterModule(new QuartzAutofacFactoryModule());
        }

        /// <summary>
        /// 注入所有繼承了IDependency接口
        /// </summary>
        /// <param name="builder"></param>
        private static void InitDependency(ContainerBuilder builder)
        {
            Type baseType = typeof(IDependency);
            var compilationLibrary = DependencyContext.Default
                .CompileLibraries
                .Where(x => !x.Serviceable
                            && x.Type == "project")
                .ToList();
            var count1 = compilationLibrary.Count;
            List<Assembly> assemblyList = new List<Assembly>();

            foreach (var _compilation in compilationLibrary)
            {
                try
                {
                    assemblyList.Add(AssemblyLoadContext.Default.LoadFromAssemblyName(new AssemblyName(_compilation.Name)));
                }
                catch (Exception ex)
                {
                    Console.WriteLine(_compilation.Name + ex.Message);
                }
            }

            builder.RegisterAssemblyTypes(assemblyList.ToArray())
                .Where(type => baseType.IsAssignableFrom(type) && !type.IsAbstract)
                .AsSelf().AsImplementedInterfaces()
                .InstancePerLifetimeScope();
        }
    }
}
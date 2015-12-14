using System.Linq;
using System.Web.Mvc;
using System.Web.Http;
using Logqso.mvc.Resolver_MEF;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Unity.Mvc;

[assembly: WebActivatorEx.PreApplicationStartMethod(typeof(Logqso.mvc.ui.App_Start.UnityWebActivator), "Start")]
[assembly: WebActivatorEx.ApplicationShutdownMethod(typeof(Logqso.mvc.ui.App_Start.UnityWebActivator), "Shutdown")]

namespace Logqso.mvc.ui.App_Start
{
    /// <summary>Provides the bootstrapping for integrating Unity with ASP.NET MVC.</summary>
    public static class UnityWebActivator
    {
        /// <summary>Integrates Unity when the application starts.</summary>
        public static void Start() 
        {
            var container = UnityConfig.GetConfiguredContainer();

            FilterProviders.Providers.Remove(FilterProviders.Providers.OfType<FilterAttributeFilterProvider>().First());
            FilterProviders.Providers.Add(new UnityFilterAttributeFilterProvider(container));

#if NoMEF
            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
#else
            //Component initialization via MEF

            Resolver_MEF.ComponentLoader.LoadContainer(container, ".\\bin", "Logqso.mvc.ui.dll");
            Resolver_MEF.ComponentLoader.LoadContainer(container, ".\\bin", "LogQso.Repository.dll");
            Resolver_MEF.ComponentLoader.LoadContainer(container, ".\\bin", "LogQso.mvc.DataModel.dll");
            Resolver_MEF.ComponentLoader.LoadContainer(container, ".\\bin", "LogQso.mvc.Domain.dll");
            //jims: MVC resolver
            System.Web.Mvc.DependencyResolver.SetResolver(new UnityDependencyResolver(container));
 
            // register dependency resolver for WebAPI RC
            //jims: Webapi resolver
             GlobalConfiguration.Configuration.DependencyResolver = new Unity.WebApi.UnityDependencyResolver(container);


#endif
            // TODO: Uncomment if you want to use PerRequestLifetimeManager
            // Microsoft.Web.Infrastructure.DynamicModuleHelper.DynamicModuleUtility.RegisterModule(typeof(UnityPerRequestHttpModule));
        }

        /// <summary>Disposes the Unity container when the application is shut down.</summary>
        public static void Shutdown()
        {
            var container = UnityConfig.GetConfiguredContainer();
            container.Dispose();
        }
    }
} 
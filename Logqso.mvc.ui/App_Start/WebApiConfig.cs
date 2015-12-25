using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Dispatcher;


namespace Logqso.mvc.ui
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            //this line enables attribute routing
            //http://weblogs.asp.net/dwahlin/new-features-in-asp-net-web-api-2-part-i
            config.MapHttpAttributeRoutes();

#if true
            //WITH aTTRIBUTE ROUTING, NO MAPPING REQUIRED
            //config.Routes.MapHttpRoute(
            //    name: "DefaultApi",
            //    routeTemplate: "api/{controller}/{id}",
            //    defaults: new { id = RouteParameter.Optional }
            //);
#else
            //non-attribute controller routing
            //uses NamespaceHttpControllerSelector can find the controller
            config.Routes.MapHttpRoute(
             name: "DefaultApi",
             routeTemplate: "api/{namespace}/{controller}/{id}",  
             defaults: new { id = RouteParameter.Optional }

);
            //use the custom http controller to support multiple controllers
            config.Services.Replace(typeof(IHttpControllerSelector), new NamespaceHttpControllerSelector(config));

#endif

#if  Debug
            //remove this iisexpress trace
            config.EnableSystemDiagnosticsTracing();
#endif


        }
    }
}

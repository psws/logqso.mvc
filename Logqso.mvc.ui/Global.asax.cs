using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Http;
using System.Web.Routing;
using Microsoft.Web.Helpers;


namespace Logqso.mvc.ui
{
 

    public class MvcApplication : System.Web.HttpApplication
    {
        //for razor to javascript debug 
        public static bool IsDebug
        {
            get
            {
#if DEBUG
                return true;
#else
                return false;
#endif
            }
        }


        protected void Application_Start()
        {
#if Debug
            WebApiTestClient.WebApiTestClientHttpMessageHandler.RegisterRouteForTestClient(GlobalConfiguration.Configuration); 
#endif
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            GlobalConfiguration.Configure(WebApiConfig.Register); 
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            Themes.Initialize("~/Content/Themes/", "Cupertino");
            //Themes.Initialize("~/Content/Themes/", "Flick");
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}

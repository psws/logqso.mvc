using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Logqso.mvc.ui
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

#if original
            routes.MapRoute(
              name: "LogQso",
              url: "LogQso",
              defaults: new { controller = "LogQso", action = "LogQso", id = UrlParameter.Optional }

          );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
#endif

            //routes.MapRoute(name: "Default", url: "{controller}/{action}/{id}",
            //    namespaces: new[] { "Logqso.mvc.ui]" },
            //   defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional });

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "logqso", action = "logqso", id = UrlParameter.Optional }
);


        }
    }
}

using System;
using System.Web;
using System.Web.Optimization;
using Microsoft.Web.Helpers;
using Logqso.mvc.ui.Helpers;

namespace Logqso.mvc.ui
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Scripts/jquery-ui-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqgrid").Include(
                        "~/Scripts/i18n/grid.locale-en.js",
                       "~/Scripts/jquery.jqGrid.src.js"));
            
            bundles.Add(new ScriptBundle("~/bundles/logqso").Include(
                        "~/Scripts/jqxcore.js",
                        //"~/Scripts/jqxtabs.js",
                        "~/Scripts/logqso.js"));


            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content").Include(
                     "~/Content/bootstrap.css",
                    "~/Content/Themes/Stock/jquery-ui.css",
                     "~/Content/site.css",
                     "~/Content/jquery.jqGrid/ui.jqgrid-bootstrap.css",
                       "~/Content/themes/jqx.base.css",
                      "~/Content/themes/jqx.energyblue.css",
                        "~/Content/logqso.css"));


            //turns off bundle minimzations when webconfig compilation debug="false"
            //some bug hoses UI if minimizatios occur on css and js files
            BundleTable.EnableOptimizations = false;
          
            var theme =  Themes.CurrentTheme;
            JQueryUI.eTheme eTheme;
            string  stylePath;
            Enum.TryParse<JQueryUI.eTheme>(theme, out eTheme);
            switch (eTheme)
            {
                case JQueryUI.eTheme.Stock:
                    stylePath = string.Format("~/Content/Themes/{0}/jquery-ui.css", theme);
                     bundles.Add(new StyleBundle(Logqso.mvc.ui.Helpers.JQueryUI.Bundle(theme)).Include(
                               "~/Content/bootstrap.css",
                               stylePath,
                      "~/Content/jquery.jqGrid/ui.jqgrid-bootstrap.css",
                             "~/Content/site.css",
                            "~/Content/themes/jqx.base.css",
                            "~/Content/themes/jqx.energyblue.css",
                              "~/Content/logqso.css"));
                   break;
                case JQueryUI.eTheme.Flick:
                   //https://www.nuget.org/packages/Microsoft.AspNet.WebHelpers/
                     stylePath = string.Format("~/Content/Themes/{0}/jquery-ui.flick.css", theme);
                     bundles.Add(new StyleBundle(Logqso.mvc.ui.Helpers.JQueryUI.Bundle(theme)).Include(
                               "~/Content/bootstrap.css",
                                "~/Content/themes/Stock/jquery-ui.css",
                              stylePath,
                       "~/Content/jquery.jqGrid/ui.jqgrid-bootstrap.css",
                            "~/Content/site.css",
                             "~/Content/themes/jqx.base.css",
                             "~/Content/themes/jqx.energyblue.css",
                            "~/Content/logqso.css"));
                  break;
                case JQueryUI.eTheme.Cupertino:
                  //https://www.nuget.org/packages/Microsoft.AspNet.WebHelpers/
                  stylePath = string.Format("~/Content/Themes/{0}/jquery-ui.cupertino.css", theme);
                  bundles.Add(new StyleBundle(Logqso.mvc.ui.Helpers.JQueryUI.Bundle(theme)).Include(
                            "~/Content/bootstrap.css",
                             "~/Content/themes/Stock/jquery-ui.css",
                           stylePath,
                    "~/Content/jquery.jqGrid/ui.jqgrid-bootstrap.css",
                         "~/Content/site.css",
                          "~/Content/themes/jqx.base.css",
                          "~/Content/themes/jqx.energyblue.css",
                         "~/Content/logqso.css"));
                  break;
                default:
                     stylePath = string.Format("~/Content/Themes/{0}/jquery-ui.css", theme);
                   break;
            }
        }
    }
}

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


            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      //"~/Content/jquery-ui.css",
                        "~/Content/site.css",
                        "~/Content/logqso.css"));

            
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
                              "~/Content/site.css",
                              "~/Content/logqso.css"));
                   break;
                case JQueryUI.eTheme.Flick:
                   //https://www.nuget.org/packages/Microsoft.AspNet.WebHelpers/
                     stylePath = string.Format("~/Content/Themes/{0}/jquery-ui.flick.css", theme);
                     bundles.Add(new StyleBundle(Logqso.mvc.ui.Helpers.JQueryUI.Bundle(theme)).Include(
                               "~/Content/bootstrap.css",
                                "~/Content/themes/Stock/jquery-ui.css",
                              stylePath,
                              "~/Content/site.css",
                              "~/Content/logqso.css"));
                  break;
                default:
                     stylePath = string.Format("~/Content/Themes/{0}/jquery-ui.css", theme);
                   break;
            }

        }
    }
}

using System;
using System.Web.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Logqso.mvc.ui.Helpers
{
    public static class HtmlHelperExtensions
    {
        public static MvcHtmlString AppVersion(this HtmlHelper HtmlHelper)
        {
            var appInstance = HtmlHelper.ViewContext.HttpContext.ApplicationInstance;
            //given that you should then be able to do 
            var assemblyVersion = appInstance.GetType().BaseType.Assembly.GetName().Version;
            //note the use of the BaseType - see note below
            //return assemblyVersion.ToString();

            var builder = new TagBuilder("label");
            builder.SetInnerText("Version:" + assemblyVersion.ToString());
            //builder.MergeAttribute("type", "text");
            //builder.MergeAttribute("name", "Version");
            //builder.MergeAttribute("value", );
            //return MvcHtmlString.Create(builder.ToString(TagRenderMode.SelfClosing));
            MvcHtmlString MvcHtmlString = MvcHtmlString.Create(builder.ToString());
            return MvcHtmlString;

        }

        public static MvcHtmlString TabViewInitialSelector(this HtmlHelper HtmlHelper)
        {
            string TabView = "0"; //default
            var value = HtmlHelper.ViewContext.HttpContext.Request.QueryString.Get("View");
            if (value == null)
            {
                value = "UBN";
            }
            switch (value)
            {
                case "Chaet":
                    TabView = "Chart";
                    break;
                case "Log":
                    TabView = "Log";
                    break;
                case "UBN":
                    TabView = "UBN";
                    break;
                default:
                    break;
            }
           // <input id="TabViewInit" type="hidden" value="TabViewChart" />
           var builder = new TagBuilder("input");
            builder.MergeAttribute("id", "TabViewInit");
            builder.MergeAttribute("type", "hidden");
            builder.MergeAttribute("value", TabView);

            MvcHtmlString MvcHtmlString = MvcHtmlString.Create(builder.ToString(TagRenderMode.SelfClosing));

            return MvcHtmlString;

        }

    }
}
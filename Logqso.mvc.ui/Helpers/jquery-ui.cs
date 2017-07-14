using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Logqso.mvc.ui.Helpers
{
    //http://jameschambers.com/2014/06/day-23-choosing-your-own-look-and-feel/
    public static class JQueryUI
    {
        public const string BundleBase = "~/Content/themes/";

        public class Theme
        {
            public const string Stock = "base";
            public const string Flick = "Flick";
            public const string Cupertino = "Cupertino";
        }

        public static HashSet<string> Themes = new HashSet<string>
        {
            Theme.Stock,
            Theme.Flick,
            Theme.Cupertino,
        };
        public enum eTheme
        {
            Stock,
            Flick,
            Cupertino,
        }

        public static string Bundle(string themename)
        {
            return BundleBase + themename;
        }
    }
}
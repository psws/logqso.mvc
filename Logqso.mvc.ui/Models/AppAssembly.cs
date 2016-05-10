using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Logqso.mvc.ui.Models
{
    //https://bubblogging.wordpress.com/2011/12/31/mvc-data-controller-view/
    public class AppAssembly
    {
        public string Version { get; set; }
        public string ProductName { get; set; }
        public string AppDescription { get; set; }
        public string CompanyName { get; set; }
        public string Copyright{ get; set; }
    }

    public class AssemblyViewModel
    {
        public AppAssembly Assembly { get; set; }
    }

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Logqso.mvc.ui.Helpers;
using System.Reflection;
using System.Diagnostics;
using Logqso.mvc.ui.Models;

namespace Logqso.mvc.ui.Controllers
{
    public class LogQsoController : Controller
    {
        // GET: LogQso
        //[ValidateAntiForgeryToken]
        public ActionResult LogQso()
        {
            return View();
        }

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "CourseID,Title,Credits,DepartmentID")]Course course)
        //{

        //}
        public ActionResult About()
        {
            //var configuration = new Configuration();
            //var migrator = new DbMigrator(configuration);
            //migrator.Update();

            //ViewBag.Message = "Your app description page.";

            //ViewBag.Message = "Your application description page.";

            //string version = Assembly.GetEntryAssembly().GetName().Version.ToString();
        //http://stackoverflow.com/questions/15126113/getting-assembly-version-from-assemblyinfo-cs 
            FileVersionInfo fv = System.Diagnostics.FileVersionInfo.GetVersionInfo
                                           (Assembly.GetExecutingAssembly().Location);

            AssemblyViewModel AssemblyViewModel = new AssemblyViewModel()
            {
                Assembly = new AppAssembly(),
            };
            AssemblyViewModel.Assembly.AppDescription = fv.Comments;
            AssemblyViewModel.Assembly.ProductName = fv.ProductName;
            AssemblyViewModel.Assembly.Version = fv.ProductVersion;
            AssemblyViewModel.Assembly.CompanyName = fv.CompanyName;
            AssemblyViewModel.Assembly.Copyright =  fv.LegalCopyright;

#if false
            string version3 = Assembly.GetExecutingAssembly().GetName().Version.ToString();
            string version2 = fv.FileVersion.ToString();
#endif

            return View(AssemblyViewModel);
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Contact us at";

            return View();
        }

        public ActionResult Help()
        {
            return View();
        }

    }

}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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

    }
}
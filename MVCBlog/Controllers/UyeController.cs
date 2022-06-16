using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCBlog.Controllers
{
    public class UyeController : Controller
    {
        // GET: Uye
        public ActionResult UyeleriListele()
        {
            return View();
        }
    }
}
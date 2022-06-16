using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCBlog.Controllers
{
    public class YazarController : Controller
    {

        // GET: Yazar
        public ActionResult YazarListele()
        {
            return View();
        }
    }
}
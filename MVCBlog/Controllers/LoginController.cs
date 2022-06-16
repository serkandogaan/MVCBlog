using Blog.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace MVCBlog.Controllers
{
    public class LoginController : Controller
    {
        MVCBlogEntities db = new MVCBlogEntities();
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Uyeler uye)
        {
            var loginuye = db.Uyelers.FirstOrDefault(x => x.UyeMailAdresi == uye.UyeMailAdresi && x.UyeSifre == uye.UyeSifre);
            if (loginuye != null)
            {
                FormsAuthentication.SetAuthCookie(loginuye.UyeMailAdresi, false);
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.mesaj = "Hatalı giriş";
                return View();
            }

        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(Uyeler newuye)
        {
            newuye.Role = "Uye";
            db.Uyelers.Add(newuye);
            var newbloguye = db.Uyelers.FirstOrDefault(x => x.UyeMailAdresi == newuye.UyeMailAdresi && x.UyeSifre == newuye.UyeSifre);
            FormsAuthentication.SetAuthCookie(newbloguye.UyeMailAdresi, false);
            return RedirectToAction("Index", "Home");

        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }
    }
}
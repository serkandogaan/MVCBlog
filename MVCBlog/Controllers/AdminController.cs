using Blog.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCBlog.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        BlogDal Islemler = new BlogDal();
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "Admin")]
        public ActionResult TumKategorileriListele()
        {
            var TumKategoriler = Islemler.KategorileriListele();
            return View(TumKategoriler);
        }

        [HttpGet]
        [Authorize(Roles ="Admin")]
        public ActionResult YeniKategoriEkle()
        {
            return View();
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public ActionResult YeniKategoriEkle(Kategoriler kategori)
        {
            Islemler.YeniKategoriOlustur(kategori);
            return RedirectToAction("Kategoriler");
        }

        [Authorize(Roles = "Admin,Yazar")]
        public ActionResult TumMakaleleriListele()
        {
            var TumMakaleler = Islemler.MakaleleriListele();
            return View(TumMakaleler);
        }
        
        public ActionResult YazarMakaleListele()
        {
            string user = User.Identity.Name;
            var userinfo = Islemler.YazarlariListele().Where(x => x.YazarMailAdresi == user).Select(y => y.YazarID).FirstOrDefault();        
            var YazarMakale = Islemler.MakaleleriListele().Where(x => x.YazarID == userinfo).ToList();
            return View(YazarMakale);
        }


        [Authorize(Roles = "Admin")]
        public ActionResult TumYazarlariListele()
        {
            var TumYazarlar = Islemler.YazarlariListele();
            return View(TumYazarlar);
        }

        [Authorize(Roles = "Admin")]
        public ActionResult TumUyeleriListele()
        {
            var TumUyeler = Islemler.UyeleriListele();
            return View(TumUyeler);
        }       
        
    }
}
using Blog.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;

namespace MVCBlog.Controllers
{
    public class MakaleController : Controller
    {
        BlogDal BlogIslemleri = new BlogDal(); 

        // GET: Makale
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult MakaleListele()
        {
            var makaleler = BlogIslemleri.MakaleListele();           
            return PartialView(makaleler);
        }

        [HttpGet]
        public ActionResult MakaleGoruntule(int id)
        {
            var userinfo = User.Identity.Name;
            ViewBag.uyeadi = BlogIslemleri.UyeleriListele().Where(x => x.UyeMailAdresi == userinfo).Select(x => x.UyeAdi).FirstOrDefault();
            ViewBag.uyesoyadi = BlogIslemleri.UyeleriListele().Where(x => x.UyeMailAdresi == userinfo).Select(x => x.UyeSoyAdi).FirstOrDefault();
            if (BlogIslemleri.MakaleBul(id) == null)
            {
                return RedirectToAction("Bulunamadi");
            }
            var Makalele = BlogIslemleri.MakaleGoruntule(id);
            Session["Makaleid"] = id;
            return View(Makalele);
        }

        [HttpPost]
        public ActionResult YorumYaz(Yorumlar yeniyorum)
        {
            var urlid = Session["Makaleid"];
            yeniyorum.MakaleID = Convert.ToInt32(urlid);
            BlogIslemleri.YeniYorumOlustur(yeniyorum);
            return RedirectToAction("MakaleGoruntule", new { id = urlid });
        }


        [HttpGet]
        [Authorize(Roles = "Yazar,Admin")]
        public ActionResult MakaleyiGuncelle(int id)
        {
            var guncellenecekmakale = BlogIslemleri.MakaleBul(id);
            return View(guncellenecekmakale);
        }

        [HttpPost]
        [Authorize(Roles = "Yazar,Admin")]
        public ActionResult MakaleyiGuncelle(int id, Makaleler makale)
        {
            BlogIslemleri.MakaleyiGuncelle(id, makale);
            var makaleid = id;
            return RedirectToAction("MakaleGoruntule", "Makale", new { id = makaleid });
        }

        [Authorize(Roles = "Admin")]
        public ActionResult MakaleyiSil(int id)
        {
            BlogIslemleri.MakaleyiSil(id);
            return RedirectToAction("MakaleListele");
        }

        [HttpGet]
        [Authorize(Roles = "Yazar,Admin")]
        public ActionResult MakaleEkle()
        {
            List<SelectListItem> kategori = (from x in BlogIslemleri.KategorileriListele()
                                             select new SelectListItem
                                             {
                                                 Text = x.KategoriAdi,
                                                 Value = x.KategoriID.ToString()
                                             }
                                             ).ToList();
            ViewBag.KategoriListesi = kategori;
            return View();
        }

        [HttpPost]
        [Authorize(Roles = "Yazar,Admin")]
        public ActionResult MakaleEkle(Makaleler makale)
        {
            makale.YazarID = 6;
            BlogIslemleri.YeniMakaleOlustur(makale);
            var makaleid = makale.MakaleID;
            return RedirectToAction("MakaleGoruntule", new { id = makaleid });
        }

        public PartialViewResult FeaturedMakale()
        {
            var featuremakale = BlogIslemleri.FeaturedMakale();
            return PartialView(featuremakale);
        }

        public PartialViewResult RandomMakale()
        {
            var randommakale = BlogIslemleri.RandomMakale();
            return PartialView(randommakale);
        }

        public PartialViewResult SonMakaleler()
        {
            var sonmakale = BlogIslemleri.MakaleleriListele().OrderByDescending(x => x.MakaleEklenmeTarihi).Take(3).ToList();
            return PartialView(sonmakale);
        }

        public ActionResult Bulunamadi()
        {
            return View();
        }

    }
}
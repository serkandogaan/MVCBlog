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
    public class KategoriController : Controller
    {
        // GET: Kategori

        BlogDal BlogIslemleri = new BlogDal();
         
        public ActionResult Kategoriler(int sayfa = 1)
        {
            var Kategoriler = BlogIslemleri.KategorileriListele().ToPagedList(sayfa,5);
            return View(Kategoriler);
        }

        public ActionResult KategoriListele(int id)
        {
            var KategoriID = BlogIslemleri.KategoriIDListele(id);
            return View(KategoriID);
        }

        public PartialViewResult PopulerKategorileriListele()
        {
            var Kategoriler = BlogIslemleri.KategorileriListele().Take(4).ToList();
            return PartialView(Kategoriler);
        }

        public ActionResult KategoriIcerik(int id, int sayfa=1)
        {
            var kategorimakale = BlogIslemleri.MakaleleriListele().OrderBy(x => x.KategoriID).Where(x => x.KategoriID == id).ToPagedList(sayfa, 5);
            return View(kategorimakale);
        }

        
    }
}
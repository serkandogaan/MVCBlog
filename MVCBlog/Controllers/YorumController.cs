using Blog.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCBlog.Controllers
{
    public class YorumController : Controller
    {
        // GET: Yorum
        BlogDal YorumIslemleri = new BlogDal();
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult YorumListele(int id)
        {
            var Yorumlar = YorumIslemleri.YorumlarıListele(id);
            return PartialView(Yorumlar);
        }

        public ActionResult YorumSil(int id)
        {
            var bulunanyorumid = YorumIslemleri.YorumBul(id);
            int makaleid = bulunanyorumid.Select(y => y.MakaleID).FirstOrDefault();
            YorumIslemleri.YorumSil(id);
            return RedirectToAction("MakaleGoruntule", "Makale", new { id = makaleid });
        }
    }
}
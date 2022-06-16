using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using PagedList;
using System;

namespace Blog.DAL
{
    public class BlogDal
    {
        MVCBlogEntities db = new MVCBlogEntities();

        public IEnumerable<Makaleler> FeaturedMakale()
        {
            return db.Makalelers.Take(3).ToList();
        }
        public IEnumerable<Makaleler> RandomMakale()
        {
            Random rnd = new Random();
            var makalecount = db.Makalelers.Count();
            int randomrows = rnd.Next(0, makalecount);
            return db.Makalelers.OrderBy(x => x.MakaleID).Skip(randomrows).Take(2).ToList();
        }
        public Makaleler MakaleBul(int id)
        {
            return db.Makalelers.Find(id);
        }
        public IEnumerable<Makaleler> MakaleleriListele()
        {
            return db.Makalelers.ToList();
        }

        public IEnumerable<Makaleler> MakaleListele(int sayfa = 1)
        {
            return db.Makalelers.OrderBy(x => x.MakaleID).Skip(3).ToPagedList(sayfa, 4);
        }

        public IEnumerable<Makaleler> MakaleGoruntule(int id)
        {
            return db.Makalelers.Where(x => x.MakaleID == id).ToList();
        }

        public void YeniMakaleOlustur(Makaleler yenimakale)
        {
            db.Makalelers.Add(yenimakale);
            db.SaveChanges();
        }

        public void MakaleyiGuncelle(int id, Makaleler guncellenecekmakale)
        {
            var guncelmakale = db.Entry(guncellenecekmakale);
            guncelmakale.State = EntityState.Modified;
            db.SaveChanges();
            
        }

        public void MakaleyiSil(int id)
        {
            db.Makalelers.Remove(db.Makalelers.Find(id));
            db.SaveChanges();
        }

        public IEnumerable<Kategoriler> KategorileriListele()
        {
            return db.Kategorilers.ToList();
        }

        public IEnumerable<Kategoriler> KategoriIDListele(int id)
        {
            return db.Kategorilers.Where(x => x.KategoriID == id).ToList();
        }

        public void YeniKategoriOlustur(Kategoriler yenikategori)
        {
            db.Kategorilers.Add(yenikategori);
            db.SaveChanges();
        }

        public IEnumerable<Yorumlar> YorumlarıListele(int id)
        {
            return db.Yorumlars.Where(x => x.MakaleID == id).ToList();
        }

        public void YeniYorumOlustur(Yorumlar yeniyorum)
        {
            db.Yorumlars.Add(yeniyorum);
            db.SaveChanges();
        }

        public void YorumSil(int id)
        {
            db.Yorumlars.Remove(db.Yorumlars.Find(id));
            db.SaveChanges();
        }

        public IEnumerable<Yorumlar> YorumBul(int id)
        {         
            return db.Yorumlars.Where(x => x.YorumID == id);
        }

        public void YeniUyeEkle(Uyeler yeniuye)
        {
            db.Uyelers.Add(yeniuye);
            db.SaveChanges();
        }

        public IEnumerable<Yazarlar> YazarlariListele()
        {
            return db.Yazarlars.ToList();
        }

        public IEnumerable<Uyeler> UyeleriListele()
        {
            return db.Uyelers.ToList();
        }
        public IEnumerable<Uyeler> UyeBul(int id)
        {
            var bulunanuye = db.Uyelers.Where(x => x.UyeID == id);
            return bulunanuye;
        }

    }
}

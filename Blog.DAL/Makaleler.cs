//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Blog.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Makaleler
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Makaleler()
        {
            this.Yorumlars = new HashSet<Yorumlar>();
        }
    
        public int MakaleID { get; set; }
        public int KategoriID { get; set; }
        public int YazarID { get; set; }
        public string MakaleBaslikAdi { get; set; }
        public string MakaleIcerik { get; set; }
        public System.DateTime MakaleEklenmeTarihi { get; set; }
        public string MakaleGorsel { get; set; }
    
        public virtual Kategoriler Kategoriler { get; set; }
        public virtual Yazarlar Yazarlar { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Yorumlar> Yorumlars { get; set; }
    }
}

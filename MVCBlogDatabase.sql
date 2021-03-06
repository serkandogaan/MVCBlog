USE [master]
GO
/****** Object:  Database [MVCBlog]    Script Date: 17/06/2022 15:13:15 ******/
CREATE DATABASE [MVCBlog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVCBlog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVCBlog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MVCBlog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVCBlog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MVCBlog] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVCBlog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVCBlog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVCBlog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVCBlog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVCBlog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVCBlog] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVCBlog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVCBlog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVCBlog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVCBlog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVCBlog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVCBlog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVCBlog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVCBlog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVCBlog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVCBlog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVCBlog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVCBlog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVCBlog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVCBlog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVCBlog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVCBlog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVCBlog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVCBlog] SET RECOVERY FULL 
GO
ALTER DATABASE [MVCBlog] SET  MULTI_USER 
GO
ALTER DATABASE [MVCBlog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVCBlog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVCBlog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVCBlog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MVCBlog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MVCBlog] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVCBlog', N'ON'
GO
ALTER DATABASE [MVCBlog] SET QUERY_STORE = OFF
GO
USE [MVCBlog]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 17/06/2022 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](100) NOT NULL,
	[KategoriAciklama] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Makaleler]    Script Date: 17/06/2022 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makaleler](
	[MakaleID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriID] [int] NOT NULL,
	[YazarID] [int] NOT NULL,
	[MakaleBaslikAdi] [nvarchar](100) NOT NULL,
	[MakaleIcerik] [nvarchar](max) NOT NULL,
	[MakaleEklenmeTarihi] [datetime2](7) NOT NULL,
	[MakaleGorsel] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Makaleler] PRIMARY KEY CLUSTERED 
(
	[MakaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 17/06/2022 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[UyeID] [int] IDENTITY(1,1) NOT NULL,
	[UyeAdi] [nvarchar](100) NOT NULL,
	[UyeSoyAdi] [nvarchar](100) NOT NULL,
	[UyeMailAdresi] [nvarchar](100) NOT NULL,
	[UyeSifre] [nvarchar](100) NOT NULL,
	[UyeNickName] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Uyeler] PRIMARY KEY CLUSTERED 
(
	[UyeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yazarlar]    Script Date: 17/06/2022 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yazarlar](
	[YazarID] [int] IDENTITY(1,1) NOT NULL,
	[YazarAdi] [nchar](30) NOT NULL,
	[YazarSoyAdi] [nchar](30) NOT NULL,
	[YazarMailAdresi] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Yazarlar] PRIMARY KEY CLUSTERED 
(
	[YazarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorumlar]    Script Date: 17/06/2022 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorumlar](
	[YorumID] [int] IDENTITY(1,1) NOT NULL,
	[MakaleID] [int] NOT NULL,
	[YorumYazanAdiSoyadi] [nvarchar](100) NOT NULL,
	[YorumAciklama] [nvarchar](max) NOT NULL,
	[YorumEklenmeTarihi] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Yorumlar] PRIMARY KEY CLUSTERED 
(
	[YorumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi], [KategoriAciklama]) VALUES (1, N'Ekran Kartları', N'Ekran Kartları Hakkında Haberler')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi], [KategoriAciklama]) VALUES (2, N'İşlemci', N'İşlemciler Hakkında Haberler')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi], [KategoriAciklama]) VALUES (3, N'Telefon', N'Telefonlar Hakkında Haberler')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi], [KategoriAciklama]) VALUES (4, N'Tablet', N'Tablerler Hakkında Haberler')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi], [KategoriAciklama]) VALUES (5, N'Televizyon', N'Televizyonlar Hakkında Haberler')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi], [KategoriAciklama]) VALUES (6, N'Kripto', N'Kripto Paralar Hakkında Haberler')
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Makaleler] ON 

INSERT [dbo].[Makaleler] ([MakaleID], [KategoriID], [YazarID], [MakaleBaslikAdi], [MakaleIcerik], [MakaleEklenmeTarihi], [MakaleGorsel]) VALUES (2, 1, 6, N'Nvidia RTX 3000 Serisi', N'NVIDIA’nın Ampere mimarisine sahip RTX 3000 kartları, gerçek zamanlı ışın izleme ve yapay zeka destekli oyun grafikleri için Turing mimarisinin dahi iki katına çıkan yüksek performans vadediyor. NVIDIA bugün, GeForce RTX 30 serisi yeni ekran kartlarını duyurdu. NVIDIA’nın Ampere mimarisinden güç alan yeni seri ekran kartları, GeForce tarihinde, jenerasyonlar arası en büyük performans farkını sergileme özelliğine sahip. Performans göstergesi tabloları alt üst ederek GeForce RTX 3090, 3080 ve 3070 ekran kartları, Turing mimarisine sahip modeller karşısında 2 kat daha yüksek performansa sahipken 1,9 kat daha verimli. Dünyanın en güçlü PC oyun platformu olan NVIDIA RTX™’in ikinci jenerasyonunun avantajına sahip olan yeni ekran kartı serisi, gerçek zamanlı ışın izleme ve yapay zeka destekli oyun grafikleri anlamında rakipsiz bir seviyeye ulaşıyor. ', CAST(N'2022-05-10T20:00:00.0000000' AS DateTime2), N'https://i.hizliresim.com/cn0qpve.jpeg')
INSERT [dbo].[Makaleler] ([MakaleID], [KategoriID], [YazarID], [MakaleBaslikAdi], [MakaleIcerik], [MakaleEklenmeTarihi], [MakaleGorsel]) VALUES (3, 1, 6, N'AMD Radeon RX 6000 Serisi', N'Önceki nesil AMD RDNA™ mimarisine göre 1,54 kata kadar watt başına performans sunan(RX 6800 XT ile RX 5700 XT ile karşılaştırıldığında)1çığır açan AMD RDNA™ 2 mimarisi üzerine kuruldu. Radeon RX 6800 XT GPU, oyuncuların belirli oyunları 4K çözünürlük ve 60 fps kare hızıyla oynamasına imkan verirken2 Radeon™ RX 6800 Serisi ve Radeon™ RX 6900 XT grafik kartları yüksek çözünürlüklü oyun performansında yeni standartları belirliyor.

Radeon™ RX 6000 Serisinde Işın Hızlandırıcıları içeren geliştirilmiş bilgi işlem birimleri ve üst düzey görüntü özellikleri donanımla hızlandırılmış ışın izleme ve değişken oranlı gölgelendirmeyi destekleyerek oyunlarda gerçekçi görüntüler ve yüksek performans ortaya çıkarıyor. Bant genişliğini büyük oranda artırabilen 128 MB''a varan çığır açan AMD Infinity Önbellek ile 256 bit 16 Gbps GDDR6 belleğin efektif bant genişliğini 3,25 kata kadar artırın.

En Güncel Grafik Teknolojileri: DirectX® 12 Ultimate ve AMD FidelityFX4 gibi teknolojilerin desteklenmesi sayesinde oyunların görüntüleri artık daha iyi olacak.

GDDR6 Bellek: 512 GB/s bant genişliği hızlarına ulaşan ve devrim niteliğindeki AMD Infinity Önbellek ile birlikte sunulan bellek ile AMD Radeon™ RX 6000 Serisi oyunlarda etkileyici ve çarpıcı deneyimler vaat ediyor.”

PCIe® 4.0 Desteği: Bu kadar gücün çok fazla bant genişliğine ihtiyacı var. PCIe® 4.0 desteği sayesinde oyuncular, AMD Radeon™ RX 6000 Serisi GPU''ları kullanırken bant genişliği azalması veya vasatın altı performans gibi sorunlarla uğraşmak zorunda kalmayacak.

AMD FreeSync™ Teknolojisi:5 Yırtılma ve takılma olmayan, düşük gecikme süreli oyun deneyimi isteyen oyuncular, 1300''den fazla AMD FreeSync™ onaylı monitörden istediğini seçebilir.

AMD Akıllı Erişim Teknolojisi: AMD Ryzen™ masaüstü işlemciler ile AMD Radeon™ grafik kartları arasında PCIe® üzerinden yeni haberleşme teknikleri sayesinde belirli oyunlarda daha fazla performansa kavuşun.', CAST(N'2022-05-11T20:00:00.0000000' AS DateTime2), N'https://www.amd.com/system/files/2020-11/amd-radeon-6000-series-1260x709.jpg')
INSERT [dbo].[Makaleler] ([MakaleID], [KategoriID], [YazarID], [MakaleBaslikAdi], [MakaleIcerik], [MakaleEklenmeTarihi], [MakaleGorsel]) VALUES (4, 1, 6, N'Intel ARC Alchemist Serisi', N'Intel bugün uzun zamandır beklenen Arc Alchemist ekran kartlarını nihayet duyurdu. Beklediğimiz gibi ilk tanıtım mobil platform için oldu ve şirket böylelikle harici GPU pazarına en büyük adımını atmış oldu. Nisan ayında çok sayıda dizüstü bilgisayar modelini Intel Arc A-Serisi mobil GPU’larla birlikte görebileceğiz. Masaüstü platform için Arc ekran kartlarını bekleyenler için de iyi bir haberimiz var. Detaylarını bu haberimizden görebileceğiniz üzere, şirket lansmanda bir “Limited Edition” harici masaüstü kartı gösterdi ve kart gerçekten şık görünüyor. Ayrıca yaz aylarının başlarında ayrık Arc Alchemist kartların geleceğini bir kez daha doğruladılar. İşlemci ailesine benzer şekilde, Intel’in Arc Alchemist serisi birden fazla performans sınıfına sahip olacak: Arc 3, Arc 5 ve Arc 7. Bu serilere ait modeller 96’dan 512 adede kadar Xe Vektör Motoruna (XVE) sahip olacak. Aslında daha öncesinde Execution Unit (EU-Yürütme Birimi) terimini çok sık duyuyorduk. XVE ile birçok değişiklik yapıldı, ancak yeni ismi aslında EU olarak düşünebiliriz. GPU testlerinden NVIDIA’nın mevcut RT çekirdeklerinin AMD’nin ışın hızlandırıcılarından çok daha hızlı olduğunu biliyoruz. Bu nedenle Intel’in geliştirdiği RTU’ların ne kadar başarılı olduğunu bilmeden yorum yapmak imkansız. Ancak mavi ekibin ışın izleme çözümü AMD ve NVIDIA rakiplerine göre önemli ölçüde daha yetenekli değilse, ışın izleme performansı açısından Arc kartların sönük kaldığını görebiliriz. NVIDIA’nın DLSS teknolojisinden farklı olarak, XeSS teknolojisi Pascal ve sonraki NVIDIA GPU’larında, ayrıca RDNA ve önceki AMD GPU’larında bulunan DP4a komut setleri için destek sunacak. Intel, XeSS 1080p’den 4K’ya yükseltme kalitesini yerel 1080p’ye kıyasla gösteren bir video da sundu. Ancak performans konusunda hiçbir bilgi verilmedi.', CAST(N'2022-05-12T20:00:00.0000000' AS DateTime2), N'https://i.hizliresim.com/fb3kcdm.png')
INSERT [dbo].[Makaleler] ([MakaleID], [KategoriID], [YazarID], [MakaleBaslikAdi], [MakaleIcerik], [MakaleEklenmeTarihi], [MakaleGorsel]) VALUES (5, 2, 6, N'AMD Ryzen 6000 APU İşlemci Serisi', N'AMD’nin Zen 3 çekirdeğini optimize ederek daha verimli bir şekilde 6nm olarak piyasaya süreceği Ryzen 6000 mobil serisi merakla bekleniyor. Kaynaklar grafik tarafında entegre birimlerin önemli bir sıçrama yapacağı görüşünde.  AMD bugüne kadar Ryzen mobil APU’larında Vega grafik mimarisini elden geçirerek kullanmış ve belirli bir noktaya kadar oyuncuları tatmin edecek performans sunmuştu. Zen3+ çekirdekleri ile birlikte grafik tarafında da RDNA 2 geçişi planlayan şirket oyuncuları da sevindirecek. 

Kaynaklar 3DMark Time Spy testlerine düşen bir Ryzen 6000 APU modelinin 2700 puan aldığını belirtiyor. Bu rakamlar GeForce GTX 1650 ile çok yakın, GTX 970 ile bir miktar mesafeli bir durum ortaya koyuyor. Böylece Full HD 60fps oyunlarda oyuncuları mutlu edecektir. 

Muhtemelen testlere giren 8 çekirdekli AMD Ryzen 9 6900HX işlemcisi zira daha önce de prototip dizüstü modellerinde ortaya çıkmıştı. İşlemci tarafında yüzde 10-15 civarında performans artışı beklenirken grafik performansında da önemli sıçramalar olacak gibi gözüküyor. Elbette daha alt modellerde bu performans artışı nispeten düşük kalacaktır. ', CAST(N'2022-05-13T20:00:00.0000000' AS DateTime2), N'https://i.hizliresim.com/sbxsj4v.jpg')
INSERT [dbo].[Makaleler] ([MakaleID], [KategoriID], [YazarID], [MakaleBaslikAdi], [MakaleIcerik], [MakaleEklenmeTarihi], [MakaleGorsel]) VALUES (6, 3, 6, N'iPhone 14 Serisi', N'Apple’ın uzun süredir kapalı kapılar ardında geliştirdiği uydu üzerinden iletişim teknolojisi bu yıl karşımıza çıkabilir. Kaynaklar Apple’ın prototip seviyesinde yeni teknolojinin testlerine başladığını belirtiyor. WiFi ve hücresel bağlantı dışında iPhone modellerine farklı bir iletişim modeli uygulamak Steve Jobs’ın hayaliydi. Bu hayalini devam ettiren Tim Cook, 2019 yılında özel bir ekip kurarak Stewie kod adıyla projeye start vermişti. Uydu üzerinden iletişim kurabilen teknolojinin prototip aşamasına geldiği iddia ediliyor. Operatörlere bağlılığı en aza indirecek uydu iletişimi iPhone 14 serisinde en azından Pro versiyonlarda karşımıza çıkabilir.

Apple’ın A16 Bionic ile donatacağı iPhone 14 Pro ve iPhone 14 Pro Max modellerinde ek olarak uydu iletişim özelliği de yer alacak. Apple A15 Bionic kullanan iPhone 14 ve iPhone 14 Max ise bu teknolojiyi sunmayacak.

iPhone 14 ile ilgili diğer gündeme gelen iddialar ise standart seri için LPDDR4, Pro serisi için LPDDR5 RAM bellek, yine Pro serisi için biraz daha uzayan ekran boyutu şeklinde sıralanıyor.', CAST(N'2022-05-14T20:00:00.0000000' AS DateTime2), N'https://i.hizliresim.com/muf7kn2.jpg')
INSERT [dbo].[Makaleler] ([MakaleID], [KategoriID], [YazarID], [MakaleBaslikAdi], [MakaleIcerik], [MakaleEklenmeTarihi], [MakaleGorsel]) VALUES (8, 5, 6, N'LG OLED G1 Evo Serisi', N'LG OLED pikselleri ortak bir ışık veya arka aydınlatmaya gereksinim duymaz ve kendi parlaklıklarını kontrol edebilirler. Bu sayede kusursuz siyahın içinde gerçek derinlik, tonlar ve mükemmel kontrast oluşur.  Arkadan aydınlatmalı LED TV''ler gerçek ekranda renkleri göstermek için bir filtreden ışık geçirir, bu da görüntüde bozulmaya sebep olabilir. LG OLED TV, kendinden aydınlatmalı pikselleri ile herhangi bir bozulma olmadan en canlı renkler ve sonsuz kontrast sunar. Kusursuz OLED siyahı diğerleriyle karşılaştırılmayacak çarpıcı kontrastı yaratır. Ortaya çıkan kontrast, sinematik deneyim için tüm renklere derinlik katar ve detayları ortaya çıkarır.  LG OLED ekranların %100 renk doğruluğuna sahip olduğu uluslararası test ajanslarından Intertek tarafından onaylandı. Bu, ekranda gördüğünüz renklerin orijinal görüntünün renklerine çok yakın olduğu anlamına gelir. Böylece izlediğiniz her şey, içerik yaratıcısının istediği gibi görünür. LG OLED TV''ler, LG TV''lerin mükemmel renk üretimi teknolojisi sayesinde tam Renk Hacmi elde eder. %100 Renk Hacmi ile LG OLED, TV''nin tüm parlaklık aralığını kapsayan bir 3D renk alanında DCI-P3 spektrumunun %100''ünü ifade edebilir. Bu da ekran ne kadar parlak veya karanlık olursa olsun, renklerin tam doygunlukla canlı ve gerçekçi kalacağı anlamına gelir.', CAST(N'2022-05-15T20:00:00.0000000' AS DateTime2), N'https://i.hizliresim.com/fgqxtib.')
INSERT [dbo].[Makaleler] ([MakaleID], [KategoriID], [YazarID], [MakaleBaslikAdi], [MakaleIcerik], [MakaleEklenmeTarihi], [MakaleGorsel]) VALUES (9, 2, 6, N'AMD Ryzen 7000 Serisi', N'AMD CEO’su Lisa Su, Computex 2022 açılış konuşmasında Ryzen 7000 serisi işlemciler ve 600 serisi anakartlarla ilgili birçok ayrıntı açıkladı. AMD, sunum sırasında 5.5 GHz hıza ulaşan 16 çekirdekli Zen 4 işlemcisini sergiledi. Ayrıca Intel’in amiral gemisi Core i9-12900K ile kıyaslama yapmayı ihmal etmediler. Beklendiği gibi, Ryzen 7000 ‘Raphael’ serisi Zen 4 mikro mimarisini ve AM5 soketini kullanıyor. Öyle ki yeni soket yeni anakart demek. Bu noktada şirket, yepyeni işlemcileri kullanabilmemiz için 600 serisi yonga setleriyle ilgili birçok detay verdi. AMD, Ryzen 7000 işlemcilerin mevcut Zen 3 modellerine kıyasla >%15 daha fazla tek iş parçacıklı performans (IPC değil) sunacağını ve frekansların 5 GHz’in üzerinde olacağını söylüyor. Şimdiye kadar ilk kez yaşanan bir gelişmeden de bahsedelim. Ryzen 7000 serisi entegre RDNA 2 grafik yongalarıyla birlikte gelecek. Ayrıca daha önce beklediğimiz gibi, yalnızca DDR5 bellek desteği sunulacak ve maalesef DDR4 bellekleri kullanamayacağız. Ek olarak, CPU yongaları 5nm üretim teknolojisine dayanırken, G/Ç yongası 6nm süreciyle üretiliyor. Çekirdek başına L2 önbellek miktarı da iki katına (1 MB) çıkmış durumda. 5nm Zen 4 yongaları için en büyük haber, önceki nesil Zen 3 tabanlı Ryzen 5000 işlemcilere karşı kaydedilen minimum %15’lik tek çekirdek performansı. AMD bize bunun döngü başına talimat (IPC) ve frekans geliştirmelerinin bir karışımı sayesinde geldiğini söylüyor. Zen 2 ve Zen 3 işlemcilerde gördüğümüz gibi, 5.5 GHz’e varan yüksek frekans hızları yalnızca tek bir çekirdek için geçerli. Ayrıca bu çekirdekler ani iş yükleri sırasında belirli bir süre yüksek saat hızlarında kalabiliyor.

%15’lik performans kazancı yalnızca IPC iyileştirmelerine dayanmıyor. Ancak gelişmiş tek çekirdek performansı iş yükleri çekirdeklere dağıldıkça güçlendirildiği için CPU genelinde performansı artırdığı anlamına geliyor. Bu amaçla AMD, Ryzen 7000 yongalarını takacağımız AM5 soketinin maksimum güç dağıtımını 170W’a yükseltti. Önceki AM4 soketi maksimum 142W ile zirveye çıkıyordu ve 28W’lık bir artış söz konusu. AMD ayrıca Zen 4 için çekirdek başına L2 önbelleği ikiye katlayarak 1 MB’a çıkardı. Intel çiplerinde daha büyük L2 önbellek miktarlarının özellikle veri merkezi iş yüklerine fayda sağladığını görmüştük. Dolayısıyla Zen 4 mimarisi ile artan L2 miktarı, EPYC Genoa sunucu yongaları da dahil olmak üzere birçok AMD işlemcisi için olumlu katkılar sunacak.', CAST(N'2022-05-16T20:00:00.0000000' AS DateTime2), N'https://i.hizliresim.com/5evegdz.jpg')
INSERT [dbo].[Makaleler] ([MakaleID], [KategoriID], [YazarID], [MakaleBaslikAdi], [MakaleIcerik], [MakaleEklenmeTarihi], [MakaleGorsel]) VALUES (10, 4, 6, N'Apple iPad Pro M1', N'Apple, Cupertino''dan bildirmeye devam ediyor. Teknoloji devi bu kez de yeni nesil iPad Pro modelini duyurdu. 2021 iPad Pro; yeni Mini-LED ekranı, 5G bağlantı teknolojisi, ve M1 çip gibi özelliklerle dikkat çekiyor. Yeni iPad Pro, 11 inç ve 12.9 inç olmak üzere iki farklı ekran boyutuyla geliyor. Mini-LED panel teknolojisine ev sahipliği yapan bu ekran, 10.000''den fazla LED''den oluşuyor. Bu sayede Pro Display XDR kadar oldukça iyi bir ekran deneyimi sunabilen yeni iPad Pro, 1.000.000: 1 kontrast oranı ve 1600 nit maksimum parlaklık sağlayabiliyor. Yeni iPad Pro''nun en dikkat çekici özelliklerinden birisi de gücünü yeni M1 çipinden alması. iPad Pro, 8 çekirdekli CPU ve GPU''ya ev sahipliği yapan bu yonga sayesinde bir önceki jenarasyona kıyasla %50 daha yüksek performans ve %40 daha iyi grafikler sunabiliyor. Apple ayrıca yeni iPad Pro''nun ilk iPad''den tam 1500 kat daha hızlı olduğunu da belirtiyor.

Depolama kanadında da vites yükselten Apple, yeni iPad Pro ile birlikte artık 2 TB depolama seçeneği de sunmaya başladı. Yeni depolama opsiyonuyla birlikte depolama hızında 2 kata kadar artış vadediliyor. Ayrıca 16 GB RAM seçeneği de artık iPad dünyasındaki yerini almış durumda. 021 iPad Pro, indirme hızı 4 Gbps''ye kadar ulaşabilen 5G MmWave teknolojisini destekliyor. Yeni iPad Pro''nun bağlantı noktasında dikkat çeken diğer bir özelliği ise tıpkı en yeni Mac modellerinde olduğu gibi USB-4 özellikli bir Thunderbolt porta ev sahipliği yapması. iPad Pro bu sayede 6K çözünürlükte görüntü aktarabilecek.', CAST(N'2022-05-17T20:00:00.0000000' AS DateTime2), N'https://i.hizliresim.com/35gll1n.jfif')
INSERT [dbo].[Makaleler] ([MakaleID], [KategoriID], [YazarID], [MakaleBaslikAdi], [MakaleIcerik], [MakaleEklenmeTarihi], [MakaleGorsel]) VALUES (11, 2, 6, N'Intel 12. Nesil Alder Lake İşlemci Serisi', N'Aylar süren sızıntıların ardından Intel, nihayet 12. nesil Alder Lake masaüstü işlemcilerini duyurdu. Kısa zaman içinde yeni nesil yongalarla birlikte Z690 anakart modelleri ve DDR5 bellekler de satışa çıkmaya başlayacak. Mavi ekip P-Core ve E-Core çekirdekli yeni hibrit tasarım da dahil olmak üzere Alder Lake mimarisi hakkında zaten daha önce bazı ayrıntılar vermişti. Ancak şimdi 4 Kasım’dan itibaren piyasaya sürülecek olan CPU’lar hakkında tüm detaylara sahibiz. Intel, üçü K serisi ve üçü KF serisinde olmak üzere altı 12. nesil Core modelini piyasaya sürecek. Temel olarak Core i9, Core i7 ve Core i5 tasarımları kullanıcılara sunulurken Core i3 serisiyle ile ilgili henüz bir gelişme bulunmuyor. Core i9-12900K, 8 performans ve 8 verimlilik çekirdeğiyle birlikte toplam 16 çekirdek taşıyor. Peki bu yongada neden 32 değil de 24 iş parçacığı mevcut? Verimlilik çekirdeklerinde hiper iş parçacığı bulunmuyor ve ek iş parçacıkları sadece P-core’lardan geliyor. Ek olarak amiral gemisi çipin 30 MB L3 önbellek taşıdığını belirtelim. Core i7-12700K ise 25 MB L3 önbelleğe sahip toplam 12 çekirdek ve 20 iş parçacığı taşıyor. 12 çekirdeğin sekizi performans ve dördü performans çekirdeklerinden oluşuyor. Frekans hızı 5.0 GHz ile Core i9 modelinden biraz daha düşük, ancak taban frekansı 3.6 GHz düzeyinde. Verimlilik çekirdekleri ise 2.7 GHz ve 3.8 GHz arasında çalışacak. Toplam 10 çekirdek ve 16 iş parçacığı barındıran Core i5-12600K ise 20 MB L3 önbelleğe sahip. 10 çekirdeğin altısı performans ve dördü verimlilik çekirdeklerinden meydana geliyor. Performans çekirdekleri 3.7 ve 4.9 GHz arasında çalışırken verimlilik çekirdekleri 2.8 ve 3.6 GHz arasında seyrediyor.', CAST(N'2022-05-18T20:00:00.0000000' AS DateTime2), N'https://i.hizliresim.com/gyx91aw.jpg')
INSERT [dbo].[Makaleler] ([MakaleID], [KategoriID], [YazarID], [MakaleBaslikAdi], [MakaleIcerik], [MakaleEklenmeTarihi], [MakaleGorsel]) VALUES (12, 5, 6, N'Samsung MICRO LED, Neo QLED ve Lifestyle Ekranları Tanıtıldı', N'Samsung''un 2022 model ekranları; görüntü ve ses kalitesindeki iyileştirmeler, daha geniş ekran boyutu seçenekleri, kişiselleştirilmiş aksesuarlar ve yükseltilmiş arayüz sayesinde markanın ''Ekranlar her yerde, ekranlar herkes için'' vizyonunu en gerçekçi görüntüler, sürükleyici ses ve hiper-kişiselleştirilmiş özelliklerle hayata geçiriyor. MICRO LED: Ekran teknolojisinin zirve noktası

Samsung CES 2022’de tanıttığı, 110, 101 ve 89 inç olmak üzere üç farklı ekran boyutu seçeneğine sahip MICRO LED ekranı, ışığı ve rengi kendi başına üretebiliyor. Samsung’un ileri teknoloji MICRO LED ürünü,bu sayede etkileyici bir derinlik, canlı renkler, daha yüksek netlik ve kontrastla sıra dışı bir deneyim sunan 25 milyon mikrometrelik LED’ler ile sınıfının en iyi görüntü kalitesini sunuyor.

2022 model MICRO LED donanımdaki inovasyonların yanı sıra 20-bit gri skala derinliğini destekliyor. Bu da MICRO LED modellerinin bir sahnedeki tüm detayları yansıtabilmesine ve 1 milyon parlaklık ve renk seviyesinde en incelikli denetimi sağlayabilmesine imkan sunuyor. Böylece kullanıcılara gerçek anlamda bir HDR deneyimi yaşatılıyor. Aynı zamanda DCI ve Adobe RGB renk gamının yüzde 100’ünü karşılayan ekran çarpıcı ve gerçeğe en yakın renkleri sunabiliyor. %99,99 ekran-gövde oranıyla kusursuz sürükleyicilik sunan bir tasarıma sahip olan MICRO LED, devrim niteliğinde bir performans ortaya koyuyor. Neo Quantum İşlemci ve Dinamik Ses Deneyimi ile Neo QLED''in evrimi
Samsung’un 2022 model Neo QLED’i, Neo Quantum İşlemci ve görüntü teknolojisindeki gelişmeler ve ses özellikleri sayesinde mümkün olan en net görüntüleri ve en etkileyici sesi sağlıyor. Yeni Neo Quantum İşlemci, Quantum Mini LED’lerin yaydığı ışığın daha iyi denetlenmesini sağlayan ve parlaklık seviyesini 12''den 14 bit''e yükselten BLU (arka ışık ünitesi) sayesinde gelişmiş karşıtlık haritalandırma özelliğine sahip. Bu da TV’nin kendi aydınlatmasını bir önceki modeldeki 4.096 adımın dört katı olarak 16.384 adımda denetleyebilmesini sağlıyor. Tasarım ve teknolojinin kusursuz bileşimine sahip ödüllü Lifestyle Ekranlar

Samsung''un 2022 Lifestyle ekranları, benzersiz ve kişiselleştirilmiş bir deneyim sunmak amacıyla tasarım ile teknolojinin kusursuz bileşimini ortaya koyuyor. The Frame, The Sero ve The Serif''e uygulanan parlama, yansıma ve parmak izi önleyici özelliklere sahip yeni ‘Mat Ekran’ kaplaması sayesinde kullanıcılar, en keyifli ve konforlu izleme deneyimini elde ediyor. Samsung''un 2022 Lifestyle Ekranlarının yeni Mat Ekran özelliği, ayrıca UL''den (Underwriter Laboratories) "Yansıma Karşıtı Parlama Önleyicilik", "Rahatsızlık Karşıtı Parlama Önleyicilik" ve "Engellilik Hassasiyetli Parlama Önleyicilik" olmak üzere üç farklı doğrulama aldı. ', CAST(N'2022-05-19T20:00:00.0000000' AS DateTime2), N'https://i.hizliresim.com/2xw5otd.jpg')
INSERT [dbo].[Makaleler] ([MakaleID], [KategoriID], [YazarID], [MakaleBaslikAdi], [MakaleIcerik], [MakaleEklenmeTarihi], [MakaleGorsel]) VALUES (13, 3, 7, N'Samsung Galaxy S22 ve S22+', N'Güney Koreli teknoloji devi Samsung, Galaxy Unpacked 2022 etkinliği kapsamında amiral gemisi akıllı telefon serisi Galaxy S22 ailesini duyurdu. Üç farklı modelden oluşan serinin ana ve ortanca modelleri Galaxy S22 ile Galaxy S22 Plus tüm detaylarıyla karşınızda. Galaxy S21 ailesine kıyasla çok büyük farklılıklar içermeyen telefonlar, seleflerine kıyasla biraz daha küt hatlara sahip. Beyaz, pembe, siyah ve yeşil renk opsiyonlarına sahip telefonların cam arka yüzeyinde, metal çerçeveyle bütünleştirilen kamera ünitesi bizleri karşılıyor. Ön tarafta ise nokta delikli ekran korunmaya devam ediyor. Her iki telefon da Full HD+ çözünürlüklü Dynamic AMOLED ekrana ev sahipliği yapıyor. Ancak Galaxy S21''in ekranı 6.1 inç büyüklüğündeyken, Galaxy S21 Plus ise 6.6 inç büyüklüğünde ekran üzerine kuruluyor. Her iki telefonun ekranı da 10Hz ile 120Hz arasında değişen dinamik ekran tazeleme hızına sahip. Ekranların ultrasonic parmak izi tarayıcısına ev sahipliği yaptığını da belirtelim. İki telefon da 4 nanometre EUV düğümü kullanılarak üretilen Exynos 2200 yonga setinden güç alıyor. Sekiz çekirdekli CPU kümelemesine sahip olan Exynos 2200''de dört adet Cortex-A510, üç adet Cortex-A710 ve bir adet de Cortex-X2 çekirdeği bulunuyor. Grafik kanadında AMD RDNA 2 mimarisine dayalı Samsung Xclipse grafik işlemcisi barındıran Exynos 2200; donanım hızlandırmalı ışın izleme, değişken oranlı gölgeleme ve gelişmiş çoklu IP düzenleyici gibi özellikleri çok daha stabil ve performanslı bir şekilde sunuyor.

 Galaxy S22 ve Galaxy S22+ da IP68 koruması sayesinde 1.5 metre derinlikteki suya, 30 dakikaya kadar dayanabiliyor. One UI 4.1 kullanıcı arabirimi giydirilmiş Android 12 işletim sisyemiyle kutudan çıkan telefonlarda 5G, Wi-Fi 6E (Galaxy S22 Plus) / Wi-Fi 6 (Galaxy S22), NFC, Bluetooth 5.2, USB Type-C bağlantıları ve AKG imzalı stereo hoparlörler bulunuyor.', CAST(N'2022-05-20T20:00:00.0000000' AS DateTime2), N'https://i.hizliresim.com/qfpv1jx.jpg')
SET IDENTITY_INSERT [dbo].[Makaleler] OFF
GO
SET IDENTITY_INSERT [dbo].[Uyeler] ON 

INSERT [dbo].[Uyeler] ([UyeID], [UyeAdi], [UyeSoyAdi], [UyeMailAdresi], [UyeSifre], [UyeNickName], [Role]) VALUES (1, N'Serkan', N'Doğan', N'serkan@gmail.com', N'123', N'serkandogan', N'Admin')
INSERT [dbo].[Uyeler] ([UyeID], [UyeAdi], [UyeSoyAdi], [UyeMailAdresi], [UyeSifre], [UyeNickName], [Role]) VALUES (3, N'ASP', N'Net', N'aspnet@gmail.com', N'124', N'aspnetmvc', N'Yazar')
INSERT [dbo].[Uyeler] ([UyeID], [UyeAdi], [UyeSoyAdi], [UyeMailAdresi], [UyeSifre], [UyeNickName], [Role]) VALUES (5, N'MVC', N'Üye', N'mvc@gmail.com', N'125', N'mvcuye', N'Uye')
SET IDENTITY_INSERT [dbo].[Uyeler] OFF
GO
SET IDENTITY_INSERT [dbo].[Yazarlar] ON 

INSERT [dbo].[Yazarlar] ([YazarID], [YazarAdi], [YazarSoyAdi], [YazarMailAdresi]) VALUES (6, N'Serkan                        ', N'Doğan                         ', N'serkan@gmail.com')
INSERT [dbo].[Yazarlar] ([YazarID], [YazarAdi], [YazarSoyAdi], [YazarMailAdresi]) VALUES (7, N'ASP                           ', N'Net                           ', N'aspnet@gmail.com')
SET IDENTITY_INSERT [dbo].[Yazarlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Yorumlar] ON 

INSERT [dbo].[Yorumlar] ([YorumID], [MakaleID], [YorumYazanAdiSoyadi], [YorumAciklama], [YorumEklenmeTarihi]) VALUES (21, 2, N'Ramiz Karaeski', N'RTX 3000 serisi ile muhtemelen AMD''yi daha da geçecektir.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Yorumlar] ([YorumID], [MakaleID], [YorumYazanAdiSoyadi], [YorumAciklama], [YorumEklenmeTarihi]) VALUES (22, 2, N'Eyşan Atay', N'Umarım AMD''den buna karşı bir hamle gelir. Yoksa iş iyice tekelleşecek.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Yorumlar] ([YorumID], [MakaleID], [YorumYazanAdiSoyadi], [YorumAciklama], [YorumEklenmeTarihi]) VALUES (23, 3, N'Ali Kırgız', N'Umarım RTX 3000 serisine iyi bir rakip olur. Tekellik olmasın piyasada.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Yorumlar] OFF
GO
ALTER TABLE [dbo].[Makaleler] ADD  CONSTRAINT [DF_Makaleler_MakaleEklenmeTarihi]  DEFAULT (getdate()) FOR [MakaleEklenmeTarihi]
GO
ALTER TABLE [dbo].[Yorumlar] ADD  CONSTRAINT [DF_Yorumlar_YorumEklenmeTarihi]  DEFAULT (getdate()) FOR [YorumEklenmeTarihi]
GO
ALTER TABLE [dbo].[Makaleler]  WITH CHECK ADD  CONSTRAINT [FK_Makaleler_Kategoriler] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategoriler] ([KategoriID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Makaleler] CHECK CONSTRAINT [FK_Makaleler_Kategoriler]
GO
ALTER TABLE [dbo].[Makaleler]  WITH CHECK ADD  CONSTRAINT [FK_Makaleler_Yazarlar] FOREIGN KEY([YazarID])
REFERENCES [dbo].[Yazarlar] ([YazarID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Makaleler] CHECK CONSTRAINT [FK_Makaleler_Yazarlar]
GO
ALTER TABLE [dbo].[Yorumlar]  WITH CHECK ADD  CONSTRAINT [FK_Yorumlar_Makaleler] FOREIGN KEY([MakaleID])
REFERENCES [dbo].[Makaleler] ([MakaleID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Yorumlar] CHECK CONSTRAINT [FK_Yorumlar_Makaleler]
GO
USE [master]
GO
ALTER DATABASE [MVCBlog] SET  READ_WRITE 
GO

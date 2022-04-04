create database Sirket
use Sirket

Select *From Urunler order by UrunFiyati desc

Select *From Musteriler where Ad like '%k%'

Select *From Urunler where UrunFiyati between 1000 and 2000 order by UrunFiyati

Select Kategori.KategoriAdi,  count(*) as KacUrunVar
from Urunler
join Kategori
on Urunler.KategoriID=Kategori.KategoriID
group by Kategori.KategoriID,Kategori.KategoriAdi

Select Ulke.UlkeAdi,  count(*) as [Kac Musteri Var]
from Musteriler
join Ulke
on Musteriler.UlkeID=Ulke.UlkeID
group by Ulke.UlkeID,Ulke.UlkeAdi

Select Kategori.KategoriAdi,  sum(Urunler.UrunFiyati) as [Toplam Fiyat]
from Urunler
join Kategori
on Urunler.KategoriID=Kategori.KategoriID
group by Kategori.KategoriID,Kategori.KategoriAdi

Select top 1 *from Urunler order by UrunFiyati desc
select top 1*from Urunler order by	UrunFiyati

Select Musteriler.Ad, Urunler.UrunAdi, Urunler.UrunFiyati, Ulke.UlkeAdi,Kategori.KategoriAdi
From GelenSiparisler
join Musteriler on Musteriler.MusteriID=GelenSiparisler.MusteriID
join Urunler on Urunler.UrunID=GelenSiparisler.UrunID
join Kategori
on Urunler.KategoriID=Kategori.KategoriID
join Ulke
on Musteriler.UlkeID=Ulke.UlkeID



Select Musteriler.Ad, Urunler.UrunAdi, GelenSiparisler.SiparisAdedi
From GelenSiparisler
join Musteriler on Musteriler.MusteriID=GelenSiparisler.MusteriID
join Urunler on Urunler.UrunID=GelenSiparisler.UrunID

Select Musteriler.Ad, Urunler.UrunAdi, GelenSiparisler.SiparisAdedi, Teslimat.TeslimatTarihi, Teslimat.TeslimatNotu
From GelenSiparisler
join Musteriler on Musteriler.MusteriID=GelenSiparisler.MusteriID
join Urunler on Urunler.UrunID=GelenSiparisler.UrunID
join Teslimat on Teslimat.TeslimatID= GelenSiparisler.TeslimatID

Select Urunler.UrunID,Urunler.UrunAdi, GelenSiparisler.SiparisAdedi
From GelenSiparisler
join Urunler on Urunler.UrunID=GelenSiparisler.UrunID

Select Anket.AnketID,Anket.AnketSoru, Musteriler.AnketCevapId as [Cevap Miktari], Anket_Cevap.Anketcevabi 
From Anket_Cevap
join Musteriler on Musteriler.MusteriID=Anket_Cevap.MusteriID
join Anket on Anket.AnketID=Anket_Cevap.AnketID

Select UrunAdi,UrunFiyati,KategoriID,
case
	when KategoriID=1 then UrunFiyati+10
	when KategoriID= 2 then UrunFiyati+15
	when KategoriID= 3 then UrunFiyati+5
	else UrunFiyati+7
end as YeniUrunFiyatlari
from Urunler order by KategoriID

Select UrunID,UrunAdi,UrunKodu,UrunMiktari,UrunFiyati,
case
	when KategoriID=1 then 'Bilgisayar'
	when KategoriID= 2 then 'Telefon'
	when KategoriID= 3 then 'Aksesuar'
	else 'Mobilya'
end as YeniUrunKategorileri
from Urunler

select StokTakibiID,StokUrunMiktar,StokUrunAdi,UrunKod,
case
	when StokTakibi.Turu=1 then 'Alis'
	else 'Satis'
end Turu
from StokTakibi

select StokTakibi.StokUrunAdi,Urunler.UrunFiyati,Kategori.KategoriAdi,
sum(case
	when StokTakibi.Turu= 1 then StokUrunMiktar
	Else StokUrunMiktar*1
End) StokBakiyesi
From StokTakibi
join Urunler on Urunler.UrunID=StokTakibi.UrunID
join Kategori on Kategori.KategoriID=StokTakibi.KategoriID
group by StokTakibi.StokUrunAdi,Urunler.UrunFiyati,Kategori.KategoriAdi
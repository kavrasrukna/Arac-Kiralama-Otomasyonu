using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace arackiralama
{
    public partial class raporlar : Form
    {
        public raporlar()
        {
            InitializeComponent();
        }
        arackiralamaContainer baglanti = new arackiralamaContainer();
        private void anasayfaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            anasayfa git = new anasayfa();
            git.Show();

        }
        private void çıkışToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        private void button4_Click(object sender, EventArgs e)
        {
            if (radioButton1.Checked == true)
            {
                //Ödemeler tablosundan ödeme tutarını desc sıralama,linq kullandık
                var sondansirala = from tutar in baglanti.odemeler1 //var bütün tipleri karşılar
                                   orderby tutar.odemetutar descending
                                   select tutar;
                dataGridView1.DataSource = sondansirala.ToList();
            }
            if (radioButton2.Checked == true)
            {
                //Müşteriler tablosundan adresi İstanbul olanları getiren sorgu
                var adres = baglanti.musteriler1.Where(p => p.adres == "istanbul");
                dataGridView1.DataSource = adres.ToList();
            }
            if (radioButton3.Checked == true)
            {
                // Arabalar ve Ödemeler tablosunu joinleyip araçmarka, aracözellik, aracbakimgunu, odemetarih, odemetutarını getiren sorgu
                var islem = from araba in baglanti.arabalar1   //araba ve odeme adında takma isim kullandım
                            join odeme in baglanti.odemeler1
                            on araba.aracno equals odeme.aracno
                            select new
                            {
                                //istediğimiz kolonları getirteceğiz bunların içinde
                                araba.aracmarka,
                                araba.aracozellik,
                                araba.aracbakimgunu,
                                odeme.odemetarih,
                                odeme.odemetutar
                            };
                dataGridView1.DataSource = islem.ToList();
            }
            if (radioButton4.Checked == true)
            {
                //Bayiler tablosundan bayi adrese göre (bayi adı sancaktepe olan) bayi yetkililerini gruplandıran sorgu

                var sonuc = from detay in baglanti.bayiler1 //personel,satis,grup takma ad
                            where detay.bayiadres == "sancaktepe"
                            group detay by detay.bayiyetkilisi into grup
                            select new
                            {
                                adres = grup.Key
                            };
                dataGridView1.DataSource = sonuc.ToList();
            }
            if (radioButton5.Checked == true)
            {
                //Müşteriler ve Ödemeler tablosundan join ile musteriadsoyad,odemetutari,aracno getiren sorgu
                var islem = from musteri in baglanti.musteriler1 //musteri ve odeme takma ad
                            join odeme in baglanti.odemeler1
                            on musteri.musterino equals odeme.musterino
                            select new
                            {
                                musteri.adsoyad,
                                odeme.odemetutar,
                                odeme.aracno
                            };
                dataGridView1.DataSource = islem.ToList();
            }
            if (radioButton6.Checked == true)
            {
                //Arabalar tablosundan aracmarkasına göre gunluktutarı gruplandıran sorgu

                var sonuc = from detay in baglanti.arabalar1 //personel,satis,grup takma ad
                            group detay by detay.gunluktutar into grup
                            select new
                            {
                                ucret = grup.Key
                            };
                dataGridView1.DataSource = sonuc.ToList();
            }
            if (radioButton7.Checked == true)
            {
                //order by ile asc sıraladıktan sonra ilk 3 kayıtı take ile aldık
                List<musteriler> kayit1 = baglanti.musteriler1.OrderBy(p => p.adsoyad).Take(3).ToList();
                dataGridView1.DataSource = kayit1;
            }
            if (radioButton8.Checked == true)
            {
                //Adı a ile başlayan bayileri getiren sorgu
                var bayi = baglanti.bayiler1.Where(p => p.bayiadi.StartsWith("a")).ToList();
                dataGridView1.DataSource = bayi;
            }
            if (radioButton9.Checked == true)
            {
                //Marka Adı t ile biten arabaları getiren sorgu
                var a = baglanti.arabalar1.Where(p => p.aracmarka.EndsWith("t")).ToList();
                dataGridView1.DataSource = a;
            }
            if (radioButton10.Checked == true)
            {
                //Ödemeler tablosunda herhangi bir değerin olup olmadığı bilgisini getiren sorgu
                bool deger = baglanti.odemeler1.Any();
                MessageBox.Show(deger.ToString(), "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            if (radioButton11.Checked == true)
            {
                //Toplam müşteri sayısını getiren sorgu
                int toplam = baglanti.musteriler1.Count();
                MessageBox.Show(toplam.ToString(), "Toplam Müşteri Sayısı", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            if (radioButton12.Checked == true)
            {
                //sorr // Araçlar ve odemeler tablosunu birleştirip vade farkı 3000 altında olan araçları getiren sorgu---sor yanlış sonuç veriyor
                var islem = from arac in baglanti.arabalar1 //musteri ve odeme takma ad
                            join odeme in baglanti.odemeler1
                            on arac.aracno equals odeme.aracno
                            select new
                            {
                                arac.aracmarka,
                                odeme.odemetutar,
                            };
                var deger = baglanti.odemeler1.Where(x => x.vadefarki < 3000);
                dataGridView1.DataSource = deger.ToList();
            }
            if (radioButton13.Checked == true)
            {
                //Hgs ücreti en yüksek olan aracı getiren
                var enyuksek = baglanti.arabalar1.Max(p => p.hgs);
                MessageBox.Show("En yüksek hgs ücretine sahip araç: " + enyuksek);
            }
            if (radioButton14.Checked == true)
            {
                //Ödemeler tablosunda odemetutarı toplamını getiren sorgu
                var toplam = baglanti.odemeler1.Sum(p => p.odemetutar);
                // dataGridView1.DataSource = toplam.ToString();
                MessageBox.Show("Ödemetutarları toplamı: " + toplam);
            }
        }
    }
}
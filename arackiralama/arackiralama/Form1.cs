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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        arackiralamaContainer baglanti = new arackiralamaContainer();
        private void btngiris_Click(object sender, EventArgs e)
        {
            if (Girisyap(txtgkullaniciadi.Text, txtgsifre.Text))
            {
                MessageBox.Show("kullanıcı adı ve şifre doğru,anasayfaya yönlendiriliyorsunuz...");
                this.Hide();
                anasayfa git = new anasayfa();
                git.ShowDialog();
            }
            else
            {
                MessageBox.Show("kullanıcı adı ve şifre hatalı");
                txtgkullaniciadi.Clear();
                txtgsifre.Clear();
            }
        }
        public bool Girisyap(string ad, string sifre)
        {
            var sorgu = from p in baglanti.kullanicilar1 where p.kullaniciadi == ad && p.sifre == sifre select p;

            if (sorgu.Any())//var mı diye bakar varsa true yoksa false döndürür
            {
                return true;

            }
            else
            {
                return false;
            }
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            kayitol.Visible = false;
        }

        private void checkBoxkayit_CheckedChanged(object sender, EventArgs e)
        {
            kayitol.Visible = true;
        }
        private void btnkayit_Click(object sender, EventArgs e)
        {
            if (kayitkullaniciadi.Text == "" || kayitsifre.Text == "" || txtmail.Text == "" || maskedTextBox1.Text == "")
            {
                MessageBox.Show("Boş alan bırakmayınız");
            }
            else
            {
                MessageBox.Show("Üyeliğiniz oluşturuldu.Giriş yapınız.");

                // veri ekleme komutu
                kullanicilar ekle = new kullanicilar();
                ekle.kullaniciadi = kayitkullaniciadi.Text;
                ekle.sifre = kayitsifre.Text;
                ekle.mail = txtmail.Text;
                ekle.telefon = maskedTextBox1.Text;
                baglanti.kullanicilar1.Add(ekle);
                baglanti.SaveChanges();
                kayitkullaniciadi.Clear();
                kayitsifre.Clear();
                txtmail.Clear();
                maskedTextBox1.Clear();
            }
        }
    }
}

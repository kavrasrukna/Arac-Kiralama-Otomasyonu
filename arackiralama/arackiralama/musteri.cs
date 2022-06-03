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
    public partial class musteri : Form
    {
        public musteri()
        {
            InitializeComponent();
        }
        arackiralamaContainer baglanti = new arackiralamaContainer();
        private void anasayfaToolStripMenuItem_Click(object sender, EventArgs e)
        {  this.Hide();
            anasayfa git = new anasayfa();
            git.ShowDialog();         
        }
        private void çıkışToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            txtmusteriadsoyad.Tag = satir.Cells["musterino"].Value.ToString();
            txtmusteriadsoyad.Text = satir.Cells["adsoyad"].Value.ToString();
            maskedTextBox1.Text = satir.Cells["telefon"].Value.ToString();
            txtmusteritc.Text = satir.Cells["tckimlikno"].Value.ToString();
            comboBox1.Text = satir.Cells["ehliyetdurumu"].Value.ToString();
            txtmusteriadres.Text = satir.Cells["adres"].Value.ToString();
        }
        public void listele()//listele metodu
        {
            dataGridView1.DataSource = baglanti.musteriler1.ToList();
        }
        private void btnlistele_Click(object sender, EventArgs e)
        {
            listele();
        }
        private void btnara_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = baglanti.musteriler1.Where(x => x.adsoyad.ToLower().Contains(txtmusteriadsoyad.Text) || x.adsoyad.ToUpper().Contains(txtmusteriadsoyad.Text)).ToList();

        }
        private void btnekle_Click(object sender, EventArgs e)
        {
            musteriler ekle = new musteriler();
            ekle.adsoyad = txtmusteriadsoyad.Text;
            ekle.telefon = txtmusteritc.Text;
            ekle.tckimlikno = txtmusteritc.Text;
            ekle.ehliyetdurumu = comboBox1.Text;
            ekle.adres = txtmusteriadres.Text;
            baglanti.musteriler1.Add(ekle);
            baglanti.SaveChanges();
            listele();
        }
        private void btnguncelle_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtmusteriadsoyad.Tag);
            var yenile = baglanti.musteriler1.Where(c => c.musterino == id).FirstOrDefault();
            yenile.adsoyad = txtmusteriadsoyad.Text;
            yenile.telefon = txtmusteritc.Text;
            yenile.tckimlikno = txtmusteritc.Text;
            yenile.ehliyetdurumu = comboBox1.Text;
            yenile.adres = txtmusteriadres.Text;
            baglanti.SaveChanges();
            listele();
        }
        private void btnsil_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtmusteriadsoyad.Tag);
            var sil = baglanti.musteriler1.Where(c => c.musterino == id).FirstOrDefault();
            baglanti.musteriler1.Remove(sil);
            baglanti.SaveChanges();
            listele();
        }

        private void btnraporlar_Click(object sender, EventArgs e)
        {
            raporlar git = new raporlar();
            git.Show();
            this.Hide();
        }
        private void azsirala_Click(object sender, EventArgs e)
        {//müşteri adsoyada göre a dan z ye sıralama
            List<musteriler> liste1 = baglanti.musteriler1.OrderBy(p => p.adsoyad).ToList();
            dataGridView1.DataSource = liste1;
        }
        private void zasirala_Click(object sender, EventArgs e)
        {//müşteri adsoyada göre z den a ya sıralama
            List<musteriler> liste2 = baglanti.musteriler1.OrderByDescending(p => p.adsoyad).ToList();
            dataGridView1.DataSource = liste2;
        }
    }
}

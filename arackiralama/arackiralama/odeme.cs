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
    public partial class odeme : Form
    {
        public odeme()
        {
            InitializeComponent();
        }
        arackiralamaContainer baglanti = new arackiralamaContainer();
        private void anasayfaToolStripMenuItem_Click(object sender, EventArgs e)
        {   
            this.Hide();
            anasayfa git = new anasayfa();
            git.ShowDialog();           
        }
        private void çıkışToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        private void btnraporlar_Click(object sender, EventArgs e)
        {
            raporlar git = new raporlar();
            git.Show();
            this.Hide();
        }
        public void listele()//listele metodu
        {
            dataGridView1.DataSource = baglanti.odemeler1.ToList();
        }
        private void btnlistele_Click(object sender, EventArgs e)
        {
            listele();
        }
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            txtodemetutar.Tag = satir.Cells["odemeno"].Value.ToString();
            txtodemetutar.Text = satir.Cells["odemetutar"].Value.ToString();
            dateTimePicker1.Text = satir.Cells["odemetarih"].Value.ToString();
            txtvadefarki.Text = satir.Cells["vadefarki"].Value.ToString();
            txtmusterino.Text = satir.Cells["musterino"].Value.ToString();
            txtaracno.Text = satir.Cells["aracno"].Value.ToString();
        }
        private void btnekle_Click(object sender, EventArgs e)
        {
            odemeler ekle = new odemeler();
            ekle.odemetutar = Convert.ToDecimal(txtodemetutar.Text);
            ekle.odemetarih = dateTimePicker1.Text;
            ekle.vadefarki = Convert.ToDecimal(txtvadefarki.Text);
            ekle.musterino = Convert.ToInt32(txtmusterino.Text);
            ekle.aracno = Convert.ToInt32(txtaracno.Text);
            baglanti.odemeler1.Add(ekle);
            baglanti.SaveChanges();
            listele();
        }
        private void btnguncelle_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtodemetutar.Tag);
            var yenile = baglanti.odemeler1.Where(c => c.odemeno == id).FirstOrDefault();
            yenile.odemetutar = Convert.ToDecimal(txtodemetutar.Text);
            yenile.odemetarih = dateTimePicker1.Text;
            yenile.vadefarki= Convert.ToDecimal(txtvadefarki.Text);
            yenile.musterino = Convert.ToInt32(txtmusterino.Text);
            yenile.aracno = Convert.ToInt32(txtaracno.Text);
            baglanti.SaveChanges();
            listele();
        }
        private void btnsil_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtodemetutar.Tag);
            var sil = baglanti.odemeler1.Where(c => c.odemeno == id).FirstOrDefault();
            baglanti.odemeler1.Remove(sil);
            baglanti.SaveChanges();
            listele();
        }
        private void btnara_Click(object sender, EventArgs e)        
        {//int tipinde arama işlemi
            int a = Convert.ToInt32(txtaracno.Text);
            dataGridView1.DataSource = baglanti.odemeler1.Where(x => x.aracno == a).ToList();   
        }
        private void azsirala_Click(object sender, EventArgs e)
        {
            //tutara göre a dan z ye sıralama
            List<odemeler> liste1 = baglanti.odemeler1.OrderBy(p => p.odemetutar).ToList();
            dataGridView1.DataSource = liste1;
        }
        private void zasirala_Click(object sender, EventArgs e)
        {
            //tutara göre z den a ya sıralama
            List<odemeler> liste2 = baglanti.odemeler1.OrderByDescending(p => p.odemetutar).ToList();
            dataGridView1.DataSource = liste2;
        }
    }
}



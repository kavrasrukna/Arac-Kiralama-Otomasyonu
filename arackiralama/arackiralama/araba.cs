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
    public partial class araba : Form
    {
        public araba()
        {
            InitializeComponent();
        }
        arackiralamaContainer baglanti=new arackiralamaContainer(); 
        private void anasayfaToolStripMenuItem_Click(object sender, EventArgs e)
        {   this.Hide();
            anasayfa git = new anasayfa();
            git.ShowDialog();            
        }
        private void çıkışToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        public void listele()//listele metodu
            {
                dataGridView1.DataSource = baglanti.arabalar1.ToList();
            }
        private void btnlistele_Click(object sender, EventArgs e)
        {
            listele();
        }
        private void btnekle_Click(object sender, EventArgs e)
        {
            arabalar ekle = new arabalar();
            ekle.aracmarka = txtaracmarka.Text;
            ekle.aracmodel = txtaracmodel.Text;
            ekle.aracozellik = txtaracozellik.Text;
            ekle.aracbakimgunu =comboBox1.Text;
            ekle.arackm =txtarackm.Text;
            ekle.hgs = Convert.ToDecimal(txtarachgs.Text);
            ekle.gunluktutar = Convert.ToDecimal(txtaracgunluktutar.Text);
            ekle.bayino = Convert.ToInt32(txtaracbayino.Text);
            baglanti.arabalar1.Add(ekle);
            baglanti.SaveChanges();
            listele();
        }
        private void btnguncelle_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtaracmarka.Tag);
            var yenile = baglanti.arabalar1.Where(c => c.aracno == id).FirstOrDefault();
            yenile.aracmarka = txtaracmarka.Text;
            yenile.aracmodel = txtaracmodel.Text;
            yenile.aracozellik = txtaracozellik.Text;
            yenile.aracbakimgunu = comboBox1.Text;
            yenile.arackm = txtarackm.Text;
            yenile.hgs = Convert.ToDecimal(txtarachgs.Text);
            yenile.gunluktutar = Convert.ToDecimal(txtaracgunluktutar.Text);
            yenile.bayino = Convert.ToInt32(txtaracbayino.Text);
            baglanti.SaveChanges();
            listele();
            //MessageBox.Show("Araçlarınız başarıyla güncellendi");
        }
        private void btnsil_Click(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(txtaracmarka.Tag);
            var sil = baglanti.arabalar1.Where(c => c.aracno == id).FirstOrDefault();
            baglanti.arabalar1.Remove(sil);
            baglanti.SaveChanges();
            listele();
        }
        private void btnara_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = baglanti.arabalar1.Where(x => x.aracmarka.ToLower().Contains(txtaracmarka.Text) || x.aracmarka.ToUpper().Contains(txtaracmarka.Text)).ToList();
        }
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            txtaracmarka.Tag = satir.Cells["aracno"].Value.ToString();
            txtaracmarka.Text = satir.Cells["aracmarka"].Value.ToString();
            txtaracmodel.Text = satir.Cells["aracmodel"].Value.ToString();
            txtaracozellik.Text = satir.Cells["aracozellik"].Value.ToString();
            comboBox1.Text = satir.Cells["aracbakimgunu"].Value.ToString();
            txtarackm.Text = satir.Cells["arackm"].Value.ToString();
            txtarachgs.Text = satir.Cells["hgs"].Value.ToString();
            txtaracgunluktutar.Text = satir.Cells["gunluktutar"].Value.ToString();
            txtaracbayino.Text = satir.Cells["bayino"].Value.ToString();
        }
        private void btnraporlar_Click(object sender, EventArgs e)
        {
            raporlar git = new raporlar();
            git.Show();
            this.Hide();
        }
        private void azsirala_Click(object sender, EventArgs e)
        {
            //markaya göre a dan z ye sıralama
            List<arabalar> liste1 = baglanti.arabalar1.OrderBy(p => p.aracmarka).ToList();
            dataGridView1.DataSource = liste1;
        }
        private void zasirala_Click(object sender, EventArgs e)
        {
            //markaya göre z den a ya sıralama
            List<arabalar> liste2 = baglanti.arabalar1.OrderByDescending(p => p.aracmarka).ToList();
            dataGridView1.DataSource = liste2;
        }
    }
}

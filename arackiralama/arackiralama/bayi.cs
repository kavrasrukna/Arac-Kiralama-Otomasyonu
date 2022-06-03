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
    public partial class bayi : Form
    {
        public bayi()
        {
            InitializeComponent();
        }
        arackiralamaContainer baglanti = new arackiralamaContainer();
        private void anasayfaToolStripMenuItem_Click(object sender, EventArgs e)
        {   this.Hide();
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
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            txtbayiadi.Tag = satir.Cells["bayino"].Value.ToString();
            txtbayiadi.Text = satir.Cells["bayiadi"].Value.ToString();
            txtbayiyetkili.Text = satir.Cells["bayiyetkilisi"].Value.ToString();
            txtbayiadres.Text = satir.Cells["bayiadres"].Value.ToString();
            maskedTextBox1.Text = satir.Cells["bayitelefon"].Value.ToString();
            txtbayiciro.Text = satir.Cells["bayiciro"].Value.ToString();
        }
        private void btnekle_Click(object sender, EventArgs e)
        {
            bayiler ekle = new bayiler();
            ekle.bayiadi = txtbayiadi.Text;
            ekle.bayiyetkilisi = txtbayiyetkili.Text;
            ekle.bayiadres = txtbayiadres.Text;
            ekle.bayitelefon = maskedTextBox1.Text;
            ekle.bayiciro = Convert.ToDecimal(txtbayiciro.Text);
            baglanti.bayiler1.Add(ekle);
            baglanti.SaveChanges();
            listele();
        }
        private void btnguncelle_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtbayiadi.Tag);
            var yenile = baglanti.bayiler1.Where(c => c.bayino == id).FirstOrDefault();
            yenile.bayiadi = txtbayiadi.Text;
            yenile.bayiyetkilisi = txtbayiyetkili.Text;
            yenile.bayiadres = txtbayiadres.Text;
            yenile.bayitelefon = maskedTextBox1.Text;
            yenile.bayiciro = Convert.ToDecimal(txtbayiciro.Text);
            baglanti.SaveChanges();
            listele();
        }
        private void btnsil_Click(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(txtbayiadi.Tag);
            var sil = baglanti.bayiler1.Where(c => c.bayino == id).FirstOrDefault();
            baglanti.bayiler1.Remove(sil);
            baglanti.SaveChanges();
            listele();
        }
        private void btnara_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = baglanti.bayiler1.Where(x => x.bayiadi.ToLower().Contains(txtbayiadi.Text) || x.bayiadi.ToUpper().Contains(txtbayiadi.Text)).ToList();

        }
        public void listele()//listele metodu
        {
            dataGridView1.DataSource = baglanti.bayiler1.ToList();
        }
        private void btnlistele_Click(object sender, EventArgs e)
        {
            listele();
        }
        private void azsirala_Click(object sender, EventArgs e)
        {
            List<bayiler> liste1 = baglanti.bayiler1.OrderBy(p => p.bayiadi).ToList();
            //listenin içine <> tablonun adını yazdık,listenin adı ise liste1. bayiler1 tablomdan
            //listeyi alır ve p diye bir parametre tanımladık lambda ile burada bayi adına göre a->z ye sıralar
            dataGridView1.DataSource = liste1; //liste1 i datagridde gösterir
        }
        private void zasirala_Click(object sender, EventArgs e)// z den a ya sıralama
        {
            List<bayiler> liste2 = baglanti.bayiler1.OrderByDescending(p => p.bayiadi).ToList();
            dataGridView1.DataSource = liste2;
        }
    }
}

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
    public partial class anasayfa : Form
    {
        public anasayfa()
        {
            InitializeComponent();
        }
        private void anasayfaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            anasayfa git = new anasayfa();
            git.Show();
            this.Hide();
        }
        private void çıkışToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        private void btnmagazalar_Click(object sender, EventArgs e)
        {
            musteri git = new musteri();
            git.Show();
            this.Hide();
        }
        private void btnbolumler_Click(object sender, EventArgs e)
        {
            bayi git = new bayi();
            git.Show();
            this.Hide();
        }
        private void btnraporlar_Click(object sender, EventArgs e)
        {
            raporlar git = new raporlar();
            git.Show();
            this.Hide();
        }
        private void btnmalzemeler_Click(object sender, EventArgs e)
        {
            araba git = new araba();
            git.Show();
            this.Hide();
        }
        private void btnsorumlular_Click(object sender, EventArgs e)
        {
            odeme git = new odeme();
            git.Show();
            this.Hide();
        }
    }
}

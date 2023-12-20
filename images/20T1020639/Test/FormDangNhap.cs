using Microsoft.Data.Sqlite;
using SQLitePCL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Test
{
    public partial class FormDangNhap : Form
    {
        public FormDangNhap()
        {
            InitializeComponent();
        }

        private void buttonDn_Click(object sender, EventArgs e)
        {
            string str = string.Format("Data Source=database.db;Version = 3;", Application.StartupPath);
            using (SqliteConnection con = new SqliteConnection(str))
            {
                SqliteCommand cmd = new SqliteCommand(string.Format(""), con);
                con.Open();
                SqliteDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    this.Hide();
                    FormSanPham main = new FormSanPham();
                    main.Show();
                }
                else
                {
                    MessageBox.Show("sai username hoặc mật khẩu","Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
                }
            }
        }
    }
}

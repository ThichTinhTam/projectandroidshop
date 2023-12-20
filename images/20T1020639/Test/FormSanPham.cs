using System.Text;
using System.Text.Json;
using Test.Model;

namespace Test
{
    public partial class FormSanPham : Form
    {
        string fileName = "20T1020639.json";

        // tạo một List dssp chứa các đối tượng SanPham
        List<SanPham> dssp = new List<SanPham>();
        public FormSanPham()
        {
            InitializeComponent();

            // kiểm tra file json tồn tại hay chưa
            if (File.Exists(fileName))
            {
                var json = File.ReadAllText(fileName, Encoding.UTF8);
                // chuyển nội dung JSON thành ds cách đối tượng SanPham
                var sanPham = SanPham.FromJson(json);
                // gán danh sách SanPham đc đọc từ JSON vào dssp
                dssp = sanPham;
            }
            LoadData();
        }

        private void RefreshDataGridView()
        {
            // Liên kết DataGridView với danh sách sản phẩm
            /*grdSanPham.DataSource = null;
            grdSanPham.DataSource = dssp;*/
            sanPhamBindingSource.DataSource = null;
            sanPhamBindingSource.DataSource = dssp;
        }

        private void LoadData()
        {
            if (File.Exists(fileName))
            {
                var json = File.ReadAllText(fileName, Encoding.UTF8);
                var sanPham = SanPham.FromJson(json);
                // cập nhật danh sách sp vào bảng datagridview
                sanPhamBindingSource.DataSource = sanPham;

            }
        }
        private int CheckNull()
        {
            if (string.IsNullOrEmpty(txtMaSanPham.Text) || string.IsNullOrEmpty(txtTenSanPham.Text) || string.IsNullOrEmpty(txtGiaNhap.Text) || string.IsNullOrEmpty(txtGiaBan.Text) || string.IsNullOrEmpty(txtSoLuongNhap.Text))
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return 1;
            }
            return 0;
        }

        private void ClearForm()
        {
            txtMaSanPham.Text = "";
            txtTenSanPham.Text = "";
            txtGiaNhap.Text = "";
            txtGiaBan.Text = "";
            txtSoLuongNhap.Text = "";
            picSanPham.ImageLocation = null;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (CheckNull() == 1) return;
            var sanPham = new SanPham
            {
                MaSanPham = txtMaSanPham.Text,
                TenSanPham = txtTenSanPham.Text,
                NgaySanXuat = dtpNgaySanXuat.Value,
                NgayHetHan = dtpNgayDenHan.Value,
                GiaNhap = long.Parse(txtGiaNhap.Text),
                GiaBan = long.Parse(txtGiaBan.Text),
                SoLuongNhap = long.Parse(txtSoLuongNhap.Text),
                HinhDaiDien = picSanPham.ImageLocation
            };
            // Kiểm tra mã sản phẩm đã tồn tại hay bằng rỗng 
            var msp = txtMaSanPham.Text;

            /*if (string.IsNullOrEmpty(msp))
            {
                MessageBox.Show("Mã sản phẩm không được để trống", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }*/
            if (dssp.Any(sp => sp.MaSanPham == msp))
            {
                MessageBox.Show("Mã sản phẩm đã tồn tại trong danh sách", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Thêm sản phẩm vào danh sách
            dssp.Add(sanPham);
            // Cập nhật DataGridView
            RefreshDataGridView();

            // chuyển đổi dssp thành JSON
            var json = JsonSerializer.Serialize(dssp);
            //var json = SanPham.ListToString(dssp);

            File.WriteAllText("testsanpham.json", json);
            MessageBox.Show("Đã lưu dữ liệu sản phẩm thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            ClearForm();
        }

        private void picSanPham_Click(object sender, EventArgs e)
        {
            var openDialog = new OpenFileDialog()
            {
                Title = "Chọn hình đại diện",
                Filter = "File ảnh | *.png;*.jpg;*.jpeg",
            };
            if (openDialog.ShowDialog() == DialogResult.OK)
            {
                var fileDaiDien = openDialog.FileName;
                picSanPham.Load(fileDaiDien);
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            var selSanPham = sanPhamBindingSource.Current as SanPham;
            if (selSanPham != null)
            {
                var rs = MessageBox.Show("Bạn có thực sự muốn xóa không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                if (rs == DialogResult.OK)
                {
                    var obj = dssp.Where(t => t.MaSanPham == selSanPham.MaSanPham).FirstOrDefault();
                    if (obj != null)
                    {
                        dssp.Remove(obj);
                        RefreshDataGridView();
                        var json = JsonSerializer.Serialize(dssp);
                        File.WriteAllText("testsanpham.json", json);
                        MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }

                }
            }
        }

        private void grdSanPham_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = new DataGridViewRow();
            if (e.RowIndex == -1)
                return;
            row = grdSanPham.Rows[e.RowIndex];
            SanPham sp = (SanPham)row.DataBoundItem;
            txtMaSanPham.Text = sp.MaSanPham;
            txtTenSanPham.Text = sp.TenSanPham;
            dtpNgaySanXuat.Value = sp.NgaySanXuat;
            dtpNgayDenHan.Value = sp.NgayHetHan;
            txtGiaNhap.Text = sp.GiaNhap.ToString();
            txtGiaBan.Text = sp.GiaBan.ToString();
            txtSoLuongNhap.Text = sp.SoLuongNhap.ToString();
            if (!string.IsNullOrEmpty(sp.HinhDaiDien))
                picSanPham.ImageLocation = sp.HinhDaiDien;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            // lấy mã sản phẩm ở textbox
            var msp = txtMaSanPham.Text;
            // kiểm tra mã sản phẩm có rỗng 
            //            DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn cập nhật sản phẩm này?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            /* if (string.IsNullOrEmpty(msp))
             {
                 MessageBox.Show("Vui lòng nhập mã sản phẩm.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                 return;
             }*/
            if (CheckNull() == 1) return;
            // tạo biến newSanPham để lưu trữ sp cập nhật
            SanPham newSanPham = dssp.Where(t => t.MaSanPham == msp).FirstOrDefault();

            if (newSanPham == null)
            {
                MessageBox.Show("Sản phẩm không tồn tại.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Cập nhật thông tin sản phẩm
            newSanPham.TenSanPham = txtTenSanPham.Text;
            newSanPham.NgaySanXuat = dtpNgaySanXuat.Value;
            newSanPham.NgayHetHan = dtpNgayDenHan.Value;
            newSanPham.GiaNhap = long.Parse(txtGiaNhap.Text);
            newSanPham.GiaBan = long.Parse(txtGiaBan.Text);
            newSanPham.SoLuongNhap = long.Parse(txtSoLuongNhap.Text);
            newSanPham.HinhDaiDien = picSanPham.ImageLocation;

            // chuyển dssp thành json
            //var json = SanPham.ListToString(dssp);
            var json = JsonSerializer.Serialize(dssp);

            RefreshDataGridView();
            File.WriteAllText("20T1020639.json", json);
            MessageBox.Show("Đã cập nhật sản phẩm thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnsearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text.Length == 0)
            {
                RefreshDataGridView();
                return;
            };
            var searchResult = dssp.Where(item => item.MaSanPham.Contains(txtSearch.Text)
            || item.TenSanPham.Contains(txtSearch.Text)).ToList();
            if (searchResult.Count == 0)
            {
                MessageBox.Show("Không tìm thấy thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            txtSearch.Text = "";
            sanPhamBindingSource.DataSource = searchResult;
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }

        private void FormSanPham_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }
    }
}
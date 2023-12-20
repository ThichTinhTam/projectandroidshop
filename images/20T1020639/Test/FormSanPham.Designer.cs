namespace Test
{
    partial class FormSanPham
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormSanPham));
            panel1 = new Panel();
            grdSanPham = new DataGridView();
            maSanPhamDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            tenSanPhamDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            ngaySanXuatDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            ngayHetHanDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            giaNhapDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            giaBanDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            soLuongNhapDataGridViewTextBoxColumn = new DataGridViewTextBoxColumn();
            sanPhamBindingSource = new BindingSource(components);
            toolStrip1 = new ToolStrip();
            btnsearch = new ToolStripButton();
            btnSua = new ToolStripButton();
            btnXoa = new ToolStripButton();
            btnThem = new ToolStripButton();
            panel2 = new Panel();
            txtSearch = new TextBox();
            label1 = new Label();
            panel3 = new Panel();
            picSanPham = new PictureBox();
            dtpNgayDenHan = new DateTimePicker();
            dtpNgaySanXuat = new DateTimePicker();
            txtTenSanPham = new TextBox();
            txtSoLuongNhap = new TextBox();
            txtGiaBan = new TextBox();
            txtGiaNhap = new TextBox();
            txtMaSanPham = new TextBox();
            label8 = new Label();
            label7 = new Label();
            label6 = new Label();
            label5 = new Label();
            label4 = new Label();
            label3 = new Label();
            label2 = new Label();
            panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)grdSanPham).BeginInit();
            ((System.ComponentModel.ISupportInitialize)sanPhamBindingSource).BeginInit();
            toolStrip1.SuspendLayout();
            panel2.SuspendLayout();
            panel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)picSanPham).BeginInit();
            SuspendLayout();
            // 
            // panel1
            // 
            panel1.Controls.Add(grdSanPham);
            panel1.Controls.Add(toolStrip1);
            panel1.Dock = DockStyle.Bottom;
            panel1.Location = new Point(0, 386);
            panel1.Margin = new Padding(4);
            panel1.Name = "panel1";
            panel1.Size = new Size(1351, 310);
            panel1.TabIndex = 1;
            // 
            // grdSanPham
            // 
            grdSanPham.AllowUserToAddRows = false;
            grdSanPham.AllowUserToDeleteRows = false;
            grdSanPham.AutoGenerateColumns = false;
            grdSanPham.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            grdSanPham.Columns.AddRange(new DataGridViewColumn[] { maSanPhamDataGridViewTextBoxColumn, tenSanPhamDataGridViewTextBoxColumn, ngaySanXuatDataGridViewTextBoxColumn, ngayHetHanDataGridViewTextBoxColumn, giaNhapDataGridViewTextBoxColumn, giaBanDataGridViewTextBoxColumn, soLuongNhapDataGridViewTextBoxColumn });
            grdSanPham.DataSource = sanPhamBindingSource;
            grdSanPham.Dock = DockStyle.Fill;
            grdSanPham.Location = new Point(0, 34);
            grdSanPham.Margin = new Padding(4);
            grdSanPham.Name = "grdSanPham";
            grdSanPham.ReadOnly = true;
            grdSanPham.RowHeadersWidth = 51;
            grdSanPham.Size = new Size(1351, 276);
            grdSanPham.TabIndex = 1;
            grdSanPham.CellClick += grdSanPham_CellClick;
            // 
            // maSanPhamDataGridViewTextBoxColumn
            // 
            maSanPhamDataGridViewTextBoxColumn.DataPropertyName = "MaSanPham";
            maSanPhamDataGridViewTextBoxColumn.HeaderText = "MaSanPham";
            maSanPhamDataGridViewTextBoxColumn.MinimumWidth = 6;
            maSanPhamDataGridViewTextBoxColumn.Name = "maSanPhamDataGridViewTextBoxColumn";
            maSanPhamDataGridViewTextBoxColumn.ReadOnly = true;
            maSanPhamDataGridViewTextBoxColumn.Width = 125;
            // 
            // tenSanPhamDataGridViewTextBoxColumn
            // 
            tenSanPhamDataGridViewTextBoxColumn.DataPropertyName = "TenSanPham";
            tenSanPhamDataGridViewTextBoxColumn.HeaderText = "TenSanPham";
            tenSanPhamDataGridViewTextBoxColumn.MinimumWidth = 6;
            tenSanPhamDataGridViewTextBoxColumn.Name = "tenSanPhamDataGridViewTextBoxColumn";
            tenSanPhamDataGridViewTextBoxColumn.ReadOnly = true;
            tenSanPhamDataGridViewTextBoxColumn.Width = 125;
            // 
            // ngaySanXuatDataGridViewTextBoxColumn
            // 
            ngaySanXuatDataGridViewTextBoxColumn.DataPropertyName = "NgaySanXuat";
            ngaySanXuatDataGridViewTextBoxColumn.HeaderText = "NgaySanXuat";
            ngaySanXuatDataGridViewTextBoxColumn.MinimumWidth = 6;
            ngaySanXuatDataGridViewTextBoxColumn.Name = "ngaySanXuatDataGridViewTextBoxColumn";
            ngaySanXuatDataGridViewTextBoxColumn.ReadOnly = true;
            ngaySanXuatDataGridViewTextBoxColumn.Width = 125;
            // 
            // ngayHetHanDataGridViewTextBoxColumn
            // 
            ngayHetHanDataGridViewTextBoxColumn.DataPropertyName = "NgayHetHan";
            ngayHetHanDataGridViewTextBoxColumn.HeaderText = "NgayHetHan";
            ngayHetHanDataGridViewTextBoxColumn.MinimumWidth = 6;
            ngayHetHanDataGridViewTextBoxColumn.Name = "ngayHetHanDataGridViewTextBoxColumn";
            ngayHetHanDataGridViewTextBoxColumn.ReadOnly = true;
            ngayHetHanDataGridViewTextBoxColumn.Width = 125;
            // 
            // giaNhapDataGridViewTextBoxColumn
            // 
            giaNhapDataGridViewTextBoxColumn.DataPropertyName = "GiaNhap";
            giaNhapDataGridViewTextBoxColumn.HeaderText = "GiaNhap";
            giaNhapDataGridViewTextBoxColumn.MinimumWidth = 6;
            giaNhapDataGridViewTextBoxColumn.Name = "giaNhapDataGridViewTextBoxColumn";
            giaNhapDataGridViewTextBoxColumn.ReadOnly = true;
            giaNhapDataGridViewTextBoxColumn.Width = 125;
            // 
            // giaBanDataGridViewTextBoxColumn
            // 
            giaBanDataGridViewTextBoxColumn.DataPropertyName = "GiaBan";
            giaBanDataGridViewTextBoxColumn.HeaderText = "GiaBan";
            giaBanDataGridViewTextBoxColumn.MinimumWidth = 6;
            giaBanDataGridViewTextBoxColumn.Name = "giaBanDataGridViewTextBoxColumn";
            giaBanDataGridViewTextBoxColumn.ReadOnly = true;
            giaBanDataGridViewTextBoxColumn.Width = 125;
            // 
            // soLuongNhapDataGridViewTextBoxColumn
            // 
            soLuongNhapDataGridViewTextBoxColumn.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            soLuongNhapDataGridViewTextBoxColumn.DataPropertyName = "SoLuongNhap";
            soLuongNhapDataGridViewTextBoxColumn.HeaderText = "SoLuongNhap";
            soLuongNhapDataGridViewTextBoxColumn.MinimumWidth = 6;
            soLuongNhapDataGridViewTextBoxColumn.Name = "soLuongNhapDataGridViewTextBoxColumn";
            soLuongNhapDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // sanPhamBindingSource
            // 
            sanPhamBindingSource.DataSource = typeof(Model.SanPham);
            // 
            // toolStrip1
            // 
            toolStrip1.ImageScalingSize = new Size(20, 20);
            toolStrip1.Items.AddRange(new ToolStripItem[] { btnsearch, btnSua, btnXoa, btnThem });
            toolStrip1.Location = new Point(0, 0);
            toolStrip1.Name = "toolStrip1";
            toolStrip1.Size = new Size(1351, 34);
            toolStrip1.TabIndex = 0;
            toolStrip1.Text = "toolStrip1";
            // 
            // btnsearch
            // 
            btnsearch.Alignment = ToolStripItemAlignment.Right;
            btnsearch.Image = (Image)resources.GetObject("btnsearch.Image");
            btnsearch.ImageTransparentColor = Color.Magenta;
            btnsearch.Name = "btnsearch";
            btnsearch.Size = new Size(108, 29);
            btnsearch.Text = "Tìm kiếm";
            btnsearch.Click += btnsearch_Click;
            // 
            // btnSua
            // 
            btnSua.Alignment = ToolStripItemAlignment.Right;
            btnSua.Image = (Image)resources.GetObject("btnSua.Image");
            btnSua.ImageTransparentColor = Color.Magenta;
            btnSua.Name = "btnSua";
            btnSua.Size = new Size(66, 29);
            btnSua.Text = "Sửa";
            btnSua.Click += btnSua_Click;
            // 
            // btnXoa
            // 
            btnXoa.Alignment = ToolStripItemAlignment.Right;
            btnXoa.Image = (Image)resources.GetObject("btnXoa.Image");
            btnXoa.ImageTransparentColor = Color.Magenta;
            btnXoa.Name = "btnXoa";
            btnXoa.Size = new Size(67, 29);
            btnXoa.Text = "Xóa";
            btnXoa.Click += btnXoa_Click;
            // 
            // btnThem
            // 
            btnThem.Alignment = ToolStripItemAlignment.Right;
            btnThem.Image = (Image)resources.GetObject("btnThem.Image");
            btnThem.ImageTransparentColor = Color.Magenta;
            btnThem.Name = "btnThem";
            btnThem.Size = new Size(80, 29);
            btnThem.Text = "Thêm";
            btnThem.Click += btnThem_Click;
            // 
            // panel2
            // 
            panel2.Controls.Add(txtSearch);
            panel2.Controls.Add(label1);
            panel2.Dock = DockStyle.Top;
            panel2.Location = new Point(0, 0);
            panel2.Margin = new Padding(4);
            panel2.Name = "panel2";
            panel2.Size = new Size(1351, 113);
            panel2.TabIndex = 2;
            // 
            // txtSearch
            // 
            txtSearch.Location = new Point(962, 31);
            txtSearch.Margin = new Padding(4);
            txtSearch.Name = "txtSearch";
            txtSearch.PlaceholderText = "Nhập tên hoặc mã sản phẩm để tìm kiếm";
            txtSearch.Size = new Size(361, 31);
            txtSearch.TabIndex = 7;
            txtSearch.TextChanged += txtSearch_TextChanged;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 18F, FontStyle.Regular, GraphicsUnit.Point);
            label1.ForeColor = Color.Coral;
            label1.Location = new Point(50, 31);
            label1.Margin = new Padding(4, 0, 4, 0);
            label1.Name = "label1";
            label1.Size = new Size(346, 48);
            label1.TabIndex = 0;
            label1.Text = "Danh sách sản phẩm";
            // 
            // panel3
            // 
            panel3.Controls.Add(picSanPham);
            panel3.Controls.Add(dtpNgayDenHan);
            panel3.Controls.Add(dtpNgaySanXuat);
            panel3.Controls.Add(txtTenSanPham);
            panel3.Controls.Add(txtSoLuongNhap);
            panel3.Controls.Add(txtGiaBan);
            panel3.Controls.Add(txtGiaNhap);
            panel3.Controls.Add(txtMaSanPham);
            panel3.Controls.Add(label8);
            panel3.Controls.Add(label7);
            panel3.Controls.Add(label6);
            panel3.Controls.Add(label5);
            panel3.Controls.Add(label4);
            panel3.Controls.Add(label3);
            panel3.Controls.Add(label2);
            panel3.Dock = DockStyle.Fill;
            panel3.Location = new Point(0, 113);
            panel3.Margin = new Padding(4);
            panel3.Name = "panel3";
            panel3.Size = new Size(1351, 273);
            panel3.TabIndex = 3;
            // 
            // picSanPham
            // 
            picSanPham.BorderStyle = BorderStyle.FixedSingle;
            picSanPham.Location = new Point(1131, 15);
            picSanPham.Margin = new Padding(4);
            picSanPham.Name = "picSanPham";
            picSanPham.Size = new Size(138, 188);
            picSanPham.SizeMode = PictureBoxSizeMode.Zoom;
            picSanPham.TabIndex = 3;
            picSanPham.TabStop = false;
            picSanPham.Click += picSanPham_Click;
            // 
            // dtpNgayDenHan
            // 
            dtpNgayDenHan.CustomFormat = "dd/MM/yyyy";
            dtpNgayDenHan.Format = DateTimePickerFormat.Custom;
            dtpNgayDenHan.Location = new Point(281, 170);
            dtpNgayDenHan.Margin = new Padding(4);
            dtpNgayDenHan.Name = "dtpNgayDenHan";
            dtpNgayDenHan.Size = new Size(312, 31);
            dtpNgayDenHan.TabIndex = 2;
            // 
            // dtpNgaySanXuat
            // 
            dtpNgaySanXuat.CustomFormat = "dd/MM/yyyy";
            dtpNgaySanXuat.Format = DateTimePickerFormat.Custom;
            dtpNgaySanXuat.Location = new Point(281, 128);
            dtpNgaySanXuat.Margin = new Padding(4);
            dtpNgaySanXuat.Name = "dtpNgaySanXuat";
            dtpNgaySanXuat.Size = new Size(312, 31);
            dtpNgaySanXuat.TabIndex = 2;
            // 
            // txtTenSanPham
            // 
            txtTenSanPham.Location = new Point(281, 75);
            txtTenSanPham.Margin = new Padding(4);
            txtTenSanPham.Name = "txtTenSanPham";
            txtTenSanPham.Size = new Size(183, 31);
            txtTenSanPham.TabIndex = 1;
            // 
            // txtSoLuongNhap
            // 
            txtSoLuongNhap.Location = new Point(872, 136);
            txtSoLuongNhap.Margin = new Padding(4);
            txtSoLuongNhap.Name = "txtSoLuongNhap";
            txtSoLuongNhap.Size = new Size(183, 31);
            txtSoLuongNhap.TabIndex = 1;
            // 
            // txtGiaBan
            // 
            txtGiaBan.Location = new Point(872, 80);
            txtGiaBan.Margin = new Padding(4);
            txtGiaBan.Name = "txtGiaBan";
            txtGiaBan.Size = new Size(183, 31);
            txtGiaBan.TabIndex = 1;
            // 
            // txtGiaNhap
            // 
            txtGiaNhap.Location = new Point(872, 19);
            txtGiaNhap.Margin = new Padding(4);
            txtGiaNhap.Name = "txtGiaNhap";
            txtGiaNhap.Size = new Size(183, 31);
            txtGiaNhap.TabIndex = 1;
            // 
            // txtMaSanPham
            // 
            txtMaSanPham.Location = new Point(281, 24);
            txtMaSanPham.Margin = new Padding(4);
            txtMaSanPham.Name = "txtMaSanPham";
            txtMaSanPham.Size = new Size(183, 31);
            txtMaSanPham.TabIndex = 1;
            // 
            // label8
            // 
            label8.AutoSize = true;
            label8.Location = new Point(730, 136);
            label8.Margin = new Padding(4, 0, 4, 0);
            label8.Name = "label8";
            label8.Size = new Size(130, 25);
            label8.TabIndex = 0;
            label8.Text = "Số lượng nhập";
            // 
            // label7
            // 
            label7.AutoSize = true;
            label7.Location = new Point(730, 84);
            label7.Margin = new Padding(4, 0, 4, 0);
            label7.Name = "label7";
            label7.Size = new Size(72, 25);
            label7.TabIndex = 0;
            label7.Text = "Giá bán";
            // 
            // label6
            // 
            label6.AutoSize = true;
            label6.Location = new Point(730, 28);
            label6.Margin = new Padding(4, 0, 4, 0);
            label6.Name = "label6";
            label6.Size = new Size(82, 25);
            label6.TabIndex = 0;
            label6.Text = "Giá nhập";
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Location = new Point(145, 168);
            label5.Margin = new Padding(4, 0, 4, 0);
            label5.Name = "label5";
            label5.Size = new Size(123, 25);
            label5.TabIndex = 0;
            label5.Text = "Ngày đến hạn";
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(145, 125);
            label4.Margin = new Padding(4, 0, 4, 0);
            label4.Name = "label4";
            label4.Size = new Size(124, 25);
            label4.TabIndex = 0;
            label4.Text = "Ngày sản xuất";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(145, 75);
            label3.Margin = new Padding(4, 0, 4, 0);
            label3.Name = "label3";
            label3.Size = new Size(121, 25);
            label3.TabIndex = 0;
            label3.Text = "Tên sản phẩm";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(145, 28);
            label2.Margin = new Padding(4, 0, 4, 0);
            label2.Name = "label2";
            label2.Size = new Size(120, 25);
            label2.TabIndex = 0;
            label2.Text = "Mã sản phẩm";
            // 
            // FormSanPham
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1351, 696);
            Controls.Add(panel3);
            Controls.Add(panel2);
            Controls.Add(panel1);
            Margin = new Padding(4);
            Name = "FormSanPham";
            Text = "Form1";
            FormClosing += FormSanPham_FormClosing;
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)grdSanPham).EndInit();
            ((System.ComponentModel.ISupportInitialize)sanPhamBindingSource).EndInit();
            toolStrip1.ResumeLayout(false);
            toolStrip1.PerformLayout();
            panel2.ResumeLayout(false);
            panel2.PerformLayout();
            panel3.ResumeLayout(false);
            panel3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)picSanPham).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private Panel panel1;
        private Panel panel2;
        private Label label1;
        private Panel panel3;
        private BindingSource sanPhamBindingSource;
        private DateTimePicker dtpNgayDenHan;
        private DateTimePicker dtpNgaySanXuat;
        private TextBox txtTenSanPham;
        private TextBox txtSoLuongNhap;
        private TextBox txtGiaBan;
        private TextBox txtGiaNhap;
        private TextBox txtMaSanPham;
        private Label label8;
        private Label label7;
        private Label label6;
        private Label label5;
        private Label label4;
        private Label label3;
        private Label label2;
        private DataGridView grdSanPham;
        private ToolStrip toolStrip1;
        private ToolStripButton btnSua;
        private ToolStripButton btnXoa;
        private ToolStripButton btnThem;
        private PictureBox picSanPham;
        private DataGridViewTextBoxColumn maSanPhamDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn tenSanPhamDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn ngaySanXuatDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn ngayHetHanDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn giaNhapDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn giaBanDataGridViewTextBoxColumn;
        private DataGridViewTextBoxColumn soLuongNhapDataGridViewTextBoxColumn;
        private ToolStripButton btnsearch;
        private TextBox txtSearch;
    }
}
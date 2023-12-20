namespace Test
{
    partial class FormDangNhap
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormDangNhap));
            label1 = new Label();
            txttk = new TextBox();
            txtmk = new TextBox();
            buttonDn = new Button();
            Username = new Label();
            label3 = new Label();
            pictureBox1 = new PictureBox();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Showcard Gothic", 26F, FontStyle.Bold, GraphicsUnit.Point);
            label1.Location = new Point(454, 75);
            label1.Name = "label1";
            label1.Size = new Size(299, 65);
            label1.TabIndex = 0;
            label1.Text = "Nhơn Viết";
            // 
            // txttk
            // 
            txttk.Location = new Point(421, 252);
            txttk.Name = "txttk";
            txttk.Size = new Size(298, 31);
            txttk.TabIndex = 1;
            // 
            // txtmk
            // 
            txtmk.Location = new Point(421, 333);
            txtmk.Name = "txtmk";
            txtmk.Size = new Size(298, 31);
            txtmk.TabIndex = 2;
            txtmk.UseSystemPasswordChar = true;
            // 
            // buttonDn
            // 
            buttonDn.Font = new Font("Algerian", 14F, FontStyle.Regular, GraphicsUnit.Point);
            buttonDn.Location = new Point(454, 411);
            buttonDn.Name = "buttonDn";
            buttonDn.Size = new Size(217, 34);
            buttonDn.TabIndex = 3;
            buttonDn.Text = "Đăng Nhập";
            buttonDn.UseVisualStyleBackColor = true;
            buttonDn.Click += buttonDn_Click;
            // 
            // Username
            // 
            Username.AutoSize = true;
            Username.Location = new Point(231, 252);
            Username.Name = "Username";
            Username.Size = new Size(91, 25);
            Username.TabIndex = 4;
            Username.Text = "Username";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(235, 339);
            label3.Name = "label3";
            label3.Size = new Size(87, 25);
            label3.TabIndex = 5;
            label3.Text = "Password";
            // 
            // pictureBox1
            // 
            pictureBox1.Image = (Image)resources.GetObject("pictureBox1.Image");
            pictureBox1.Location = new Point(25, 21);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new Size(384, 171);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox1.TabIndex = 6;
            pictureBox1.TabStop = false;
            // 
            // FormDangNhap
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(911, 529);
            Controls.Add(pictureBox1);
            Controls.Add(label3);
            Controls.Add(Username);
            Controls.Add(buttonDn);
            Controls.Add(txtmk);
            Controls.Add(txttk);
            Controls.Add(label1);
            MinimizeBox = false;
            Name = "FormDangNhap";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Đăng Nhập";
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private TextBox txttk;
        private TextBox txtmk;
        private Button buttonDn;
        private Label Username;
        private Label label3;
        private PictureBox pictureBox1;
    }
}
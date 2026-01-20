namespace AppliGSB
{
    partial class FrmMedecin
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
            this.lblListeMedecin = new System.Windows.Forms.Label();
            this.lstMedecin = new System.Windows.Forms.ListBox();
            this.lblId = new System.Windows.Forms.Label();
            this.lblNom = new System.Windows.Forms.Label();
            this.lblAdresse = new System.Windows.Forms.Label();
            this.lblTel = new System.Windows.Forms.Label();
            this.lblPrenom = new System.Windows.Forms.Label();
            this.lblSpecialite = new System.Windows.Forms.Label();
            this.lblDepartement = new System.Windows.Forms.Label();
            this.txtPrenom = new System.Windows.Forms.TextBox();
            this.txtAdresse = new System.Windows.Forms.TextBox();
            this.txtTel = new System.Windows.Forms.TextBox();
            this.txtNom = new System.Windows.Forms.TextBox();
            this.txtId = new System.Windows.Forms.TextBox();
            this.txtSpecialite = new System.Windows.Forms.TextBox();
            this.txtDepartement = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // lblListeMedecin
            // 
            this.lblListeMedecin.AutoSize = true;
            this.lblListeMedecin.Font = new System.Drawing.Font("Century Gothic", 26.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblListeMedecin.Location = new System.Drawing.Point(330, 22);
            this.lblListeMedecin.Name = "lblListeMedecin";
            this.lblListeMedecin.Size = new System.Drawing.Size(338, 42);
            this.lblListeMedecin.TabIndex = 1;
            this.lblListeMedecin.Text = "Liste des médecins";
            // 
            // lstMedecin
            // 
            this.lstMedecin.FormattingEnabled = true;
            this.lstMedecin.Location = new System.Drawing.Point(39, 80);
            this.lstMedecin.Name = "lstMedecin";
            this.lstMedecin.Size = new System.Drawing.Size(902, 316);
            this.lstMedecin.TabIndex = 2;
            this.lstMedecin.SelectedIndexChanged += new System.EventHandler(this.lstMedecin_SelectedIndexChanged);
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblId.Location = new System.Drawing.Point(47, 442);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(38, 20);
            this.lblId.TabIndex = 3;
            this.lblId.Text = "ID :";
            // 
            // lblNom
            // 
            this.lblNom.AutoSize = true;
            this.lblNom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNom.Location = new System.Drawing.Point(47, 504);
            this.lblNom.Name = "lblNom";
            this.lblNom.Size = new System.Drawing.Size(55, 20);
            this.lblNom.TabIndex = 4;
            this.lblNom.Text = "Nom :";
            // 
            // lblAdresse
            // 
            this.lblAdresse.AutoSize = true;
            this.lblAdresse.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAdresse.Location = new System.Drawing.Point(46, 628);
            this.lblAdresse.Name = "lblAdresse";
            this.lblAdresse.Size = new System.Drawing.Size(85, 20);
            this.lblAdresse.TabIndex = 5;
            this.lblAdresse.Text = "Adresse :";
            // 
            // lblTel
            // 
            this.lblTel.AutoSize = true;
            this.lblTel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTel.Location = new System.Drawing.Point(47, 695);
            this.lblTel.Name = "lblTel";
            this.lblTel.Size = new System.Drawing.Size(43, 20);
            this.lblTel.TabIndex = 6;
            this.lblTel.Text = "Tél :";
            // 
            // lblPrenom
            // 
            this.lblPrenom.AutoSize = true;
            this.lblPrenom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPrenom.Location = new System.Drawing.Point(47, 565);
            this.lblPrenom.Name = "lblPrenom";
            this.lblPrenom.Size = new System.Drawing.Size(80, 20);
            this.lblPrenom.TabIndex = 7;
            this.lblPrenom.Text = "Prénom :";
            // 
            // lblSpecialite
            // 
            this.lblSpecialite.AutoSize = true;
            this.lblSpecialite.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSpecialite.Location = new System.Drawing.Point(553, 470);
            this.lblSpecialite.Name = "lblSpecialite";
            this.lblSpecialite.Size = new System.Drawing.Size(98, 20);
            this.lblSpecialite.TabIndex = 8;
            this.lblSpecialite.Text = "Spécialité :";
            // 
            // lblDepartement
            // 
            this.lblDepartement.AutoSize = true;
            this.lblDepartement.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartement.Location = new System.Drawing.Point(553, 628);
            this.lblDepartement.Name = "lblDepartement";
            this.lblDepartement.Size = new System.Drawing.Size(124, 20);
            this.lblDepartement.TabIndex = 9;
            this.lblDepartement.Text = "Département :";
            // 
            // txtPrenom
            // 
            this.txtPrenom.Location = new System.Drawing.Point(149, 565);
            this.txtPrenom.Name = "txtPrenom";
            this.txtPrenom.Size = new System.Drawing.Size(252, 20);
            this.txtPrenom.TabIndex = 10;
            // 
            // txtAdresse
            // 
            this.txtAdresse.Location = new System.Drawing.Point(149, 628);
            this.txtAdresse.Name = "txtAdresse";
            this.txtAdresse.Size = new System.Drawing.Size(252, 20);
            this.txtAdresse.TabIndex = 11;
            // 
            // txtTel
            // 
            this.txtTel.Location = new System.Drawing.Point(149, 695);
            this.txtTel.Name = "txtTel";
            this.txtTel.Size = new System.Drawing.Size(252, 20);
            this.txtTel.TabIndex = 12;
            // 
            // txtNom
            // 
            this.txtNom.Location = new System.Drawing.Point(149, 504);
            this.txtNom.Name = "txtNom";
            this.txtNom.Size = new System.Drawing.Size(252, 20);
            this.txtNom.TabIndex = 13;
            // 
            // txtId
            // 
            this.txtId.Location = new System.Drawing.Point(149, 442);
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(252, 20);
            this.txtId.TabIndex = 14;
            // 
            // txtSpecialite
            // 
            this.txtSpecialite.Location = new System.Drawing.Point(689, 470);
            this.txtSpecialite.Name = "txtSpecialite";
            this.txtSpecialite.Size = new System.Drawing.Size(252, 20);
            this.txtSpecialite.TabIndex = 15;
            // 
            // txtDepartement
            // 
            this.txtDepartement.Location = new System.Drawing.Point(689, 628);
            this.txtDepartement.Name = "txtDepartement";
            this.txtDepartement.Size = new System.Drawing.Size(252, 20);
            this.txtDepartement.TabIndex = 16;
            // 
            // FrmMedecin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(128)))));
            this.ClientSize = new System.Drawing.Size(984, 766);
            this.ControlBox = false;
            this.Controls.Add(this.txtDepartement);
            this.Controls.Add(this.txtSpecialite);
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.txtNom);
            this.Controls.Add(this.txtTel);
            this.Controls.Add(this.txtAdresse);
            this.Controls.Add(this.txtPrenom);
            this.Controls.Add(this.lblDepartement);
            this.Controls.Add(this.lblSpecialite);
            this.Controls.Add(this.lblPrenom);
            this.Controls.Add(this.lblTel);
            this.Controls.Add(this.lblAdresse);
            this.Controls.Add(this.lblNom);
            this.Controls.Add(this.lblId);
            this.Controls.Add(this.lstMedecin);
            this.Controls.Add(this.lblListeMedecin);
            this.Name = "FrmMedecin";
            this.Text = "FrmMedecin";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmMedecin_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblListeMedecin;
        private System.Windows.Forms.ListBox lstMedecin;
        private System.Windows.Forms.Label lblId;
        private System.Windows.Forms.Label lblNom;
        private System.Windows.Forms.Label lblAdresse;
        private System.Windows.Forms.Label lblTel;
        private System.Windows.Forms.Label lblPrenom;
        private System.Windows.Forms.Label lblSpecialite;
        private System.Windows.Forms.Label lblDepartement;
        private System.Windows.Forms.TextBox txtPrenom;
        private System.Windows.Forms.TextBox txtAdresse;
        private System.Windows.Forms.TextBox txtTel;
        private System.Windows.Forms.TextBox txtNom;
        private System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.TextBox txtSpecialite;
        private System.Windows.Forms.TextBox txtDepartement;
    }
}
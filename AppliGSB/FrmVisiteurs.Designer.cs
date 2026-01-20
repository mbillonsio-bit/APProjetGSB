namespace AppliGSB
{
    partial class FrmVisiteurs
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
            this.lblListeVisiteurs = new System.Windows.Forms.Label();
            this.lstVisiteurs = new System.Windows.Forms.ListBox();
            this.lblId = new System.Windows.Forms.Label();
            this.lblNom = new System.Windows.Forms.Label();
            this.lblPrenom = new System.Windows.Forms.Label();
            this.lblLogin = new System.Windows.Forms.Label();
            this.lblMdp = new System.Windows.Forms.Label();
            this.lblAdresse = new System.Windows.Forms.Label();
            this.lblCp = new System.Windows.Forms.Label();
            this.lblVille = new System.Windows.Forms.Label();
            this.lblDateEmbauche = new System.Windows.Forms.Label();
            this.txtMdp = new System.Windows.Forms.TextBox();
            this.txtLogin = new System.Windows.Forms.TextBox();
            this.txtPrenom = new System.Windows.Forms.TextBox();
            this.txtNom = new System.Windows.Forms.TextBox();
            this.txtId = new System.Windows.Forms.TextBox();
            this.txtDateEmbauche = new System.Windows.Forms.TextBox();
            this.txtVille = new System.Windows.Forms.TextBox();
            this.txtCp = new System.Windows.Forms.TextBox();
            this.txtAdresse = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // lblListeVisiteurs
            // 
            this.lblListeVisiteurs.AutoSize = true;
            this.lblListeVisiteurs.BackColor = System.Drawing.Color.Transparent;
            this.lblListeVisiteurs.Font = new System.Drawing.Font("Century Gothic", 26.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblListeVisiteurs.Location = new System.Drawing.Point(315, 36);
            this.lblListeVisiteurs.Name = "lblListeVisiteurs";
            this.lblListeVisiteurs.Size = new System.Drawing.Size(301, 42);
            this.lblListeVisiteurs.TabIndex = 1;
            this.lblListeVisiteurs.Text = "Liste des visiteurs";
            // 
            // lstVisiteurs
            // 
            this.lstVisiteurs.FormattingEnabled = true;
            this.lstVisiteurs.Location = new System.Drawing.Point(38, 125);
            this.lstVisiteurs.Name = "lstVisiteurs";
            this.lstVisiteurs.Size = new System.Drawing.Size(902, 238);
            this.lstVisiteurs.TabIndex = 2;
            this.lstVisiteurs.SelectedIndexChanged += new System.EventHandler(this.lstVisiteurs_SelectedIndexChanged);
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblId.Location = new System.Drawing.Point(81, 436);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(38, 20);
            this.lblId.TabIndex = 3;
            this.lblId.Text = "ID :";
            // 
            // lblNom
            // 
            this.lblNom.AutoSize = true;
            this.lblNom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNom.Location = new System.Drawing.Point(81, 490);
            this.lblNom.Name = "lblNom";
            this.lblNom.Size = new System.Drawing.Size(55, 20);
            this.lblNom.TabIndex = 4;
            this.lblNom.Text = "Nom :";
            // 
            // lblPrenom
            // 
            this.lblPrenom.AutoSize = true;
            this.lblPrenom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPrenom.Location = new System.Drawing.Point(81, 546);
            this.lblPrenom.Name = "lblPrenom";
            this.lblPrenom.Size = new System.Drawing.Size(80, 20);
            this.lblPrenom.TabIndex = 5;
            this.lblPrenom.Text = "Prenom :";
            // 
            // lblLogin
            // 
            this.lblLogin.AutoSize = true;
            this.lblLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLogin.Location = new System.Drawing.Point(81, 603);
            this.lblLogin.Name = "lblLogin";
            this.lblLogin.Size = new System.Drawing.Size(63, 20);
            this.lblLogin.TabIndex = 6;
            this.lblLogin.Text = "Login :";
            // 
            // lblMdp
            // 
            this.lblMdp.AutoSize = true;
            this.lblMdp.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMdp.Location = new System.Drawing.Point(81, 662);
            this.lblMdp.Name = "lblMdp";
            this.lblMdp.Size = new System.Drawing.Size(127, 20);
            this.lblMdp.TabIndex = 7;
            this.lblMdp.Text = "Mot de passe :";
            // 
            // lblAdresse
            // 
            this.lblAdresse.AutoSize = true;
            this.lblAdresse.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAdresse.Location = new System.Drawing.Point(503, 438);
            this.lblAdresse.Name = "lblAdresse";
            this.lblAdresse.Size = new System.Drawing.Size(85, 20);
            this.lblAdresse.TabIndex = 8;
            this.lblAdresse.Text = "Adresse :";
            // 
            // lblCp
            // 
            this.lblCp.AutoSize = true;
            this.lblCp.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCp.Location = new System.Drawing.Point(503, 511);
            this.lblCp.Name = "lblCp";
            this.lblCp.Size = new System.Drawing.Size(115, 20);
            this.lblCp.TabIndex = 9;
            this.lblCp.Text = "Code postal :";
            // 
            // lblVille
            // 
            this.lblVille.AutoSize = true;
            this.lblVille.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblVille.Location = new System.Drawing.Point(503, 583);
            this.lblVille.Name = "lblVille";
            this.lblVille.Size = new System.Drawing.Size(53, 20);
            this.lblVille.TabIndex = 10;
            this.lblVille.Text = "Ville :";
            // 
            // lblDateEmbauche
            // 
            this.lblDateEmbauche.AutoSize = true;
            this.lblDateEmbauche.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDateEmbauche.Location = new System.Drawing.Point(503, 656);
            this.lblDateEmbauche.Name = "lblDateEmbauche";
            this.lblDateEmbauche.Size = new System.Drawing.Size(160, 20);
            this.lblDateEmbauche.TabIndex = 11;
            this.lblDateEmbauche.Text = "Date d\'embauche :";
            // 
            // txtMdp
            // 
            this.txtMdp.Location = new System.Drawing.Point(224, 662);
            this.txtMdp.Name = "txtMdp";
            this.txtMdp.Size = new System.Drawing.Size(273, 20);
            this.txtMdp.TabIndex = 12;
            // 
            // txtLogin
            // 
            this.txtLogin.Location = new System.Drawing.Point(224, 603);
            this.txtLogin.Name = "txtLogin";
            this.txtLogin.Size = new System.Drawing.Size(273, 20);
            this.txtLogin.TabIndex = 13;
            // 
            // txtPrenom
            // 
            this.txtPrenom.Location = new System.Drawing.Point(224, 546);
            this.txtPrenom.Name = "txtPrenom";
            this.txtPrenom.Size = new System.Drawing.Size(273, 20);
            this.txtPrenom.TabIndex = 14;
            // 
            // txtNom
            // 
            this.txtNom.Location = new System.Drawing.Point(224, 490);
            this.txtNom.Name = "txtNom";
            this.txtNom.Size = new System.Drawing.Size(273, 20);
            this.txtNom.TabIndex = 15;
            // 
            // txtId
            // 
            this.txtId.Location = new System.Drawing.Point(224, 436);
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(273, 20);
            this.txtId.TabIndex = 16;
            // 
            // txtDateEmbauche
            // 
            this.txtDateEmbauche.Location = new System.Drawing.Point(678, 656);
            this.txtDateEmbauche.Name = "txtDateEmbauche";
            this.txtDateEmbauche.Size = new System.Drawing.Size(273, 20);
            this.txtDateEmbauche.TabIndex = 17;
            // 
            // txtVille
            // 
            this.txtVille.Location = new System.Drawing.Point(678, 583);
            this.txtVille.Name = "txtVille";
            this.txtVille.Size = new System.Drawing.Size(273, 20);
            this.txtVille.TabIndex = 18;
            // 
            // txtCp
            // 
            this.txtCp.Location = new System.Drawing.Point(678, 511);
            this.txtCp.Name = "txtCp";
            this.txtCp.Size = new System.Drawing.Size(273, 20);
            this.txtCp.TabIndex = 19;
            // 
            // txtAdresse
            // 
            this.txtAdresse.Location = new System.Drawing.Point(678, 436);
            this.txtAdresse.Name = "txtAdresse";
            this.txtAdresse.Size = new System.Drawing.Size(273, 20);
            this.txtAdresse.TabIndex = 20;
            // 
            // FrmVisiteurs
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(128)))));
            this.ClientSize = new System.Drawing.Size(984, 766);
            this.ControlBox = false;
            this.Controls.Add(this.txtAdresse);
            this.Controls.Add(this.txtCp);
            this.Controls.Add(this.txtVille);
            this.Controls.Add(this.txtDateEmbauche);
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.txtNom);
            this.Controls.Add(this.txtPrenom);
            this.Controls.Add(this.txtLogin);
            this.Controls.Add(this.txtMdp);
            this.Controls.Add(this.lblDateEmbauche);
            this.Controls.Add(this.lblVille);
            this.Controls.Add(this.lblCp);
            this.Controls.Add(this.lblAdresse);
            this.Controls.Add(this.lblMdp);
            this.Controls.Add(this.lblLogin);
            this.Controls.Add(this.lblPrenom);
            this.Controls.Add(this.lblNom);
            this.Controls.Add(this.lblId);
            this.Controls.Add(this.lstVisiteurs);
            this.Controls.Add(this.lblListeVisiteurs);
            this.Name = "FrmVisiteurs";
            this.Text = "FrmVisiteurs";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmVisiteurs_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblListeVisiteurs;
        private System.Windows.Forms.ListBox lstVisiteurs;
        private System.Windows.Forms.Label lblId;
        private System.Windows.Forms.Label lblNom;
        private System.Windows.Forms.Label lblPrenom;
        private System.Windows.Forms.Label lblLogin;
        private System.Windows.Forms.Label lblMdp;
        private System.Windows.Forms.Label lblAdresse;
        private System.Windows.Forms.Label lblCp;
        private System.Windows.Forms.Label lblVille;
        private System.Windows.Forms.Label lblDateEmbauche;
        private System.Windows.Forms.TextBox txtMdp;
        private System.Windows.Forms.TextBox txtLogin;
        private System.Windows.Forms.TextBox txtPrenom;
        private System.Windows.Forms.TextBox txtNom;
        private System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.TextBox txtDateEmbauche;
        private System.Windows.Forms.TextBox txtVille;
        private System.Windows.Forms.TextBox txtCp;
        private System.Windows.Forms.TextBox txtAdresse;
    }
}
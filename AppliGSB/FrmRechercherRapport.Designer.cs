namespace AppliGSB
{
    partial class FrmRechercherRapport
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
            this.lblVisiteur = new System.Windows.Forms.Label();
            this.lblMedecin = new System.Windows.Forms.Label();
            this.lblRapportVisites = new System.Windows.Forms.Label();
            this.lblVisiteur2 = new System.Windows.Forms.Label();
            this.lblMedecin2 = new System.Windows.Forms.Label();
            this.lblBilan = new System.Windows.Forms.Label();
            this.lblDate = new System.Windows.Forms.Label();
            this.lblMotif = new System.Windows.Forms.Label();
            this.lblPrenom = new System.Windows.Forms.Label();
            this.lblNom = new System.Windows.Forms.Label();
            this.lblNom2 = new System.Windows.Forms.Label();
            this.lblPrenom2 = new System.Windows.Forms.Label();
            this.lblAdresse = new System.Windows.Forms.Label();
            this.lstMedicaments = new System.Windows.Forms.ListView();
            this.clmMedOfferts = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.clmQtt = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.txtBilan = new System.Windows.Forms.TextBox();
            this.txtDate = new System.Windows.Forms.TextBox();
            this.txtMotif = new System.Windows.Forms.TextBox();
            this.txtPrenom = new System.Windows.Forms.TextBox();
            this.txtNom = new System.Windows.Forms.TextBox();
            this.txtNom2 = new System.Windows.Forms.TextBox();
            this.txtPrenom2 = new System.Windows.Forms.TextBox();
            this.txtAdresse = new System.Windows.Forms.TextBox();
            this.cbxMedecins = new System.Windows.Forms.ComboBox();
            this.cbxVisiteurs = new System.Windows.Forms.ComboBox();
            this.btnRechercherRapportVisiteur = new System.Windows.Forms.Button();
            this.btnRechercherRapportMedecin = new System.Windows.Forms.Button();
            this.lstRapportVisite = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // lblVisiteur
            // 
            this.lblVisiteur.AutoSize = true;
            this.lblVisiteur.Location = new System.Drawing.Point(116, 46);
            this.lblVisiteur.Name = "lblVisiteur";
            this.lblVisiteur.Size = new System.Drawing.Size(47, 13);
            this.lblVisiteur.TabIndex = 0;
            this.lblVisiteur.Text = "Visiteur :";
            // 
            // lblMedecin
            // 
            this.lblMedecin.AutoSize = true;
            this.lblMedecin.Location = new System.Drawing.Point(116, 105);
            this.lblMedecin.Name = "lblMedecin";
            this.lblMedecin.Size = new System.Drawing.Size(54, 13);
            this.lblMedecin.TabIndex = 1;
            this.lblMedecin.Text = "Médecin :";
            // 
            // lblRapportVisites
            // 
            this.lblRapportVisites.AutoSize = true;
            this.lblRapportVisites.Location = new System.Drawing.Point(72, 169);
            this.lblRapportVisites.Name = "lblRapportVisites";
            this.lblRapportVisites.Size = new System.Drawing.Size(98, 13);
            this.lblRapportVisites.TabIndex = 2;
            this.lblRapportVisites.Text = "Rapport de visites :";
            // 
            // lblVisiteur2
            // 
            this.lblVisiteur2.AutoSize = true;
            this.lblVisiteur2.Location = new System.Drawing.Point(59, 343);
            this.lblVisiteur2.Name = "lblVisiteur2";
            this.lblVisiteur2.Size = new System.Drawing.Size(41, 13);
            this.lblVisiteur2.TabIndex = 3;
            this.lblVisiteur2.Text = "Visiteur";
            // 
            // lblMedecin2
            // 
            this.lblMedecin2.AutoSize = true;
            this.lblMedecin2.Location = new System.Drawing.Point(454, 343);
            this.lblMedecin2.Name = "lblMedecin2";
            this.lblMedecin2.Size = new System.Drawing.Size(48, 13);
            this.lblMedecin2.TabIndex = 4;
            this.lblMedecin2.Text = "Médecin";
            // 
            // lblBilan
            // 
            this.lblBilan.AutoSize = true;
            this.lblBilan.Location = new System.Drawing.Point(129, 488);
            this.lblBilan.Name = "lblBilan";
            this.lblBilan.Size = new System.Drawing.Size(30, 13);
            this.lblBilan.TabIndex = 5;
            this.lblBilan.Text = "Bilan";
            // 
            // lblDate
            // 
            this.lblDate.AutoSize = true;
            this.lblDate.Location = new System.Drawing.Point(76, 462);
            this.lblDate.Name = "lblDate";
            this.lblDate.Size = new System.Drawing.Size(83, 13);
            this.lblDate.TabIndex = 6;
            this.lblDate.Text = "Date de la visite";
            // 
            // lblMotif
            // 
            this.lblMotif.AutoSize = true;
            this.lblMotif.Location = new System.Drawing.Point(76, 437);
            this.lblMotif.Name = "lblMotif";
            this.lblMotif.Size = new System.Drawing.Size(83, 13);
            this.lblMotif.TabIndex = 7;
            this.lblMotif.Text = "Motif de la visite";
            // 
            // lblPrenom
            // 
            this.lblPrenom.AutoSize = true;
            this.lblPrenom.Location = new System.Drawing.Point(116, 410);
            this.lblPrenom.Name = "lblPrenom";
            this.lblPrenom.Size = new System.Drawing.Size(43, 13);
            this.lblPrenom.TabIndex = 8;
            this.lblPrenom.Text = "Prénom";
            // 
            // lblNom
            // 
            this.lblNom.AutoSize = true;
            this.lblNom.Location = new System.Drawing.Point(130, 384);
            this.lblNom.Name = "lblNom";
            this.lblNom.Size = new System.Drawing.Size(29, 13);
            this.lblNom.TabIndex = 9;
            this.lblNom.Text = "Nom";
            // 
            // lblNom2
            // 
            this.lblNom2.AutoSize = true;
            this.lblNom2.Location = new System.Drawing.Point(500, 384);
            this.lblNom2.Name = "lblNom2";
            this.lblNom2.Size = new System.Drawing.Size(29, 13);
            this.lblNom2.TabIndex = 12;
            this.lblNom2.Text = "Nom";
            // 
            // lblPrenom2
            // 
            this.lblPrenom2.AutoSize = true;
            this.lblPrenom2.Location = new System.Drawing.Point(486, 410);
            this.lblPrenom2.Name = "lblPrenom2";
            this.lblPrenom2.Size = new System.Drawing.Size(43, 13);
            this.lblPrenom2.TabIndex = 11;
            this.lblPrenom2.Text = "Prénom";
            // 
            // lblAdresse
            // 
            this.lblAdresse.AutoSize = true;
            this.lblAdresse.Location = new System.Drawing.Point(484, 437);
            this.lblAdresse.Name = "lblAdresse";
            this.lblAdresse.Size = new System.Drawing.Size(45, 13);
            this.lblAdresse.TabIndex = 10;
            this.lblAdresse.Text = "Adresse";
            // 
            // lstMedicaments
            // 
            this.lstMedicaments.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.clmMedOfferts,
            this.clmQtt});
            this.lstMedicaments.HideSelection = false;
            this.lstMedicaments.Location = new System.Drawing.Point(186, 526);
            this.lstMedicaments.Name = "lstMedicaments";
            this.lstMedicaments.Size = new System.Drawing.Size(726, 187);
            this.lstMedicaments.TabIndex = 13;
            this.lstMedicaments.UseCompatibleStateImageBehavior = false;
            this.lstMedicaments.View = System.Windows.Forms.View.Details;
            // 
            // clmMedOfferts
            // 
            this.clmMedOfferts.Text = "Medicaments offerts";
            this.clmMedOfferts.Width = 436;
            // 
            // clmQtt
            // 
            this.clmQtt.Text = "Quantité";
            this.clmQtt.Width = 290;
            // 
            // txtBilan
            // 
            this.txtBilan.Location = new System.Drawing.Point(186, 485);
            this.txtBilan.Name = "txtBilan";
            this.txtBilan.Size = new System.Drawing.Size(726, 20);
            this.txtBilan.TabIndex = 14;
            // 
            // txtDate
            // 
            this.txtDate.Location = new System.Drawing.Point(186, 459);
            this.txtDate.Name = "txtDate";
            this.txtDate.Size = new System.Drawing.Size(258, 20);
            this.txtDate.TabIndex = 15;
            // 
            // txtMotif
            // 
            this.txtMotif.Location = new System.Drawing.Point(186, 434);
            this.txtMotif.Name = "txtMotif";
            this.txtMotif.Size = new System.Drawing.Size(258, 20);
            this.txtMotif.TabIndex = 16;
            // 
            // txtPrenom
            // 
            this.txtPrenom.Location = new System.Drawing.Point(186, 407);
            this.txtPrenom.Name = "txtPrenom";
            this.txtPrenom.Size = new System.Drawing.Size(258, 20);
            this.txtPrenom.TabIndex = 17;
            // 
            // txtNom
            // 
            this.txtNom.Location = new System.Drawing.Point(186, 381);
            this.txtNom.Name = "txtNom";
            this.txtNom.Size = new System.Drawing.Size(258, 20);
            this.txtNom.TabIndex = 18;
            // 
            // txtNom2
            // 
            this.txtNom2.Location = new System.Drawing.Point(542, 381);
            this.txtNom2.Name = "txtNom2";
            this.txtNom2.Size = new System.Drawing.Size(258, 20);
            this.txtNom2.TabIndex = 21;
            // 
            // txtPrenom2
            // 
            this.txtPrenom2.Location = new System.Drawing.Point(542, 407);
            this.txtPrenom2.Name = "txtPrenom2";
            this.txtPrenom2.Size = new System.Drawing.Size(258, 20);
            this.txtPrenom2.TabIndex = 20;
            // 
            // txtAdresse
            // 
            this.txtAdresse.Location = new System.Drawing.Point(542, 434);
            this.txtAdresse.Name = "txtAdresse";
            this.txtAdresse.Size = new System.Drawing.Size(370, 20);
            this.txtAdresse.TabIndex = 19;
            // 
            // cbxMedecins
            // 
            this.cbxMedecins.FormattingEnabled = true;
            this.cbxMedecins.Location = new System.Drawing.Point(186, 102);
            this.cbxMedecins.Name = "cbxMedecins";
            this.cbxMedecins.Size = new System.Drawing.Size(258, 21);
            this.cbxMedecins.TabIndex = 23;
            // 
            // cbxVisiteurs
            // 
            this.cbxVisiteurs.FormattingEnabled = true;
            this.cbxVisiteurs.Location = new System.Drawing.Point(186, 43);
            this.cbxVisiteurs.Name = "cbxVisiteurs";
            this.cbxVisiteurs.Size = new System.Drawing.Size(258, 21);
            this.cbxVisiteurs.TabIndex = 24;
            // 
            // btnRechercherRapportVisiteur
            // 
            this.btnRechercherRapportVisiteur.Location = new System.Drawing.Point(542, 41);
            this.btnRechercherRapportVisiteur.Name = "btnRechercherRapportVisiteur";
            this.btnRechercherRapportVisiteur.Size = new System.Drawing.Size(258, 23);
            this.btnRechercherRapportVisiteur.TabIndex = 25;
            this.btnRechercherRapportVisiteur.Text = "Rechercher Rapports Visiteur";
            this.btnRechercherRapportVisiteur.UseVisualStyleBackColor = true;
            this.btnRechercherRapportVisiteur.Click += new System.EventHandler(this.btnRechercherRapportVisiteur_Click);
            // 
            // btnRechercherRapportMedecin
            // 
            this.btnRechercherRapportMedecin.Location = new System.Drawing.Point(542, 100);
            this.btnRechercherRapportMedecin.Name = "btnRechercherRapportMedecin";
            this.btnRechercherRapportMedecin.Size = new System.Drawing.Size(258, 23);
            this.btnRechercherRapportMedecin.TabIndex = 26;
            this.btnRechercherRapportMedecin.Text = "Rechercher Rapports Médecin";
            this.btnRechercherRapportMedecin.UseVisualStyleBackColor = true;
            this.btnRechercherRapportMedecin.Click += new System.EventHandler(this.btnRechercherRapportMedecin_Click);
            // 
            // lstRapportVisite
            // 
            this.lstRapportVisite.FormattingEnabled = true;
            this.lstRapportVisite.Location = new System.Drawing.Point(186, 169);
            this.lstRapportVisite.Name = "lstRapportVisite";
            this.lstRapportVisite.Size = new System.Drawing.Size(258, 121);
            this.lstRapportVisite.TabIndex = 27;
            this.lstRapportVisite.SelectedIndexChanged += new System.EventHandler(this.lstRapportVisite_SelectedIndexChanged);
            // 
            // FrmRechercherRapport
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(984, 766);
            this.ControlBox = false;
            this.Controls.Add(this.lstRapportVisite);
            this.Controls.Add(this.btnRechercherRapportMedecin);
            this.Controls.Add(this.btnRechercherRapportVisiteur);
            this.Controls.Add(this.cbxVisiteurs);
            this.Controls.Add(this.cbxMedecins);
            this.Controls.Add(this.txtNom2);
            this.Controls.Add(this.txtPrenom2);
            this.Controls.Add(this.txtAdresse);
            this.Controls.Add(this.txtNom);
            this.Controls.Add(this.txtPrenom);
            this.Controls.Add(this.txtMotif);
            this.Controls.Add(this.txtDate);
            this.Controls.Add(this.txtBilan);
            this.Controls.Add(this.lstMedicaments);
            this.Controls.Add(this.lblNom2);
            this.Controls.Add(this.lblPrenom2);
            this.Controls.Add(this.lblAdresse);
            this.Controls.Add(this.lblNom);
            this.Controls.Add(this.lblPrenom);
            this.Controls.Add(this.lblMotif);
            this.Controls.Add(this.lblDate);
            this.Controls.Add(this.lblBilan);
            this.Controls.Add(this.lblMedecin2);
            this.Controls.Add(this.lblVisiteur2);
            this.Controls.Add(this.lblRapportVisites);
            this.Controls.Add(this.lblMedecin);
            this.Controls.Add(this.lblVisiteur);
            this.Name = "FrmRechercherRapport";
            this.Text = "FrmRechercherRapport";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmRechercherRapport_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblVisiteur;
        private System.Windows.Forms.Label lblMedecin;
        private System.Windows.Forms.Label lblRapportVisites;
        private System.Windows.Forms.Label lblVisiteur2;
        private System.Windows.Forms.Label lblMedecin2;
        private System.Windows.Forms.Label lblBilan;
        private System.Windows.Forms.Label lblDate;
        private System.Windows.Forms.Label lblMotif;
        private System.Windows.Forms.Label lblPrenom;
        private System.Windows.Forms.Label lblNom;
        private System.Windows.Forms.Label lblNom2;
        private System.Windows.Forms.Label lblPrenom2;
        private System.Windows.Forms.Label lblAdresse;
        private System.Windows.Forms.ListView lstMedicaments;
        private System.Windows.Forms.TextBox txtBilan;
        private System.Windows.Forms.TextBox txtDate;
        private System.Windows.Forms.TextBox txtMotif;
        private System.Windows.Forms.TextBox txtPrenom;
        private System.Windows.Forms.TextBox txtNom;
        private System.Windows.Forms.TextBox txtNom2;
        private System.Windows.Forms.TextBox txtPrenom2;
        private System.Windows.Forms.TextBox txtAdresse;
        private System.Windows.Forms.ComboBox cbxMedecins;
        private System.Windows.Forms.ComboBox cbxVisiteurs;
        private System.Windows.Forms.Button btnRechercherRapportVisiteur;
        private System.Windows.Forms.Button btnRechercherRapportMedecin;
        private System.Windows.Forms.ListBox lstRapportVisite;
        private System.Windows.Forms.ColumnHeader clmMedOfferts;
        private System.Windows.Forms.ColumnHeader clmQtt;
    }
}
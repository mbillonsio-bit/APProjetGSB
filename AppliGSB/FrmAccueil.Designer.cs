namespace AppliGSB
{
    partial class FrmAccueil
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmAccueil));
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.mnuFichier = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuFichierAccueil = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuFichierQuitter = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuMedicament = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuMedicamentGerer = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuMedicamentListe = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuVisiteur = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuVisiteurListe = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuVisiteurGerer = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuVisiteurRechercher = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuMedecin = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuMedecinGerer = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuMedecinDernierRapport = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuMedecinListe = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuRapport = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuRapportAjouter = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuRapportRechercher = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuRapportListe = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuAide = new System.Windows.Forms.ToolStripMenuItem();
            this.pbxGSB = new System.Windows.Forms.PictureBox();
            this.btnQuitter = new System.Windows.Forms.Button();
            this.menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbxGSB)).BeginInit();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuFichier,
            this.mnuMedicament,
            this.mnuVisiteur,
            this.mnuMedecin,
            this.mnuRapport,
            this.mnuAide});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(984, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // mnuFichier
            // 
            this.mnuFichier.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuFichierAccueil,
            this.mnuFichierQuitter});
            this.mnuFichier.Name = "mnuFichier";
            this.mnuFichier.Size = new System.Drawing.Size(54, 20);
            this.mnuFichier.Text = "Fichier";
            // 
            // mnuFichierAccueil
            // 
            this.mnuFichierAccueil.Name = "mnuFichierAccueil";
            this.mnuFichierAccueil.Size = new System.Drawing.Size(113, 22);
            this.mnuFichierAccueil.Text = "Accueil";
            // 
            // mnuFichierQuitter
            // 
            this.mnuFichierQuitter.Name = "mnuFichierQuitter";
            this.mnuFichierQuitter.Size = new System.Drawing.Size(113, 22);
            this.mnuFichierQuitter.Text = "Quitter";
            this.mnuFichierQuitter.Click += new System.EventHandler(this.mnuFichierQuitter_Click);
            // 
            // mnuMedicament
            // 
            this.mnuMedicament.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuMedicamentGerer,
            this.mnuMedicamentListe});
            this.mnuMedicament.Name = "mnuMedicament";
            this.mnuMedicament.Size = new System.Drawing.Size(86, 20);
            this.mnuMedicament.Text = "Médicament";
            // 
            // mnuMedicamentGerer
            // 
            this.mnuMedicamentGerer.Name = "mnuMedicamentGerer";
            this.mnuMedicamentGerer.Size = new System.Drawing.Size(102, 22);
            this.mnuMedicamentGerer.Text = "Gérer";
            this.mnuMedicamentGerer.Click += new System.EventHandler(this.mnuMedicamentGerer_Click);
            // 
            // mnuMedicamentListe
            // 
            this.mnuMedicamentListe.Name = "mnuMedicamentListe";
            this.mnuMedicamentListe.Size = new System.Drawing.Size(102, 22);
            this.mnuMedicamentListe.Text = "Liste";
            this.mnuMedicamentListe.Click += new System.EventHandler(this.mnuMedicamentListe_Click);
            // 
            // mnuVisiteur
            // 
            this.mnuVisiteur.AccessibleRole = System.Windows.Forms.AccessibleRole.None;
            this.mnuVisiteur.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuVisiteurListe,
            this.mnuVisiteurGerer,
            this.mnuVisiteurRechercher});
            this.mnuVisiteur.Name = "mnuVisiteur";
            this.mnuVisiteur.Size = new System.Drawing.Size(58, 20);
            this.mnuVisiteur.Text = "Visiteur";
            // 
            // mnuVisiteurListe
            // 
            this.mnuVisiteurListe.Name = "mnuVisiteurListe";
            this.mnuVisiteurListe.Size = new System.Drawing.Size(133, 22);
            this.mnuVisiteurListe.Text = "Liste";
            this.mnuVisiteurListe.Click += new System.EventHandler(this.mnuVisiteurListe_Click);
            // 
            // mnuVisiteurGerer
            // 
            this.mnuVisiteurGerer.Name = "mnuVisiteurGerer";
            this.mnuVisiteurGerer.Size = new System.Drawing.Size(133, 22);
            this.mnuVisiteurGerer.Text = "Gérer";
            this.mnuVisiteurGerer.Click += new System.EventHandler(this.mnuVisiteurGerer_Click);
            // 
            // mnuVisiteurRechercher
            // 
            this.mnuVisiteurRechercher.Name = "mnuVisiteurRechercher";
            this.mnuVisiteurRechercher.Size = new System.Drawing.Size(133, 22);
            this.mnuVisiteurRechercher.Text = "Rechercher";
            // 
            // mnuMedecin
            // 
            this.mnuMedecin.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuMedecinGerer,
            this.mnuMedecinDernierRapport,
            this.mnuMedecinListe});
            this.mnuMedecin.Name = "mnuMedecin";
            this.mnuMedecin.Size = new System.Drawing.Size(65, 20);
            this.mnuMedecin.Text = "Médecin";
            // 
            // mnuMedecinGerer
            // 
            this.mnuMedecinGerer.Name = "mnuMedecinGerer";
            this.mnuMedecinGerer.Size = new System.Drawing.Size(154, 22);
            this.mnuMedecinGerer.Text = "Gérer";
            this.mnuMedecinGerer.Click += new System.EventHandler(this.mnuMedecinGerer_Click);
            // 
            // mnuMedecinDernierRapport
            // 
            this.mnuMedecinDernierRapport.Name = "mnuMedecinDernierRapport";
            this.mnuMedecinDernierRapport.Size = new System.Drawing.Size(154, 22);
            this.mnuMedecinDernierRapport.Text = "Dernier rapport";
            // 
            // mnuMedecinListe
            // 
            this.mnuMedecinListe.Name = "mnuMedecinListe";
            this.mnuMedecinListe.Size = new System.Drawing.Size(154, 22);
            this.mnuMedecinListe.Text = "Liste";
            this.mnuMedecinListe.Click += new System.EventHandler(this.mnuMedecinListe_Click);
            // 
            // mnuRapport
            // 
            this.mnuRapport.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuRapportAjouter,
            this.mnuRapportRechercher,
            this.mnuRapportListe});
            this.mnuRapport.Name = "mnuRapport";
            this.mnuRapport.Size = new System.Drawing.Size(61, 20);
            this.mnuRapport.Text = "Rapport";
            // 
            // mnuRapportAjouter
            // 
            this.mnuRapportAjouter.Name = "mnuRapportAjouter";
            this.mnuRapportAjouter.Size = new System.Drawing.Size(133, 22);
            this.mnuRapportAjouter.Text = "Ajouter";
            // 
            // mnuRapportRechercher
            // 
            this.mnuRapportRechercher.Name = "mnuRapportRechercher";
            this.mnuRapportRechercher.Size = new System.Drawing.Size(133, 22);
            this.mnuRapportRechercher.Text = "Rechercher";
            this.mnuRapportRechercher.Click += new System.EventHandler(this.mnuRapportRechercher_Click);
            // 
            // mnuRapportListe
            // 
            this.mnuRapportListe.Name = "mnuRapportListe";
            this.mnuRapportListe.Size = new System.Drawing.Size(133, 22);
            this.mnuRapportListe.Text = "Liste";
            // 
            // mnuAide
            // 
            this.mnuAide.Name = "mnuAide";
            this.mnuAide.Size = new System.Drawing.Size(24, 20);
            this.mnuAide.Text = "?";
            // 
            // pbxGSB
            // 
            this.pbxGSB.Image = ((System.Drawing.Image)(resources.GetObject("pbxGSB.Image")));
            this.pbxGSB.Location = new System.Drawing.Point(333, 208);
            this.pbxGSB.Name = "pbxGSB";
            this.pbxGSB.Size = new System.Drawing.Size(347, 195);
            this.pbxGSB.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbxGSB.TabIndex = 1;
            this.pbxGSB.TabStop = false;
            // 
            // btnQuitter
            // 
            this.btnQuitter.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.btnQuitter.Location = new System.Drawing.Point(428, 444);
            this.btnQuitter.Name = "btnQuitter";
            this.btnQuitter.Size = new System.Drawing.Size(138, 40);
            this.btnQuitter.TabIndex = 2;
            this.btnQuitter.Text = "Quitter";
            this.btnQuitter.UseVisualStyleBackColor = false;
            this.btnQuitter.Click += new System.EventHandler(this.btnQuitter_Click);
            // 
            // FrmAccueil
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.ClientSize = new System.Drawing.Size(984, 766);
            this.Controls.Add(this.btnQuitter);
            this.Controls.Add(this.pbxGSB);
            this.Controls.Add(this.menuStrip1);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "FrmAccueil";
            this.Text = "Application Comptes-Rendus";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbxGSB)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem mnuFichier;
        private System.Windows.Forms.ToolStripMenuItem mnuFichierAccueil;
        private System.Windows.Forms.ToolStripMenuItem mnuFichierQuitter;
        private System.Windows.Forms.ToolStripMenuItem mnuMedicament;
        private System.Windows.Forms.ToolStripMenuItem mnuMedicamentGerer;
        private System.Windows.Forms.ToolStripMenuItem mnuMedicamentListe;
        private System.Windows.Forms.ToolStripMenuItem mnuVisiteur;
        private System.Windows.Forms.ToolStripMenuItem mnuVisiteurListe;
        private System.Windows.Forms.ToolStripMenuItem mnuVisiteurGerer;
        private System.Windows.Forms.ToolStripMenuItem mnuVisiteurRechercher;
        private System.Windows.Forms.ToolStripMenuItem mnuMedecin;
        private System.Windows.Forms.ToolStripMenuItem mnuMedecinGerer;
        private System.Windows.Forms.ToolStripMenuItem mnuMedecinDernierRapport;
        private System.Windows.Forms.ToolStripMenuItem mnuMedecinListe;
        private System.Windows.Forms.ToolStripMenuItem mnuRapport;
        private System.Windows.Forms.ToolStripMenuItem mnuRapportAjouter;
        private System.Windows.Forms.ToolStripMenuItem mnuRapportRechercher;
        private System.Windows.Forms.ToolStripMenuItem mnuRapportListe;
        private System.Windows.Forms.ToolStripMenuItem mnuAide;
        private System.Windows.Forms.PictureBox pbxGSB;
        private System.Windows.Forms.Button btnQuitter;
    }
}


namespace AppliGSB
{
    partial class FrmNouveauMedicament
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
            this.lblNouvMedic = new System.Windows.Forms.Label();
            this.lblId = new System.Windows.Forms.Label();
            this.lblComposition = new System.Windows.Forms.Label();
            this.lblNomCom = new System.Windows.Forms.Label();
            this.lblContreIndications = new System.Windows.Forms.Label();
            this.lblFamille = new System.Windows.Forms.Label();
            this.lblEffet = new System.Windows.Forms.Label();
            this.btnAjouter = new System.Windows.Forms.Button();
            this.txtId = new System.Windows.Forms.TextBox();
            this.txtNomCom = new System.Windows.Forms.TextBox();
            this.txtComposition = new System.Windows.Forms.RichTextBox();
            this.txtContreIndications = new System.Windows.Forms.RichTextBox();
            this.txtEffets = new System.Windows.Forms.RichTextBox();
            this.cbxFamille = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // lblNouvMedic
            // 
            this.lblNouvMedic.AutoSize = true;
            this.lblNouvMedic.Font = new System.Drawing.Font("Century Gothic", 26.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNouvMedic.Location = new System.Drawing.Point(295, 36);
            this.lblNouvMedic.Name = "lblNouvMedic";
            this.lblNouvMedic.Size = new System.Drawing.Size(408, 42);
            this.lblNouvMedic.TabIndex = 1;
            this.lblNouvMedic.Text = "Nouveau médicament";
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblId.Location = new System.Drawing.Point(129, 185);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(38, 20);
            this.lblId.TabIndex = 2;
            this.lblId.Text = "ID :";
            // 
            // lblComposition
            // 
            this.lblComposition.AutoSize = true;
            this.lblComposition.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblComposition.Location = new System.Drawing.Point(129, 470);
            this.lblComposition.Name = "lblComposition";
            this.lblComposition.Size = new System.Drawing.Size(114, 20);
            this.lblComposition.TabIndex = 3;
            this.lblComposition.Text = "Compostion :";
            // 
            // lblNomCom
            // 
            this.lblNomCom.AutoSize = true;
            this.lblNomCom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNomCom.Location = new System.Drawing.Point(129, 329);
            this.lblNomCom.Name = "lblNomCom";
            this.lblNomCom.Size = new System.Drawing.Size(150, 20);
            this.lblNomCom.TabIndex = 4;
            this.lblNomCom.Text = "Nom commercial :";
            // 
            // lblContreIndications
            // 
            this.lblContreIndications.AutoSize = true;
            this.lblContreIndications.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblContreIndications.Location = new System.Drawing.Point(513, 329);
            this.lblContreIndications.Name = "lblContreIndications";
            this.lblContreIndications.Size = new System.Drawing.Size(175, 20);
            this.lblContreIndications.TabIndex = 7;
            this.lblContreIndications.Text = "Contre indiquations :";
            // 
            // lblFamille
            // 
            this.lblFamille.AutoSize = true;
            this.lblFamille.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFamille.Location = new System.Drawing.Point(513, 470);
            this.lblFamille.Name = "lblFamille";
            this.lblFamille.Size = new System.Drawing.Size(76, 20);
            this.lblFamille.TabIndex = 6;
            this.lblFamille.Text = "Famille :";
            // 
            // lblEffet
            // 
            this.lblEffet.AutoSize = true;
            this.lblEffet.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblEffet.Location = new System.Drawing.Point(513, 185);
            this.lblEffet.Name = "lblEffet";
            this.lblEffet.Size = new System.Drawing.Size(68, 20);
            this.lblEffet.TabIndex = 5;
            this.lblEffet.Text = "Effets :";
            // 
            // btnAjouter
            // 
            this.btnAjouter.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAjouter.Location = new System.Drawing.Point(377, 584);
            this.btnAjouter.Name = "btnAjouter";
            this.btnAjouter.Size = new System.Drawing.Size(245, 98);
            this.btnAjouter.TabIndex = 8;
            this.btnAjouter.Text = "Ajouter";
            this.btnAjouter.UseVisualStyleBackColor = true;
            this.btnAjouter.Click += new System.EventHandler(this.btnAjouter_Click);
            // 
            // txtId
            // 
            this.txtId.Location = new System.Drawing.Point(288, 185);
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(219, 20);
            this.txtId.TabIndex = 9;
            // 
            // txtNomCom
            // 
            this.txtNomCom.Location = new System.Drawing.Point(288, 329);
            this.txtNomCom.Name = "txtNomCom";
            this.txtNomCom.Size = new System.Drawing.Size(219, 20);
            this.txtNomCom.TabIndex = 10;
            // 
            // txtComposition
            // 
            this.txtComposition.Location = new System.Drawing.Point(288, 421);
            this.txtComposition.Name = "txtComposition";
            this.txtComposition.Size = new System.Drawing.Size(219, 117);
            this.txtComposition.TabIndex = 11;
            this.txtComposition.Text = "";
            // 
            // txtContreIndications
            // 
            this.txtContreIndications.Location = new System.Drawing.Point(694, 283);
            this.txtContreIndications.Name = "txtContreIndications";
            this.txtContreIndications.Size = new System.Drawing.Size(251, 117);
            this.txtContreIndications.TabIndex = 12;
            this.txtContreIndications.Text = "";
            // 
            // txtEffets
            // 
            this.txtEffets.Location = new System.Drawing.Point(694, 141);
            this.txtEffets.Name = "txtEffets";
            this.txtEffets.Size = new System.Drawing.Size(251, 117);
            this.txtEffets.TabIndex = 13;
            this.txtEffets.Text = "";
            // 
            // cbxFamille
            // 
            this.cbxFamille.FormattingEnabled = true;
            this.cbxFamille.Location = new System.Drawing.Point(694, 472);
            this.cbxFamille.Name = "cbxFamille";
            this.cbxFamille.Size = new System.Drawing.Size(251, 21);
            this.cbxFamille.TabIndex = 14;
            // 
            // FrmNouveauMedicament
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(984, 766);
            this.ControlBox = false;
            this.Controls.Add(this.cbxFamille);
            this.Controls.Add(this.txtEffets);
            this.Controls.Add(this.txtContreIndications);
            this.Controls.Add(this.txtComposition);
            this.Controls.Add(this.txtNomCom);
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.btnAjouter);
            this.Controls.Add(this.lblContreIndications);
            this.Controls.Add(this.lblFamille);
            this.Controls.Add(this.lblEffet);
            this.Controls.Add(this.lblNomCom);
            this.Controls.Add(this.lblComposition);
            this.Controls.Add(this.lblId);
            this.Controls.Add(this.lblNouvMedic);
            this.Name = "FrmNouveauMedicament";
            this.Text = "FrmNouveauMedicament";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmNouveauMedicament_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblNouvMedic;
        private System.Windows.Forms.Label lblId;
        private System.Windows.Forms.Label lblComposition;
        private System.Windows.Forms.Label lblNomCom;
        private System.Windows.Forms.Label lblContreIndications;
        private System.Windows.Forms.Label lblFamille;
        private System.Windows.Forms.Label lblEffet;
        private System.Windows.Forms.Button btnAjouter;
        private System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.TextBox txtNomCom;
        private System.Windows.Forms.RichTextBox txtComposition;
        private System.Windows.Forms.RichTextBox txtContreIndications;
        private System.Windows.Forms.RichTextBox txtEffets;
        private System.Windows.Forms.ComboBox cbxFamille;
    }
}
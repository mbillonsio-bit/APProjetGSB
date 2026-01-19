namespace AppliGSB
{
    partial class FrmMedicament
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
            this.spcMedicament = new System.Windows.Forms.SplitContainer();
            this.lblListeMedic = new System.Windows.Forms.Label();
            this.lblComposition = new System.Windows.Forms.Label();
            this.lblNomCom = new System.Windows.Forms.Label();
            this.lblId = new System.Windows.Forms.Label();
            this.lstMedicament = new System.Windows.Forms.ListBox();
            this.lblEffets = new System.Windows.Forms.Label();
            this.lblContreIndications = new System.Windows.Forms.Label();
            this.lblFamille = new System.Windows.Forms.Label();
            this.txtId = new System.Windows.Forms.TextBox();
            this.txtNomCommercial = new System.Windows.Forms.TextBox();
            this.txtComposition = new System.Windows.Forms.RichTextBox();
            this.txtEffets = new System.Windows.Forms.RichTextBox();
            this.txtContreIndications = new System.Windows.Forms.RichTextBox();
            this.txtFamille = new System.Windows.Forms.RichTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.spcMedicament)).BeginInit();
            this.spcMedicament.Panel1.SuspendLayout();
            this.spcMedicament.Panel2.SuspendLayout();
            this.spcMedicament.SuspendLayout();
            this.SuspendLayout();
            // 
            // spcMedicament
            // 
            this.spcMedicament.Dock = System.Windows.Forms.DockStyle.Fill;
            this.spcMedicament.Location = new System.Drawing.Point(0, 0);
            this.spcMedicament.Name = "spcMedicament";
            this.spcMedicament.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // spcMedicament.Panel1
            // 
            this.spcMedicament.Panel1.Controls.Add(this.lblListeMedic);
            // 
            // spcMedicament.Panel2
            // 
            this.spcMedicament.Panel2.Controls.Add(this.txtFamille);
            this.spcMedicament.Panel2.Controls.Add(this.txtContreIndications);
            this.spcMedicament.Panel2.Controls.Add(this.txtEffets);
            this.spcMedicament.Panel2.Controls.Add(this.txtComposition);
            this.spcMedicament.Panel2.Controls.Add(this.txtNomCommercial);
            this.spcMedicament.Panel2.Controls.Add(this.txtId);
            this.spcMedicament.Panel2.Controls.Add(this.lblFamille);
            this.spcMedicament.Panel2.Controls.Add(this.lblContreIndications);
            this.spcMedicament.Panel2.Controls.Add(this.lblEffets);
            this.spcMedicament.Panel2.Controls.Add(this.lblComposition);
            this.spcMedicament.Panel2.Controls.Add(this.lblNomCom);
            this.spcMedicament.Panel2.Controls.Add(this.lblId);
            this.spcMedicament.Panel2.Controls.Add(this.lstMedicament);
            this.spcMedicament.Panel2MinSize = 50;
            this.spcMedicament.Size = new System.Drawing.Size(984, 746);
            this.spcMedicament.SplitterDistance = 95;
            this.spcMedicament.TabIndex = 0;
            // 
            // lblListeMedic
            // 
            this.lblListeMedic.AutoSize = true;
            this.lblListeMedic.Font = new System.Drawing.Font("Century Gothic", 26.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblListeMedic.Location = new System.Drawing.Point(288, 23);
            this.lblListeMedic.Name = "lblListeMedic";
            this.lblListeMedic.Size = new System.Drawing.Size(406, 42);
            this.lblListeMedic.TabIndex = 0;
            this.lblListeMedic.Text = "Liste des médicaments";
            // 
            // lblComposition
            // 
            this.lblComposition.AutoSize = true;
            this.lblComposition.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblComposition.Location = new System.Drawing.Point(33, 514);
            this.lblComposition.Name = "lblComposition";
            this.lblComposition.Size = new System.Drawing.Size(123, 20);
            this.lblComposition.TabIndex = 3;
            this.lblComposition.Text = "Composition : ";
            // 
            // lblNomCom
            // 
            this.lblNomCom.AutoSize = true;
            this.lblNomCom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNomCom.Location = new System.Drawing.Point(33, 379);
            this.lblNomCom.Name = "lblNomCom";
            this.lblNomCom.Size = new System.Drawing.Size(155, 20);
            this.lblNomCom.TabIndex = 2;
            this.lblNomCom.Text = "Nom commercial : ";
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblId.Location = new System.Drawing.Point(33, 290);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(43, 20);
            this.lblId.TabIndex = 1;
            this.lblId.Text = "ID : ";
            // 
            // lstMedicament
            // 
            this.lstMedicament.FormattingEnabled = true;
            this.lstMedicament.Location = new System.Drawing.Point(37, 13);
            this.lstMedicament.Name = "lstMedicament";
            this.lstMedicament.Size = new System.Drawing.Size(902, 238);
            this.lstMedicament.TabIndex = 0;
            this.lstMedicament.SelectedIndexChanged += new System.EventHandler(this.lstMedicament_SelectedIndexChanged);
            // 
            // lblEffets
            // 
            this.lblEffets.AutoSize = true;
            this.lblEffets.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblEffets.Location = new System.Drawing.Point(481, 292);
            this.lblEffets.Name = "lblEffets";
            this.lblEffets.Size = new System.Drawing.Size(68, 20);
            this.lblEffets.TabIndex = 4;
            this.lblEffets.Text = "Effets :";
            // 
            // lblContreIndications
            // 
            this.lblContreIndications.AutoSize = true;
            this.lblContreIndications.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblContreIndications.Location = new System.Drawing.Point(481, 379);
            this.lblContreIndications.Name = "lblContreIndications";
            this.lblContreIndications.Size = new System.Drawing.Size(169, 20);
            this.lblContreIndications.TabIndex = 5;
            this.lblContreIndications.Text = "Contre indications : ";
            // 
            // lblFamille
            // 
            this.lblFamille.AutoSize = true;
            this.lblFamille.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFamille.Location = new System.Drawing.Point(481, 585);
            this.lblFamille.Name = "lblFamille";
            this.lblFamille.Size = new System.Drawing.Size(76, 20);
            this.lblFamille.TabIndex = 6;
            this.lblFamille.Text = "Famille :";
            // 
            // txtId
            // 
            this.txtId.Location = new System.Drawing.Point(210, 292);
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(265, 20);
            this.txtId.TabIndex = 7;
            // 
            // txtNomCommercial
            // 
            this.txtNomCommercial.Location = new System.Drawing.Point(210, 379);
            this.txtNomCommercial.Name = "txtNomCommercial";
            this.txtNomCommercial.Size = new System.Drawing.Size(265, 20);
            this.txtNomCommercial.TabIndex = 8;
            // 
            // txtComposition
            // 
            this.txtComposition.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtComposition.Location = new System.Drawing.Point(210, 468);
            this.txtComposition.Name = "txtComposition";
            this.txtComposition.Size = new System.Drawing.Size(265, 114);
            this.txtComposition.TabIndex = 10;
            this.txtComposition.Text = "";
            // 
            // txtEffets
            // 
            this.txtEffets.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtEffets.Location = new System.Drawing.Point(555, 257);
            this.txtEffets.Name = "txtEffets";
            this.txtEffets.Size = new System.Drawing.Size(384, 106);
            this.txtEffets.TabIndex = 11;
            this.txtEffets.Text = "";
            // 
            // txtContreIndications
            // 
            this.txtContreIndications.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtContreIndications.Location = new System.Drawing.Point(656, 369);
            this.txtContreIndications.Name = "txtContreIndications";
            this.txtContreIndications.Size = new System.Drawing.Size(283, 182);
            this.txtContreIndications.TabIndex = 12;
            this.txtContreIndications.Text = "";
            // 
            // txtFamille
            // 
            this.txtFamille.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtFamille.Location = new System.Drawing.Point(572, 557);
            this.txtFamille.Name = "txtFamille";
            this.txtFamille.Size = new System.Drawing.Size(367, 71);
            this.txtFamille.TabIndex = 13;
            this.txtFamille.Text = "";
            // 
            // FrmMedicament
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(984, 746);
            this.ControlBox = false;
            this.Controls.Add(this.spcMedicament);
            this.MinimumSize = new System.Drawing.Size(1000, 785);
            this.Name = "FrmMedicament";
            this.Text = "FrmMedicament";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmMedicament_Load);
            this.spcMedicament.Panel1.ResumeLayout(false);
            this.spcMedicament.Panel1.PerformLayout();
            this.spcMedicament.Panel2.ResumeLayout(false);
            this.spcMedicament.Panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.spcMedicament)).EndInit();
            this.spcMedicament.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer spcMedicament;
        private System.Windows.Forms.Label lblListeMedic;
        private System.Windows.Forms.ListBox lstMedicament;
        private System.Windows.Forms.Label lblNomCom;
        private System.Windows.Forms.Label lblId;
        private System.Windows.Forms.Label lblComposition;
        private System.Windows.Forms.TextBox txtNomCommercial;
        private System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.Label lblFamille;
        private System.Windows.Forms.Label lblContreIndications;
        private System.Windows.Forms.Label lblEffets;
        private System.Windows.Forms.RichTextBox txtFamille;
        private System.Windows.Forms.RichTextBox txtContreIndications;
        private System.Windows.Forms.RichTextBox txtEffets;
        private System.Windows.Forms.RichTextBox txtComposition;
    }
}
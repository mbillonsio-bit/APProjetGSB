using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AppliGSB
{
    public partial class FrmAccueil: Form
    {
        private void fermerMDI()
        {
            Form c;
            c = this.ActiveMdiChild;    // Récupère le formulaire actif
            if (c != null)      // S’il existe,
                c.Close();  // on le ferme
        }
        private void rendVisible(bool val)      // val vaut true ou false
        {
            pbxGSB.Visible = val;      // La propriété Visible passe à Vrai ou Faux
            btnQuitter.Visible = val;
        }


        public FrmAccueil()
        {
            InitializeComponent();
        }

        private void btnQuitter_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void mnuFichierQuitter_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void mnuMedicamentListe_Click(object sender, EventArgs e)
        {
            fermerMDI();        // Ferme le formulaire actif
            rendVisible(false);     // Rend invisibles les composants de FrmAccueil
            FrmMedicament frmMedicament = new FrmMedicament(); // Crée une instance de FrmMedicament
            frmMedicament.MdiParent = this; //Le formulaire MDI parent est l'instance en cours (this)
                                            // de FrmAccueil
            frmMedicament.Show();	// Montre le nouveau formulaire

        }

        private void mnuMedecinListe_Click(object sender, EventArgs e)
        {
            fermerMDI();      
            rendVisible(false);   
            FrmMedecin frmMedecin = new FrmMedecin();
            frmMedecin.MdiParent = this; 
            frmMedecin.Show();	
        }

        private void mnuMedicamentGerer_Click(object sender, EventArgs e)
        {
            fermerMDI();
            rendVisible(false);
            FrmNouveauMedicament frmNouveauMedicament = new FrmNouveauMedicament();
            frmNouveauMedicament.MdiParent = this;
            frmNouveauMedicament.Show();
        }

        private void mnuMedecinGerer_Click(object sender, EventArgs e)
        {
            fermerMDI();
            rendVisible(false);
            FrmNouveauMedecin frmNouveauMedecin = new FrmNouveauMedecin();
            frmNouveauMedecin.MdiParent = this;
            frmNouveauMedecin.Show();
        }

        private void mnuVisiteurListe_Click(object sender, EventArgs e)
        {
            fermerMDI();
            rendVisible(false);
            FrmVisiteurs frmVisiteurs = new FrmVisiteurs();
            frmVisiteurs.MdiParent = this;
            frmVisiteurs.Show();
        }

        private void mnuVisiteurGerer_Click(object sender, EventArgs e)
        {
            fermerMDI();
            rendVisible(false);
            FrmNouveauVisiteur frmNouveauVisiteur = new FrmNouveauVisiteur();
            frmNouveauVisiteur.MdiParent = this;
            frmNouveauVisiteur.Show();
        }

        private void mnuRapportRechercher_Click(object sender, EventArgs e)
        {
            fermerMDI();
            rendVisible(false);
            FrmRechercherRapport frmRechercherRapport = new FrmRechercherRapport();
            frmRechercherRapport.MdiParent = this;
            frmRechercherRapport.Show();
        }
    }
}

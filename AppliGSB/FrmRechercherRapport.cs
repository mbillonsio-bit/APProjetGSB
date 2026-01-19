using CoucheLogiqueMetier;
using CoucheMetier;
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
    public partial class FrmRechercherRapport: Form
    {
        public FrmRechercherRapport()
        {
            InitializeComponent();
        }

        private void FrmRechercherRapport_Load(object sender, EventArgs e)
        {
            List<Visiteur> lesVisiteurs = Manager.ChargerTousVisiteurs();
            cbxVisiteurs.DataSource = lesVisiteurs;
            List<Medecin> lesMedecins = Manager.ChargerTousMedecins();
            cbxMedecins.DataSource = lesMedecins;
        }

        private void btnRechercherRapportVisiteur_Click(object sender, EventArgs e)
        {
            List<Rapport> lesRapport = Manager.ChargerRapportsIdVisiteur(((Visiteur)cbxVisiteurs.SelectedItem).Id);
            lstRapportVisite.DataSource = lesRapport;
            lstRapportVisite.DisplayMember = "Id";
        }

        private void btnRechercherRapportMedecin_Click(object sender, EventArgs e)
        {
            List<Rapport> lesRapport = Manager.ChargerRapportIdMedecin(((Medecin)cbxMedecins.SelectedItem).Id);
            lstRapportVisite.DataSource = lesRapport;
            lstRapportVisite.DisplayMember = "Id";
        }

        private void lstRapportVisite_SelectedIndexChanged(object sender, EventArgs e)
        {
            Rapport leRapport = (Rapport)lstRapportVisite.SelectedItem;
            int idRapport = leRapport.Id;
            Rapport unRapport = Manager.ChargerInfoRapport(idRapport);

            this.txtNom.Text = unRapport.LeVisiteur.Nom;
            this.txtNom2.Text = unRapport.LeMedecin.Nom;
            this.txtPrenom.Text = unRapport.LeVisiteur.Prenom;
            this.txtPrenom2.Text = unRapport.LeMedecin.Prenom;
            this.txtMotif.Text = unRapport.Motif;
            this.txtDate.Text = unRapport.Date.ToShortDateString();
            this.txtBilan.Text = unRapport.Bilan;
            this.txtAdresse.Text = unRapport.LeMedecin.Adresse;

            lstMedicaments.Items.Clear();

            List<EchantillonOffert> lesEchantillons = Manager.ChargerEchantillonsIdRapport(idRapport);
            foreach (EchantillonOffert unEchantillon in lesEchantillons)
            {
                string[] row = { unEchantillon.LeMedicament.NomCommercial, unEchantillon.Quantite.ToString() };
                lstMedicaments.Items.Add(new ListViewItem(row));
            }
         


        }
    }
}

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
    public partial class FrmNouveauMedicament: Form
    {
        public FrmNouveauMedicament()
        {
            InitializeComponent();
        }

        private void FrmNouveauMedicament_Load(object sender, EventArgs e)
        {
            List<Famille> lesFamilles = Manager.ChargerToutesFamilles();
            cbxFamille.DataSource = lesFamilles;
            cbxFamille.DisplayMember = "Libelle";
        }

        private void btnAjouter_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtId.Text) || string.IsNullOrWhiteSpace(txtNomCom.Text) ||
                    string.IsNullOrWhiteSpace(txtComposition.Text) || string.IsNullOrWhiteSpace(txtEffets.Text) ||
                    string.IsNullOrWhiteSpace(txtContreIndications.Text))
                {
                    MessageBox.Show("Veuillez remplir tous les champs avant d'ajouter un médicament.");
                    return;
                }
                else { 
                Famille uneFamille = (Famille)cbxFamille.SelectedItem;
                Medicament unMedicament = new Medicament(txtId.Text, txtNomCom.Text, txtComposition.Text, txtEffets.Text, txtContreIndications.Text, uneFamille);
                Manager.AjouterUnMedicament(unMedicament);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erreur lors de l'ajout du médicament : " + ex.Message);
            }
        }
    }
}

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
    public partial class FrmNouveauMedecin: Form
    {
        public FrmNouveauMedecin()
        {
            InitializeComponent();
        }

        private void FrmNouveauMedecin_Load(object sender, EventArgs e)
        {
            List<Specialite> lesSpecialites = Manager.ChargerToutesSpecialites();
            cbxSpecialite.DataSource = lesSpecialites;
            cbxSpecialite.DisplayMember = "LibSpecialite";
            List<Medecin> lesMedecins = Manager.ChargerTousMedecins();
            txtId.Text = (lesMedecins.Count + 1).ToString();
        }

        private void btnAjouter_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtNom.Text) ||
                    string.IsNullOrWhiteSpace(txtPrenom.Text) || string.IsNullOrWhiteSpace(txtAdresse.Text) ||
                    string.IsNullOrWhiteSpace(txtTel.Text) || string.IsNullOrWhiteSpace(txtDepartement.Text))
                {
                    MessageBox.Show("Veuillez remplir tous les champs avant d'ajouter un médecin.");
                    return;
                }
                else
                {
                    Specialite uneSpecialite = (Specialite)cbxSpecialite.SelectedItem;
                    Medecin unMedecin = new Medecin(txtId.Text, txtNom.Text, txtPrenom.Text, txtAdresse.Text, txtTel.Text, txtDepartement.Text, uneSpecialite);
                    Manager.AjouterUnMedecin(unMedecin);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erreur lors de l'ajout du médecin : " + ex.Message);
            }
        }
    }
}

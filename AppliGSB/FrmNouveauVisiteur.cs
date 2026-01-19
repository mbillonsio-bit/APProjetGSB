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
    public partial class FrmNouveauVisiteur: Form
    {
        public FrmNouveauVisiteur()
        {
            InitializeComponent();
        }

        private void btnAjouter_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtId.Text) || string.IsNullOrWhiteSpace(txtNom.Text) ||
                    string.IsNullOrWhiteSpace(txtPrenom.Text) || string.IsNullOrWhiteSpace(txtAdresse.Text) ||
                    string.IsNullOrWhiteSpace(txtCp.Text) || string.IsNullOrWhiteSpace(txtVille.Text))
                {
                    MessageBox.Show("Veuillez remplir tous les champs avant d'ajouter un visiteur.");
                    return;
                }
                else
                {
                    string dateEmbauche = dtpDateEmbauche.Value.ToString("yyyy-MM-dd");

                    Visiteur unVisiteur = new Visiteur(txtId.Text, txtNom.Text, txtPrenom.Text, txtAdresse.Text, txtCp.Text, txtVille.Text, dateEmbauche, txtLogin.Text, txtMdp.Text);
                    CoucheLogiqueMetier.Manager.AjouterUnVisiteur(unVisiteur);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erreur lors de l'ajout du visiteur : " + ex.Message);
            }
        }
    }
}

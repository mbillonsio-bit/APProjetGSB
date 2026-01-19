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
    public partial class FrmVisiteurs: Form
    {
        public FrmVisiteurs()
        {
            InitializeComponent();
        }

        private void lstVisiteurs_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indexVisiteur = this.lstVisiteurs.SelectedIndex;

            Visiteur unVisiteur = Manager.GetUnVisiteur(indexVisiteur);

            this.txtId.Text = unVisiteur.Id;
            this.txtNom.Text = unVisiteur.Nom;
            this.txtPrenom.Text = unVisiteur.Prenom;
            this.txtAdresse.Text = unVisiteur.Adresse;
            this.txtCp.Text = unVisiteur.Cp;
            this.txtVille.Text = unVisiteur.Ville;
            this.txtDateEmbauche.Text = unVisiteur.DateEmbauche;
            this.txtLogin.Text = unVisiteur.Login;
            this.txtMdp.Text = unVisiteur.Mdp;

        }

        private void FrmVisiteurs_Load(object sender, EventArgs e)
        {
            List<Visiteur> lesVisiteurs = Manager.ChargerTousVisiteurs();
            lstVisiteurs.DataSource = lesVisiteurs;
        }
    }
}

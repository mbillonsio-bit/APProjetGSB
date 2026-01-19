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
    public partial class FrmMedecin: Form
    {
        public FrmMedecin()
        {
            InitializeComponent();
        }

        private void lstMedecin_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indexMedecin = this.lstMedecin.SelectedIndex;

            Medecin unMedecin = Manager.GetMedecin(indexMedecin);

            this.txtId.Text = unMedecin.Id;
            this.txtNom.Text = unMedecin.Nom;
            this.txtPrenom.Text = unMedecin.Prenom;
            this.txtAdresse.Text = unMedecin.Adresse;
            this.txtTel.Text = unMedecin.Tel;
            this.txtDepartement.Text = unMedecin.Departement;


            Specialite laSpecialite = Manager.ChargerSpecialiteDuMedecin(unMedecin);
            this.txtSpecialite.Text = laSpecialite.LibSpecialite;
        }

        private void FrmMedecin_Load(object sender, EventArgs e)
        {
            List<Medecin> lesMedecins = Manager.ChargerTousMedecins();
            lstMedecin.DataSource = lesMedecins;
        }
    }
}

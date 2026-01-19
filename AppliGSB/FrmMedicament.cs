using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CoucheAccesDonnees;
using CoucheMetier;
using CoucheLogiqueMetier;

namespace AppliGSB
{
    public partial class FrmMedicament: Form
    {
        public FrmMedicament()
        {
            InitializeComponent();
        }

        private void FrmMedicament_Load(object sender, EventArgs e)
        {
            List<Medicament> lesMedicaments = Manager.ChargerMedicaments();
            lstMedicament.DataSource = lesMedicaments;
        }

        private void lstMedicament_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indexMed = this.lstMedicament.SelectedIndex;

            Medicament unMed = Manager.GetMedicament(indexMed);

            this.txtId.Text = unMed.Id;
            this.txtNomCommercial.Text = unMed.NomCommercial;
            this.txtComposition.Text = unMed.Composition;
            this.txtEffets.Text = unMed.Effets;
            this.txtContreIndications.Text = unMed.ContreIndications;

            Famille laFamille = Manager.GetFamilleDuMedicament(unMed);
            this.txtFamille.Text = laFamille.Libelle;
        }
    }
}

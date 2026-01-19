using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoucheMetier
{
    public class Medecin : Personne
    {
        private string departement;
        private string tel;
        private Specialite laSpecialite;

        public Medecin(string id, string nom, string prenom, string adresse, string departement, string tel)
            : base(id, nom, prenom, adresse)
        {
            this.departement = departement;
            this.tel = tel;
        }

        public Medecin(string id, string nom, string prenom, string adresse, string tel, string departement, Specialite laSpecialite)
            : base(id, nom, prenom, adresse)
        {
            this.departement = departement;
            this.tel = tel;
            this.laSpecialite = laSpecialite;
        }

        public string Departement { get => departement; set => departement = value; }
        public string Tel { get => tel; set => tel = value; }
        public Specialite LaSpecialite { get => laSpecialite; set => laSpecialite = value; }
    }
}

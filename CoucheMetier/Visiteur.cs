using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoucheMetier
{
    public class Visiteur : Personne
    {
        private string cp;
        private string ville;
        private string dateEmbauche;
        private string login;
        private string mdp;

        public Visiteur(string unId, string unNom, string unPrenom, string uneAdresse, string unCp, string uneVille, string uneDateEmbauche, string unLogin, string unMdp)
            : base(unId, unNom, unPrenom, uneAdresse)
        {
            this.cp = unCp;
            this.ville = uneVille;
            this.dateEmbauche = uneDateEmbauche;
            this.login = unLogin;
            this.mdp = unMdp;
        }

        public string Cp { get => cp; set => cp = value; }
        public string Ville { get => ville; set => ville = value; }
        public string DateEmbauche { get => dateEmbauche; set => dateEmbauche = value; }
        public string Login { get => login; set => login = value; }
        public string Mdp { get => mdp; set => mdp = value; }

        public override string ToString()
        {
            return $"{Id} - {Nom} {Prenom} - {ville}";
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoucheMetier
{
    public class Medicament
    {
        private string composition;
        private string contreIndications;
        private string effets;
        private string id;
        private string nomCommercial;
        private Famille famille;

        public Medicament(string id, string nomCommercial, string composition, string effets, string contreIndications)
        {
            this.id = id;
            this.nomCommercial = nomCommercial;
            this.composition = composition;
            this.effets = effets;
            this.contreIndications = contreIndications;
        }

        public Medicament(string id, string nomCommercial, string composition, string effets, string contreIndications, Famille Famille)
        {
            this.id = id;
            this.nomCommercial = nomCommercial;
            this.composition = composition;
            this.effets = effets;
            this.contreIndications = contreIndications;
            this.Famille = Famille;
        }

        public Famille Famille { get => famille; set => famille = value; }
        public string Composition { get => composition; set => composition = value; }
        public string ContreIndications { get => contreIndications; set => contreIndications = value; }
        public string Effets { get => effets; set => effets = value; }
        public string Id { get => id; set => id = value; }
        public string NomCommercial { get => nomCommercial; set => nomCommercial = value; }

        public override string ToString()
        {
            return $"{id} - {nomCommercial} ({Famille.Libelle})";
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoucheMetier
{
    public class EchantillonOffert
    {
        private Medicament leMedicament;
        private int quantite;

        // Constructeur
        public EchantillonOffert(Medicament medicament, int quantite)
        {
            this.leMedicament = medicament;
            this.quantite = quantite;
        }

        // Getters et setters
        public Medicament LeMedicament { get => leMedicament; set => leMedicament = value; }
        public int Quantite { get => quantite; set => quantite = value; }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoucheMetier
{
    public class Rapport
    {
        private int id;
        private DateTime date;
        private string motif;
        private string bilan;
        private string idVisiteur;
        private int idMedecin;
        private Visiteur leVisiteur;
        private Medecin leMedecin;
        private List<EchantillonOffert> lesEchantillonsOfferts;

        // Constructeur
        public Rapport(int id, DateTime date, string motif, string bilan)
        {
            this.id = id;
            this.date = date;
            this.motif = motif;
            this.bilan = bilan;
        }

        public Rapport(int id, DateTime date, string motif, string bilan, string idVisiteur, int idMedecin)
        {
            this.id = id;
            this.date = date;
            this.motif = motif;
            this.bilan = bilan;
            this.idVisiteur = idVisiteur;
            this.idMedecin = idMedecin;
        }

        public Rapport(int id, DateTime date, string motif, string bilan, Visiteur visiteur, Medecin medecin)
        {
            this.id = id;
            this.date = date;
            this.motif = motif;
            this.bilan = bilan;
            this.leVisiteur = visiteur;
            this.leMedecin = medecin;
        }

        // Getters et setters
        public int Id { get => id; set => id = value; }
        public DateTime Date { get => date; set => date = value; }
        public string Motif { get => motif; set => motif = value; }
        public string Bilan { get => bilan; set => bilan = value; }

        public Visiteur LeVisiteur { get => leVisiteur; set => leVisiteur = value; }
        public Medecin LeMedecin { get => leMedecin; set => leMedecin = value; }
        public string IdVisiteur { get => idVisiteur; set => idVisiteur = value; }
        public int IdMedecin { get => idMedecin; set => idMedecin = value; }
        public List<EchantillonOffert> LesEchantillonsOfferts { get => lesEchantillonsOfferts; set => lesEchantillonsOfferts = value; }
    }

}


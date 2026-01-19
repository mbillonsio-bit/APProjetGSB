using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CoucheMetier;
using CoucheAccesDonnees;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices.ComTypes;
using System.Reflection;

namespace CoucheLogiqueMetier
{
    public class Manager
    {
        // Liste des médicaments
        private static List<Medicament> lesMeds;
        private static List<Medecin> lesMedecins;
        private static List<Famille> lesFamilles;
        private static List<Specialite> lesSpecialites;
        private static List<Visiteur> lesVisiteurs;

        // Constructeur
        public Manager()
        {
        }
        /// <summary>
        /// Charge la liste des médicaments a partir de la base de données en utilisant la classe Passerelle
        /// </summary>
        /// <returns></returns>
        public static List<Medicament> ChargerMedicaments()
        {
            lesMeds = Passerelle.GetLesMedicaments();
            return lesMeds;
        }
        /// <summary>
        /// Accesseur en lecture pour un médicament
        /// </summary>
        /// <param name="index">l'indice pour un médicament</param>
        /// <returns>le médicament situé à l'indice index</returns>
        public static Medicament GetMedicament(int index)
        {
            return lesMeds[index];
        }

        public static Famille GetFamilleDuMedicament(Medicament unMed)
        {
            Famille laFamille = Passerelle.GetFamilleDuMedicament(unMed.Id);
            unMed.Famille = laFamille;
            return laFamille;
        }

        public static List<Medecin> ChargerTousMedecins()
        {
            lesMedecins = Passerelle.GetTousMedecins();
            return lesMedecins;
        }

        public static Medecin GetMedecin(int index)
        {
            return lesMedecins[index];
        }

        public static Specialite ChargerSpecialiteDuMedecin(Medecin unMedecin)
        {
            Specialite laSpecialite = Passerelle.GetSpecialiteDuMedecin(unMedecin.Id);
            unMedecin.LaSpecialite = laSpecialite;
            return laSpecialite;
        }

        public static List<Famille> ChargerToutesFamilles()
        {
            lesFamilles = Passerelle.GetToutesFamilles();
            return lesFamilles;
        }

        public static Famille GetUneFamille(int index)
        {
            return lesFamilles[index];
        }

        public static void AjouterUnMedicament(Medicament unMedicament)
        {
            Passerelle.InsererMedicament(unMedicament);
        }

        public static List<Specialite> ChargerToutesSpecialites()
        {
            lesSpecialites = Passerelle.GetToutesSpecialites();
            return lesSpecialites;
        }

        public static Specialite GetUneSpecialite(int index)
        {
            return lesSpecialites[index];
        }

        public static void AjouterUnMedecin(Medecin unMedecin)
        {
            Passerelle.InsererMedecin(unMedecin);
        }

        public static List<Visiteur> ChargerTousVisiteurs()
        {
            lesVisiteurs = Passerelle.GetTousVisiteurs();
            return lesVisiteurs;
        }

        public static Visiteur GetUnVisiteur(int index)
        {
            return lesVisiteurs[index];
        }

        public static void AjouterUnVisiteur(Visiteur unVisiteur)
        {
            Passerelle.InsererVisiteur(unVisiteur);
        }

        public static List<Rapport> ChargerRapportsIdVisiteur(string idVisiteur)
        {
            List<Rapport> lesRapports = Passerelle.RechercherIdRapportVisiteur(idVisiteur);
            return lesRapports;
        }

        public static List<Rapport> ChargerRapportIdMedecin(string idMedecin)
        {
            List<Rapport> lesRapports = Passerelle.RechercherIdRapportMedecin(idMedecin);
            return lesRapports;
        }

        public static Rapport ChargerInfoRapport(int idRapport)
        {
            Rapport leRapport = Passerelle.GetInfoRapport(idRapport);
            Visiteur leVisiteur = Passerelle.GetInfoVisiteur(leRapport.IdVisiteur);
            Medecin leMedecin = Passerelle.GetInfoMedecin(leRapport.IdMedecin);
            Rapport infoRapport = new Rapport(idRapport, leRapport.Date, leRapport.Motif, leRapport.Bilan, leVisiteur, leMedecin);
            return infoRapport;
        }

        public static List<EchantillonOffert> ChargerEchantillonsIdRapport(int idRapport)
        {
            List<EchantillonOffert> lesEchantillonOfferts = Passerelle.GetTousEchantillonsIdRapport(idRapport);
            return lesEchantillonOfferts;
        }

    }
}

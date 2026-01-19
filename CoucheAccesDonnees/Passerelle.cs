using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CoucheMetier;

namespace CoucheAccesDonnees
{
    public class Passerelle
    {
        private static MySqlConnection connexion = null;

        private static MySqlConnection GetConnection()
        {
            if (connexion != null)
            {
                return connexion;
            }
            else
            {
                string chConnexion = "SERVER=localhost; DATABASE=bdgsb; UID=root;";
                connexion = new MySqlConnection(chConnexion);
                connexion.Open();
                return connexion;
            }
        }
        public static Medicament GetUnMedicament(string idMedicament)
        {
            Medicament unMedicament = null;

            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = "SELECT * FROM medicament WHERE id = '" + idMedicament + "'";
            MySqlDataReader rdr = cmd.ExecuteReader();

            if (rdr.Read())
            {
                unMedicament = MapperLigneMedicament(rdr);
            }
            rdr.Close();
            return unMedicament;
        }
        /// <summary>
        /// Crée un médicament a partir d'une ligne de résultat du jeu d'enregistrements
        /// </summary>
        /// <param name="rdr">le jeu d'enregistrements</param>
        /// <returns>le médicament correspondant a la ligne lue</returns>
        private static Medicament MapperLigneMedicament(MySqlDataReader rdr)
        {
            string id, nomCommercial, composition, effets, contreIndications;

            // Récupération des informations du médicament
            id = rdr["id"].ToString();
            nomCommercial = rdr["nomCommercial"].ToString();
            composition = rdr["composition"].ToString();
            effets = rdr["effets"].ToString();
            contreIndications = rdr["contreIndications"].ToString();


            // Instanciation du médicament
            Medicament unMedicament = new Medicament(id, nomCommercial, composition, effets, contreIndications);

            return unMedicament;
        }

        public static List<Medicament> GetLesMedicaments()
        {
            List<Medicament> lesMedicaments = new List<Medicament>();

            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = "SELECT * FROM medicament";
            MySqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                Medicament unMedicament = MapperLigneMedicament(rdr);
                lesMedicaments.Add(unMedicament);
            }
            rdr.Close();
            foreach(Medicament unMed in lesMedicaments)
            {
                Famille laFamille = GetFamilleDuMedicament(unMed.Id);
                unMed.Famille = laFamille;
            }
            return lesMedicaments;
        }

        public static Famille GetFamilleDuMedicament(string idMedicament)
        {
            Famille laFamille = null;

            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = "SELECT famille.* FROM famille INNER JOIN medicament " +
                "ON medicament.idFamille = famille.id WHERE medicament.id = '" + idMedicament + "'";

            MySqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                laFamille = MapperLigneFamille(rdr);
            }
            rdr.Close();
            return laFamille;
        }

        private static Famille MapperLigneFamille(MySqlDataReader rdr)
        {
            string id, libelle;
            id = rdr["id"].ToString();
            libelle = rdr["libelle"].ToString();

            Famille laFamille = new Famille(id, libelle);

            return laFamille;
        }

        public static List<Medecin> GetTousMedecins()
        {
            List<Medecin> lesMedecins = new List<Medecin>();

            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = "SELECT * FROM medecin";
            MySqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                Medecin unMedecin = MapperLigneMedecin(rdr);
                lesMedecins.Add(unMedecin);
            }
            rdr.Close();
           

            return lesMedecins;
        }

        private static Medecin MapperLigneMedecin(MySqlDataReader rdr)
        {
            string id, nom, prenom, adresse, tel, departement;

            // Récupération des informations du médicament
            id = rdr["id"].ToString();
            nom = rdr["nom"].ToString();
            prenom = rdr["prenom"].ToString();
            adresse = rdr["adresse"].ToString();
            tel = rdr["tel"].ToString();
            departement = rdr["departement"].ToString();


            // Instanciation du médicament
            Medecin unMedecin = new Medecin(id, nom, prenom, adresse, departement, tel);

            return unMedecin;
        }

        public static Specialite GetSpecialiteDuMedecin(string idMedecin)
        {
            Specialite laSpecialite = null;

            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = "SELECT specialite.* FROM specialite INNER JOIN medecin " +
                "ON medecin.idSpecialite = specialite.id WHERE medecin.id = '" + idMedecin + "'";

            MySqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                laSpecialite = MapperLigneSpecialite(rdr);
            }
            rdr.Close();
            return laSpecialite;
        }

        private static Specialite MapperLigneSpecialite(MySqlDataReader rdr)
        {
            string id, libelle;
            id = rdr["id"].ToString();
            libelle = rdr["specialite"].ToString();

            Specialite laSpecialite = new Specialite(id, libelle);

            return laSpecialite;
        }

        public static List<Famille> GetToutesFamilles()
        {
            List<Famille> lesFamilles = new List<Famille>();

            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = "SELECT * FROM famille";
            MySqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                Famille uneFamille = MapperLigneFamille(rdr);
                lesFamilles.Add(uneFamille);
            }
            rdr.Close();
            
            return lesFamilles;
        }

        public static void InsererMedicament(Medicament unMed)
        {
            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = $"INSERT INTO medicament VALUES ('{unMed.Id}','{unMed.NomCommercial}','{unMed.Famille.Id}','{unMed.Composition}','{unMed.Effets}','{unMed.ContreIndications}')";
            cmd.ExecuteNonQuery();
        }

        public static List<Specialite> GetToutesSpecialites()
        {
            List<Specialite> lesSpecialites = new List<Specialite>();

            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = "SELECT * FROM specialite";
            MySqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                Specialite uneSpecialite = MapperLigneSpecialite(rdr);
                lesSpecialites.Add(uneSpecialite);
            }
            rdr.Close();

            return lesSpecialites;
        }
        public static void InsererMedecin(Medecin unMedecin)
        {
            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = $"INSERT INTO medecin (nom,prenom,adresse,tel,idSpecialite,departement) VALUES ('{unMedecin.Nom}','{unMedecin.Prenom}','{unMedecin.Adresse}','{unMedecin.Tel}','{unMedecin.LaSpecialite.Id}',{unMedecin.Departement})";
            cmd.ExecuteNonQuery();
        }

        public static List<Visiteur> GetTousVisiteurs()
        {
            List<Visiteur> lesVisiteurs = new List<Visiteur>();

            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = "SELECT * FROM visiteur";
            MySqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                Visiteur unVisiteur = MapperLigneVisiteur(rdr);
                lesVisiteurs.Add(unVisiteur);
            }
            rdr.Close();

            return lesVisiteurs;
        }

        private static Visiteur MapperLigneVisiteur(MySqlDataReader rdr)
        {
            string id, nom, prenom, login, mdp, adresse,cp,ville,dateEmbauche ;
            id = rdr["id"].ToString();
            nom = rdr["nom"].ToString();
            prenom = rdr["prenom"].ToString();
            login = rdr["login"].ToString();
            mdp = rdr["mdp"].ToString();
            adresse = rdr["adresse"].ToString();
            cp = rdr["cp"].ToString();
            ville = rdr["ville"].ToString();
            dateEmbauche = rdr["dateEmbauche"].ToString();


            Visiteur leVisiteur = new Visiteur(id, nom, prenom, adresse, cp, ville, dateEmbauche, login, mdp);

            return leVisiteur;
        }
        public static void InsererVisiteur(Visiteur unVisiteur)
        {
            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = $"INSERT INTO visiteur VALUES ('{unVisiteur.Id}','{unVisiteur.Nom}','{unVisiteur.Prenom}','{unVisiteur.Login}','{unVisiteur.Mdp}','{unVisiteur.Adresse}','{unVisiteur.Cp}','{unVisiteur.Ville}','{unVisiteur.DateEmbauche}')";
            cmd.ExecuteNonQuery();
        }

        public static List<Rapport> RechercherIdRapportVisiteur(string idVisiteur)
        {
            List<Rapport> lesRapports = new List<Rapport>();

            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = $"SELECT * FROM rapport WHERE idVisiteur = '{idVisiteur}'";
            MySqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                Rapport unRapport = MapperLigneIdRapport(rdr);
                lesRapports.Add(unRapport);
            }
            rdr.Close();

            return lesRapports;
        }

        public static List<Rapport> RechercherIdRapportMedecin(string idMedecin)
        {
            List<Rapport> lesRapports = new List<Rapport>();

            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = $"SELECT * FROM rapport WHERE idMedecin = {idMedecin}";
            MySqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                Rapport unRapport = MapperLigneIdRapport(rdr);
                lesRapports.Add(unRapport);
            }
            rdr.Close();

            return lesRapports;
        }

        public static Rapport GetInfoRapport(int id)
        { 
            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = $"SELECT * FROM rapport WHERE id = {id}";
            MySqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            Rapport unRapport = MapperLigneIdRapport(rdr);
            rdr.Close();
            return unRapport;
        }

        public static Visiteur GetInfoVisiteur(string id)
        {
            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = $"SELECT * FROM visiteur WHERE id = '{id}'";
            MySqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            Visiteur unVisiteur = MapperLigneVisiteur(rdr);
            rdr.Close();
            return unVisiteur;
        }

        public static Medecin GetInfoMedecin(int id)
        {
            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = $"SELECT * FROM medecin WHERE id = {id}";
            MySqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            Medecin unMedecin = MapperLigneMedecin(rdr);
            rdr.Close();
            return unMedecin;
        }

        private static Rapport MapperLigneIdRapport(MySqlDataReader rdr)
        {
            int idRapport, idMedecin;
            string id, motif, bilan, idVisiteur;
            DateTime date;
            id = rdr["id"].ToString();
            motif = rdr["motif"].ToString();
            bilan = rdr["bilan"].ToString();
            idVisiteur = rdr["idVisiteur"].ToString();
            idMedecin = (int)rdr["idMedecin"];
            date = Convert.ToDateTime(rdr["date"].ToString());
            idRapport = int.Parse(id);


            Rapport leRapport = new Rapport(idRapport, date, motif, bilan, idVisiteur, idMedecin);

            return leRapport;
        }

        public static List<EchantillonOffert> GetTousEchantillonsIdRapport(int idRapport)
        {
            List<EchantillonOffert> lesEchantillonOfferts = new List<EchantillonOffert>();
            List<Medicament> lesMedicaments = GetLesMedicaments();

            MySqlCommand cmd = GetConnection().CreateCommand();
            cmd.CommandText = $"SELECT * FROM offrir where idRapport = {idRapport}";
            MySqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                EchantillonOffert unEchantillonOffert = MapperLigneEchantillons(rdr, lesMedicaments);
                lesEchantillonOfferts.Add(unEchantillonOffert);
            }
            rdr.Close();

            return lesEchantillonOfferts;
        }

        private static EchantillonOffert MapperLigneEchantillons(MySqlDataReader rdr, List<Medicament> lesMedicaments)
        {
            string idMedicament, quantite;
            Medicament unMedicament = null;
            idMedicament = rdr["idMedicament"].ToString();
            quantite = rdr["quantite"].ToString();
            foreach (Medicament unMed in lesMedicaments)
            {
                if (unMed.Id == idMedicament)
                {
                    unMedicament = unMed;
                }
            }

            EchantillonOffert leEchantillonOffert = new EchantillonOffert(unMedicament, int.Parse(quantite));

            return leEchantillonOffert;
        }


    }
}
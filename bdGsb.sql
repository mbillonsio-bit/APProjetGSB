DROP DATABASE IF EXISTS bdGsb;
CREATE DATABASE IF NOT EXISTS bdGsb;
USE bdGsb;


-- Structure de la table FraisForfait
CREATE TABLE IF NOT EXISTS FraisForfait
(
  id 		varchar(3) NOT NULL,
  libelle 	varchar(20) DEFAULT NULL,
  montant 	decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (id)
) 
ENGINE=InnoDB;


-- Structure de la table Etat
CREATE TABLE IF NOT EXISTS Etat
(
  id 		varchar(2) NOT NULL,
  libelle 	varchar(30) DEFAULT NULL,
  PRIMARY KEY (id)
) 
ENGINE=InnoDB;


-- Structure de la table Visiteur
CREATE TABLE IF NOT EXISTS Visiteur
(
  id 		varchar(4) NOT NULL,
  nom 		varchar(30) DEFAULT NULL,
  prenom 	varchar(30)  DEFAULT NULL, 
  login 	varchar(20) DEFAULT NULL,
  mdp 		varchar(20) DEFAULT NULL,
  adresse 	varchar(30) DEFAULT NULL,
  cp 		varchar(5) DEFAULT NULL,
  ville 	varchar(30) DEFAULT NULL,
  dateEmbauche date DEFAULT NULL,
  PRIMARY KEY (id)
) 
ENGINE=InnoDB;


-- Structure de la table FicheFrais
CREATE TABLE IF NOT EXISTS Fichefrais 
(
  idVisiteur 	varchar(4) NOT NULL,
  mois 			varchar(6) NOT NULL,
  nbJustificatifs int(11) DEFAULT NULL,
  montantValide decimal(10,2) DEFAULT NULL,
  dateModif 	date DEFAULT NULL,
  idEtat 		varchar(2) DEFAULT 'CR',
  PRIMARY KEY (idVisiteur,mois),
  FOREIGN KEY (idEtat) REFERENCES Etat(id),
  FOREIGN KEY (idVisiteur) REFERENCES Visiteur(id)
) 
ENGINE=InnoDB;


-- Structure de la table LigneFraisForfait
CREATE TABLE IF NOT EXISTS LigneFraisForfait 
(
  idVisiteur 	varchar(4) NOT NULL,
  mois 			varchar(6) NOT NULL,
  idFraisForfait varchar(3) NOT NULL,
  quantite 		int(11) DEFAULT NULL,
  PRIMARY KEY (idVisiteur,mois,idFraisForfait),
  FOREIGN KEY (idVisiteur, mois) REFERENCES FicheFrais(idVisiteur, mois),
  FOREIGN KEY (idFraisForfait) REFERENCES FraisForfait(id)
) 
ENGINE=InnoDB;


-- Structure de la table LigneFraisHorsForfait
CREATE TABLE IF NOT EXISTS LigneFraisHorsForfait 
(
  id 			int(11) NOT NULL auto_increment,
  idVisiteur 	varchar(4) NOT NULL,
  mois 			varchar(6) NOT NULL,
  libelle 		varchar(100) DEFAULT NULL,
  date 			date DEFAULT NULL,
  montant 		decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (idVisiteur, mois) REFERENCES FicheFrais(idVisiteur, mois)
) 
ENGINE=InnoDB;


-- Structure de la table Famille
CREATE TABLE IF NOT EXISTS Famille 
(
  id 	  varchar(10) NOT NULL,
  libelle varchar(80) NOT NULL,
  PRIMARY KEY (id)
) 
ENGINE=InnoDB;


-- Structure de la table Specialite
CREATE TABLE IF NOT EXISTS Specialite 
(
  id 			varchar(3) NOT NULL,
  specialite 	varchar(64) NOT NULL,
  PRIMARY KEY (id)
) 
ENGINE=InnoDB;


-- Structure de la table Medicament
CREATE TABLE IF NOT EXISTS Medicament 
(
  id 			varchar(30) NOT NULL,
  nomCommercial varchar(80) NOT NULL,
  idFamille  	varchar(10) NOT NULL,
  composition 	varchar(200) NOT NULL,
  effets 		varchar(200) NOT NULL,
  contreIndications varchar(200) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (idFamille) REFERENCES Famille(id)
) 
ENGINE=InnoDB;


-- Structure de la table Medecin
CREATE TABLE IF NOT EXISTS Medecin 
(
  id 			int(11) NOT NULL AUTO_INCREMENT,
  nom 			varchar(30) NOT NULL,
  prenom 		varchar(30) NOT NULL,
  adresse 		varchar(80) NOT NULL,
  tel 			varchar(15) DEFAULT NULL,
  idSpecialite 	varchar(3) DEFAULT NULL,
  departement 	int(11) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (idSpecialite) REFERENCES  Specialite(id)
) 
ENGINE=InnoDB;


-- Structure de la table Rapport
CREATE TABLE IF NOT EXISTS Rapport 
(
  id int(11) NOT NULL AUTO_INCREMENT,
  date date DEFAULT NULL,
  motif varchar(100),
  bilan varchar(100),
  idVisiteur char(4) NOT NULL,
  idMedecin int(11) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (idVisiteur) REFERENCES  Visiteur(id),
  FOREIGN KEY (idMedecin) REFERENCES  Medecin(id)
) 
ENGINE=InnoDB;


-- Structure de la table Offrir
CREATE TABLE IF NOT EXISTS Offrir
(
	idRapport 		int(11) NOT NULL,
	idMedicament 	varchar(30) NOT NULL,
	quantite 		int(2),
	PRIMARY KEY (idRapport,idMedicament),
	FOREIGN KEY (idRapport) REFERENCES  Rapport(id),
	FOREIGN KEY (idMedicament) REFERENCES  Medicament(id)
) 
ENGINE=InnoDB;

-- Contenu des tables

-- Contenu FraisForfait
INSERT INTO FraisForfait (id, libelle, montant) VALUES
('ETP', 'Forfait Etape', 110.00),
('KM', 'Frais Kilométrique', 0.62),
('NUI', 'Nuitée Hôtel', 80.00),
('REP', 'Repas Restaurant', 25.00);


-- Contenu Etat
INSERT INTO Etat (id, libelle) VALUES
('RB', 'Remboursée'),
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('VA', 'Validée et mise en paiement');


-- Contenu Visiteur
INSERT INTO visiteur (id, nom, prenom, login, mdp, adresse, cp, ville, dateEmbauche) VALUES
('a131', 'Villechalane', 'Louis', 'lvillachane', 'jux7g', '8 rue des Charmes', '46000', 'Cahors', '2012-12-21'),
('a17', 'Andre', 'David', 'dandre', 'oppg5', '1 rue Petit', '46200', 'Lalbenque', '2021-11-23'),
('a55', 'Bedos', 'Christian', 'cbedos', 'gmhxd', '1 rue Peranud', '46250', 'Montcuq', '2022-01-12'),
('a93', 'Tusseau', 'Louis', 'ltusseau', 'ktp3s', '22 rue des Ternes', '46123', 'Gramat', '2007-05-01'),
('b13', 'Bentot', 'Pascal', 'pbentot', 'doyw1', '11 allée des Cerises', '46512', 'Bessines', '2023-07-09'),
('b16', 'Bioret', 'Luc', 'lbioret', 'hrjfs', '1 Avenue gambetta', '46000', 'Cahors', '2007-05-11'),
('b19', 'Bunisset', 'Francis', 'fbunisset', '4vbnd', '10 rue des Perles', '93100', 'Montreuil', '2024-10-21'),
('b25', 'Bunisset', 'Denise', 'dbunisset', 's1y1r', '23 rue Manin', '75019', 'paris', '2019-12-05'),
('b28', 'Cacheux', 'Bernard', 'bcacheux', 'uf7r3', '114 rue Blanche', '75017', 'Paris', '2018-11-12'),
('b34', 'Cadic', 'Eric', 'ecadic', '6u8dc', '123 avenue de la République', '75011', 'Paris', '2023-09-23'),
('b4', 'Charoze', 'Catherine', 'ccharoze', 'u817o', '100 rue Petit', '75019', 'Paris', '2014-12-13'),
('b50', 'Clepkens', 'Christophe', 'cclepkens', 'bw1us', '12 allée des Anges', '93230', 'Romainville', '2020-08-11'),
('b59', 'Cottin', 'Vincenne', 'vcottin', '2hoh9', '36 rue Des Roches', '93100', 'Monteuil', '2008-11-18'),
('c14', 'Daburon', 'François', 'fdaburon', '7oqpv', '13 rue de Chanzy', '94000', 'Créteil', '2009-02-11'),
('c3', 'De', 'Philippe', 'pde', 'gk9kx', '13 rue Barthes', '94000', 'Créteil', '2017-12-14'),
('c54', 'Debelle', 'Michel', 'mdebelle', 'od5rt', '181 avenue Barbusse', '93210', 'Rosny', '2012-11-23'),
('d13', 'Debelle', 'Jeanne', 'jdebelle', 'nvwqq', '134 allée des Joncs', '44000', 'Nantes', '2011-05-11'),
('d51', 'Debroise', 'Michel', 'mdebroise', 'sghkb', '2 Bld Jourdain', '44000', 'Nantes', '2008-04-17'),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', 'f1fob', '14 Place d Arc', '45000', 'Orléans', '2012-11-12'),
('e24', 'Desnost', 'Pierre', 'pdesnost', '4k2o5', '16 avenue des Cèdres', '23200', 'Guéret', '2010-02-05'),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '44im8', '18 rue de l église', '23120', 'GrandBourg', '2017-08-01'),
('e49', 'Duncombe', 'Claude', 'cduncombe', 'qf77j', '19 rue de la tour', '23100', 'La souteraine', '2021-10-10'),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', 'y2qdu', '25 place de la gare', '23200', 'Gueret', '2022-09-01'),
('e52', 'Eynde', 'Valérie', 'veynde', 'i7sn3', '3 Grand Place', '13015', 'Marseille', '2024-11-01'),
('f21', 'Finck', 'Jacques', 'jfinck', 'mpb3t', '10 avenue du Prado', '13002', 'Marseille', '2010-11-10'),
('f39', 'Frémont', 'Fernande', 'ffremont', 'xs5tq', '4 route de la mer', '13012', 'Allauh', '2016-10-01'),
('f4', 'Gest', 'Alain', 'agest', 'dywvt', '30 avenue de la mer', '13025', 'Berre', '2024-11-01');


-- Contenu Famille
INSERT INTO Famille VALUES
('AA','Antalgiques en association'),
('AAA','Antalgiques antipyréques en association'),
('AAC','Antidépresseur d action centrale'),
('AAH','Antivertigineux antihistaminique H1'),
('ABA','Antibiotique antituberculeux'),
('ABC','Antibiotique antiacnénique local'),
('ABP','Antibiotique de la famille des béta-lactamines -pénicilline A-'),
('AFC','Antibiotique de la famille des cyclines'),
('AFM','Antibiotique de la famille des macrolides'),
('AH','Antihistaminique H1 local'),
('AIM','Antidépresseur imipraminique -tricyclique-'),
('AIN','Antidépresseur inhibiteur sélectif de la recapture de la sétonine'),
('ALO','Antibiotique local -ORL-'),
('ANS','Antidépresseur IMAO non sélectif'),
('AO','Antibiotique ophtalmique'),
('AP','Antipsychotique normothymique'),
('AUM','Antibiotique urinaire minute'),
('CRT','Corticoide, antibiotique et antifongique à usage local'),
('HYP','Hypnotique antihistaminique'),
('PSA','Psychostimulant antiasthésique');


-- Contenu Medicament
INSERT INTO Medicament VALUES
('3MYC7','TRIMYCINE','CRT','Triamcinolone acétonide + Néomycine + Nystatine','Ce médicament est un corticoïde à activité forte ou très forte associé à  un antibiotique et un antifongique  utilisé en application locale dans certaines atteintes cutanées surinfectées.','Ce médicament est contre-indiqué en cas d allergie à l un des constituants d infections.'),
('ADIMOL9','ADIMOL','ABP','Amoxicilline + Acide clavulanique','Ce médicament  plus puissant que les pénicillines simples est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d allergie aux pénicillines ou aux céphalosporines.'),
('AMOPIL7','AMOPIL','ABP','Amoxicilline','Ce médicament  plus puissant que les pénicillines simples est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d allergie aux pénicillines. Il doit être administré avec prudence en cas d allergie aux céphalosporines.'),
('AMOX45','AMOXAR','ABP','Amoxicilline','Ce médicament  plus puissant que les pénicillines simples est utilisé pour traiter des infections bactériennes spécifiques.','La prise de ce médicament peut rendre positifs les tests de dépistage du dopage.'),
('AMOXIG12','AMOXI Gé','ABP','Amoxicilline','Ce médicament  plus puissant que les pénicillines simples  est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d allergie aux pénicillines. Il doit être administré avec prudence en cas d allergie aux céphalosporines.'),
('APATOUX22','APATOUX Vitamine C','ALO','Tyrothricine + Tétracaïne + Acide ascorbique (Vitamine C)','Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.','Ce médicament est contre-indiqué en cas d allergie à  l un des constituants  en cas de phénylcétonurie et chez l enfant de moins de 6 ans.'),
('BACTIG10','BACTIGEL','ABC','Erythromycine','Ce médicament est utilisé en application locale pour traiter l acné et les infections cutanées bactériennes associées.','Ce médicament est contre-indiqué en cas d allergie aux antibiotiques de la famille des macrolides ou des lincosanides.'),
('BACTIV13','BACTIVIL','AFM','Erythromycine','Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d allergie aux macrolides (dont le chef de file est l érythromycine).'),
('BITALV','BIVALIC','AAA','Dextropropoxyphène + Paracétamol','Ce médicament est utilisé pour traiter les douleurs d intensité modérée ou intense.','Ce médicament est contre-indiqué en cas d allergie aux médicaments de cette famille  d insuffisance hépatique ou d insuffisance rénale.'),
('CARTION6','CARTION','AAA','Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol','Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.','Ce médicament est contre-indiqué en cas de troubles de la coagulation (tendances aux hémorragies)  d ulcère gastroduodénal  maladies graves du foie.'),
('CLAZER6','CLAZER','AFM','Clarithromycine','Ce médicament est utilisé pour traiter des infections bactériennes spécifiques. Il est également utilisé dans le traitement de l ulcère gastro-duodénal  en association avec d autres médicaments.','Ce médicament est contre-indiqué en cas d allergie aux macrolides (dont le chef de file est l érythromycine).'),
('DEPRIL9','DEPRAMIL','AIM','Clomipramine','Ce médicament est utilisé pour traiter les épisodes dépressifs sévères  certaines douleurs rebelles  les troubles obsessionnels compulsifs et certaines énurésies chez l enfant.','Ce médicament est contre-indiqué en cas de glaucome ou d adénome de la prostate  d infarctus récent.'),
('DIMIRTAM6','DIMIRTAM','AAC','Mirtazapine','Ce médicament est utilisé pour traiter les épisodes dépressifs sévères.','La prise de ce produit est contre-indiquée en cas de d allergie à  l un des constituants.'),
('DOLRIL7','DOLORIL','AAA','Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol','Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.','Ce médicament est contre-indiqué en cas d allergie au paracétamol ou aux salicylates.'),
('DORNOM8','NORMADOR','HYP','Doxylamine','Ce médicament est utilisé pour traiter l insomnie chez l adulte.','Ce médicament est contre-indiqué en cas de glaucome  de certains troubles urinaires (rétention urinaire) et chez l enfant de moins de 15 ans.'),
('EQUILARX6','EQUILAR','AAH','Méclozine','Ce médicament est utilisé pour traiter les vertiges et pour prévenir le mal des transports.','Ce médicament ne doit pas être utilisé en cas d allergie au produit  en cas de glaucome ou de rétention urinaire.'),
('EVILR7','EVEILLOR','PSA','Adrafinil','Ce médicament est utilisé pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet agé.','Ce médicament est contre-indiqué en cas d allergie à  l un des constituants.'),
('INSXT5','INSECTIL','AH','Diphénydramine','Ce médicament est utilisé en application locale sur les piqûres d insecte et l urticaire.','Ce médicament est contre-indiqué en cas d allergie aux antihistaminiques.'),
('JOVAI8','JOVENIL','AFM','Josamycine','Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d allergie aux macrolides (dont le chef de file est l érythromycine).'),
('LIDOXY23','LIDOXYTRACINE','AFC','Oxytétracycline +Lidocaïne','Ce médicament est utilisé en injection intramusculaire pour traiter certaines infections spécifiques.','Ce médicament est contre-indiqué en cas d allergie à  l un des constituants. Il ne doit pas être associé aux rétinoïdes.'),
('LITHOR12','LITHORINE','AP','Lithium','Ce médicament est indiqué dans la prévention des psychoses maniaco-dépressives ou pour traiter les états maniaques.','Ce médicament ne doit pas être utilisé si vous êtes allergique au lithium. Avant de prendre ce traitement  signalez à  votre médecin traitant si vous souffrez d insuffisance rénale  .'),
('PARMOL16','PARMOCODEINE','AA','Codéine + Paracétamol','Ce médicament est utilisé pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.','Ce médicament est contre-indiqué en cas d allergie à  l un des constituants  chez l enfant de moins de 15 Kg  en cas d insuffisance hépatique ou respiratoire.'),
('PHYSOI8','PHYSICOR','PSA','Sulbutiamine','Ce médicament est utilisé pour traiter les baisses d activité physique ou psychique  souvent dans un contexte de dépression.','Ce médicament est contre-indiqué en cas d allergie à  l un des constituants.'),
('PIRIZ8','PIRIZAN','ABA','Pyrazinamide','Ce médicament est utilisé  en association à  d autres antibiotiques  pour traiter la tuberculose.','Ce médicament est contre-indiqué en cas d allergie à  l un des constituants  d insuffisance rénale ou hépatique d hyperuricémie ou de porphyrie.'),
('POMDI20','POMADINE','AO','Bacitracine','Ce médicament est utilisé pour traiter les infections oculaires de la surface de l oeil.','Ce médicament est contre-indiqué en cas d allergie aux antibiotiques appliqués localement.'),
('TROXT21','TROXADET','AIN','Paroxétine','Ce médicament est utilisé pour traiter la dépression et les troubles obsessionnels compulsifs. Il peut également être utilisé en prévention des crises de panique avec ou sans agoraphobie.','Ce médicament est contre-indiqué en cas d allergie au produit.'),
('TXISOL22','TOUXISOL','ALO','Tyrothricine + Acide ascorbique (Vitamine C)','Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.','Ce médicament est contre-indiqué en cas d allergie à  l un des constituants et chez l enfant de moins de 6 ans.'),
('URIEG6','URIREGUL','AUM','Fosfomycine trométamol','Ce médicament est utilisé pour traiter les infections urinaires simples chez la femme de moins de 65 ans.','La prise de ce médicament est contre-indiquée en cas d allergie à l un des constituants et d insuffisance rénale.');


-- Contenu Specialite
INSERT INTO Specialite VALUES
('GEN','GENERALISTE'),
('PSY','PSYCHIATRE'),
('INF','INFIRMIER'),
('CHC','CHEF DE CLINIQUE'),
('OBS','OBSTETRICIEN'),
('CHR','CHIRURGIE'),
('MAS','MedecinE APPLIQUEE AUX SPORTS'),
('HOM','HOMEOPATHIE'),
('URG','URGENTISTE'),
('ACU','ACUPONCTURE'),
('ALL','ALLERGOLOGIE'),
('GER','GERONTOLOGIE'),
('ANG','ANGEIOLOGIE'),
('OST','OSTEOPATHIE');


-- Contenu Medecin
INSERT INTO Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Prosper','25 rue Anatole France BRIANCON 05100','0485244174','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ferdinand','Anne-Lucie','39 rue des gatinnes BILLIAT 01200','0433812572','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pastor','Camille','58 rue du stade MESSINCOURT 08110','0365489929','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Certifat','Alice','12 rue des Pigeons JOIGNY-SUR-MEUSE 08700','0319692016','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipillon','Vénus','55 rue du 14 juillet ORCIERES 05170','0421670911','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shavert','Anne-Lucie','49 rue des Ormes ATTILLY 02490','0313817061','INF',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nasri','Marie','78 rue de Poligny YONCQ 08210','0388716930','HOM',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamois','Andrew','29 rue des Pigeons SAVINES-LE-LAC 05160','0477740994','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jamgotchian','Julien','45 rue de du général Scott THIN-LE-MOUTIER 08460','0321760709','MAS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cherioux','Aurèle','16 rue Alphonse Daudet ORCIERES 05170','0485568083','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hansbern','Johnny','74 rue de Paris SAVINES-LE-LAC 05160','0417789322','CHC',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Billahian','Andrée','29 rue Edouard Hériot SAINT-SAUVEUR 05200','0439352503','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zerbib','Gilles','33 rue Commandant Hériot MONTIGNY-SUR-MEUSE 08170','0334037052','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Varditi','Vénus','14 rue de la poste BANCIGNY 02140','0313832194','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Labatiste','Cristophe','81 rue Bonaparte AUBENTON 02500','0366612144','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gaudin','Jules','85 rue Hector Berlioz BRIANCON 05100','0459073011','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cheroudy','Julienne','17 rue Lampion AUGIREIN 09800','0524077425','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lirevien','John','92 rue du général de Gaulle SORBIERS 05150','0484328394','HOM',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pistache','Cristophe','1 rue des Accacias BELLOC 09600','0564847694','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nazaoui','Catherine','8 rue des Accacias MONCEAU-SUR-OISE 02120','0352679072','HOM',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Vipère','Julien','51 rue Bonaparte CAMON 09500','0552863581','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Nohan','69 rue Mallarmé AX-LES-THERMES 09110','0596648531','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chemkaoui','Julienne','72 rue Pasteur SAVOURNON 05700','0490527954','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ségura','Irénée','28 rue Anatole France BELLEY 01300','0486481045','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','François','78 rue des Epines AZY-SUR-MARNE 02400','0318212781','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Roland','Charles-Edouard','86 rue Louis Aragon BILLIAT 01200','0446961025','HOM',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prestoriat','Jérémy','89 rue de la pointe SAINT-FIRMIN 05800','0438318333','HOM',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Varicelle','Johnny','19 rue de la Tour JOIGNY-SUR-MEUSE 08700','0341883832','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zidanne','Hector','29 rue de la pointe BOURG-EN-BRESSE 01000','0431450970','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hatiche','Mohammed','30 rue Pasteur BEZAC 09100','0591677334','MAS',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sursarshill','Annie','82 rue Mallarmé SIGOYER 05130','0487018886','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cherioux','Caline','27 rue de Marigny BRIANCON 05100','0444253472','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framier','Jordan','53 rue Alphonse Daudet SAINT-LAURENT-SUR-SAONE 01750','0463813731','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Falmino','Anne-Lucie','94 rue de la pointe BOULIGNEUX 01330','0462262613','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Klébert','Reissa','63 rue Alphonse Daudet AX-LES-THERMES 09110','0563092583','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mérieux','Anne-Jeanne','26 rue des Armées AVANCON 05230','0442237548','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Merlieux','Fatima','24 rue Albert Camus PELVOUX 05340','0411439067','URG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zomar','Alice','33 rue de la Tour BOURG-EN-BRESSE 01000','0479660588','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Faure','Béatrice','25 rue des Lilas LAUNOIS-SUR-VENCE 08430','0389426738','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Balittin','Armelle','48 rue de Paris REOTIER 05600','0467247607','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Alprousky','Anselme','19 rue des pyramides ARANDAS 01230','0434638475','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Faure','John','23 rue Alphonse Daudet SORBIERS 05150','0473380415','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mérieux','Firmin','59 rue de la Pergolat FLEVILLE 08250','0337420570','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Yanshen','Anne','59 rue de du général Scott MONTCY-NOTRE-DAME 08090','0310431717','ACU',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bouglieux','Gilles','65 rue des oiseaux ARROUT 09800','0578097401','MAS',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Braquet','Anne-Jeanne','29 rue Petit BEDEILLE 09230','0523206238','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Vipère','Anne-Lucie','14 rue Petit BEZAC 09100','0512011679','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Billahian','Carole','86 rue du capitaine Fraquasse BETTANT 01500','0490382365','HOM',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanscart','Amiel','22 rue Lampion BELLEY 01300','0463584743','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Natale','Martial','75 rue du capitaine Crochet ATTILLY 02490','0361985743','CHC',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epriniche','Anne-Laure','60 rue Pernod BETTANT 01500','0437621473','CHC',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Oumar','Prosper','46 rue de la Tour REOTIER 05600','0450401007','ACU',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Brouzais','Fatima','95 rue de Poligny BOURG-EN-BRESSE 01000','0481057435','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Guimauve','Jérome','39 rue Commandant Hériot BANCIGNY 02140','0315759754','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Guimauve','Ines','90 rue Pernod ROCHEBRUNE 05190','0444572962','ALL',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipion','Jérémie','45 rue des Chantereines FLOING 08200','0333621591','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chevalier','Anne-Marie','48 rue du 14 juillet BRIANCON 05100','0478777229','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Heroudy','Armelle','88 rue des Argonautes DOMMARTIN 01380','0482500579','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Nazaoui','Anselme','18 rue de du général Scott BOURG-EN-BRESSE 01000','0428387190','GER',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frequin','Aude','98 rue Hector Berlioz BOULIGNEUX 01330','0460116931','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Razaoui','Camille','43 rue de la poste ASTON 09310','0554877193','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nahraoui','Bernard','69 rue Debussy AX-LES-THERMES 09110','0592618819','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chakraoui','Johnny','27 rue Victor Hugo MONTCEAUX 01090','0410938634','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lopes','Aude','40 rue Mellarmé SAINT-FIRMIN 05800','0434328795','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charmieux','Anne-Lucie','80 rue Victor Hugo LAVAL-MORENCY 08150','0354570788','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Vivian','Alice','48 rue des perles blanches QUATRE-CHAMPS 08400','0351022549','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Astoria','Bénédicte','44 rue des Pigeons SAINT-LAURENT-SUR-SAONE 01750','0453817641','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Ferdinand','Précilia','65 rue St Denis ASTON 09310','0574385413','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charlequin','Andrée','86 rue des Pigeons AX-LES-THERMES 09110','0512919575','CHC',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Merlieux','Bertrand','87 rue du 14 juillet BARZY-SUR-MARNE 02850','0389988201','ALL',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Hamouti','Jérome','40 rue Bonaparte MAYOT 02800','0380247692','CHC',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pionneer','Victor','91 rue Malraux MEZIERES-SUR-OISE 02240','0396223586','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pistache','Victor','86 rue du capitaine Fraquasse SAVINES-LE-LAC 05160','0424098074','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charmieux','Bertrand','44 rue du capitaine Fraquasse MONTIGNY-SUR-MEUSE 08170','0365814281','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jarrinovski','Adrien','47 rue Commandant Hériot AUDRESSEIN 09800','0561293920','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chermis','Irénée','42 rue des Epines SAINT-LAURENT-SUR-SAONE 01750','0432573377','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pizoulais','Amélie','95 rue Anatole France HERBEUVAL 08370','0395342234','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gullit','Jordan','18 rue Blainville AVANCON 05230','0410805260','CHC',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zomar','Anne-Laure','49 rue des Princes OYONNAX 01100','0495914341','CHR',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Natale','Ingrid','90 rue des Lilas BELLOC 09600','0550136460','CHR',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prouteau','Yoan','2 rue Beaudelaire FALAISE 08400','0349609708','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zebitoun','Jules','61 rue Petit SORBIERS 05150','0453597713','ANG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gaudillot','Jérome','12 rue Agniel ABBECOURT 02300','0336592352','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pionneer','Bernard','46 rue des Néfliers ARROUT 09800','0593876907','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznavourian','Anne-Jeanne','94 rue de la Tour AUBENTON 02500','0315358087','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zingaro','John','13 rue de la recette MONT-LAURENT 08130','0324815927','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Thardieux','Aurélien','34 rue Alphonse Daudet MONTCY-NOTRE-DAME 08090','0388838695','ALL',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zingaro','Anne-Marie','50 rue Commandant Mouchotte BARENTON-SUR-SERRE 02270','0380767789','INF',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Nazaoui','Marie','36 rue de la rose BOULIGNEUX 01330','0459841705','HOM',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Amoudi','Bertrand','80 rue Beaudelaire FLOING 08200','0370254981','HOM',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mingelle','Austine','37 rue Agniel BILLIAT 01200','0498702952','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zingaro','Aline','85 rue des Cavaux AUBENTON 02500','0320874526','ACU',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zebitoun','Béatrice','98 rue Perdue AUDRESSEIN 09800','0550107365','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charles','Fernand','21 rue Blainville ABBECOURT 02300','0379546875','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Brouzais','Anne-Lucie','47 rue des Anses bleues BARENTON-SUR-SERRE 02270','0357798474','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bridel','Julienne','89 rue du stade VAUX-CHAMPAGNE 08130','0321409034','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sursarshill','Alain','21 rue des pyramides MONTCY-NOTRE-DAME 08090','0355126171','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radesky','André','70 rue de la rose THIN-LE-MOUTIER 08460','0383574338','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Anne-Lucie','28 rue du Mont AX-LES-THERMES 09110','0525425981','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Roland','Jérémie','83 rue de la pointe MONTCY-NOTRE-DAME 08090','0344175754','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zola','Alizée','23 rue des Néfliers BARZY-SUR-MARNE 02850','0318063658','CHC',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lafricain','Béatrice','75 rue de la poste SIGOYER 05130','0499728475','ALL',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shavert','Jimmy','57 rue du 14 juillet BEDEILLE 09230','0579403405','URG',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Labuze','Martin','77 rue Edouard Hériot PELVOUX 05340','0465821962','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charminet','Astine','77 rue des Chantereines SIGOYER 05130','0443207794','URG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Francis','Julien','75 rue des Epines EVIGNY 08090','0353124513','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lièvremont','Anne-Lucie','64 rue des Pigeons BEAUMONT-EN-BEINE 02300','0357357391','CHR',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Martinet','Fernand','21 rue Commandant Hériot ARROUT 09800','0533982064','ALL',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pletziglass','Aurélien','13 rue Debussy AUGIREIN 09800','0550671849','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Raminski','Hector','54 rue des Chantereines BEAUMONT-EN-BEINE 02300','0397960460','MAS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Bénédicte','7 rue de Paris BOURG-EN-BRESSE 01000','0483574560','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kopa','Aristote','35 rue des Argonautes FEPIN 08170','0321622783','ACU',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framier','Anémone','66 rue Blainville ARROUT 09800','0561274309','CHR',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Vivian','Hamed','96 rue de la Tour SAINT-CREPIN 05600','0466381035','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rastuffe','Précilia','45 rue des Chantereines MONTIGNY-SUR-MEUSE 08170','0319515228','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epriniche','Ines','54 rue de la Tour AUGIREIN 09800','0522353355','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Newmann','Alizée','32 rue des gatinnes SAINT-SAUVEUR 05200','0479723538','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nazaoui','Reissa','36 rue Malraux FLEVILLE 08250','0389034128','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Protonne','Anne-Sophie','27 rue Anatole France LAUNOIS-SUR-VENCE 08430','0319617909','ANG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rastuffe','Hamed','44 rue de la Pergolat AGUILCOURT 02190','0391017673','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Politzer','Alain','97 rue des Anges SAINT-LAURENT-SUR-SAONE 01750','0420673509','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Margotton','Rodolphe','5 rue de la pointe AUGIREIN 09800','0568080361','ALL',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kravatte','Andrée','26 rue des Argonautes BELLEY 01300','0417979762','ALL',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kobel','Hamed','52 rue des Argonautes BILLIAT 01200','0434883323','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Vispendieu','Mohammed','33 rue Bonaparte VAUX-CHAMPAGNE 08130','0388412366','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Billahian','Patricia','86 rue de la poste ASTON 09310','0544573807','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lopez','Aurélien','51 rue Debussy SAINT-FIRMIN 05800','0429493464','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shavert','Firmin','69 rue de Paris MEZIERES-SUR-OISE 02240','0327148898','INF',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nahraoui','Robert','18 rue des Pigeons MAYOT 02800','0350756815','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamonix','Patrick','35 rue des Cyprés MEZIERES-SUR-OISE 02240','0375111486','HOM',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charlequin','Catherine','67 rue des Pigeons NEUVILLE-LES-DAMES 01400','0445004508','HOM',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prestor','Aude','68 rue des Epines BAGERT 09230','0511378600','ALL',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fressinet','François','38 rue Agniel PELVOUX 05340','0466704922','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charmis','Habib','96 rue de Marigny SAINTE-MARIE 05150','0472203933','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznavourian','Annie','98 rue des Argonautes FRESSANCOURT 02800','0324461914','HOM',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Julienne','59 rue des gatinnes BARZY-SUR-MARNE 02850','0311581103','CHC',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kopa','Alain','48 rue des Epines VAUX-CHAMPAGNE 08130','0353929274','CHC',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Merlieux','Aristote','42 rue Edouard Hériot BAGERT 09230','0597457423','CHC',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pionneer','Catherine','53 rue des hirondelles SAINT-FIRMIN 05800','0473864972','CHC',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prestor','Fatima','7 rue Alphonse Daudet ASTON 09310','0573029393','HOM',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Durhum','Fernand','64 rue des Artistes AX-LES-THERMES 09110','0580503787','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cheroudy','Anne-Lucie','17 rue Pernod DOMMARTIN 01380','0454076144','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Milliet','Anne','39 rue des Anges SAVINES-LE-LAC 05160','0460795137','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framier','Alice','32 rue des pyramides BEAUMONT-EN-BEINE 02300','0315894255','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipillon','Armelle','44 rue Perdue ABBECOURT 02300','0346616676','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Mestre','Anne-Ange','67 rue de la pointe SAINT-LAURENT-SUR-SAONE 01750','0479957609','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cheroudy','André','9 rue Mallarmé AUBENTON 02500','0342830645','ACU',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zerbib','Aurèle','54 rue du stade NEUVILLE-LES-DAMES 01400','0470983399','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sabatier','Jimmy','8 rue Albert Camus MONTCY-NOTRE-DAME 08090','0339328684','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mariveaux','Anaelle','53 rue St Denis BELLOC 09600','0575252091','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hallouche','Armelle','79 rue Beaudelaire BAGERT 09230','0574702561','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sadot','Catherine','81 rue des Cyprés SIGOYER 05130','0431018220','CHC',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Politzer','Julien','33 rue des Cyprés BAGERT 09230','0590592425','CHR',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charlequin','Adelphe','7 rue de la poste OYONNAX 01100','0463473029','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Restiffe','Hypolite','62 rue Malraux BOURG-EN-BRESSE 01000','0459994942','CHC',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zebitoun','Martin','4 rue des perles blanches FLOING 08200','0377624408','URG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bridel','Aristote','13 rue des Argonautes ABBECOURT 02300','0334073561','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hansbern','Roby','16 rue Hector Berlioz MACHAULT 08310','0327990795','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ricardo','Austine','86 rue Pernod SAINT-ANDRE-DE-ROSANS 05150','0475430562','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charles','François','75 rue Anatole France AX-LES-THERMES 09110','0527300069','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pionneer','Aurèle','77 rue des perles blanches BANCIGNY 02140','0336207616','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rachock','Carole','62 rue de la pointe BRIANCON 05100','0494704120','ALL',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mistigry','Charles-Edouard','96 rue des Pigeons MONTCY-NOTRE-DAME 08090','0351941479','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chesnikov','Hamed','88 rue des Armées BELLEY 01300','0425303459','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mariveaux','Amélie','8 rue de la gare AX-LES-THERMES 09110','0543024681','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznavourian','Yoan','67 rue des Anges SAINT-SAUVEUR 05200','0444643838','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shavert','Victor','31 rue des Anges BUZAN 09800','0531789114','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanzle','Julien','30 rue des Argonautes ATTILLY 02490','0381097843','ACU',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frazier','Astine','63 rue du stade AX-LES-THERMES 09110','0589774185','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kérouanne','Johnny','63 rue du 14 juillet AX-LES-THERMES 09110','0559787089','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chastidien','Anaelle','72 rue de Paris CHALLES 01450','0436897781','MAS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Alprousky','Habib','42 rue des Ormes BILLIAT 01200','0461405456','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zebitoun','Johnny','62 rue du général de Gaulle BOURG-EN-BRESSE 01000','0479899509','OST',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Billahian','Anne-Jeanne','9 rue Pasteur SAINT-FIRMIN 05800','0412854347','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Braquette','Françoise','36 rue des Ormes SAINT-CREPIN 05600','0470969763','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ben Harfa','Annie','6 rue des Armées ASTON 09310','0561398750','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epoka','Alizée','60 rue Edouard Hériot ASTON 09310','0529196402','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Farahoui','Victor','68 rue de la Pergolat BEDEILLE 09230','0510798563','CHC',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipillon','Amiel','48 rue Alphonse Daudet FLOING 08200','0367188526','MAS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Alprousky','Serge','13 rue des Epines BETTANT 01500','0415842763','CHR',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Heroudy','Anne-Lucie','91 rue Lampion HOUDILCOURT 08190','0360919149','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scott','Firmin','79 rue Commandant Mouchotte SAVINES-LE-LAC 05160','0454186158','OST',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jalouve','Jules','41 rue Louis Aragon SAINT-LAURENT-SUR-SAONE 01750','0470580820','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Yanshen','Irénée','25 rue Lampion BLYES 01150','0462212615','CHC',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Camus','Anne-Marie','21 rue de la Pergolat AX-LES-THERMES 09110','0552002239','CHC',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pastor','Ines','81 rue du 14 juillet BELLOC 09600','0579065527','CHR',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chastidien','Aurèle','82 rue des Anges MEZIERES-SUR-OISE 02240','0372146119','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Yanshen','Ingrid','2 rue de la rose BARZY-SUR-MARNE 02850','0374513763','MAS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Froudette','Prosper','34 rue Louis Aragon ARROUT 09800','0570233041','ALL',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Ronsart','Hamed','54 rue Louis Aragon MACHAULT 08310','0361841793','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('GrosPierre','Yoan','69 rue des Accacias BEAUMONT-EN-BEINE 02300','0364444471','ANG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamois','Serge','57 rue du capitaine Crochet MONTCY-NOTRE-DAME 08090','0348000197','MAS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lirevien','Patrice','64 rue Albert Camus SAINT-LAURENT-SUR-SAONE 01750','0427960246','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Egrouzais','Aristote','5 rue des Cyprés AZY-SUR-MARNE 02400','0352734097','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frazier','Astine','40 rue Louis Aragon MONTCY-NOTRE-DAME 08090','0335541135','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Ferdinand','Anémone','85 rue Hector Berlioz BEZAC 09100','0538796488','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mérieux','Anselme','79 rue des Cavaux CHABESTAN 05400','0478991381','MAS',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Hamouti','Gilles','88 rue Alphonse Daudet BELLOC 09600','0591522693','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mistigry','Austine','72 rue des Ormes MESSINCOURT 08110','0368355399','GER',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Klébert','Aurèle','53 rue Hector Berlioz FALAISE 08400','0325150351','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('GrosJean','Nohan','58 rue du 14 juillet AUBENTON 02500','0380869429','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Roland','Jimmy','41 rue du Mont FRESSANCOURT 02800','0333010728','HOM',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rétin','Gilles','26 rue du capitaine Fraquasse YONCQ 08210','0355888480','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shavert','Jules','95 rue des gatinnes EVIGNY 08090','0321047751','URG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Adrien','37 rue de la rose BARENTON-SUR-SERRE 02270','0333061059','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radot','Astine','29 rue Louis Aragon FLEVILLE 08250','0337878739','URG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Camus','Ingrid','95 rue du caféAX-LES-THERMES 09110','0538253531','ALL',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gueret','Julie','70 rue du Mont BILLIAT 01200','0434858369','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hemdaoui','Jules','87 rue des hirondelles FLOING 08200','0366452640','MAS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','sabine','70 rue des Ormes LAVAL-MORENCY 08150','0313786191','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Vivian','Anne-Sophie','72 rue de Paris AMBRIEF 02200','0396888350','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fermontin','Julienne','95 rue de du général Scott SAINT-FIRMIN 05800','0499781511','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lièvremont','Prosper','40 rue du stade CHEZY-SUR-MARNE 02570','0370552277','MAS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sursarshill','François','21 rue des oiseaux AUBENTON 02500','0347608567','ALL',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Lazio','Béatrice','91 rue de Paris BARENTON-SUR-SERRE 02270','0332630528','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Egrouzais','Alice','14 rue de la Tour PELVOUX 05340','0497349269','CHC',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Roulède','Hypolite','4 rue Petit AX-LES-THERMES 09110','0592259965','URG',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bridel','Dominique','17 rue Victor Hugo NEUVILLE-LES-DAMES 01400','0436894892','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Précilia','46 rue Perdue MONT-LAURENT 08130','0357123782','ALL',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frequin','Patrice','37 rue des perles blanches AUGIREIN 09800','0514467307','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Ronsart','Catherine','18 rue de la Pergolat CHABESTAN 05400','0433787136','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chemkaou','Anne-Jeanne','61 rue Malraux SAVINES-LE-LAC 05160','0425403948','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Francis','Martial','39 rue des Pigeons FRESSANCOURT 02800','0376405689','INF',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanscart','Ines','36 rue du général de Gaulle AX-LES-THERMES 09110','0571237673','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Doineau','Fatima','27 rue des Ormes BARENTON-SUR-SERRE 02270','0369886219','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zerbib','Cristophe','35 rue Commandant Mouchotte CHEZY-SUR-MARNE 02570','0399128847','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Harshill','Charles-Edouard','69 rue de Paris BRIANCON 05100','0486522042','ACU',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamois','Alice','64 rue de Paris SORBIERS 05150','0498218342','ANG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kobel','Johnny','4 rue des Lilas BELLOC 09600','0583708661','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gullit','Marie','27 rue du stade NEUVILLE-LES-DAMES 01400','0440602180','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Format','Patrice','25 rue des Néfliers AGUILCOURT 02190','0313705112','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mérieux','Roby','74 rue de Marigny JUNIVILLE 08310','0370618394','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Krevette','François','40 rue Commandant Mouchotte BOURG-EN-BRESSE 01000','0466232870','ANG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chastidien','Anne-Lucie','28 rue de la mairie MONCEAU-SUR-OISE 02120','0337880516','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prouteau','Marie','65 rue des Accacias MEZIERES-SUR-OISE 02240','0347429128','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radosky','Irénée','66 rue Victor Hugo ASTON 09310','0545396012','HOM',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cassolette','Aurèle','78 rue du 14 juillet NEUVILLE-LES-DAMES 01400','0436441368','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Armouche','Jimmy','31 rue des Cavaux BOURG-EN-BRESSE 01000','0489010528','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nasri','Jordan','56 rue du Mont BRIANCON 05100','0497686569','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanzle','Andrew','5 rue des Pigeons ATTILLY 02490','0317928011','INF',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Capliez','Andrée','9 rue de Paris CAMON 09500','0575615612','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Béronze ','Aurélien','34 rue des perles blanches HERBEUVAL 08370','0354324365','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamois','Caline','90 rue des Pigeons BETTANT 01500','0441422871','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hemdaoui','Bertrand','88 rue du caféCAMON 09500','0519717031','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Magellan','Anne-Lucie','31 rue St Denis AVANCON 05230','0476620839','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Ferdinand','Anne-Marie','32 rue Petit BOULIGNEUX 01330','0429892782','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sibaton','Anne','96 rue des pyramides SAINT-FIRMIN 05800','0430056957','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frédrick','Jordan','71 rue Lampion ROCHEBRUNE 05190','0422193913','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Falahoui','Hector','39 rue des Chantereines SAINT-CREPIN 05600','0427945468','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mistigry','Patrice','35 rue de la gare DOMMARTIN 01380','0412349269','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scotbel','Austine','1 rue Perdue BANCIGNY 02140','0362784487','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sidot','Nohan','87 rue de la mairie ORCIERES 05170','0492790588','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framzaoui','Adrien','6 rue St Denis NEUVILLE-LES-DAMES 01400','0463805846','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nazaoui','Aurélien','24 rue Anatole France FALAISE 08400','0394184441','ALL',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanzert','Anne-Sophie','78 rue du caféBELLOC 09600','0565131061','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Harviche','Précilia','17 rue de Paris BARZY-SUR-MARNE 02850','0373800189','CHC',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Farmin','Béatrice','65 rue des Cyprés ASTON 09310','0556222808','CHC',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Oulianov','Alain','12 rue des oiseaux BEAUMONT-EN-BEINE 02300','0336437836','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framier','Jérémy','13 rue Louis Aragon ARROUT 09800','0579019785','GER',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznavourian','Alice','42 rue des hirondelles SAINT-LAURENT-SUR-SAONE 01750','0418404333','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Faouzi','Serge','54 rue Debussy AUDRESSEIN 09800','0589986579','URG',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rodriguez','Bertrand','16 rue de la Tour MONTIGNY-SUR-MEUSE 08170','0362958231','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radronck','Alizée','85 rue Alphonse Daudet SAINT-SAUVEUR 05200','0469350553','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sibroton','Irénée','54 rue de Marigny PELVOUX 05340','0413512651','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Billahian','Bertrand','66 rue du capitaine Crochet BILLIAT 01200','0430273395','ALL',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frequin','Reissa','92 rue des Epines BOURG-EN-BRESSE 01000','0462567494','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('GrosPierre','Anne-Lucie','58 rue des Anges FRESSANCOURT 02800','0397948858','GER',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chermis','Alain','13 rue Albert Camus BAGERT 09230','0561056383','URG',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jankelevitch','Rodolphe','4 rue Bonaparte NEUVILLE-LES-DAMES 01400','0499930510','ALL',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hutch','Dominique','31 rue Pernod MESSINCOURT 08110','0354437353','HOM',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jalouve','Amélie','73 rue des Epines AGUILCOURT 02190','0393504917','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanscart','Aude','43 rue des Pigeons FALAISE 08400','0395808887','MAS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Julie','76 rue des Armées CAMON 09500','0558376134','ALL',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Loulianov','Jérémie','71 rue de Poligny SAVINES-LE-LAC 05160','0490614401','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Falahoui','Annie','95 rue des hirondelles AGUILCOURT 02190','0334620315','ALL',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rachock','Hypolite','96 rue Commandant Mouchotte BOULIGNEUX 01330','0445325841','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Billahian','Aline','9 rue des Epines OYONNAX 01100','0463729220','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fournil','Martin','93 rue de la Tour BELLEY 01300','0459132484','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Thardieux','Hamed','8 rue Louis Aragon FRESSANCOURT 02800','0311170881','GER',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Perronet','François','90 rue de la mairie AX-LES-THERMES 09110','0553374090','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bridel','Aurèle','92 rue St Denis SORBIERS 05150','0481537923','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frequin','Bernard','71 rue du caféMESSINCOURT 08110','0366706848','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nazaoui','Julien','58 rue de Paris CEYZERIAT 01250','0411229599','MAS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Nazaoui','Gilles','66 rue de du général Scott ARROUT 09800','0590561289','MAS',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Anglomert','Astine','18 rue des gatinnes SAINT-LAURENT-SUR-SAONE 01750','0426146482','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mistigry','Patrice','12 rue Victor Hugo EVIGNY 08090','0311209603','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanzert','Ingrid','74 rue des hirondelles AX-LES-THERMES 09110','0542828199','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radocky','Aurélien','38 rue Debussy BILLIAT 01200','0439490126','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanscart','Yoan','40 rue de la recette MONCEAU-SUR-OISE 02120','0333274282','OST',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scott','Adelphe','93 rue Alphonse Daudet OYONNAX 01100','0457686776','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamonix','Adrien','82 rue Agniel JUNIVILLE 08310','0352053332','ALL',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Farahoui','Caline','82 rue St Denis ASTON 09310','0593546818','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ben Harfa','Rodolphe','68 rue des Argonautes MONCEAU-SUR-OISE 02120','0381648585','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Roland','Patricia','6 rue de la gare BILLIAT 01200','0474405770','GER',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kan','Robert','40 rue des pyramides SAINT-FIRMIN 05800','0482621556','GER',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charlequin','Fatima','7 rue du renard BUZAN 09800','0560148975','GER',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cerpico','Carole','77 rue Anatole France MESSINCOURT 08110','0361849887','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hourin','Jordan','20 rue de la recette SAINT-ANDRE-DE-ROSANS 05150','0432143599','ANG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Ligne','Patrice','10 rue du capitaine Crochet CHALLES 01450','0479473742','ALL',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Durieux','Astine','98 rue du renard BLYES 01150','0447475896','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chermis','Anselme','78 rue de la mairie OYONNAX 01100','0465535519','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazoline','Aurèle','63 rue de la gare CHABESTAN 05400','0434955199','MAS',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Serbouny','Jérome','27 rue des Chantereines BARZY-SUR-MARNE 02850','0328609452','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Victor','70 rue de la Pergolat ABBECOURT 02300','0397808656','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hemdaoui','Anne-Laure','58 rue du général de Gaulle FALAISE 08400','0381506423','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cheroudy','Hector','41 rue Malraux SIGOYER 05130','0447077417','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Harviche','Anne-Jeanne','12 rue Louis Aragon THIN-LE-MOUTIER 08460','0351239489','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Raminsky','Anne-Lucie','16 rue Blainville SAVINES-LE-LAC 05160','0474386707','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sursarshill','Jérémy','53 rue de la pointe AUGIREIN 09800','0517209857','CHC',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shavert','Anne','70 rue de la rose ABBECOURT 02300','0315174364','CHC',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kan','Armelle','27 rue Blainville SIGOYER 05130','0487157453','CHR',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cherioux','Camille','90 rue du caféPELVOUX 05340','0462682764','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jankelevitch','Anaelle','73 rue des Cavaux FEPIN 08170','0347605928','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Carole','82 rue Blainville BILLIAT 01200','0489580183','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bredequin','Rosalie','66 rue des Princes SORBIERS 05150','0447973887','MAS',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mariveaux','Fatima','38 rue Hector Berlioz SORBIERS 05150','0489828043','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fugasse','Anne-Jeanne','60 rue Victor Hugo NEUVILLE-LES-DAMES 01400','0466135862','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nahraoui','Hypolite','26 rue Alphonse Daudet BETTANT 01500','0496740768','MAS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chemkaoui','Sophie','37 rue Alphonse Daudet AX-LES-THERMES 09110','0550507761','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nazaoui','Anne-Laure','96 rue du capitaine Fraquasse AUBENTON 02500','0332042330','GER',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cassin','Caline','84 rue des Néfliers SAINT-ANDRE-DE-ROSANS 05150','0441770926','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pololsky','Amiel','11 rue Commandant Hériot ARROUT 09800','0530054025','GER',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gueret','Adelphe','1 rue des Princes SIGOYER 05130','0446366196','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Doineau','Alain','76 rue Commandant Mouchotte AX-LES-THERMES 09110','0510808813','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rosty','Gilles','64 rue Commandant Hériot ARANDAS 01230','0466707367','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Fernand','66 rue du 14 juillet OYONNAX 01100','0446432036','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Vipère','Andrée','76 rue des Cavaux SORBIERS 05150','0433833354','CHC',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fournil','Robert','67 rue du capitaine Crochet FRESSANCOURT 02800','0396745829','CHR',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Merlieux','Charles','81 rue MALLarmé BEAUMONT-EN-BEINE 02300','0318112146','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Doineau','Jérémie','49 rue de la Pergolat REOTIER 05600','0452299934','ACU',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prouteau','sabine','73 rue Agniel FEPIN 08170','0340871558','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Braquette','Patrice','26 rue du renard OYONNAX 01100','0499920026','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frequin','Jules','21 rue Pasteur SORBIERS 05150','0497153129','CHR',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Froudette','Alizée','69 rue de la Pergolat BELLEY 01300','0485963418','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Yansen','Armelle','16 rue des Anses bleues VAUX-CHAMPAGNE 08130','0334124353','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charminet','Hector','73 rue du général de Gaulle AUDRESSEIN 09800','0593896893','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hourin','Aristote','78 rue des Argonautes AUGIREIN 09800','0560183642','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Khan','Anne-Jeanne','20 rue Commandant Hériot BEAUMONT-EN-BEINE 02300','0335062492','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznavourian','Anne-Jeanne','38 rue Louis Aragon SAINTE-MARIE 05150','0413931222','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jankelevitch','Jordan','96 rue Bonaparte SAINTE-MARIE 05150','0419574602','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Brouzais','Cristophe','65 rue de la recette HERBEUVAL 08370','0353219537','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Yanshen','Bénédicte','2 rue des Armées FALAISE 08400','0392106994','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Margot','sabine','66 rue des Epines HOUDILCOURT 08190','0396081849','GER',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frazier','Serge','6 rue du stade NEUVILLE-LES-DAMES 01400','0441736702','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rachock','Adelphe','26 rue des Pigeons FEPIN 08170','0383040737','GER',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framzaoui','Julienne','89 rue Pasteur ASTON 09310','0558895500','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Braquette','Austine','96 rue St Denis BRIANCON 05100','0442356662','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rétin','Anne-Marie','88 rue du capitaine Fraquasse FLOING 08200','0337248343','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Raminski','Austine','86 rue des Lilas BAGERT 09230','0564227642','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chesnikov','Aristote','13 rue des Néfliers ARROUT 09800','0578693214','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Reissa','56 rue du Mont THIN-LE-MOUTIER 08460','0379320791','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lirevien','sabine','96 rue du général de Gaulle BELLOC 09600','0517690862','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Vispendieu','Marie','62 rue Hector Berlioz SAVOURNON 05700','0443661423','ACU',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Ronsart','Irénée','68 rue de la pointe BARENTON-SUR-SERRE 02270','0313123217','INF',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Arditi','Adrien','2 rue des hirondelles HAUTEVILLE 02120','0385350100','MAS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Farmin','Caline','13 rue du Mont SAINT-FIRMIN 05800','0439120333','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zomar','Camille','38 rue des Chantereines MAYOT 02800','0390403626','GER',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scotland','Ingrid','73 rue des gatinnes SAINT-ANDRE-DE-ROSANS 05150','0455695337','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zola','Jordan','47 rue de Paris ROCHEBRUNE 05190','0488575731','URG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Favriellé','Andrew','40 rue Anatole France LAUNOIS-SUR-VENCE 08430','0395797173','OST',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamonix','Aline','27 rue des ANGes SAINT-FIRMIN 05800','0454426212','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazoline','Aurèle','87 rue de Poligny SAINT-ANDRE-DE-ROSANS 05150','0437604768','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hemdaoui','Carole','17 rue Debussy AVANCON 05230','0435416748','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shavert','Adelphe','74 rue des Néfliers AUBENTON 02500','0369486130','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Froudette','Irénée','85 rue du capitaine Crochet JOIGNY-SUR-MEUSE 08700','0397935550','OST',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lopez','Aurélien','92 rue des oiseaux SAVOURNON 05700','0452076802','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scotland','John','74 rue des oiseaux BILLIAT 01200','0463193696','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Format','Jules','84 rue du stade OYONNAX 01100','0430814652','GER',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hourin','Robert','46 rue des Accacias OYONNAX 01100','0456783280','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hatiche','Carole','18 rue de la Tour NEUVILLE-LES-DAMES 01400','0411713298','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Faure','Firmin','73 rue du Mont ARROUT 09800','0532011995','MAS',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Doineau','Amélie','79 rue Lampion SAINT-LAURENT-SUR-SAONE 01750','0499820900','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Froudette','Patrice','14 rue des Lilas CHEZY-SUR-MARNE 02570','0310790961','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scott','Martial','32 rue de la mairie JOIGNY-SUR-MEUSE 08700','0351863890','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Astoria','John','81 rue Edouard Hériot MAYOT 02800','0361434057','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Roulède','Prosper','99 rue des Pigeons SIGOYER 05130','0420048322','URG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanscart','Camille','88 rue des oiseaux JUNIVILLE 08310','0370063871','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipillon','Adrien','21 rue de la rose AX-LES-THERMES 09110','0513336137','GER',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gaudillot','Victor','86 rue des Armées DOMMARTIN 01380','0447458241','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radot','Bertrand','91 rue de la rose FEPIN 08170','0398107919','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gueret','Serge','58 rue Pernod MONCEAU-SUR-OISE 02120','0322992429','INF',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazoline','Julienne','93 rue des Néfliers MONCEAU-SUR-OISE 02120','0348940958','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radosky','Caline','8 rue des Anges FEPIN 08170','0364882312','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hemdaoui','Françoise','76 rue de Marigny CAMON 09500','0522112610','OST',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mérieux','Françoise','3 rue des Anges AUBENTON 02500','0397776971','MAS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epoka','Serge','92 rue de Paris THIN-LE-MOUTIER 08460','0365834913','ACU',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shavert','Prosper','24 rue de du général Scott BRIANCON 05100','0493163850','GER',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fourmiret','Dominique','4 rue Hector Berlioz AX-LES-THERMES 09110','0585018637','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hatiche','Adrien','30 rue Agniel SAINT-FIRMIN 05800','0483927775','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Adelphe','4 rue des Pigeons BARZY-SUR-MARNE 02850','0391947902','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gullit','sabine','9 rue du Mont BRIANCON 05100','0423613710','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Vipère','Anne-Lucie','81 rue des Lilas ABBECOURT 02300','0357752522','HOM',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epriniche','Aurèle','78 rue du renard SAINT-LAURENT-SUR-SAONE 01750','0499152521','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Doineau','Julienne','16 rue de la gare BELLOC 09600','0567014080','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nazaoui','Aurélien','41 rue des Anses bleues ASTON 09310','0528108863','OST',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shouchen','François','52 rue des Epines ATTILLY 02490','0395338199','CHC',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Bénédicte','88 rue du renard ORCIERES 05170','0452809250','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epriniche','Vénus','84 rue des Armées MONTIGNY-SUR-MEUSE 08170','0332562475','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Camille','20 rue Anatole France MACHAULT 08310','0394066862','CHC',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nazaoui','Carole','90 rue Bonaparte OYONNAX 01100','0446953066','CHC',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chemkaoui','Cristophe','22 rue Perdue AX-LES-THERMES 09110','0533152140','CHR',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sérénice','Anne-Laure','73 rue Agniel BOURG-EN-BRESSE 01000','0434367086','CHR',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Merlieux','Martial','61 rue des Cavaux SAINT-LAURENT-SUR-SAONE 01750','0460367150','CHR',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Certifat','Aurélien','44 rue des Epines OYONNAX 01100','0439758191','CHR',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Azria','Aude','98 rue des Accacias SIGOYER 05130','0497650512','OST',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Durhum','sabine','61 rue de la Pergolat AUDRESSEIN 09800','0566668732','ACU',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rachock','Jules','45 rue du capitaine Crochet EVIGNY 08090','0351073860','CHC',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shouchen','Rodolphe','89 rue des oiseaux BOURG-EN-BRESSE 01000','0436599230','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Béronze ','Habib','97 rue Pernod AZY-SUR-MARNE 02400','0380003737','ACU',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Merlieux','Bernard','81 rue des Epines SAINT-CREPIN 05600','0477707175','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chrome','Habib','83 rue Malraux ABBECOURT 02300','0310290366','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zebitoun','Mohammed','70 rue du 14 juillet MONT-LAURENT 08130','0398765209','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cassan','François','71 rue du 14 juillet SAINT-SAUVEUR 05200','0418376454','ACU',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bouglieux','Rodolphe','99 rue Alphonse Daudet YONCQ 08210','0367093394','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Anglomert','Catherine','4 rue des Armées AUBENTON 02500','0368054817','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Format','Bernard','64 rue Commandant Hériot TRAVECY 02800','0315061114','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chemkaou','Armelle','79 rue des Epines EVIGNY 08090','0334511766','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Arvis','Julie','13 rue de la pointe ASTON 09310','0518564010','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charmieux','Dominique','62 rue Malraux AUGIREIN 09800','0585303807','GER',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Amoudi','Charles','71 rue Anatole France CAMON 09500','0569559189','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scotbel','Cristophe','85 rue des Argonautes AZY-SUR-MARNE 02400','0316188975','HOM',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charles','Dominique','21 rue des Artistes BELLEY 01300','0428818011','OST',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Harshill','Précilia','82 rue Victor Hugo LAVAL-MORENCY 08150','0391802125','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fermat','André','87 rue Anatole France YONCQ 08210','0311956610','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chastidien','Fernand','37 rue du général de Gaulle AUGIREIN 09800','0517286774','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ségura','Hamed','72 rue des hirondelles AGUILCOURT 02190','0334618532','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Berzinne','Hector','20 rue du capitaine Fraquasse BELLEY 01300','0447089672','ANG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamois','Patricia','9 rue des gatinnes CHALLES 01450','0489226737','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Yoggi','Aline','12 rue des Anges BRIANCON 05100','0498699637','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cassolette','Austine','37 rue des Armées SIGOYER 05130','0485539010','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epoka','Hypolite','33 rue de Paris TRAVECY 02800','0319460470','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scotland','Fernand','80 rue du Mont BAGERT 09230','0570483785','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Festina','Anne-Sophie','18 rue de la recette FLOING 08200','0335293346','ALL',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamonix','Bénédicte','71 rue des pyramides MONT-LAURENT 08130','0364431472','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radot','John','35 rue du caféATTILLY 02490','0384830087','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nazaoui','Patrick','97 rue du général de Gaulle AUBENTON 02500','0378805449','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Béronzelle ','Alice','3 rue des Lilas ABBECOURT 02300','0338216554','GER',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Khan','Jérome','67 rue Perdue BEDEILLE 09230','0527487962','URG',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Liorehen','Anne-Jeanne','91 rue Albert Camus SAINT-CREPIN 05600','0464885309','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Azoulais','Robert','73 rue Pasteur BOURG-EN-BRESSE 01000','0451252312','MAS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazoline','Marie','51 rue Victor Hugo JOIGNY-SUR-MEUSE 08700','0328058400','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Billahian','Bénédicte','37 rue du caféSAINT-CREPIN 05600','0472480246','URG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazile','Hypolite','97 rue Malraux SAINTE-MARIE 05150','0471019122','URG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Razaoui','Anne-Marie','21 rue Blainville MESSINCOURT 08110','0315472355','URG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zola','Fatima','32 rue des Armées MEZIERES-SUR-OISE 02240','0335733742','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Harshill','sabine','52 rue des Pigeons PELVOUX 05340','0424219942','GER',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Braquette','Vénus','96 rue des Chantereines FRESSANCOURT 02800','0359036944','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hatiche','Victor','96 rue de Paris BETTANT 01500','0478464491','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pletziglass','Aurèle','34 rue des oiseaux NEUVILLE-LES-DAMES 01400','0437142230','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Béronzelle ','Reissa','89 rue des Pigeons PELVOUX 05340','0414138297','GER',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ben Harfa','Camille','5 rue des Anges BUZAN 09800','0550828415','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Alprousky','Marie','58 rue Victor Hugo BOULIGNEUX 01330','0432323455','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ferdinand','Camille','89 rue Beaudelaire AUBENTON 02500','0341803965','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Roulède','Fatima','59 rue Bonaparte EVIGNY 08090','0326409640','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sérénice','Anne-Jeanne','10 rue du capitaine Fraquasse MESSINCOURT 08110','0315685825','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Vivian','Alice','94 rue des Cyprés SAINT-FIRMIN 05800','0492845898','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Casson','Aline','83 rue des Cavaux CHALLES 01450','0477868457','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Doineau','Françoise','3 rue des gatinnes FRESSANCOURT 02800','0310422807','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pistache','Béatrice','86 rue des Accacias MONTIGNY-SUR-MEUSE 08170','0351114264','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bridel','Marie','17 rue des Accacias JOIGNY-SUR-MEUSE 08700','0354449959','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cassin','Alain','61 rue de du général Scott QUATRE-CHAMPS 08400','0395171820','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Alain','10 rue Alphonse Daudet AGUILCOURT 02190','0378125914','GER',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Habrielle','Aude','73 rue du caféSORBIERS 05150','0415973212','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Azoulais','Aurélien','5 rue des pyramides SAVINES-LE-LAC 05160','0417672103','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gaudillot','Amiel','44 rue Victor Hugo SIGOYER 05130','0470456938','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Vivian','Aude','45 rue des Lilas FLOING 08200','0347310971','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charminet','Catherine','88 rue Alphonse Daudet ARROUT 09800','0578689528','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fugasse','Alain','57 rue Petit SAINT-LAURENT-SUR-SAONE 01750','0448765649','CHC',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zitoune','Fatima','47 rue Lampion OYONNAX 01100','0460692244','OST',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Certifat','Anaelle','12 rue Albert Camus AX-LES-THERMES 09110','0569661155','CHC',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hutch','Julie','3 rue de la pointe SAINT-CREPIN 05600','0435145304','CHC',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanscart','Alizée','91 rue Blainville OYONNAX 01100','0424443942','CHC',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chesnikov','Anselme','58 rue Victor Hugo LAVAL-MORENCY 08150','0387649400','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nazaoui','Rodolphe','57 rue des Epines AZY-SUR-MARNE 02400','0397983251','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Harviche','Aristote','2 rue de Poligny FALAISE 08400','0379304135','ANG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Klébert','Anne-Marie','73 rue du capitaine Crochet CHALLES 01450','0459580046','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frequin','Rosalie','88 rue Hector Berlioz SAINT-LAURENT-SUR-SAONE 01750','0460756612','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charminet','Julienne','54 rue du 14 juillet BEAUMONT-EN-BEINE 02300','0357974621','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Bernard','28 rue des perles blanches MONT-LAURENT 08130','0350608229','CHC',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Yanshen','Ingrid','14 rue de Paris MONTCEAUX 01090','0490462674','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sadot','Alice','84 rue Albert Camus BLYES 01150','0486949300','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chastidien','Reissa','71 rue des Cavaux FLOING 08200','0371858489','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Vispendieu','Anselme','67 rue Bonaparte MESSINCOURT 08110','0353311714','CHR',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Roland','Aristote','67 rue du renard BUZAN 09800','0550911167','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazile','Jules','50 rue des Cyprés BARENTON-SUR-SERRE 02270','0377237270','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Thardieux','François','98 rue du stade MACHAULT 08310','0371879519','OST',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Magellan','Patricia','8 rue des Pigeons CHEZY-SUR-MARNE 02570','0360797082','OST',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radesky','Reissa','33 rue Beaudelaire BAGERT 09230','0551753977','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Braquette','Rosalie','3 rue des Cavaux AMBRIEF 02200','0325834365','GER',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rodriguez','Irénée','16 rue Bonaparte AVANCON 05230','0429279003','HOM',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Raminsky','Armelle','24 rue des Néfliers QUATRE-CHAMPS 08400','0371872007','OST',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ricardo','Serge','30 rue Albert Camus ARROUT 09800','0563717429','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kobel','Bénédicte','29 rue Victor Hugo AUDRESSEIN 09800','0525469712','GER',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Razaoui','Marie','15 rue de Paris AUBENTON 02500','0396696281','CHR',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Armouche','Charles-Edouard','12 rue St Denis MONTCEAUX 01090','0492465629','CHR',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ségura','Victor','12 rue des Anses bleues SAVINES-LE-LAC 05160','0417736200','CHR',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fylbouni','Johnny','35 rue du stade ASTON 09310','0575380150','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chakraoui','Cristophe','86 rue du caféORCIERES 05170','0488800978','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fermontin','Julien','38 rue Anatole France AUBENTON 02500','0318610565','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frequin','François','32 rue du Mont REOTIER 05600','0425989993','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sérénice','Anaelle','74 rue de la gare FLEVILLE 08250','0325218232','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kan','Anselme','86 rue Victor Hugo MESSINCOURT 08110','0381133645','GER',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fort','Cristophe','86 rue Pasteur NEUVILLE-LES-DAMES 01400','0432667697','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chemkaou','sabine','75 rue des Pigeons BEAUMONT-EN-BEINE 02300','0376547227','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sibroton','Précilia','66 rue Malraux BUZAN 09800','0513300693','URG',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chrome','Catherine','27 rue de la Pergolat MONTCEAUX 01090','0421383743','ALL',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Ferdinand','Alice','37 rue de Paris CHEZY-SUR-MARNE 02570','0356410090','ANG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gullit','Habib','71 rue Bonaparte AGUILCOURT 02190','0350823331','OBS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mérieux','Alain','77 rue des Accacias BRIANCON 05100','0498867503','GER',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznavourian','Patricia','3 rue de la Tour BILLIAT 01200','0428025797','OBS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ricardo','Austine','44 rue des Néfliers CHEZY-SUR-MARNE 02570','0363569859','OBS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznavourian','André','30 rue Hector Berlioz SAINT-FIRMIN 05800','0444332279','MAS',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Casson','Johnny','36 rue Blainville AUBENTON 02500','0395155855','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Razaoui','Aurèle','10 rue du général de Gaulle ARROUT 09800','0554301843','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Krevette','Alizée','35 rue des Pigeons MONT-LAURENT 08130','0340963504','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Fatima','16 rue Commandant Hériot BANCIGNY 02140','0334753913','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hemdaoui','Adrien','2 rue Commandant Hériot MONCEAU-SUR-OISE 02120','0352372278','MAS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Amoudi','Andrew','26 rue des pyramides BOULIGNEUX 01330','0469707196','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Anémone','9 rue des Epines BLYES 01150','0440301616','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bonieck','Cristophe','69 rue de la recette DOMMARTIN 01380','0495802726','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Falmino','Jules','24 rue Perdue THIN-LE-MOUTIER 08460','0328900829','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Castro','Aurélien','66 rue des Anges BOULIGNEUX 01330','0417563891','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charles','François','1 rue Blainville HAUTEVILLE 02120','0317885243','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lirevien','Irénée','64 rue des perles blanches QUATRE-CHAMPS 08400','0316251329','ALL',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prestor','Camille','20 rue du stade AZY-SUR-MARNE 02400','0339478573','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipillon','Adelphe','51 rue des gatinnes BRIANCON 05100','0412521015','MAS',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charmieux','Andrew','14 rue Hector Berlioz BRIANCON 05100','0448191946','GER',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rachock','Mohammed','47 rue Pernod YONCQ 08210','0371193497','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanzert','Aurèle','68 rue des Chantereines BUZAN 09800','0563311027','OST',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Oberlieux','Patricia','72 rue des pyramides ARROUT 09800','0551116863','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('GrosPierre','Aude','35 rue de Poligny CHABESTAN 05400','0454617092','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznavourian','Jérémy','10 rue Malraux FALAISE 08400','0355875878','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Politzer','Jérémy','12 rue des Anges SAINT-LAURENT-SUR-SAONE 01750','0476010116','GER',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Faure','Alain','86 rue de Marigny AUDRESSEIN 09800','0584761714','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radot','Sophie','54 rue des Epines SAINTE-MARIE 05150','0447268257','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Habrielle','Marie','44 rue Malraux DOMMARTIN 01380','0420664795','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cheroudy','Anaelle','65 rue des Accacias BILLIAT 01200','0463159777','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Julien','26 rue Pernod AUDRESSEIN 09800','0564023565','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Casson','Jules','5 rue Albert Camus BAGERT 09230','0553330696','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jamgotchian','Aristote','71 rue Petit OYONNAX 01100','0459707313','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framzaoui','Fernand','59 rue des Cavaux YONCQ 08210','0370679861','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hansbern','Anselme','89 rue de la rose THIN-LE-MOUTIER 08460','0329785730','ANG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Ligne','Firmin','36 rue Blainville MAYOT 02800','0335413346','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Hypolite','77 rue de Paris OYONNAX 01100','0445547469','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Cristophe','24 rue de la Pergolat THIN-LE-MOUTIER 08460','0394637980','ANG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Habib','28 rue des Chantereines FEPIN 08170','0370382521','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazoline','Amiel','14 rue Petit AUBENTON 02500','0324206273','INF',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fermontin','Béatrice','34 rue de la rose AVANCON 05230','0441382007','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamonix','Béatrice','98 rue du capitaine Crochet AX-LES-THERMES 09110','0583031525','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hatiche','Béatrice','7 rue Hector Berlioz FRESSANCOURT 02800','0368437171','CHC',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Magellan','Fernand','91 rue Pernod DOMMARTIN 01380','0417334765','ACU',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Newmann','Anselme','82 rue St Denis BOURG-EN-BRESSE 01000','0467462959','MAS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radronck','Jérémie','80 rue Beaudelaire HOUDILCOURT 08190','0391017675','CHC',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ben Harfa','Fatima','88 rue du général de Gaulle DOMMARTIN 01380','0436582548','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shavert','Marie','65 rue Edouard Hériot ABBECOURT 02300','0316457802','HOM',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chakraoui','Amiel','75 rue des Accacias MAYOT 02800','0348266841','CHC',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Harshill','Anne-Lucie','89 rue de la Pergolat SIGOYER 05130','0423854231','CHC',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznavourian','Patrice','38 rue Pasteur AVANCON 05230','0433495288','MAS',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cassolette','Victor','3 rue des Chantereines AMBRIEF 02200','0313285058','MAS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jaoulle','John','99 rue du capitaine Fraquasse MAYOT 02800','0325788039','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Palminin','Anne','59 rue des Pigeons CEYZERIAT 01250','0414968284','CHR',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznavourian','Aurèle','48 rue Anatole France SIGOYER 05130','0498986897','CHR',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gueret','Firmin','2 rue de la Tour AZY-SUR-MARNE 02400','0334984702','CHR',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Mestre','Ingrid','74 rue des Pigeons BELLOC 09600','0575501098','CHR',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zelniky','Prosper','53 rue de Paris BARENTON-SUR-SERRE 02270','0390633950','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Hamouti','Anne-Lucie','19 rue du renard FRESSANCOURT 02800','0380522884','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ben Harfa','Aline','76 rue Louis Aragon BOULIGNEUX 01330','0458483440','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lirevien','Serge','79 rue Petit BUZAN 09800','0597720760','ANG',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sadot','Carole','87 rue de Paris YONCQ 08210','0386136458','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ambert','Aristote','89 rue du stade BOURG-EN-BRESSE 01000','0495804047','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zelniky','Annie','81 rue de Poligny ORCIERES 05170','0484719957','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lopes','Marie','89 rue Debussy VAUX-CHAMPAGNE 08130','0398454558','ACU',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charmieux','Vénus','19 rue Bonaparte AUDRESSEIN 09800','0576161788','ACU',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Durhum','Irénée','16 rue de Paris OYONNAX 01100','0438645340','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chrome','Jérémie','61 rue Hector Berlioz CHABESTAN 05400','0488168776','OST',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nahraoui','Aurèle','64 rue des Epines NEUVILLE-LES-DAMES 01400','0498004744','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Restiffe','Fatima','21 rue des Chantereines LAVAL-MORENCY 08150','0397521639','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Amoudi','André','35 rue Lampion BOURG-EN-BRESSE 01000','0473219689','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Loulianov','Marie','17 rue des Accacias LAUNOIS-SUR-VENCE 08430','0369193051','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zelniky','Astine','94 rue Malraux HAUTEVILLE 02120','0335672541','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Klébert','Patricia','75 rue du général de Gaulle FALAISE 08400','0359521971','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ferdinand','Charles','40 rue de la mairie JOIGNY-SUR-MEUSE 08700','0395476454','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Anglomert','Anne-Laure','75 rue Victor Hugo MONTCY-NOTRE-DAME 08090','0333999479','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Yansen','Alizée','51 rue Agniel YONCQ 08210','0352293505','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Capliez','Françoise','9 rue Malraux SAINT-ANDRE-DE-ROSANS 05150','0433874591','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chemkaoui','Anne-Marie','90 rue du caféMAYOT 02800','0363076320','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Certifat','Jimmy','10 rue Hector Berlioz CHABESTAN 05400','0479570050','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jankelevitch','Aurélien','67 rue des Princes AMBRIEF 02200','0326868610','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Béronzelle ','Anaelle','86 rue du Mont MONTCEAUX 01090','0432538873','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chakraoui','François','23 rue de Paris BARZY-SUR-MARNE 02850','0338114774','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazile','François','33 rue Victor Hugo BELLOC 09600','0587084727','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Harviche','Catherine','70 rue Malraux BRIANCON 05100','0446591175','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Ronsart','Amélie','26 rue des Accacias MONT-LAURENT 08130','0347054500','GER',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Braquet','Charles','77 rue des perles blanches BETTANT 01500','0413532750','GER',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Breton','Adelphe','96 rue des Argonautes REOTIER 05600','0488831908','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lopes','Carole','83 rue du renard AX-LES-THERMES 09110','0540901782','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Labatiste','Rodolphe','33 rue Commandant Mouchotte THIN-LE-MOUTIER 08460','0324607170','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Nazaoui','Yoan','42 rue Anatole France BEZAC 09100','0597093071','ALL',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lopez','Firmin','66 rue Commandant Hériot AX-LES-THERMES 09110','0560293085','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Astoria','Caline','54 rue de la pointe SAINT-SAUVEUR 05200','0476324085','URG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Capliez','Amélie','12 rue du capitaine Fraquasse BARZY-SUR-MARNE 02850','0347886278','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('CHeroudy','Nohan','87 rue du 14 juillet HERBEUVAL 08370','0350146870','URG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Raminsky','Yoan','8 rue de Paris MONCEAU-SUR-OISE 02120','0358800447','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framier','Victor','26 rue Hector Berlioz ARANDAS 01230','0426016480','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Faure','Bertrand','94 rue des gatinnes MONTCEAUX 01090','0480493919','ANG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chesnikov','Précilia','56 rue du capitaine Crochet AUDRESSEIN 09800','0537599041','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lièvremont','Astine','58 rue des perles blanches YONCQ 08210','0380622197','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ségura','Anne-Sophie','52 rue des Artistes FALAISE 08400','0352041231','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chevalier','Anselme','85 rue des Pigeons AGUILCOURT 02190','0387135673','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sursarshill','Julie','97 rue des Lilas OYONNAX 01100','0493949488','CHC',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pletziglass','Andrée','76 rue Alphonse Daudet LAUNOIS-SUR-VENCE 08430','0355911277','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Ronsart','Rosalie','28 rue des Argonautes SAINTE-MARIE 05150','0470907768','HOM',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Guimauve','Alizée','78 rue de Marigny HERBEUVAL 08370','0347904226','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sabatier','Adelphe','72 rue Albert Camus SAINT-FIRMIN 05800','0474088419','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chastidien','Rodolphe','59 rue Pasteur ORCIERES 05170','0464480776','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Azria','Martin','14 rue Perdue AUBENTON 02500','0377909038','OST',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Roland','Marie','89 rue Pasteur SIGOYER 05130','0461827483','HOM',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Liorehen','Marie','51 rue des Epines ABBECOURT 02300','0326934571','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zidanne','Julienne','3 rue des Artistes BLYES 01150','0413911989','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Homar','Amélie','45 rue des Cavaux ABBECOURT 02300','0372174885','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rachock','Jules','18 rue Agniel AUBENTON 02500','0368418443','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Froudette','Aurèle','64 rue de Poligny BRIANCON 05100','0484091392','OST',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lopes','Bertrand','68 rue de la gare BOURG-EN-BRESSE 01000','0416521067','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prestoriat','Jimmy','66 rue de Paris OYONNAX 01100','0419790693','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Nohan','55 rue Victor Hugo BANCIGNY 02140','0350319392','HOM',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prouteau','Caline','96 rue Perdue CAMON 09500','0540178028','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pistache','André','34 rue des Princes ROCHEBRUNE 05190','0444668151','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Politzer','Hector','75 rue des Anses bleues SAINT-LAURENT-SUR-SAONE 01750','0478936977','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chrome','Précilia','39 rue Petit SAINT-LAURENT-SUR-SAONE 01750','0456796681','OST',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kérouanne','Gilles','11 rue des Pigeons NEUVILLE-LES-DAMES 01400','0418340885','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Durhum','Jordan','53 rue des Anses bleues PELVOUX 05340','0474792387','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Thardieux','Julien','76 rue Pasteur PELVOUX 05340','0439307843','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Froudette','François','83 rue Petit BRIANCON 05100','0481669712','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Farahoui','Firmin','69 rue de la Tour AUGIREIN 09800','0561526750','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prouteau','Bernard','50 rue Malraux MONCEAU-SUR-OISE 02120','0330404637','MAS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Doineau','Aline','63 rue du général de Gaulle MONTCY-NOTRE-DAME 08090','0330296222','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Yoggi','Anne-Sophie','28 rue du général de Gaulle BRIANCON 05100','0466993498','GER',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Durieux','Bernard','47 rue du général de Gaulle CAMON 09500','0534440216','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Format','Anne-Marie','15 rue des Princes ASTON 09310','0584747640','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bretonnot','Aristote','27 rue des Cavaux FEPIN 08170','0333376588','ANG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('GrosJean','John','41 rue Commandant Mouchotte HAUTEVILLE 02120','0328740889','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ségura','Irénée','42 rue Agniel OYONNAX 01100','0447938676','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Farahoui','Martin','67 rue Agniel NEUVILLE-LES-DAMES 01400','0412803539','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sibroton','Rosalie','15 rue Edouard Hériot ARROUT 09800','0553692792','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mérieux','Gilles','64 rue du Mont HAUTEVILLE 02120','0310558221','GER',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jaoulle','Aude','25 rue des hirondelles BLYES 01150','0415240773','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hemdaoui','Reissa','65 rue du général de Gaulle AZY-SUR-MARNE 02400','0374955418','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Oulianov','Andrée','30 rue du 14 juillet AVANCON 05230','0463468177','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipion','Julien','47 rue Agniel JOIGNY-SUR-MEUSE 08700','0334063627','OBS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prestor','Reissa','62 rue de la Tour ROCHEBRUNE 05190','0480473643','OBS',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fourmiret','Sophie','91 rue Petit AUBENTON 02500','0348745022','CHR',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Patricia','95 rue Pasteur HERBEUVAL 08370','0354297793','CHR',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Oulianov','Reissa','25 rue Perdue AX-LES-THERMES 09110','0540152929','OST',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lopes','Armelle','57 rue des Pigeons SAINT-FIRMIN 05800','0479849596','CHR',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Minge','Irénée','83 rue des pyramides FLEVILLE 08250','0312351408','CHC',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kobel','Anne-Laure','58 rue des Argonautes ATTILLY 02490','0344455589','CHR',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chrome','Patrick','28 rue des Cyprés OYONNAX 01100','0456081235','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hutch','Ines','65 rue du caféTRAVECY 02800','0344024000','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scott','Julie','30 rue de du général Scott SAINT-FIRMIN 05800','0440937400','URG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zingaro','Aurélien','92 rue des Cyprés BEZAC 09100','0521006225','URG',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framaouzy','Martial','41 rue du général de Gaulle AUGIREIN 09800','0569674646','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazile','Amiel','6 rue Malraux HAUTEVILLE 02120','0336447283','OST',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Thardieux','Jérémy','62 rue Lampion BEZAC 09100','0526185264','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fylbouni','Cristophe','88 rue du général de Gaulle BOULIGNEUX 01330','0435544779','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fort','Ingrid','6 rue du 14 juillet DOMMARTIN 01380','0442048091','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cheroudy','Jimmy','50 rue Anatole France MACHAULT 08310','0332316186','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Lazio','Aline','68 rue des Artistes NEUVILLE-LES-DAMES 01400','0431882334','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Yoggi','Irénée','34 rue des Chantereines BEAUMONT-EN-BEINE 02300','0337016124','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jalouve','Gilles','28 rue du Mont JOIGNY-SUR-MEUSE 08700','0356982229','OST',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Martinet','Irénée','33 rue des perles blanches HOUDILCOURT 08190','0399670344','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kan','Habib','9 rue des gatinnes BEZAC 09100','0521113468','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chermis','Cristophe','18 rue Edouard Hériot CHALLES 01450','0428126087','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chastidien','Aline','87 rue de la Tour ORCIERES 05170','0474417618','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ricardo','Julien','20 rue des Chantereines SAINT-SAUVEUR 05200','0430434976','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epoka','Anselme','14 rue des Anges REOTIER 05600','0441999912','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bredequin','Anne-Lucie','47 rue Bonaparte AUGIREIN 09800','0533497900','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lopez','Alizée','96 rue Albert Camus BAGERT 09230','0519203974','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Doineau','Béatrice','97 rue Lampion TRAVECY 02800','0350641861','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hemdaoui','Serge','61 rue du caféSAVINES-LE-LAC 05160','0489512105','OST',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamois','Rodolphe','43 rue des Princes ASTON 09310','0513212527','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Durhum','Adelphe','80 rue des Princes AVANCON 05230','0446646697','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nahraoui','Austine','47 rue Pasteur BEZAC 09100','0530872724','CHC',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Klébert','Yoan','55 rue des Cavaux AGUILCOURT 02190','0324607617','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fermontin','Gilles','46 rue du stade MONT-LAURENT 08130','0387328329','MAS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zola','Aude','98 rue des Cyprés SAINT-CREPIN 05600','0458369404','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zingaro','Cristophe','82 rue Hector Berlioz ARANDAS 01230','0425003261','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pionneer','Jérémy','21 rue des Princes MONT-LAURENT 08130','0322135363','ANG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lièvremont','Mohammed','53 rue Pasteur THIN-LE-MOUTIER 08460','0389514499','URG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ferdinand','Précilia','38 rue Louis Aragon SAVINES-LE-LAC 05160','0441180757','URG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charles','Françoise','63 rue des Anges AX-LES-THERMES 09110','0553742065','URG',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Festina','sabine','18 rue Lampion MONTCEAUX 01090','0474843880','OST',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jaoulle','Julien','50 rue des Chantereines REOTIER 05600','0433213809','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epoka','Julie','29 rue de du général Scott SAINT-ANDRE-DE-ROSANS 05150','0450980762','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radot','Roby','14 rue du caféLAVAL-MORENCY 08150','0350310027','ANG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chrome','Jérémy','42 rue du capitaine Fraquasse JUNIVILLE 08310','0361117640','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Durhum','Anne-Laure','63 rue Commandant Mouchotte BOURG-EN-BRESSE 01000','0442277236','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Armouche','Anaelle','21 rue des Cavaux CHEZY-SUR-MARNE 02570','0388675304','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rastidien','Hamed','74 rue Victor Hugo ARROUT 09800','0541004550','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipion','Béatrice','54 rue Victor Hugo FRESSANCOURT 02800','0312941986','ALL',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ferdinand','Françoise','98 rue de la Tour MESSINCOURT 08110','0317883763','GER',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Thardieux','Aristote','73 rue des Anges BARENTON-SUR-SERRE 02270','0369353331','OBS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanzert','Johnny','41 rue Victor Hugo FALAISE 08400','0393642374','OBS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Arvis','André','59 rue de la Pergolat BAGERT 09230','0570809688','OBS',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fourmiret','Carole','49 rue de du général Scott HOUDILCOURT 08190','0318196859','URG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Milliet','Armelle','70 rue du caféLAVAL-MORENCY 08150','0330805895','OST',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kan','François','51 rue des Lilas SAINT-FIRMIN 05800','0410879788','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Dusel','Anémone','66 rue Commandant Mouchotte BRIANCON 05100','0421542405','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framzaoui','Reissa','73 rue de la Pergolat BRIANCON 05100','0444698187','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pionneer','John','2 rue des Princes SAVINES-LE-LAC 05160','0431249814','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Billahian','Catherine','53 rue de Poligny BARZY-SUR-MARNE 02850','0373513553','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frequin','Jules','30 rue Malraux EVIGNY 08090','0317625916','GER',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Yanshen','Martin','35 rue des perles blanches OYONNAX 01100','0484949416','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Newmann','Rodolphe','22 rue du stade AX-LES-THERMES 09110','0597525447','GER',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nazaoui','Patrick','18 rue Perdue NEUVILLE-LES-DAMES 01400','0454304156','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nahraoui','Bertrand','65 rue des Anses bleues BELLOC 09600','0522232477','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Capliez','Bernard','70 rue des pyramides AX-LES-THERMES 09110','0548800884','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zelniky','Rosalie','9 rue du caféSAINT-CREPIN 05600','0470298666','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Roulède','Jordan','36 rue du caféMONCEAU-SUR-OISE 02120','0337902134','CHC',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fourmiret','Jérémie','27 rue de Paris TRAVECY 02800','0321240986','ANG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frequin','Catherine','25 rue du stade THIN-LE-MOUTIER 08460','0373019942','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Oar','Précilia','58 rue des Chantereines SORBIERS 05150','0456138900','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cerpico','Roby','14 rue des Princes REOTIER 05600','0418201233','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hollidays','Roby','7 rue du 14 juillet SAINT-FIRMIN 05800','0435737841','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fournil','Alice','21 rue du 14 juillet AUDRESSEIN 09800','0549577626','ALL',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fournil','Sophie','12 rue Blainville BOULIGNEUX 01330','0485824681','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Armelle','87 rue des pyramides BANCIGNY 02140','0380163229','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radronck','Cristophe','44 rue St Denis ROCHEBRUNE 05190','0421833954','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznakovitch','Reissa','27 rue de la gare AUDRESSEIN 09800','0525862994','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Astoria','Amélie','41 rue des pyramides VAUX-CHAMPAGNE 08130','0343900888','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Roulède','Andrew','31 rue de la mairie FLOING 08200','0311338451','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Béronze ','Marie','35 rue des gatinnes PELVOUX 05340','0427092084','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Hamouti','Alice','35 rue du renard AX-LES-THERMES 09110','0579017565','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Loulianov','Jules','90 rue de Paris VAUX-CHAMPAGNE 08130','0386647121','MAS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Falmino','Rosalie','3 rue de Marigny AX-LES-THERMES 09110','0552021678','GER',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zidanne','Astine','7 rue de la Pergolat BAGERT 09230','0521392547','MAS',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bonieck','Prosper','90 rue Bonaparte YONCQ 08210','0392674994','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanscart','Fernand','42 rue Edouard Hériot ARROUT 09800','0515601750','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipillon','Anne-Laure','70 rue du Mont AZY-SUR-MARNE 02400','0347195732','OST',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framier','Julien','13 rue des Lilas BANCIGNY 02140','0339249742','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Hypolite','45 rue des Néfliers ORCIERES 05170','0435503130','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jamgotchian','Irénée','57 rue Hector Berlioz FEPIN 08170','0399685398','ANG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamois','Reissa','24 rue Hector Berlioz ARROUT 09800','0564256388','GER',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radocky','Jimmy','25 rue Albert Camus SAINT-LAURENT-SUR-SAONE 01750','0442319187','ANG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Protonne','Jérémie','96 rue Anatole France MONT-LAURENT 08130','0379511159','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zitoune','Victor','37 rue de Marigny SAINTE-MARIE 05150','0497549880','ANG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Guimauve','Bertrand','20 rue Pasteur BEDEILLE 09230','0522586224','CHC',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epriniche','Julien','44 rue Bonaparte BANCIGNY 02140','0390688254','CHC',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Khan','Habib','5 rue du stade AMBRIEF 02200','0327960352','OBS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lopez','André','69 rue Debussy MONCEAU-SUR-OISE 02120','0363762717','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Casson','Hypolite','20 rue Victor Hugo THIN-LE-MOUTIER 08460','0387692474','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Oumar','André','27 rue des Accacias LAUNOIS-SUR-VENCE 08430','0314089620','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznakovitch','Mohammed','48 rue du 14 juillet AX-LES-THERMES 09110','0557230819','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Roulède','Patrick','38 rue du renard BILLIAT 01200','0438986289','OBS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epoka','Précilia','3 rue des Epines AUGIREIN 09800','0555523105','OBS',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Merlieux','Hamed','43 rue des Epines HERBEUVAL 08370','0332471585','CHR',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fournil','Anne-Marie','26 rue de Paris SORBIERS 05150','0480449197','OST',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Liorehen','Amélie','33 rue de Marigny BRIANCON 05100','0429531221','MAS',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Festina','Précilia','17 rue des pyramides MESSINCOURT 08110','0383254238','OST',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jamgotchian','Précilia','24 rue Debussy BOURG-EN-BRESSE 01000','0431348186','MAS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charminet','Béatrice','21 rue des perles blanches MONTCY-NOTRE-DAME 08090','0314453519','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ségura','Caline','46 rue du caféMONTCEAUX 01090','0420799374','MAS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charlequin','Bénédicte','90 rue Agniel YONCQ 08210','0373069363','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cheroudy','Alain','17 rue St Denis AGUILCOURT 02190','0333695801','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Harviche','Précilia','34 rue Anatole France BETTANT 01500','0412141785','GER',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shavert','Anne-Laure','24 rue Commandant Mouchotte REOTIER 05600','0420893209','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hutch','Françoise','80 rue Albert Camus AMBRIEF 02200','0373756074','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kérouanne','Caline','30 rue des perles blanches SAINT-LAURENT-SUR-SAONE 01750','0439831324','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pololsky','Victor','14 rue des Lilas CHEZY-SUR-MARNE 02570','0313300681','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Minge','Aristote','79 rue des Anses bleues ARANDAS 01230','0420332660','OST',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frazier','Johnny','34 rue du renard FALAISE 08400','0370553291','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rodriguez','Jérome','28 rue Hector Berlioz ORCIERES 05170','0443297062','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bredequin','Françoise','88 rue du Mont FRESSANCOURT 02800','0313654986','ANG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Labatiste','Anaelle','48 rue des Argonautes ARROUT 09800','0518603040','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Resti','Jérémie','67 rue des gatinnes ARANDAS 01230','0410422676','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chrome','Julie','4 rue Anatole France DOMMARTIN 01380','0496807830','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Guimauve','Jules','62 rue de la Pergolat BOURG-EN-BRESSE 01000','0487728945','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nahraoui','Amélie','59 rue Louis Aragon CAMON 09500','0591653123','OST',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('CHeroudy','Johnny','80 rue de du général Scott JOIGNY-SUR-MEUSE 08700','0386814494','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Azria','Dominique','35 rue des Epines MONTCEAUX 01090','0463823233','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Azoulais','Amélie','60 rue des gatinnes BILLIAT 01200','0487102339','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mariveaux','Andrée','20 rue de la Pergolat MONTCEAUX 01090','0487833849','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Aristote','74 rue des Néfliers SAINT-LAURENT-SUR-SAONE 01750','0417675151','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charmieux','Anémone','78 rue Victor Hugo BRIANCON 05100','0430859878','ANG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Vispendieu','Amiel','2 rue Perdue AUBENTON 02500','0334550712','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Farahoui','Aline','88 rue de Poligny FRESSANCOURT 02800','0399301475','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Liorehen','Prosper','18 rue des hirondelles BOURG-EN-BRESSE 01000','0463936581','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Froudette','Marie','47 rue Perdue BRIANCON 05100','0464689414','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Klébert','Hector','91 rue des hirondelles AX-LES-THERMES 09110','0583375798','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Klébert','Jérémie','19 rue Commandant Hériot CEYZERIAT 01250','0426848534','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Brouzais','Aristote','96 rue du Mont ROCHEBRUNE 05190','0486526998','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frazier','Hypolite','92 rue Beaudelaire JOIGNY-SUR-MEUSE 08700','0364925968','MAS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cassolette','Jules','56 rue du Mont BILLIAT 01200','0459159687','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazoline','Anne-Lucie','94 rue Agniel BILLIAT 01200','0497364094','OST',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Favriellé','Reissa','37 rue de la pointe HAUTEVILLE 02120','0398806683','ALL',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Camus','Patricia','5 rue St Denis ABBECOURT 02300','0355040100','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mingo','Anne-Lucie','90 rue Lampion YONCQ 08210','0399778947','MAS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Khan','Jérémy','75 rue des Cavaux SAINT-LAURENT-SUR-SAONE 01750','0466069822','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charmis','Nohan','9 rue des Epines SAVOURNON 05700','0411774310','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cassin','Hector','87 rue Malraux LAUNOIS-SUR-VENCE 08430','0359717547','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bonieck','Aline','14 rue de la rose BARZY-SUR-MARNE 02850','0356584101','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Billahian','Sophie','66 rue du 14 juillet AVANCON 05230','0413861599','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pionneer','Dominique','72 rue des Argonautes BRIANCON 05100','0465512769','ANG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Durhum','Anne','78 rue des hirondelles PELVOUX 05340','0495946694','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Perronet','Ines','15 rue des Anses bleues MESSINCOURT 08110','0312418493','OBS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Resti','Anémone','21 rue Commandant Hériot BELLEY 01300','0465513099','OBS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bonieck','Sophie','54 rue du 14 juillet AX-LES-THERMES 09110','0548859466','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Vivian','Irénée','48 rue des perles blanches BRIANCON 05100','0424065321','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radosky','John','34 rue du Mont BETTANT 01500','0441330897','HOM',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nazaoui','Aurélien','61 rue Pasteur MAYOT 02800','0356229245','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Vivian','sabine','14 rue des Anges OYONNAX 01100','0456485843','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Oberlieux','Camille','67 rue Alphonse Daudet BUZAN 09800','0531797312','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fylbouni','Mohammed','6 rue des Pigeons BARENTON-SUR-SERRE 02270','0370234499','MAS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Oar','Amiel','23 rue Hector Berlioz BETTANT 01500','0487520515','OBS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Azria','Vénus','90 rue des Lilas HAUTEVILLE 02120','0394086731','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sidot','Hypolite','80 rue de la gare ARANDAS 01230','0440645072','OST',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rastidien','Anémone','22 rue des Cyprés BLYES 01150','0470785500','GER',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Oulianov','Rodolphe','24 rue des Anges BELLEY 01300','0459668577','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanzert','Julie','88 rue des Pigeons JUNIVILLE 08310','0391920541','MAS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zelniky','Alice','6 rue des hirondelles SAINT-CREPIN 05600','0478485015','MAS',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Guimauve','Carole','78 rue des Pigeons SAINTE-MARIE 05150','0433025835','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ambert','Marie','19 rue de la pointe PELVOUX 05340','0411070122','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Braquet','Ingrid','35 rue Malraux QUATRE-CHAMPS 08400','0370478563','ALL',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Alain','27 rue du stade SAINT-LAURENT-SUR-SAONE 01750','0492470117','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shavert','Vénus','29 rue de Paris AVANCON 05230','0424123589','URG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framier','Bernard','53 rue de la mairie BAGERT 09230','0550830599','OST',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Charlequin','Serge','52 rue de Paris SAINT-FIRMIN 05800','0472679599','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fermat','Anaelle','92 rue Blainville SAINT-ANDRE-DE-ROSANS 05150','0474041924','GER',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sibroton','Charles','47 rue Beaudelaire AMBRIEF 02200','0356493035','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Hamouti','Fatima','73 rue des Anges FRESSANCOURT 02800','0390943061','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sadot','André','95 rue Edouard Hériot SAINT-FIRMIN 05800','0483174531','HOM',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frazier','André','24 rue Louis Aragon REOTIER 05600','0476877380','URG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zingaro','Ines','71 rue Edouard Hériot ASTON 09310','0543065471','HOM',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('''Chrome','Irénée','72 rue du capitaine Crochet SAVOURNON 05700','0415947068','ANG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Harshill','Armelle','32 rue de Paris SAINT-LAURENT-SUR-SAONE 01750','0480648434','URG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznakovitch','Serge','96 rue des oiseaux YONCQ 08210','0397358254','URG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frazier','Patrick','66 rue Blainville FRESSANCOURT 02800','0330907062','OST',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Habresh','Caline','84 rue des Epines BRIANCON 05100','0411957355','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fermontin','Patrice','93 rue Perdue DOMMARTIN 01380','0430289650','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazoline','Martin','96 rue des Pigeons ORCIERES 05170','0492319447','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rastuffe','Rosalie','34 rue des Ormes AX-LES-THERMES 09110','0577827344','URG',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ambert','Robert','97 rue des perles blanches VAUX-CHAMPAGNE 08130','0315818160','URG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Protonne','Patricia','59 rue Pernod SORBIERS 05150','0452990036','GER',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Raminski','Patrice','30 rue de du général Scott SAINT-SAUVEUR 05200','0412740574','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Falahoui','Alizée','24 rue Commandant Hériot HERBEUVAL 08370','0372811016','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zomar','Amiel','30 rue des Epines ARROUT 09800','0554912883','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jalouve','Anne-Laure','72 rue des Accacias CEYZERIAT 01250','0495757649','ANG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epoka','Alain','89 rue de la Pergolat NEUVILLE-LES-DAMES 01400','0443139412','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chéchenko','Julien','52 rue Malraux MAYOT 02800','0313537125','CHC',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framier','Dominique','26 rue des Pigeons CHEZY-SUR-MARNE 02570','0376713314','INF',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('CHeroudy','Prosper','34 rue des pyramides DOMMARTIN 01380','0437007893','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipillon','Amélie','84 rue de Marigny AMBRIEF 02200','0362342189','GER',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Durhum','Carole','14 rue des Lilas SAVOURNON 05700','0440474468','ALL',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mar','Adelphe','32 rue de Marigny CHABESTAN 05400','0479332407','ANG',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamois','Anne-Lucie','31 rue des pyramides MAYOT 02800','0352060592','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Egrouzais','Amélie','90 rue des Néfliers HOUDILCOURT 08190','0360017048','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ben Harfa','Adelphe','35 rue des Argonautes BOULIGNEUX 01330','0470938471','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rastidien','Rosalie','14 rue Blainville FLEVILLE 08250','0320670229','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Caline','27 rue Pasteur AX-LES-THERMES 09110','0512150549','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gaudillot','Astine','94 rue Debussy MONTIGNY-SUR-MEUSE 08170','0358772408','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Vivian','Victor','23 rue St Denis TRAVECY 02800','0330373632','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hutch','Aristote','55 rue Agniel BEDEILLE 09230','0597171275','MAS',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mistigry','Charles-Edouard','78 rue de la recette MACHAULT 08310','0325349638','ANG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Frequin','Caline','19 rue Pernod AX-LES-THERMES 09110','0568016782','INF',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lopes','Aurèle','9 rue de la gare MONTCY-NOTRE-DAME 08090','0346893168','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ségura','Serge','99 rue de Paris MONTCY-NOTRE-DAME 08090','0391243175','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Béronzelle ','Aline','66 rue des Cyprés ROCHEBRUNE 05190','0474044568','HOM',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanscart','Gilles','13 rue des Ormes BLYES 01150','0424315941','ANG',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kérouanne','Johnny','99 rue des Epines LAUNOIS-SUR-VENCE 08430','0313668088','ALL',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chrome','Jérome','24 rue des Anses bleues FLOING 08200','0351576826','INF',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Egrouzais','Amiel','16 rue des oiseaux OYONNAX 01100','0480872838','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ronsard','Irénée','24 rue Agniel BOURG-EN-BRESSE 01000','0457782183','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hanscart','Andrew','63 rue de du général Scott SAINTE-MARIE 05150','0496424640','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fort','Fatima','9 rue des Cyprés FRESSANCOURT 02800','0399807861','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radot','Andrew','53 rue de la Pergolat CHABESTAN 05400','0448286750','MAS',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framier','Gilles','47 rue du capitaine Fraquasse BANCIGNY 02140','0397976949','HOM',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chéchenko','Marie','89 rue Albert Camus MONTCY-NOTRE-DAME 08090','0378321982','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fort','Anne-Jeanne','81 rue des Cavaux SAINT-LAURENT-SUR-SAONE 01750','0463951383','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Habresh','Armelle','76 rue du Mont MONTCEAUX 01090','0415598111','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gaudin','Anémone','19 rue Albert Camus CAMON 09500','0573404038','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Durhum','Prosper','67 rue de la gare FLOING 08200','0324668686','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zebitoun','Anselme','53 rue des hirondelles FLOING 08200','0327408227','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Capliez','Roby','13 rue du stade OYONNAX 01100','0474204428','MAS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipillon','Vénus','50 rue des Argonautes HERBEUVAL 08370','0373456319','PSY',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nahraoui','Aline','54 rue de la Tour ARROUT 09800','0573442616','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Alain','50 rue Anatole France TRAVECY 02800','0323311091','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Krevette','Mohammed','78 rue des Epines BLYES 01150','0431013911','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fermontin','sabine','80 rue de la Tour AX-LES-THERMES 09110','0516185496','ANG',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bouglieux','Adelphe','43 rue de la pointe AZY-SUR-MARNE 02400','0325660790','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scott','Annie','96 rue du général de Gaulle AX-LES-THERMES 09110','0599243446','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Lazio','John','82 rue de la recette AGUILCOURT 02190','0366228551','CHC',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Brouzais','Aurélien','66 rue Louis Aragon BETTANT 01500','0473878093','MAS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fressinet','Hypolite','70 rue des Néfliers CHALLES 01450','0476171240','CHC',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamonix','Sophie','43 rue des Armées BRIANCON 05100','0415807023','OBS',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shouchen','Anselme','59 rue Petit FRESSANCOURT 02800','0383782513','GER',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazoline','Ines','43 rue du général de Gaulle AUGIREIN 09800','0598718886','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Aurélien','79 rue de la gare BELLEY 01300','0479776039','PSY',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Roland','Andrew','18 rue du Mont CHALLES 01450','0433547437','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scotland','Jérome','89 rue des pyramides MONCEAU-SUR-OISE 02120','0345551167','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Guimauve','Serge','97 rue du capitaine Crochet FLOING 08200','0316196835','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fortin','Patrice','25 rue des gatinnes FLEVILLE 08250','0334902877','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fylbouni','Bénédicte','13 rue Agniel BEZAC 09100','0566740268','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Jérome','40 rue des perles blanches SAINT-ANDRE-DE-ROSANS 05150','0446944245','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Doineau','Jérémie','78 rue des Epines VAUX-CHAMPAGNE 08130','0358416091','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nasri','Catherine','34 rue Malraux MACHAULT 08310','0384057669','OBS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sérénice','Prosper','76 rue des Epines FLOING 08200','0393379729','OBS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Hamouti','Patrick','26 rue Agniel BOURG-EN-BRESSE 01000','0479180299','OBS',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Rosty','Julie','40 rue des Armées AMBRIEF 02200','0361450183','CHR',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prestoriat','Jordan','27 rue de la rose BANCIGNY 02140','0352416188','HOM',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipillon','Julienne','69 rue des gatinnes AX-LES-THERMES 09110','0580069967','ACU',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pastor','Annie','58 rue du capitaine Fraquasse CHABESTAN 05400','0467360442','HOM',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zingaro','Patrick','19 rue Pernod SIGOYER 05130','0457375943','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Brouzais','Andrew','83 rue de Paris AMBRIEF 02200','0395359341','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framaouzy','Adelphe','27 rue Bonaparte CHEZY-SUR-MARNE 02570','0355084339','ACU',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chrome','sabine','65 rue des Pigeons HERBEUVAL 08370','0360394232','GER',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipion','Irénée','69 rue de la recette MACHAULT 08310','0383128193','MAS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zitoune','Martial','86 rue du général de Gaulle BARZY-SUR-MARNE 02850','0317141855','ACU',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Loulianov','Roby','9 rue du général de Gaulle SAINT-ANDRE-DE-ROSANS 05150','0487582509','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Arditi','Aurèle','87 rue des Armées BARZY-SUR-MARNE 02850','0338003620','ANG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Kopa','Sophie','94 rue de Poligny ARROUT 09800','0557640538','PSY',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epriniche','Aurèle','63 rue des Epines ASTON 09310','0522392505','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fylbouni','Bertrand','46 rue des Néfliers AUBENTON 02500','0347004937','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ambert','Catherine','75 rue des Pigeons MEZIERES-SUR-OISE 02240','0361266958','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shavert','Anne-Jeanne','45 rue de la mairie MONTCEAUX 01090','0483591358','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamonix','Précilia','97 rue de Marigny OYONNAX 01100','0492249302','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Durieux','Julien','86 rue Pasteur AMBRIEF 02200','0351207619','ACU',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sibaton','Yoan','16 rue des Cyprés ROCHEBRUNE 05190','0447561911','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Froudette','Martin','12 rue de Marigny SAVOURNON 05700','0427247399','MAS',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Yansen','Alizée','88 rue Blainville ROCHEBRUNE 05190','0426259531','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Aznakovitch','Anne-Jeanne','25 rue des Cavaux SAINT-ANDRE-DE-ROSANS 05150','0453552598','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Billahian','Anémone','52 rue des Argonautes BRIANCON 05100','0490437250','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hourin','Rosalie','1 rue Albert Camus BOURG-EN-BRESSE 01000','0436516378','GER',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scotland','Julien','16 rue du caféJUNIVILLE 08310','0387772024','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nahraoui','Béatrice','56 rue de du général Scott BLYES 01150','0497830362','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nahraoui','Irénée','28 rue Hector Berlioz YONCQ 08210','0391607943','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prouteau','Bernard','67 rue des Pigeons AZY-SUR-MARNE 02400','0363260638','ACU',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Format','Nohan','56 rue de la mairie BILLIAT 01200','0489588610','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Klébert','Hector','56 rue du Mont AUBENTON 02500','0317965994','PSY',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chesnikov','Vénus','42 rue du caféSAINT-FIRMIN 05800','0496188645','PSY',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framzaoui','Ingrid','69 rue des gatinnes SAINT-LAURENT-SUR-SAONE 01750','0474955755','ACU',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazoline','Béatrice','83 rue du caféLAVAL-MORENCY 08150','0353669720','GER',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Lazio','Aristote','45 rue des Néfliers ORCIERES 05170','0410443514','OST',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Faure','Firmin','86 rue Alphonse Daudet SORBIERS 05150','0474673714','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shouchen','Hypolite','46 rue Blainville BELLEY 01300','0432841577','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radot','Anne-Laure','10 rue Debussy BRIANCON 05100','0488339706','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Liorehen','Adrien','16 rue des Lilas CHEZY-SUR-MARNE 02570','0375598648','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zingaro','Martial','48 rue des Cavaux BRIANCON 05100','0497203279','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prestor','Adrien','67 rue du caféNEUVILLE-LES-DAMES 01400','0483807492','CHC',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('GrosJean','Andrée','9 rue Blainville BILLIAT 01200','0443247634','CHC',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Khan','Austine','76 rue des Ormes BEDEILLE 09230','0541576058','GER',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cassan','sabine','37 rue du stade ARROUT 09800','0574023557','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Gaudin','Bénédicte','52 rue du caféSAINT-FIRMIN 05800','0498785723','GER',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Prestoriat','Aline','72 rue des Accacias AX-LES-THERMES 09110','0548451154','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Cerpico','Charles-Edouard','19 rue des Accacias HOUDILCOURT 08190','0316020754','MAS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Yoggi','Hector','65 rue des Lilas BEDEILLE 09230','0574559022','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bazile','Anémone','5 rue du 14 juillet CHEZY-SUR-MARNE 02570','0337232948','ANG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Astoria','Ingrid','92 rue des Epines AX-LES-THERMES 09110','0561364657','ACU',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Heroudy','Habib','22 rue de la pointe MESSINCOURT 08110','0313589708','ACU',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Caroussel','Jérémy','59 rue des perles blanches YONCQ 08210','0326242380','MAS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Zerbib','Amiel','96 rue Pasteur ARROUT 09800','0587698522','ACU',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lièvremont','Austine','65 rue du caféMONTCEAUX 01090','0470285907','CHR',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chamonix','Anne-Jeanne','32 rue Pernod TRAVECY 02800','0333270659','URG',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Durieux','François','33 rue des Armées JOIGNY-SUR-MEUSE 08700','0349739798','URG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Framzaoui','Astine','14 rue de Paris HAUTEVILLE 02120','0351375540','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Epoka','Catherine','62 rue Petit AUBENTON 02500','0396351922','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Shavert','Dominique','16 rue Albert Camus MONTCEAUX 01090','0460614067','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Raminski','Habib','43 rue Agniel FEPIN 08170','0334104949','OBS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scotland','Bertrand','19 rue des Armées BUZAN 09800','0568125818','HOM',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Hutch','Anne-Lucie','98 rue de la recette CHABESTAN 05400','0456022326','OBS',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Billahian','Bernard','20 rue des Pigeons ARROUT 09800','0573067550','GEN',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Fort','Nohan','43 rue des hirondelles BEDEILLE 09230','0525181569','URG',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nazaoui','Anne-Sophie','31 rue Blainville BARENTON-SUR-SERRE 02270','0373526813','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Chevalier','Alice','33 rue des Accacias ROCHEBRUNE 05190','0449350884','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ambert','Aline','84 rue du capitaine Crochet MONT-LAURENT 08130','0325576123','OBS',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ségura','John','3 rue de la Tour FRESSANCOURT 02800','0331446881','OBS',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Har','Anne','96 rue des Anges AUBENTON 02500','0378136627','GER',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bridel','Julienne','69 rue des Argonautes MONT-LAURENT 08130','0370869862','URG',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Di Conota','Amiel','64 rue Bonaparte PELVOUX 05340','0488029182','GEN',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('El Arabi','sabine','82 rue Petit MONTCEAUX 01090','0462167372','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Casson','Aurélien','43 rue de la pointe SAINTE-MARIE 05150','0435284955','GER',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Pololsky','François','82 rue des gatinnes LAVAL-MORENCY 08150','0342390211','CHC',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Ligne','Anne-Jeanne','43 rue Hector Berlioz MONTCEAUX 01090','0423643158','INF',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sabatier','Gilles','61 rue de la Pergolat FLEVILLE 08250','0344269218','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Mestre','Anne-Lucie','10 rue des Armées JUNIVILLE 08310','0323215933','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Lopez','Rosalie','61 rue Lampion MAYOT 02800','0334037246','ACU',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Scipillon','Marie','42 rue de la recette MONTCEAUX 01090','0483490191','ACU',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Radot','Alain','49 rue des Chantereines SAINT-SAUVEUR 05200','0444873979','ACU',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Mérieux','Yoan','26 rue Perdue BARENTON-SUR-SERRE 02270','0383462706','ACU',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Oberlieux','Anne-Lucie','30 rue des Néfliers FRESSANCOURT 02800','0375894393','ACU',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Serbouny','Nohan','35 rue Pernod BELLOC 09600','0584397641','URG',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Jarrinovski','John','87 rue des Epines JUNIVILLE 08310','0326912283','ALL',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Capliez','Patricia','11 rue des Armées CAMON 09500','0564584038','ACU',09);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('CHeroudy','Adelphe','1 rue des Anges AMBRIEF 02200','0341912319','ACU',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Margot','Anaelle','34 rue de la Tour BOURG-EN-BRESSE 01000','0421198450','ACU',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('OMar','Jérome','1 rue du capitaine Crochet MAYOT 02800','0322747123','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Ricardo','Hector','96 rue des Princes AGUILCOURT 02190','0344210000','GEN',02);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Sursarshill','Austine','48 rue Beaudelaire MACHAULT 08310','0327416806','GEN',08);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Bretonnot','Anne','37 rue du capitaine Crochet SIGOYER 05130','0440990856','ACU',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('De Mestre','Aude','87 rue Louis Aragon SAINTE-MARIE 05150','0458331361','INF',05);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Nazaoui','Aurélien','83 rue des hirondelles SAINT-LAURENT-SUR-SAONE 01750','0419114151','GEN',01);
insert into Medecin(nom,prenom,adresse,tel,idSpecialite,departement) values('Armouche','Sophie','83 rue des Chantereines NEUVILLE-LES-DAMES 01400','0412959203','GEN',01);


-- Contenu Rapport
insert into rapport values(NULL,'2025-09-02','Installation nouvelle','Trop pressé','b16',963);
insert into rapport values(NULL ,'2025-09-02','Demande du médecin','Très aimable maintenir un contact régulier','a93',4);
insert into rapport values(NULL,'2025-09-02','Demande du médecin','Trop pressé','a93',86);
insert into rapport values(NULL,'2025-09-02','Recommandation de confrère','Visite positive','a131',2);
insert into rapport values(NULL,'2025-09-02','Recommandation de confrère','Pas intéressé du tout','e49',570);
insert into rapport values(NULL,'2025-09-02','Installation nouvelle','Sur sa réserve','b13',82);
insert into rapport values(NULL,'2025-09-02','Visite annuelle','Pas intéressé du tout','b25',521);
insert into rapport values(NULL,'2025-09-02','Prise de contact','Très fixé sur les produits utilisés','d13',639);
insert into rapport values(NULL,'2025-09-02','Demande du médecin','Visite positive','b16',863);
insert into rapport values(NULL,'2025-09-02','Demande du médecin','A revoir assez rapidement','e39',475);
insert into rapport values(NULL,'2025-09-02','recommandation de confrère','Très aimable maintenir un contact régulier','e39',575);
insert into rapport values(NULL,'2025-09-02','Installation nouvelle','A revoir assez rapidement','b19',268);
insert into rapport values(NULL,'2025-09-02','Installation nouvelle','Demande à me revoir dans un mois','c14',754);
insert into rapport values(NULL,'2025-09-02','Recommandation de confrère','Très aimable maintenir un contact régulier','b50',421);
insert into rapport values(NULL,'2025-09-02','Prise de contact','Sur sa réserve','e5',11);
insert into rapport values(NULL,'2025-09-02','Visite annuelle','Pas très aimable','b59',791);
insert into rapport values(NULL,'2025-09-02','Visite annuelle','Très fixé sur les produits utilisés','e5',28);
insert into rapport values(NULL,'2025-09-02','Installation nouvelle','Sur sa réserve','c14',662);
insert into rapport values(NULL,'2025-09-02','Prise de contact','Très aimable maintenir un contact régulier','e24',365);
insert into rapport values(NULL,'2025-09-02','Demande du médecin','Pas très aimable','b28',882);
insert into rapport values(NULL,'2025-09-03','Visite annuelle','RAS','e39',727);
insert into rapport values(NULL,'2025-09-03','Recommandation de confrère','Visite positive','e39',882);
insert into rapport values(NULL,'2025-09-03','Demande du médecin','Demande à me revoir dans un mois','b34',69);
insert into rapport values(NULL,'2025-09-03','Demande du médecin','Demande à me revoir dans un mois','b4',200);
insert into rapport values(NULL,'2025-09-03','Recommandation de confrère','RAS','c3',265);
insert into rapport values(NULL,'2025-09-03','Demande du médecin','A revoir assez rapidement','d13',589);
insert into rapport values(NULL,'2025-09-03','Demande du médecin','Visite positive','b25',471);
insert into rapport values(NULL,'2025-09-03','Prise de contact','Très intéressé par les produits présentés','a131',935);
insert into rapport values(NULL,'2025-09-03','Recommandation de confrère','Peu bavard','f21',41);
insert into rapport values(NULL,'2025-09-03','Recommandation de confrère','Demande à me revoir dans un mois','e39',148);
insert into rapport values(NULL,'2025-09-03','Installation nouvelle','Peu bavard','d13',820);
insert into rapport values(NULL,'2025-09-03','Recommandation de confrère','Très fixé sur les produits utilisés','b28',691);
insert into rapport values(NULL,'2025-09-03','Recommandation de confrère','A beaucoup appécié notre rencontre','c14',381);
insert into rapport values(NULL,'2025-09-03','Visite annuelle','Très intéressé par les produits présentés','c14',818);
insert into rapport values(NULL,'2025-09-03','Demande du médecin','A revoir assez rapidement','b59',153);
insert into rapport values(NULL,'2025-09-03','Prise de contact','Très aimable maintenir un contact régulier','b25',321);
insert into rapport values(NULL,'2025-09-03','Installation nouvelle','Jeune médecin découvrant les visiteurs','b19',352);
insert into rapport values(NULL,'2025-09-03','Recommandation de confrère','Très aimable maintenir un contact régulier','b34',86);
insert into rapport values(NULL,'2025-09-03','Demande du médecin','Jeune médecin découvrant les visiteurs','c54',404);
insert into rapport values(NULL,'2025-09-03','Prise de contact','Visite positive','e39',803);
insert into rapport values(NULL,'2025-09-04','Prise de contact','Pas très aimable','c14',34);
insert into rapport values(NULL,'2025-09-04','Prise de contact','Trop pressé','e52',738);
insert into rapport values(NULL,'2025-09-04','Prise de contact','Sur sa réserve','d51',628);
insert into rapport values(NULL,'2025-09-04','Demande du médecin','Trop pressé','c3',356);
insert into rapport values(NULL,'2025-09-04','Installation nouvelle','Très aimable maintenir un contact régulier','a17',388);
insert into rapport values(NULL,'2025-09-04','Visite annuelle','Peu bavard','e5',590);
insert into rapport values(NULL,'2025-09-04','Visite annuelle','Jeune médecin découvrant les visiteurs','b13',603);
insert into rapport values(NULL,'2025-09-04','Prise de contact','Très intéressé par les produits présentés','b16',551);
insert into rapport values(NULL,'2025-09-04','Prise de contact','Trop pressé','d13',995);
insert into rapport values(NULL,'2025-09-04','Recommandation de confrère','Pas intéressé du tout','e24',115);
insert into rapport values(NULL,'2025-09-04','Prise de contact','A beaucoup appécié notre rencontre','e5',680);
insert into rapport values(NULL,'2025-09-04','Installation nouvelle','Pas en confiance','e39',564);
insert into rapport values(NULL,'2025-09-04','Recommandation de confrère','A revoir assez rapidement','e22',281);
insert into rapport values(NULL,'2025-09-04','Installation nouvelle','Jeune médecin découvrant les visiteurs','c54',542);
insert into rapport values(NULL,'2025-09-04','Installation nouvelle','Peu intéressé','e5',137);
insert into rapport values(NULL,'2025-09-04','Prise de contact','Très aimable maintenir un contact régulier','b19',362);
insert into rapport values(NULL,'2025-09-04','Recommandation de confrère','Très intéressé par les produits présentés','b16',633);
insert into rapport values(NULL,'2025-09-04','Visite annuelle','Pas très aimable','c14',424);
insert into rapport values(NULL,'2025-09-04','Prise de contact','Peu bavard','e52',663);
insert into rapport values(NULL,'2025-09-04','Visite annuelle','A revoir assez rapidement','e5',437);
insert into rapport values(NULL,'2025-09-05','Installation nouvelle','Pas très aimable','e24',264);
insert into rapport values(NULL,'2025-09-05','Demande du médecin','Peu bavard','e39',7);
insert into rapport values(NULL,'2025-09-05','Visite annuelle','Très intéressé par les produits présentés','b25',895);
insert into rapport values(NULL,'2025-09-05','Prise de contact','Pas très aimable','d13',182);
insert into rapport values(NULL,'2025-09-05','Demande du médecin','A beaucoup appécié notre rencontre','e24',594);
insert into rapport values(NULL,'2025-09-05','Prise de contact','Sur sa réserve','c3',285);
insert into rapport values(NULL,'2025-09-05','Installation nouvelle','Pas intéressé du tout','e22',834);
insert into rapport values(NULL,'2025-09-05','Prise de contact','Peu bavard','b50',531);
insert into rapport values(NULL,'2025-09-05','Visite annuelle','Jeune médecin découvrant les visiteurs','b59',873);
insert into rapport values(NULL,'2025-09-05','Prise de contact','Peu bavard','f39',976);
insert into rapport values(NULL,'2025-09-05','Demande du médecin','A revoir assez rapidement','c54',913);
insert into rapport values(NULL,'2025-09-05','Demande du médecin','Trop pressé','a131',931);
insert into rapport values(NULL,'2025-09-05','Demande du médecin','Pas en confiance','b4',571);
insert into rapport values(NULL,'2025-09-05','Prise de contact','Pas intéressé du tout','e52',487);
insert into rapport values(NULL,'2025-09-05','Visite annuelle','Très fixé sur les produits utilisés','c54',78);
insert into rapport values(NULL,'2025-09-05','Demande du médecin','Peu bavard','b59',103);
insert into rapport values(NULL,'2025-09-05','Installation nouvelle','Pas en confiance','e5',991);
insert into rapport values(NULL,'2025-09-05','Visite annuelle','Demande à me revoir dans un mois','d13',290);
insert into rapport values(NULL,'2025-09-05','Prise de contact','Demande à me revoir dans un mois','b19',314);
insert into rapport values(NULL,'2025-09-05','Prise de contact','Trop pressé','f39',43);
insert into rapport values(NULL,'2025-09-06','Demande du médecin','Demande à me revoir dans un mois','c14',797);
insert into rapport values(NULL,'2025-09-06','Prise de contact','Peu intéressé','a55',747);
insert into rapport values(NULL,'2025-09-06','Prise de contact','RAS','e49',97);
insert into rapport values(NULL,'2025-09-06','Prise de contact','Peu intéressé','e24',389);
insert into rapport values(NULL,'2025-09-06','Installation nouvelle','Très fixé sur les produits utilisés','b25',550);
insert into rapport values(NULL,'2025-09-06','Installation nouvelle','RAS','e39',546);
insert into rapport values(NULL,'2025-09-06','Visite annuelle','Très intéressé par les produits présentés','a131',643);
insert into rapport values(NULL,'2025-09-06','Visite annuelle','Pas très aimable','e52',410);
insert into rapport values(NULL,'2025-09-06','Prise de contact','A beaucoup appécié notre rencontre','e39',422);
insert into rapport values(NULL,'2025-09-06','Prise de contact','Pas en confiance','c3',765);
insert into rapport values(NULL,'2025-09-06','Installation nouvelle','Très intéressé par les produits présentés','b59',117);
insert into rapport values(NULL,'2025-09-06','Recommandation de confrère','A beaucoup appécié notre rencontre','e5',638);
insert into rapport values(NULL,'2025-09-06','Visite annuelle','Visite positive','c54',96);
insert into rapport values(NULL,'2025-09-06','Demande du médecin','Très fixé sur les produits utilisés','b19',257);
insert into rapport values(NULL,'2025-09-06','Recommandation de confrère','Peu bavard','e22',465);
insert into rapport values(NULL,'2025-09-06','Recommandation de confrère','Très fixé sur les produits utilisés','e22',907);
insert into rapport values(NULL,'2025-09-06','Visite annuelle','Jeune médecin découvrant les visiteurs','d13',871);
insert into rapport values(NULL,'2025-09-06','Visite annuelle','Très aimable maintenir un contact régulier','f39',15);
insert into rapport values(NULL,'2025-09-06','Recommandation de confrère','A beaucoup appécié notre rencontre','e52',676);
insert into rapport values(NULL,'2025-09-06','Prise de contact','Pas en confiance','c54',569);
insert into rapport values(NULL,'2025-09-07','Demande du médecin','Jeune médecin découvrant les visiteurs','d13',158);
insert into rapport values(NULL,'2025-09-07','Recommandation de confrère','Visite positive','a131',32);
insert into rapport values(NULL,'2025-09-07','Demande du médecin','A beaucoup appécié notre rencontre','b50',434);
insert into rapport values(NULL,'2025-09-07','Recommandation de confrère','Très intéressé par les produits présentés','e52',181);
insert into rapport values(NULL,'2025-09-07','Demande du médecin','Pas très aimable','a131',525);
insert into rapport values(NULL,'2025-09-07','Recommandation de confrère','RAS','c14',687);
insert into rapport values(NULL,'2025-09-07','Recommandation de confrère','Pas très aimable','b13',867);
insert into rapport values(NULL,'2025-09-07','Prise de contact','Pas très aimable','e22',302);
insert into rapport values(NULL,'2025-09-07','Demande du médecin','Sur sa réserve','b19',455);
insert into rapport values(NULL,'2025-09-07','Recommandation de confrère','A beaucoup appécié notre rencontre','e52',278);
insert into rapport values(NULL,'2025-09-07','Demande du médecin','Pas très aimable','c54',572);
insert into rapport values(NULL,'2025-09-07','Recommandation de confrère','A beaucoup appécié notre rencontre','a131',863);
insert into rapport values(NULL,'2025-09-07','Prise de contact','Pas en confiance','b25',959);
insert into rapport values(NULL,'2025-09-07','Installation nouvelle','Très intéressé par les produits présentés','d51',205);
insert into rapport values(NULL,'2025-09-07','Recommandation de confrère','Peu intéressé','b19',413);
insert into rapport values(NULL,'2025-09-07','Installation nouvelle','Sur sa réserve','b59',698);
insert into rapport values(NULL,'2025-09-07','Recommandation de confrère','Sur sa réserve','a17',857);
insert into rapport values(NULL,'2025-09-07','Recommandation de confrère','Très fixé sur les produits utilisés','b28',833);
insert into rapport values(NULL,'2025-09-07','Installation nouvelle','Pas en confiance','a93',308);
insert into rapport values(NULL,'2025-09-07','Prise de contact','Peu bavard','e39',362);
insert into rapport values(NULL,'2025-09-08','Prise de contact','Pas intéressé du tout','b25',803);
insert into rapport values(NULL,'2025-09-08','Demande du médecin','Demande à me revoir dans un mois','d13',291);
insert into rapport values(NULL,'2025-09-08','Prise de contact','RAS','c54',910);
insert into rapport values(NULL,'2025-09-08','Demande du médecin','Très fixé sur les produits utilisés','d13',205);
insert into rapport values(NULL,'2025-09-08','Visite annuelle','Peu intéressé','e24',775);
insert into rapport values(NULL,'2025-09-08','Prise de contact','Sur sa réserve','a17',126);
insert into rapport values(NULL,'2025-09-08','Demande du médecin','Très fixé sur les produits utilisés','b25',926);
insert into rapport values(NULL,'2025-09-08','Recommandation de confrère','Très aimable maintenir un contact régulier','e39',906);
insert into rapport values(NULL,'2025-09-08','Visite annuelle','Peu intéressé','e5',365);
insert into rapport values(NULL,'2025-09-08','Recommandation de confrère','Pas en confiance','b4',62);
insert into rapport values(NULL,'2025-09-08','Prise de contact','Demande à me revoir dans un mois','b4',779);
insert into rapport values(NULL,'2025-09-08','Recommandation de confrère','Jeune médecin découvrant les visiteurs','c14',172);
insert into rapport values(NULL,'2025-09-08','Visite annuelle','Peu bavard','b16',522);
insert into rapport values(NULL,'2025-09-08','Demande du médecin','RAS','e5',403);
insert into rapport values(NULL,'2025-09-08','Demande du médecin','Sur sa réserve','b4',845);
insert into rapport values(NULL,'2025-09-08','Prise de contact','Pas en confiance','b34',104);
insert into rapport values(NULL,'2025-09-08','Demande du médecin','Trop pressé','e24',404);
insert into rapport values(NULL,'2025-09-08','Installation nouvelle','Pas intéressé du tout','b28',397);
insert into rapport values(NULL,'2025-09-08','Prise de contact','Pas en confiance','b25',707);
insert into rapport values(NULL,'2025-09-08','Installation nouvelle','Pas intéressé du tout','b19',959);
insert into rapport values(NULL,'2025-09-09','Recommandation de confrère','Très intéressé par les produits présentés','e39',986);
insert into rapport values(NULL,'2025-09-09','Visite annuelle','Pas intéressé du tout','e22',143);
insert into rapport values(NULL,'2025-09-09','Visite annuelle','Très fixé sur les produits utilisés','a55',735);
insert into rapport values(NULL,'2025-09-09','Demande du médecin','A beaucoup appécié notre rencontre','c54',788);
insert into rapport values(NULL,'2025-09-09','Prise de contact','Pas intéressé du tout','c14',186);
insert into rapport values(NULL,'2025-09-09','Installation nouvelle','Sur sa réserve','c14',871);
insert into rapport values(NULL,'2025-09-09','Installation nouvelle','Visite positive','a131',511);
insert into rapport values(NULL,'2025-09-09','Installation nouvelle','Sur sa réserve','d13',996);
insert into rapport values(NULL,'2025-09-09','Recommandation de confrère','Très fixé sur les produits utilisés','f21',351);
insert into rapport values(NULL,'2025-09-09','Recommandation de confrère','Très aimable maintenir un contact régulier','f21',992);
insert into rapport values(NULL,'2025-09-09','Recommandation de confrère','Pas très aimable','b4',205);
insert into rapport values(NULL,'2025-09-09','Visite annuelle','Pas très aimable','a93',936);
insert into rapport values(NULL,'2025-09-09','Visite annuelle','Très fixé sur les produits utilisés','b25',484);
insert into rapport values(NULL,'2025-09-09','Installation nouvelle','Très intéressé par les produits présentés','b25',790);
insert into rapport values(NULL,'2025-09-09','Prise de contact','Peu intéressé','b34',328);
insert into rapport values(NULL,'2025-09-09','Demande du médecin','A revoir assez rapidement','b4',834);
insert into rapport values(NULL,'2025-09-09','Recommandation de confrère','Très intéressé par les produits présentés','e49',826);
insert into rapport values(NULL,'2025-09-09','Installation nouvelle','A revoir assez rapidement','e5',41);
insert into rapport values(NULL,'2025-09-09','Demande du médecin','A beaucoup appécié notre rencontre','b16',52);
insert into rapport values(NULL,'2025-09-09','Installation nouvelle','Très aimable maintenir un contact régulier','e22',52);
insert into rapport values(NULL,'2025-09-10','Installation nouvelle','Très intéressé par les produits présentés','b4',237);
insert into rapport values(NULL,'2025-09-10','Recommandation de confrère','Sur sa réserve','b19',829);
insert into rapport values(NULL,'2025-09-10','Visite annuelle','Sur sa réserve','e24',973);
insert into rapport values(NULL,'2025-09-10','Visite annuelle','Trop pressé','e24',789);
insert into rapport values(NULL,'2025-09-10','Demande du médecin','A beaucoup appécié notre rencontre','b4',31);
insert into rapport values(NULL,'2025-09-10','Installation nouvelle','Pas intéressé du tout','b25',858);
insert into rapport values(NULL,'2025-09-10','Installation nouvelle','Pas intéressé du tout','a93',210);
insert into rapport values(NULL,'2025-09-10','Recommandation de confrère','A revoir assez rapidement','a17',278);
insert into rapport values(NULL,'2025-09-10','Demande du médecin','Pas intéressé du tout','d13',144);
insert into rapport values(NULL,'2025-09-10','Installation nouvelle','Sur sa réserve','f21',665);
insert into rapport values(NULL,'2025-09-10','Recommandation de confrère','RAS','d51',495);
insert into rapport values(NULL,'2025-09-10','Prise de contact','Peu intéressé','a131',701);
insert into rapport values(NULL,'2025-09-10','Installation nouvelle','Jeune médecin découvrant les visiteurs','e5',180);
insert into rapport values(NULL,'2025-09-10','Recommandation de confrère','Pas en confiance','b25',414);
insert into rapport values(NULL,'2025-09-10','Installation nouvelle','A beaucoup appécié notre rencontre','d13',628);
insert into rapport values(NULL,'2025-09-10','Recommandation de confrère','RAS','f39',925);
insert into rapport values(NULL,'2025-09-10','Visite annuelle','Très fixé sur les produits utilisés','e39',711);
insert into rapport values(NULL,'2025-09-10','Visite annuelle','Pas très aimable','a131',22);
insert into rapport values(NULL,'2025-09-10','Installation nouvelle','Pas en confiance','b13',738);
insert into rapport values(NULL,'2025-09-10','Installation nouvelle','Demande à me revoir dans un mois','b34',696);
insert into rapport values(NULL,'2025-09-11','Demande du médecin','Très fixé sur les produits utilisés','b50',452);
insert into rapport values(NULL,'2025-09-11','Demande du médecin','Visite positive','b34',506);
insert into rapport values(NULL,'2025-09-11','Recommandation de confrère','A revoir assez rapidement','b34',228);
insert into rapport values(NULL,'2025-09-11','Prise de contact','Très aimable maintenir un contact régulier','d51',806);
insert into rapport values(NULL,'2025-09-11','Visite annuelle','Pas en confiance','b4',9);
insert into rapport values(NULL,'2025-09-11','Visite annuelle','Très aimable maintenir un contact régulier','e22',159);
insert into rapport values(NULL,'2025-09-11','Prise de contact','Visite positive','c3',202);
insert into rapport values(NULL,'2025-09-11','Prise de contact','Pas très aimable','e39',974);
insert into rapport values(NULL,'2025-09-11','Visite annuelle','Peu intéressé','b4',543);
insert into rapport values(NULL,'2025-09-11','Installation nouvelle','A beaucoup appécié notre rencontre','c14',208);
insert into rapport values(NULL,'2025-09-11','Visite annuelle','Pas intéressé du tout','e22',793);
insert into rapport values(NULL,'2025-09-11','Demande du médecin','Demande à me revoir dans un mois','b59',281);
insert into rapport values(NULL,'2025-09-11','Visite annuelle','Très aimable maintenir un contact régulier','e22',892);
insert into rapport values(NULL,'2025-09-11','Demande du médecin','Très aimable maintenir un contact régulier','c3',917);
insert into rapport values(NULL,'2025-09-11','Installation nouvelle','Pas intéressé du tout','a17',561);
insert into rapport values(NULL,'2025-09-11','Demande du médecin','Sur sa réserve','f39',428);
insert into rapport values(NULL,'2025-09-11','Prise de contact','Jeune médecin découvrant les visiteurs','a17',618);
insert into rapport values(NULL,'2025-09-11','Recommandation de confrère','Sur sa réserve','b16',531);
insert into rapport values(NULL,'2025-09-11','Visite annuelle','A revoir assez rapidement','e5',874);
insert into rapport values(NULL,'2025-09-11','Prise de contact','Peu intéressé','e52',625);
insert into rapport values(NULL,'2025-09-12','Demande du médecin','Pas intéressé du tout','a93',153);
insert into rapport values(NULL,'2025-09-12','Recommandation de confrère','Peu intéressé','c3',816);
insert into rapport values(NULL,'2025-09-12','Demande du médecin','Très fixé sur les produits utilisés','e39',330);
insert into rapport values(NULL,'2025-09-12','Prise de contact','Peu bavard','e52',978);
insert into rapport values(NULL,'2025-09-12','Demande du médecin','Pas intéressé du tout','b34',871);
insert into rapport values(NULL,'2025-09-12','Installation nouvelle','Visite positive','b34',928);
insert into rapport values(NULL,'2025-09-12','Visite annuelle','Sur sa réserve','e22',192);
insert into rapport values(NULL,'2025-09-12','Prise de contact','Trop pressé','b28',851);
insert into rapport values(NULL,'2025-09-12','Demande du médecin','Jeune médecin découvrant les visiteurs','b16',4);
insert into rapport values(NULL,'2025-09-12','Visite annuelle','Visite positive','c3',532);
insert into rapport values(NULL,'2025-09-12','Recommandation de confrère','A revoir assez rapidement','b19',445);
insert into rapport values(NULL,'2025-09-12','Demande du médecin','Visite positive','a17',223);
insert into rapport values(NULL,'2025-09-12','Demande du médecin','Peu intéressé','c54',312);
insert into rapport values(NULL,'2025-09-12','Prise de contact','RAS','e52',503);
insert into rapport values(NULL,'2025-09-12','Recommandation de confrère','A revoir assez rapidement','f39',709);
insert into rapport values(NULL,'2025-09-12','Visite annuelle','Jeune médecin découvrant les visiteurs','b28',693);
insert into rapport values(NULL,'2025-09-12','Visite annuelle','Peu intéressé','f21',47);
insert into rapport values(NULL,'2025-09-12','Installation nouvelle','Peu intéressé','f39',451);
insert into rapport values(NULL,'2025-09-12','Installation nouvelle','Visite positive','a17',502);
insert into rapport values(NULL,'2025-09-12','Installation nouvelle','Peu intéressé','c54',305);
insert into rapport values(NULL,'2025-09-13','Visite annuelle','Très fixé sur les produits utilisés','e52',581);
insert into rapport values(NULL,'2025-09-13','Visite annuelle','RAS','b28',346);
insert into rapport values(NULL,'2025-09-13','Prise de contact','Pas en confiance','a17',786);
insert into rapport values(NULL,'2025-09-13','Recommandation de confrère','Visite positive','b28',422);
insert into rapport values(NULL,'2025-09-13','Recommandation de confrère','A beaucoup appécié notre rencontre','b25',402);
insert into rapport values(NULL,'2025-09-13','Recommandation de confrère','RAS','b50',391);
insert into rapport values(NULL,'2025-09-13','Recommandation de confrère','Sur sa réserve','c54',699);
insert into rapport values(NULL,'2025-09-13','Recommandation de confrère','Jeune médecin découvrant les visiteurs','e52',31);
insert into rapport values(NULL,'2025-09-13','Installation nouvelle','Trop pressé','c54',728);
insert into rapport values(NULL,'2025-09-13','Prise de contact','Demande à me revoir dans un mois','c54',155);
insert into rapport values(NULL,'2025-09-13','Installation nouvelle','Pas très aimable','c14',71);
insert into rapport values(NULL,'2025-09-13','Recommandation de confrère','A revoir assez rapidement','c54',887);
insert into rapport values(NULL,'2025-09-13','Prise de contact','Trop pressé','c54',63);
insert into rapport values(NULL,'2025-09-13','Installation nouvelle','A revoir assez rapidement','b4',83);
insert into rapport values(NULL,'2025-09-13','Visite annuelle','A beaucoup appécié notre rencontre','d13',946);
insert into rapport values(NULL,'2025-09-13','Prise de contact','Pas très aimable','b34',139);
insert into rapport values(NULL,'2025-09-13','Recommandation de confrère','RAS','b13',174);
insert into rapport values(NULL,'2025-09-13','Demande du médecin','Pas très aimable','f21',148);
insert into rapport values(NULL,'2025-09-13','Recommandation de confrère','Sur sa réserve','e39',308);
insert into rapport values(NULL,'2025-09-13','Prise de contact','Jeune médecin découvrant les visiteurs','c3',740);
insert into rapport values(NULL,'2025-09-14','Prise de contact','Pas en confiance','b16',323);
insert into rapport values(NULL,'2025-09-14','Installation nouvelle','Visite positive','b4',440);
insert into rapport values(NULL,'2025-09-14','Demande du médecin','A beaucoup appécié notre rencontre','e22',986);
insert into rapport values(NULL,'2025-09-14','Visite annuelle','Trop pressé','e22',6);
insert into rapport values(NULL,'2025-09-14','Demande du médecin','Jeune médecin découvrant les visiteurs','b19',809);
insert into rapport values(NULL,'2025-09-14','Visite annuelle','Jeune médecin découvrant les visiteurs','d13',896);
insert into rapport values(NULL,'2025-09-14','Installation nouvelle','Très fixé sur les produits utilisés','a93',499);
insert into rapport values(NULL,'2025-09-14','Prise de contact','Très intéressé par les produits présentés','c54',639);
insert into rapport values(NULL,'2025-09-14','Recommandation de confrère','Peu intéressé','b4',737);
insert into rapport values(NULL,'2025-09-14','Prise de contact','RAS','b34',979);
insert into rapport values(NULL,'2025-09-14','Installation nouvelle','Pas en confiance','e52',709);
insert into rapport values(NULL,'2025-09-14','Recommandation de confrère','Peu bavard','a17',290);
insert into rapport values(NULL,'2025-09-14','Prise de contact','Demande à me revoir dans un mois','a55',121);
insert into rapport values(NULL,'2025-09-14','Visite annuelle','Pas en confiance','e22',116);
insert into rapport values(NULL,'2025-09-14','Visite annuelle','Pas intéressé du tout','c54',331);
insert into rapport values(NULL,'2025-09-14','Installation nouvelle','Peu intéressé','a131',204);
insert into rapport values(NULL,'2025-09-14','Recommandation de confrère','Très intéressé par les produits présentés','a131',187);
insert into rapport values(NULL,'2025-09-14','Demande du médecin','Peu bavard','c54',172);
insert into rapport values(NULL,'2025-09-14','Visite annuelle','Pas intéressé du tout','b13',311);
insert into rapport values(NULL,'2025-09-14','Prise de contact','Peu bavard','f39',766);
insert into rapport values(NULL,'2025-09-15','Prise de contact','Visite positive','a55',634);
insert into rapport values(NULL,'2025-09-15','Visite annuelle','Très fixé sur les produits utilisés','c14',216);
insert into rapport values(NULL,'2025-09-15','Demande du médecin','Pas intéressé du tout','e22',119);
insert into rapport values(NULL,'2025-09-15','Prise de contact','RAS','b19',725);
insert into rapport values(NULL,'2025-09-15','Installation nouvelle','Trop pressé','e24',827);
insert into rapport values(NULL,'2025-09-15','Recommandation de confrère','Visite positive','a131',412);
insert into rapport values(NULL,'2025-09-15','Visite annuelle','Peu intéressé','a55',837);
insert into rapport values(NULL,'2025-09-15','Prise de contact','Jeune médecin découvrant les visiteurs','c3',97);
insert into rapport values(NULL,'2025-09-15','Demande du médecin','Visite positive','f21',885);
insert into rapport values(NULL,'2025-09-15','Recommandation de confrère','Jeune médecin découvrant les visiteurs','b16',484);
insert into rapport values(NULL,'2025-09-15','Prise de contact','Visite positive','f39',962);
insert into rapport values(NULL,'2025-09-15','Demande du médecin','Très fixé sur les produits utilisés','e22',9);
insert into rapport values(NULL,'2025-09-15','Visite annuelle','Très fixé sur les produits utilisés','d13',855);
insert into rapport values(NULL,'2025-09-15','Visite annuelle','Sur sa réserve','e5',545);
insert into rapport values(NULL,'2025-09-15','Installation nouvelle','Trop pressé','b50',94);
insert into rapport values(NULL,'2025-09-15','Demande du médecin','Trop pressé','d51',802);
insert into rapport values(NULL,'2025-09-15','Installation nouvelle','Pas très aimable','e49',598);
insert into rapport values(NULL,'2025-09-15','Visite annuelle','Jeune médecin découvrant les visiteurs','e52',291);
insert into rapport values(NULL,'2025-09-15','Prise de contact','Pas intéressé du tout','b25',97);
insert into rapport values(NULL,'2025-09-15','Recommandation de confrère','Très intéressé par les produits présentés','a93',718);
insert into rapport values(NULL,'2025-09-16','Visite annuelle','Très intéressé par les produits présentés','e49',103);
insert into rapport values(NULL,'2025-09-16','Installation nouvelle','Pas en confiance','e52',128);
insert into rapport values(NULL,'2025-09-16','Recommandation de confrère','Jeune médecin découvrant les visiteurs','a55',123);
insert into rapport values(NULL,'2025-09-16','Recommandation de confrère','Très intéressé par les produits présentés','a55',866);
insert into rapport values(NULL,'2025-09-16','Visite annuelle','Sur sa réserve','b19',691);
insert into rapport values(NULL,'2025-09-16','Installation nouvelle','Sur sa réserve','e52',632);
insert into rapport values(NULL,'2025-09-16','Prise de contact','Très aimable maintenir un contact régulier','b34',896);
insert into rapport values(NULL,'2025-09-16','Recommandation de confrère','Demande à me revoir dans un mois','d51',714);
insert into rapport values(NULL,'2025-09-16','Prise de contact','Pas en confiance','e52',284);
insert into rapport values(NULL,'2025-09-16','Recommandation de confrère','A beaucoup appécié notre rencontre','a131',993);
insert into rapport values(NULL,'2025-09-16','Installation nouvelle','Pas en confiance','c54',717);
insert into rapport values(NULL,'2025-09-16','Demande du médecin','Demande à me revoir dans un mois','b28',375);
insert into rapport values(NULL,'2025-09-16','Visite annuelle','Jeune médecin découvrant les visiteurs','f21',697);
insert into rapport values(NULL,'2025-09-16','Recommandation de confrère','Jeune médecin découvrant les visiteurs','a17',53);
insert into rapport values(NULL,'2025-09-16','Visite annuelle','A revoir assez rapidement','c3',446);
insert into rapport values(NULL,'2025-09-16','Demande du médecin','RAS','b19',236);
insert into rapport values(NULL,'2025-09-16','Installation nouvelle','Jeune médecin découvrant les visiteurs','c3',222);
insert into rapport values(NULL,'2025-09-16','Visite annuelle','Visite positive','a131',604);
insert into rapport values(NULL,'2025-09-16','Visite annuelle','Pas intéressé du tout','a131',959);
insert into rapport values(NULL,'2025-09-16','Prise de contact','A revoir assez rapidement','b28',743);
insert into rapport values(NULL,'2025-09-17','Recommandation de confrère','Peu bavard','e22',483);
insert into rapport values(NULL,'2025-09-17','Recommandation de confrère','Peu bavard','e52',135);
insert into rapport values(NULL,'2025-09-17','Installation nouvelle','Visite positive','a55',670);
insert into rapport values(NULL,'2025-09-17','Recommandation de confrère','Pas très aimable','d13',659);
insert into rapport values(NULL,'2025-09-17','Prise de contact','Très aimable maintenir un contact régulier','a131',905);
insert into rapport values(NULL,'2025-09-17','Demande du médecin','Très intéressé par les produits présentés','b13',334);
insert into rapport values(NULL,'2025-09-17','Prise de contact','Très aimable maintenir un contact régulier','c3',570);
insert into rapport values(NULL,'2025-09-17','Prise de contact','Très intéressé par les produits présentés','c14',978);
insert into rapport values(NULL,'2025-09-17','Recommandation de confrère','Visite positive','b50',349);
insert into rapport values(NULL,'2025-09-17','Demande du médecin','Pas en confiance','b4',742);
insert into rapport values(NULL,'2025-09-17','Prise de contact','Jeune médecin découvrant les visiteurs','c3',334);
insert into rapport values(NULL,'2025-09-17','Installation nouvelle','Très aimable maintenir un contact régulier','c54',577);
insert into rapport values(NULL,'2025-09-17','Installation nouvelle','Très aimable maintenir un contact régulier','c14',154);
insert into rapport values(NULL,'2025-09-17','Visite annuelle','Très fixé sur les produits utilisés','c14',871);
insert into rapport values(NULL,'2025-09-17','Recommandation de confrère','Jeune médecin découvrant les visiteurs','a55',486);
insert into rapport values(NULL,'2025-09-17','Prise de contact','Très aimable maintenir un contact régulier','e22',551);
insert into rapport values(NULL,'2025-09-17','Demande du médecin','Sur sa réserve','e49',169);
insert into rapport values(NULL,'2025-09-17','Visite annuelle','Pas intéressé du tout','b34',707);
insert into rapport values(NULL,'2025-09-17','Recommandation de confrère','Pas intéressé du tout','b4',814);
insert into rapport values(NULL,'2025-09-17','Prise de contact','Visite positive','c54',69);
insert into rapport values(NULL,'2025-09-18','Installation nouvelle','Peu bavard','f21',71);
insert into rapport values(NULL,'2025-09-18','Installation nouvelle','Jeune médecin découvrant les visiteurs','e39',404);
insert into rapport values(NULL,'2025-09-18','Demande du médecin','Pas très aimable','c14',895);
insert into rapport values(NULL,'2025-09-18','Installation nouvelle','Peu intéressé','b28',175);
insert into rapport values(NULL,'2025-09-18','Installation nouvelle','RAS','a131',588);
insert into rapport values(NULL,'2025-09-18','Prise de contact','Très fixé sur les produits utilisés','b50',314);
insert into rapport values(NULL,'2025-09-18','Recommandation de confrère','Demande à me revoir dans un mois','b16',926);
insert into rapport values(NULL,'2025-09-18','Visite annuelle','Pas en confiance','b28',970);
insert into rapport values(NULL,'2025-09-18','Installation nouvelle','RAS','e24',466);
insert into rapport values(NULL,'2025-09-18','Demande du médecin','Trop pressé','f21',955);
insert into rapport values(NULL,'2025-09-18','Demande du médecin','Jeune médecin découvrant les visiteurs','e5',541);
insert into rapport values(NULL,'2025-09-18','Installation nouvelle','Très fixé sur les produits utilisés','a131',21);
insert into rapport values(NULL,'2025-09-18','Recommandation de confrère','A revoir assez rapidement','a55',548);
insert into rapport values(NULL,'2025-09-18','Recommandation de confrère','RAS','c3',273);
insert into rapport values(NULL,'2025-09-18','Prise de contact','Trop pressé','a55',812);
insert into rapport values(NULL,'2025-09-18','Visite annuelle','Visite positive','b34',625);
insert into rapport values(NULL,'2025-09-18','Demande du médecin','A beaucoup appécié notre rencontre','a55',662);
insert into rapport values(NULL,'2025-09-18','Visite annuelle','Visite positive','e49',65);
insert into rapport values(NULL,'2025-09-18','Visite annuelle','RAS','b19',91);
insert into rapport values(NULL,'2025-09-18','Prise de contact','Peu intéressé','c3',511);
insert into rapport values(NULL,'2025-09-19','Installation nouvelle','Sur sa réserve','f39',789);
insert into rapport values(NULL,'2025-09-19','Prise de contact','Demande à me revoir dans un mois','a93',756);
insert into rapport values(NULL,'2025-09-19','Prise de contact','Très fixé sur les produits utilisés','f21',711);
insert into rapport values(NULL,'2025-09-19','Prise de contact','Sur sa réserve','e39',481);
insert into rapport values(NULL,'2025-09-19','Visite annuelle','A revoir assez rapidement','b25',203);
insert into rapport values(NULL,'2025-09-19','Demande du médecin','Très aimable maintenir un contact régulier','e5',103);
insert into rapport values(NULL,'2025-09-19','Prise de contact','RAS','b59',796);
insert into rapport values(NULL,'2025-09-19','Installation nouvelle','Très fixé sur les produits utilisés','d51',599);
insert into rapport values(NULL,'2025-09-19','Visite annuelle','Pas très aimable','a17',994);
insert into rapport values(NULL,'2025-09-19','Recommandation de confrère','Pas très aimable','a17',506);
insert into rapport values(NULL,'2025-09-19','Prise de contact','Très aimable maintenir un contact régulier','b16',669);
insert into rapport values(NULL,'2025-09-19','Recommandation de confrère','Très intéressé par les produits présentés','c14',935);
insert into rapport values(NULL,'2025-09-19','Demande du médecin','Demande à me revoir dans un mois','a17',367);
insert into rapport values(NULL,'2025-09-19','Installation nouvelle','Très aimable maintenir un contact régulier','a93',385);
insert into rapport values(NULL,'2025-09-19','Demande du médecin','Visite positive','b34',544);
insert into rapport values(NULL,'2025-09-19','Demande du médecin','Très aimable maintenir un contact régulier','f39',985);
insert into rapport values(NULL,'2025-09-19','Recommandation de confrère','Très aimable maintenir un contact régulier','c54',980);
insert into rapport values(NULL,'2025-09-19','Visite annuelle','Demande à me revoir dans un mois','c54',456);
insert into rapport values(NULL,'2025-09-19','Visite annuelle','Demande à me revoir dans un mois','e24',4);
insert into rapport values(NULL,'2025-09-19','Visite annuelle','Sur sa réserve','b16',318);
insert into rapport values(NULL,'2025-09-20','Prise de contact','A beaucoup appécié notre rencontre','c14',19);
insert into rapport values(NULL,'2025-09-20','Prise de contact','Pas intéressé du tout','f21',751);
insert into rapport values(NULL,'2025-09-20','Prise de contact','Trop pressé','d51',13);
insert into rapport values(NULL,'2025-09-20','Demande du médecin','Très fixé sur les produits utilisés','b16',104);
insert into rapport values(NULL,'2025-09-20','Demande du médecin','A revoir assez rapidement','e5',535);
insert into rapport values(NULL,'2025-09-20','Prise de contact','A beaucoup appécié notre rencontre','e5',479);
insert into rapport values(NULL,'2025-09-20','Visite annuelle','Pas très aimable','b13',876);
insert into rapport values(NULL,'2025-09-20','Prise de contact','Sur sa réserve','b16',137);
insert into rapport values(NULL,'2025-09-20','Installation nouvelle','RAS','a131',736);
insert into rapport values(NULL,'2025-09-20','Recommandation de confrère','Peu bavard','c3',504);
insert into rapport values(NULL,'2025-09-20','Demande du médecin','Visite positive','c3',407);
insert into rapport values(NULL,'2025-09-20','Visite annuelle','Pas très aimable','b19',691);
insert into rapport values(NULL,'2025-09-20','Prise de contact','Trop pressé','d13',938);
insert into rapport values(NULL,'2025-09-20','Demande du médecin','Trop pressé','e49',4);
insert into rapport values(NULL,'2025-09-20','Installation nouvelle','RAS','e5',830);
insert into rapport values(NULL,'2025-09-20','Visite annuelle','Très intéressé par les produits présentés','b13',276);
insert into rapport values(NULL,'2025-09-20','Prise de contact','A beaucoup appécié notre rencontre','b34',173);
insert into rapport values(NULL,'2025-09-20','Prise de contact','Très fixé sur les produits utilisés','b25',424);
insert into rapport values(NULL,'2025-09-20','Installation nouvelle','Très aimable maintenir un contact régulier','a93',628);
insert into rapport values(NULL,'2025-09-20','Recommandation de confrère','Très fixé sur les produits utilisés','b34',587);
insert into rapport values(NULL,'2025-09-21','Demande du médecin','Très fixé sur les produits utilisés','b28',913);
insert into rapport values(NULL,'2025-09-21','Prise de contact','Pas intéressé du tout','e39',985);
insert into rapport values(NULL,'2025-09-21','Demande du médecin','RAS','a17',750);
insert into rapport values(NULL,'2025-09-21','Visite annuelle','Pas en confiance','b34',317);
insert into rapport values(NULL,'2025-09-21','Installation nouvelle','Pas intéressé du tout','f21',584);
insert into rapport values(NULL,'2025-09-21','Demande du médecin','RAS','b16',55);
insert into rapport values(NULL,'2025-09-21','Demande du médecin','A revoir assez rapidement','b25',982);
insert into rapport values(NULL,'2025-09-21','Prise de contact','A revoir assez rapidement','a131',238);
insert into rapport values(NULL,'2025-09-21','Installation nouvelle','Pas intéressé du tout','b59',644);
insert into rapport values(NULL,'2025-09-21','Installation nouvelle','Pas intéressé du tout','e24',168);
insert into rapport values(NULL,'2025-09-21','Installation nouvelle','Très aimable maintenir un contact régulier','f21',476);
insert into rapport values(NULL,'2025-09-21','Prise de contact','A beaucoup appécié notre rencontre','b28',926);
insert into rapport values(NULL,'2025-09-21','Recommandation de confrère','Visite positive','f21',694);
insert into rapport values(NULL,'2025-09-21','Prise de contact','Demande à me revoir dans un mois','b34',294);
insert into rapport values(NULL,'2025-09-21','Demande du médecin','Pas intéressé du tout','c3',329);
insert into rapport values(NULL,'2025-09-21','Visite annuelle','Visite positive','b50',22);
insert into rapport values(NULL,'2025-09-21','Recommandation de confrère','Demande à me revoir dans un mois','a17',843);
insert into rapport values(NULL,'2025-09-21','Demande du médecin','Pas en confiance','c3',428);
insert into rapport values(NULL,'2025-09-21','Prise de contact','Demande à me revoir dans un mois','e5',867);
insert into rapport values(NULL,'2025-09-21','Visite annuelle','Pas en confiance','d13',810);
insert into rapport values(NULL,'2025-09-22','Recommandation de confrère','Très aimable maintenir un contact régulier','a131',720);
insert into rapport values(NULL,'2025-09-22','Demande du médecin','Très aimable maintenir un contact régulier','e24',910);
insert into rapport values(NULL,'2025-09-22','Recommandation de confrère','Sur sa réserve','b34',467);
insert into rapport values(NULL,'2025-09-22','Installation nouvelle','Jeune médecin découvrant les visiteurs','b13',908);
insert into rapport values(NULL,'2025-09-22','Recommandation de confrère','Peu intéressé','b59',629);
insert into rapport values(NULL,'2025-09-22','Prise de contact','Très fixé sur les produits utilisés','d51',253);
insert into rapport values(NULL,'2025-09-22','Demande du médecin','A beaucoup appécié notre rencontre','b13',702);
insert into rapport values(NULL,'2025-09-22','Recommandation de confrère','Très fixé sur les produits utilisés','b13',549);
insert into rapport values(NULL,'2025-09-22','Installation nouvelle','Pas en confiance','b50',651);
insert into rapport values(NULL,'2025-09-22','Recommandation de confrère','Pas en confiance','e24',640);
insert into rapport values(NULL,'2025-09-22','Visite annuelle','Sur sa réserve','f21',80);
insert into rapport values(NULL,'2025-09-22','Demande du médecin','Très intéressé par les produits présentés','e22',108);
insert into rapport values(NULL,'2025-09-22','Installation nouvelle','Peu bavard','f21',179);
insert into rapport values(NULL,'2025-09-22','Demande du médecin','Peu bavard','b28',406);
insert into rapport values(NULL,'2025-09-22','Installation nouvelle','Demande à me revoir dans un mois','b59',749);
insert into rapport values(NULL,'2025-09-22','Visite annuelle','RAS','f39',420);
insert into rapport values(NULL,'2025-09-22','Recommandation de confrère','Visite positive','e39',968);
insert into rapport values(NULL,'2025-09-22','Recommandation de confrère','A beaucoup appécié notre rencontre','a55',192);
insert into rapport values(NULL,'2025-09-22','Visite annuelle','Visite positive','c3',340);
insert into rapport values(NULL,'2025-09-22','Prise de contact','Pas très aimable','e52',146);
insert into rapport values(NULL,'2025-09-23','Installation nouvelle','RAS','a17',978);
insert into rapport values(NULL,'2025-09-23','Prise de contact','RAS','b28',678);
insert into rapport values(NULL,'2025-09-23','Prise de contact','RAS','f39',68);
insert into rapport values(NULL,'2025-09-23','Demande du médecin','RAS','b59',23);
insert into rapport values(NULL,'2025-09-23','Visite annuelle','A beaucoup appécié notre rencontre','a55',549);
insert into rapport values(NULL,'2025-09-23','Demande du médecin','Demande à me revoir dans un mois','a93',115);
insert into rapport values(NULL,'2025-09-23','Recommandation de confrère','Demande à me revoir dans un mois','a131',375);
insert into rapport values(NULL,'2025-09-23','Prise de contact','Peu bavard','e5',100);
insert into rapport values(NULL,'2025-09-23','Recommandation de confrère','Très aimable maintenir un contact régulier','f21',116);
insert into rapport values(NULL,'2025-09-23','Recommandation de confrère','RAS','e5',989);
insert into rapport values(NULL,'2025-09-23','Prise de contact','Très intéressé par les produits présentés','c3',931);
insert into rapport values(NULL,'2025-09-23','Prise de contact','RAS','f21',159);
insert into rapport values(NULL,'2025-09-23','Demande du médecin','A beaucoup appécié notre rencontre','b13',23);
insert into rapport values(NULL,'2025-09-23','Prise de contact','Très aimable maintenir un contact régulier','e49',43);
insert into rapport values(NULL,'2025-09-23','Recommandation de confrère','Peu bavard','a93',783);
insert into rapport values(NULL,'2025-09-23','Recommandation de confrère','Peu bavard','b19',443);
insert into rapport values(NULL,'2025-09-23','Visite annuelle','Visite positive','b16',930);
insert into rapport values(NULL,'2025-09-23','Visite annuelle','Très aimable maintenir un contact régulier','a17',157);
insert into rapport values(NULL,'2025-09-23','Installation nouvelle','Très intéressé par les produits présentés','a17',177);
insert into rapport values(NULL,'2025-09-23','Demande du médecin','A revoir assez rapidement','c3',831);
insert into rapport values(NULL,'2025-09-24','Recommandation de confrère','Visite positive','f39',881);
insert into rapport values(NULL,'2025-09-24','Recommandation de confrère','Visite positive','c54',519);
insert into rapport values(NULL,'2025-09-24','Prise de contact','Peu intéressé','b16',6);
insert into rapport values(NULL,'2025-09-24','Recommandation de confrère','Très intéressé par les produits présentés','f39',556);
insert into rapport values(NULL,'2025-09-24','Recommandation de confrère','Très intéressé par les produits présentés','e24',681);
insert into rapport values(NULL,'2025-09-24','Recommandation de confrère','RAS','a55',39);
insert into rapport values(NULL,'2025-09-24','Prise de contact','RAS','b4',408);
insert into rapport values(NULL,'2025-09-24','Demande du médecin','Trop pressé','e49',719);
insert into rapport values(NULL,'2025-09-24','Demande du médecin','Pas intéressé du tout','f39',148);
insert into rapport values(NULL,'2025-09-24','Recommandation de confrère','Très aimable maintenir un contact régulier','d13',330);
insert into rapport values(NULL,'2025-09-24','Demande du médecin','Pas en confiance','b50',139);
insert into rapport values(NULL,'2025-09-24','Visite annuelle','RAS','b25',538);
insert into rapport values(NULL,'2025-09-24','Visite annuelle','Très fixé sur les produits utilisés','b25',99);
insert into rapport values(NULL,'2025-09-24','Prise de contact','Peu intéressé','a131',815);
insert into rapport values(NULL,'2025-09-24','Installation nouvelle','Peu bavard','b4',784);
insert into rapport values(NULL,'2025-09-24','Prise de contact','A revoir assez rapidement','b16',813);
insert into rapport values(NULL,'2025-09-24','Visite annuelle','Très fixé sur les produits utilisés','c54',590);
insert into rapport values(NULL,'2025-09-24','Visite annuelle','Visite positive','c54',495);
insert into rapport values(NULL,'2025-09-24','Prise de contact','Jeune médecin découvrant les visiteurs','b4',129);
insert into rapport values(NULL,'2025-09-24','Prise de contact','Peu bavard','e5',434);
insert into rapport values(NULL,'2025-09-25','Installation nouvelle','Visite positive','b25',794);
insert into rapport values(NULL,'2025-09-25','Demande du médecin','Pas en confiance','b25',507);
insert into rapport values(NULL,'2025-09-25','Demande du médecin','Sur sa réserve','b4',12);
insert into rapport values(NULL,'2025-09-25','Recommandation de confrère','Visite positive','e5',80);
insert into rapport values(NULL,'2025-09-25','Prise de contact','Trop pressé','a17',685);
insert into rapport values(NULL,'2025-09-25','Prise de contact','Trop pressé','b4',260);
insert into rapport values(NULL,'2025-09-25','Recommandation de confrère','Demande à me revoir dans un mois','d13',18);
insert into rapport values(NULL,'2025-09-25','Prise de contact','Peu intéressé','b19',780);
insert into rapport values(NULL,'2025-09-25','Visite annuelle','Peu bavard','a131',608);
insert into rapport values(NULL,'2025-09-25','Recommandation de confrère','Jeune médecin découvrant les visiteurs','b50',335);
insert into rapport values(NULL,'2025-09-25','Visite annuelle','Très intéressé par les produits présentés','b28',988);
insert into rapport values(NULL,'2025-09-25','Prise de contact','Pas très aimable','c14',610);
insert into rapport values(NULL,'2025-09-25','Prise de contact','Très aimable maintenir un contact régulier','d51',919);
insert into rapport values(NULL,'2025-09-25','Recommandation de confrère','A revoir assez rapidement','f39',63);
insert into rapport values(NULL,'2025-09-25','Prise de contact','RAS','e52',548);
insert into rapport values(NULL,'2025-09-25','Visite annuelle','Pas intéressé du tout','a131',393);
insert into rapport values(NULL,'2025-09-25','Recommandation de confrère','Pas très aimable','f21',16);
insert into rapport values(NULL,'2025-09-25','Recommandation de confrère','Pas intéressé du tout','b16',23);
insert into rapport values(NULL,'2025-09-25','Visite annuelle','Pas en confiance','b59',333);
insert into rapport values(NULL,'2025-09-25','Demande du médecin','Jeune médecin découvrant les visiteurs','e49',309);
insert into rapport values(NULL,'2025-09-26','Demande du médecin','RAS','b50',143);
insert into rapport values(NULL,'2025-09-26','Demande du médecin','Très aimable maintenir un contact régulier','e5',872);
insert into rapport values(NULL,'2025-09-26','Recommandation de confrère','Peu bavard','b13',841);
insert into rapport values(NULL,'2025-09-26','Prise de contact','Peu intéressé','b16',943);
insert into rapport values(NULL,'2025-09-26','Visite annuelle','Peu intéressé','a55',818);
insert into rapport values(NULL,'2025-09-26','Installation nouvelle','A beaucoup appécié notre rencontre','e39',293);
insert into rapport values(NULL,'2025-09-26','Visite annuelle','Trop pressé','e24',176);
insert into rapport values(NULL,'2025-09-26','Installation nouvelle','Trop pressé','d51',31);
insert into rapport values(NULL,'2025-09-26','Demande du médecin','Pas très aimable','b19',85);
insert into rapport values(NULL,'2025-09-26','Installation nouvelle','Peu intéressé','b13',546);
insert into rapport values(NULL,'2025-09-26','Installation nouvelle','Très intéressé par les produits présentés','a17',841);
insert into rapport values(NULL,'2025-09-26','Visite annuelle','Très aimable maintenir un contact régulier','b59',278);
insert into rapport values(NULL,'2025-09-26','Prise de contact','A beaucoup appécié notre rencontre','b19',453);
insert into rapport values(NULL,'2025-09-26','Demande du médecin','RAS','d51',792);
insert into rapport values(NULL,'2025-09-26','Demande du médecin','Sur sa réserve','a131',566);
insert into rapport values(NULL,'2025-09-26','Installation nouvelle','Pas en confiance','b13',305);
insert into rapport values(NULL,'2025-09-26','Demande du médecin','Sur sa réserve','d13',948);
insert into rapport values(NULL,'2025-09-26','Installation nouvelle','Sur sa réserve','a93',184);
insert into rapport values(NULL,'2025-09-26','Installation nouvelle','A beaucoup appécié notre rencontre','a17',571);
insert into rapport values(NULL,'2025-09-26','Prise de contact','Peu bavard','b13',784);
insert into rapport values(NULL,'2025-09-27','Visite annuelle','Très fixé sur les produits utilisés','d51',168);
insert into rapport values(NULL,'2025-09-27','Prise de contact','A revoir assez rapidement','e22',224);
insert into rapport values(NULL,'2025-09-27','Recommandation de confrère','Très fixé sur les produits utilisés','e5',627);
insert into rapport values(NULL,'2025-09-27','Recommandation de confrère','Pas très aimable','f21',45);
insert into rapport values(NULL,'2025-09-27','Recommandation de confrère','Pas en confiance','c3',967);
insert into rapport values(NULL,'2025-09-27','Installation nouvelle','A beaucoup appécié notre rencontre','d13',358);
insert into rapport values(NULL,'2025-09-27','Demande du médecin','Très intéressé par les produits présentés','e22',758);
insert into rapport values(NULL,'2025-09-27','Recommandation de confrère','Très intéressé par les produits présentés','b28',278);
insert into rapport values(NULL,'2025-09-27','Recommandation de confrère','A revoir assez rapidement','b4',147);
insert into rapport values(NULL,'2025-09-27','Visite annuelle','Peu bavard','e52',47);
insert into rapport values(NULL,'2025-09-27','Prise de contact','Jeune médecin découvrant les visiteurs','a131',192);
insert into rapport values(NULL,'2025-09-27','Demande du médecin','A beaucoup appécié notre rencontre','b25',129);
insert into rapport values(NULL,'2025-09-27','Installation nouvelle','RAS','d51',711);
insert into rapport values(NULL,'2025-09-27','Demande du médecin','A revoir assez rapidement','a17',628);
insert into rapport values(NULL,'2025-09-27','Recommandation de confrère','Très aimable maintenir un contact régulier','e39',327);
insert into rapport values(NULL,'2025-09-27','Prise de contact','Peu bavard','b25',831);
insert into rapport values(NULL,'2025-09-27','Visite annuelle','Pas très aimable','d13',664);
insert into rapport values(NULL,'2025-09-27','Demande du médecin','Demande à me revoir dans un mois','a131',914);
insert into rapport values(NULL,'2025-09-27','Recommandation de confrère','A beaucoup appécié notre rencontre','c3',344);
insert into rapport values(NULL,'2025-09-27','Prise de contact','Jeune médecin découvrant les visiteurs','a17',873);
insert into rapport values(NULL,'2025-09-28','Installation nouvelle','Pas très aimable','a93',900);
insert into rapport values(NULL,'2025-09-28','Prise de contact','Trop pressé','e5',752);
insert into rapport values(NULL,'2025-09-28','Visite annuelle','Demande à me revoir dans un mois','b28',708);
insert into rapport values(NULL,'2025-09-28','Demande du médecin','Pas très aimable','c14',459);
insert into rapport values(NULL,'2025-09-28','Visite annuelle','A revoir assez rapidement','a17',709);
insert into rapport values(NULL,'2025-09-28','Recommandation de confrère','Trop pressé','e52',821);
insert into rapport values(NULL,'2025-09-28','Visite annuelle','Pas en confiance','e5',886);
insert into rapport values(NULL,'2025-09-28','Installation nouvelle','Pas en confiance','a55',400);
insert into rapport values(NULL,'2025-09-28','Demande du médecin','Peu intéressé','c3',943);
insert into rapport values(NULL,'2025-09-28','Recommandation de confrère','Jeune médecin découvrant les visiteurs','b4',495);
insert into rapport values(NULL,'2025-09-28','Installation nouvelle','Peu intéressé','b59',437);
insert into rapport values(NULL,'2025-09-28','Prise de contact','Pas intéressé du tout','e22',265);
insert into rapport values(NULL,'2025-09-28','Recommandation de confrère','Très intéressé par les produits présentés','b19',321);
insert into rapport values(NULL,'2025-09-28','Demande du médecin','Très aimable maintenir un contact régulier','a131',142);
insert into rapport values(NULL,'2025-09-28','Installation nouvelle','Très aimable maintenir un contact régulier','e52',684);
insert into rapport values(NULL,'2025-09-28','Installation nouvelle','Peu bavard','a55',471);
insert into rapport values(NULL,'2025-09-28','Installation nouvelle','Peu intéressé','b50',322);
insert into rapport values(NULL,'2025-09-28','Visite annuelle','Pas très aimable','d13',703);
insert into rapport values(NULL,'2025-09-28','Installation nouvelle','Pas très aimable','a131',971);
insert into rapport values(NULL,'2025-09-28','Visite annuelle','Très fixé sur les produits utilisés','b28',700);
insert into rapport values(NULL,'2025-09-29','Visite annuelle','Pas très aimable','e52',580);
insert into rapport values(NULL,'2025-09-29','Prise de contact','Demande à me revoir dans un mois','a131',885);
insert into rapport values(NULL,'2025-09-29','recommandation de confrère','Jeune médecin découvrant les visiteurs','b25',493);
insert into rapport values(NULL,'2025-09-29','Prise de contact','Pas en confiance','e24',699);
insert into rapport values(NULL,'2025-09-29','Recommandation de confrère','RAS','e39',566);
insert into rapport values(NULL,'2025-09-29','Recommandation de confrère','Très aimable maintenir un contact régulier','b19',411);
insert into rapport values(NULL,'2025-09-29','Prise de contact','A beaucoup appécié notre rencontre','c14',790);
insert into rapport values(NULL,'2025-09-29','Demande du médecin','RAS','f39',184);
insert into rapport values(NULL,'2025-09-29','recommandation de confrère','A revoir assez rapidement','d13',152);
insert into rapport values(NULL,'2025-09-29','Visite annuelle','Très fixé sur les produits utilisés','a131',865);
insert into rapport values(NULL,'2025-09-29','Recommandation de confrère','Pas très aimable','b50',619);
insert into rapport values(NULL,'2025-09-29','Demande du médecin','Sur sa réserve','b16',78);
insert into rapport values(NULL,'2025-09-29','Recommandation de confrère','Très aimable maintenir un contact régulier','a93',127);
insert into rapport values(NULL,'2025-09-29','Installation nouvelle','Demande à me revoir dans un mois','e5',682);
insert into rapport values(NULL,'2025-09-29','Demande du médecin','Très fixé sur les produits utilisés','a93',917);
insert into rapport values(NULL,'2025-09-29','Demande du médecin','A revoir assez rapidement','c3',864);
insert into rapport values(NULL,'2025-09-29','Prise de contact','Très intéressé par les produits présentés','c14',316);
insert into rapport values(NULL,'2025-09-29','Visite annuelle','Pas très aimable','c54',320);
insert into rapport values(NULL,'2025-09-29','Visite annuelle','Peu intéressé','d51',274);
insert into rapport values(NULL,'2025-09-29','Recommandation de confrère','Pas très aimable','a55',298);
insert into rapport values(NULL,'2025-09-30','Demande du médecin','Très fixé sur les produits utilisés','f21',33);
insert into rapport values(NULL,'2025-09-30','Recommandation de confrère','Visite positive','b59',205);
insert into rapport values(NULL,'2025-09-30','Demande du médecin','Peu bavard','e39',611);
insert into rapport values(NULL,'2025-09-30','Demande du médecin','Très intéressé par les produits présentés','c54',635);
insert into rapport values(NULL,'2025-09-30','Visite annuelle','A beaucoup appécié notre rencontre','b16',205);
insert into rapport values(NULL,'2025-09-30','Installation nouvelle','Peu intéressé','f39',251);
insert into rapport values(NULL,'2025-09-30','Installation nouvelle','Visite positive','a93',788);
insert into rapport values(NULL,'2025-09-30','Visite annuelle','Pas très aimable','e24',748);
insert into rapport values(NULL,'2025-09-30','Demande du médecin','Visite positive','c3',813);
insert into rapport values(NULL,'2025-09-30','Demande du médecin','A beaucoup appécié notre rencontre','f39',542);
insert into rapport values(NULL,'2025-09-30','Prise de contact','Demande à me revoir dans un mois','e5',867);

-- Contenu Offrir
insert into offrir values(4,'3MYC7',3);
insert into offrir values(4,'CLAZER6',4);
insert into offrir values(5,'AMOXIG12',1);
insert into offrir values(6,'PIRIZ8',1);
insert into offrir values(7,'DOLRIL7',2);
insert into offrir values(8,'CARTION6',3);
insert into offrir values(9,'AMOXIG12',2);
insert into offrir values(10,'3MYC7',3);
insert into offrir values(10,'BITALV',3);
insert into offrir values(11,'BITALV',1);
insert into offrir values(12,'DIMIRTAM6',3);
insert into offrir values(13,'EQUILARX6',4);
insert into offrir values(13,'BACTIG10',2);
insert into offrir values(14,'LITHOR12',3);
insert into offrir values(15,'AMOPIL7',2);
insert into offrir values(16,'3MYC7',3);
insert into offrir values(17,'JOVAI8',2);
insert into offrir values(17,'BACTIV13',4);
insert into offrir values(18,'TXISOL22',1);
insert into offrir values(19,'TROXT21',3);
insert into offrir values(19,'CLAZER6',2);
insert into offrir values(20,'EQUILARX6',4);
insert into offrir values(20,'POMDI20',4);
insert into offrir values(21,'CARTION6',2);
insert into offrir values(21,'POMDI20',3);
insert into offrir values(22,'AMOXIG12',1);
insert into offrir values(23,'DORNOM8',1);
insert into offrir values(23,'BITALV',3);
insert into offrir values(24,'EVILR7',3);
insert into offrir values(24,'3MYC7',3);
insert into offrir values(25,'TXISOL22',2);
insert into offrir values(25,'DORNOM8',4);
insert into offrir values(26,'TXISOL22',3);
insert into offrir values(26,'POMDI20',4);
insert into offrir values(27,'3MYC7',1);
insert into offrir values(28,'CARTION6',2);
insert into offrir values(29,'BACTIG10',4);
insert into offrir values(29,'AMOX45',2);
insert into offrir values(30,'LIDOXY23',3);
insert into offrir values(31,'TXISOL22',3);
insert into offrir values(32,'APATOUX22',4);
insert into offrir values(33,'EVILR7',4);
insert into offrir values(33,'PHYSOI8',4);
insert into offrir values(34,'TXISOL22',4);
insert into offrir values(34,'DORNOM8',2);
insert into offrir values(35,'EQUILARX6',1);
insert into offrir values(35,'AMOXIG12',3);
insert into offrir values(36,'POMDI20',1);
insert into offrir values(36,'BACTIV13',1);
insert into offrir values(37,'DOLRIL7',1);
insert into offrir values(37,'JOVAI8',4);
insert into offrir values(38,'BITALV',1);
insert into offrir values(38,'PARMOL16',4);
insert into offrir values(39,'BITALV',1);
insert into offrir values(39,'BACTIG10',2);
insert into offrir values(40,'DEPRIL9',1);
insert into offrir values(41,'DORNOM8',4);
insert into offrir values(41,'LIDOXY23',3);
insert into offrir values(42,'JOVAI8',4);
insert into offrir values(42,'EQUILARX6',1);
insert into offrir values(43,'ADIMOL9',2);
insert into offrir values(43,'AMOXIG12',4);
insert into offrir values(44,'DEPRIL9',2);
insert into offrir values(45,'ADIMOL9',4);
insert into offrir values(46,'LITHOR12',4);
insert into offrir values(46,'BACTIV13',4);
insert into offrir values(47,'AMOX45',4);
insert into offrir values(48,'DEPRIL9',2);
insert into offrir values(49,'DIMIRTAM6',3);
insert into offrir values(49,'ADIMOL9',4);
insert into offrir values(50,'POMDI20',1);
insert into offrir values(50,'3MYC7',1);
insert into offrir values(51,'AMOX45',3);
insert into offrir values(52,'EVILR7',1);
insert into offrir values(52,'BACTIG10',1);
insert into offrir values(53,'EVILR7',2);
insert into offrir values(54,'TXISOL22',4);
insert into offrir values(55,'TROXT21',1);
insert into offrir values(56,'DEPRIL9',3);
insert into offrir values(56,'INSXT5',4);
insert into offrir values(57,'EQUILARX6',3);
insert into offrir values(58,'INSXT5',4);
insert into offrir values(58,'CLAZER6',4);
insert into offrir values(59,'AMOX45',1);
insert into offrir values(59,'JOVAI8',2);
insert into offrir values(60,'ADIMOL9',4);
insert into offrir values(60,'BITALV',1);
insert into offrir values(61,'PHYSOI8',1);
insert into offrir values(61,'APATOUX22',3);
insert into offrir values(62,'EVILR7',4);
insert into offrir values(62,'PHYSOI8',2);
insert into offrir values(63,'EQUILARX6',2);
insert into offrir values(64,'DOLRIL7',3);
insert into offrir values(64,'AMOXIG12',4);
insert into offrir values(65,'DORNOM8',2);
insert into offrir values(66,'BACTIV13',1);
insert into offrir values(66,'AMOXIG12',1);
insert into offrir values(67,'DORNOM8',2);
insert into offrir values(68,'DIMIRTAM6',2);
insert into offrir values(68,'CARTION6',4);
insert into offrir values(69,'LIDOXY23',3);
insert into offrir values(69,'CARTION6',4);
insert into offrir values(70,'3MYC7',4);
insert into offrir values(71,'CLAZER6',2);
insert into offrir values(71,'DORNOM8',3);
insert into offrir values(72,'PHYSOI8',4);
insert into offrir values(73,'PIRIZ8',2);
insert into offrir values(73,'DORNOM8',2);
insert into offrir values(74,'PHYSOI8',4);
insert into offrir values(75,'EQUILARX6',1);
insert into offrir values(76,'DIMIRTAM6',4);
insert into offrir values(77,'POMDI20',1);
insert into offrir values(77,'DEPRIL9',3);
insert into offrir values(78,'TXISOL22',4);
insert into offrir values(78,'AMOPIL7',4);
insert into offrir values(79,'DORNOM8',1);
insert into offrir values(79,'PIRIZ8',4);
insert into offrir values(80,'CLAZER6',1);
insert into offrir values(80,'LIDOXY23',3);
insert into offrir values(81,'EQUILARX6',1);
insert into offrir values(82,'CARTION6',3);
insert into offrir values(82,'PIRIZ8',4);
insert into offrir values(83,'BACTIV13',4);
insert into offrir values(84,'CLAZER6',3);
insert into offrir values(84,'DIMIRTAM6',2);
insert into offrir values(85,'BITALV',2);
insert into offrir values(86,'3MYC7',1);
insert into offrir values(87,'BITALV',4);
insert into offrir values(87,'TROXT21',1);
insert into offrir values(88,'TXISOL22',2);
insert into offrir values(88,'AMOXIG12',1);
insert into offrir values(89,'TXISOL22',4);
insert into offrir values(90,'PARMOL16',2);
insert into offrir values(91,'3MYC7',4);
insert into offrir values(92,'DORNOM8',4);
insert into offrir values(93,'EVILR7',1);
insert into offrir values(94,'DEPRIL9',2);
insert into offrir values(95,'AMOPIL7',3);
insert into offrir values(96,'DOLRIL7',4);
insert into offrir values(96,'PARMOL16',4);
insert into offrir values(97,'DEPRIL9',3);
insert into offrir values(97,'POMDI20',4);
insert into offrir values(98,'AMOPIL7',4);
insert into offrir values(98,'EQUILARX6',2);
insert into offrir values(99,'AMOPIL7',3);
insert into offrir values(99,'POMDI20',1);
insert into offrir values(100,'AMOXIG12',4);
insert into offrir values(101,'TXISOL22',1);
insert into offrir values(101,'CLAZER6',4);
insert into offrir values(102,'EQUILARX6',3);
insert into offrir values(102,'AMOPIL7',1);
insert into offrir values(103,'JOVAI8',2);
insert into offrir values(104,'EQUILARX6',1);
insert into offrir values(104,'DORNOM8',3);
insert into offrir values(105,'3MYC7',1);
insert into offrir values(106,'LIDOXY23',2);
insert into offrir values(106,'3MYC7',3);
insert into offrir values(107,'BITALV',4);
insert into offrir values(107,'CLAZER6',4);
insert into offrir values(108,'DOLRIL7',3);
insert into offrir values(109,'PARMOL16',3);
insert into offrir values(110,'INSXT5',1);
insert into offrir values(111,'CARTION6',4);
insert into offrir values(112,'CARTION6',4);
insert into offrir values(112,'TROXT21',4);
insert into offrir values(113,'EVILR7',2);
insert into offrir values(113,'3MYC7',1);
insert into offrir values(114,'PHYSOI8',1);
insert into offrir values(114,'PIRIZ8',2);
insert into offrir values(115,'PIRIZ8',1);
insert into offrir values(116,'JOVAI8',1);
insert into offrir values(116,'BACTIG10',1);
insert into offrir values(117,'DIMIRTAM6',4);
insert into offrir values(117,'DEPRIL9',1);
insert into offrir values(118,'CLAZER6',3);
insert into offrir values(118,'LITHOR12',4);
insert into offrir values(119,'TXISOL22',1);
insert into offrir values(119,'LITHOR12',4);
insert into offrir values(120,'APATOUX22',1);
insert into offrir values(120,'BACTIV13',1);
insert into offrir values(121,'LIDOXY23',3);
insert into offrir values(122,'LIDOXY23',1);
insert into offrir values(122,'DORNOM8',1);
insert into offrir values(123,'EQUILARX6',1);
insert into offrir values(124,'AMOX45',3);
insert into offrir values(124,'3MYC7',2);
insert into offrir values(125,'APATOUX22',2);
insert into offrir values(125,'EVILR7',3);
insert into offrir values(126,'ADIMOL9',4);
insert into offrir values(127,'POMDI20',1);
insert into offrir values(127,'CARTION6',1);
insert into offrir values(128,'EVILR7',3);
insert into offrir values(129,'ADIMOL9',4);
insert into offrir values(129,'APATOUX22',4);
insert into offrir values(130,'JOVAI8',1);
insert into offrir values(131,'APATOUX22',3);
insert into offrir values(132,'PIRIZ8',4);
insert into offrir values(133,'DIMIRTAM6',3);
insert into offrir values(133,'AMOPIL7',1);
insert into offrir values(134,'JOVAI8',3);
insert into offrir values(134,'POMDI20',3);
insert into offrir values(135,'ADIMOL9',4);
insert into offrir values(135,'PHYSOI8',1);
insert into offrir values(136,'JOVAI8',4);
insert into offrir values(137,'PHYSOI8',1);
insert into offrir values(138,'PARMOL16',3);
insert into offrir values(138,'DOLRIL7',2);
insert into offrir values(139,'AMOX45',2);
insert into offrir values(140,'PIRIZ8',1);
insert into offrir values(140,'DORNOM8',1);
insert into offrir values(141,'EVILR7',3);
insert into offrir values(141,'BITALV',3);
insert into offrir values(142,'BACTIV13',3);
insert into offrir values(142,'TROXT21',3);
insert into offrir values(143,'APATOUX22',4);
insert into offrir values(144,'BACTIG10',1);
insert into offrir values(145,'APATOUX22',2);
insert into offrir values(145,'AMOX45',4);
insert into offrir values(146,'TROXT21',4);
insert into offrir values(146,'EVILR7',3);
insert into offrir values(147,'DORNOM8',1);
insert into offrir values(148,'PHYSOI8',3);
insert into offrir values(149,'LITHOR12',1);
insert into offrir values(149,'EVILR7',3);
insert into offrir values(150,'CLAZER6',2);
insert into offrir values(151,'DOLRIL7',4);
insert into offrir values(151,'BACTIV13',2);
insert into offrir values(152,'EVILR7',1);
insert into offrir values(153,'DIMIRTAM6',1);
insert into offrir values(153,'INSXT5',3);
insert into offrir values(154,'BACTIG10',1);
insert into offrir values(155,'INSXT5',3);
insert into offrir values(155,'ADIMOL9',3);
insert into offrir values(156,'DOLRIL7',4);
insert into offrir values(156,'JOVAI8',3);
insert into offrir values(157,'AMOX45',1);
insert into offrir values(157,'EVILR7',2);
insert into offrir values(158,'PARMOL16',1);
insert into offrir values(159,'BITALV',3);
insert into offrir values(159,'INSXT5',3);
insert into offrir values(160,'POMDI20',2);
insert into offrir values(161,'EQUILARX6',4);
insert into offrir values(161,'AMOXIG12',4);
insert into offrir values(162,'DORNOM8',4);
insert into offrir values(163,'TXISOL22',3);
insert into offrir values(163,'BITALV',4);
insert into offrir values(164,'TXISOL22',4);
insert into offrir values(164,'EQUILARX6',4);
insert into offrir values(165,'DOLRIL7',4);
insert into offrir values(165,'BITALV',1);
insert into offrir values(166,'PHYSOI8',3);
insert into offrir values(166,'PARMOL16',4);
insert into offrir values(167,'3MYC7',1);
insert into offrir values(168,'AMOXIG12',1);
insert into offrir values(169,'TROXT21',4);
insert into offrir values(170,'EQUILARX6',3);
insert into offrir values(170,'BACTIV13',3);
insert into offrir values(171,'PHYSOI8',2);
insert into offrir values(172,'LITHOR12',2);
insert into offrir values(173,'ADIMOL9',3);
insert into offrir values(173,'INSXT5',2);
insert into offrir values(174,'BITALV',3);
insert into offrir values(175,'BITALV',2);
insert into offrir values(176,'EVILR7',2);
insert into offrir values(177,'PIRIZ8',1);
insert into offrir values(177,'AMOXIG12',3);
insert into offrir values(178,'ADIMOL9',1);
insert into offrir values(178,'BACTIG10',1);
insert into offrir values(179,'LIDOXY23',3);
insert into offrir values(179,'JOVAI8',3);
insert into offrir values(180,'DOLRIL7',1);
insert into offrir values(181,'LITHOR12',4);
insert into offrir values(181,'DEPRIL9',4);
insert into offrir values(182,'PIRIZ8',4);
insert into offrir values(182,'DEPRIL9',3);
insert into offrir values(183,'APATOUX22',2);
insert into offrir values(184,'PIRIZ8',3);
insert into offrir values(184,'DORNOM8',3);
insert into offrir values(185,'CLAZER6',1);
insert into offrir values(186,'JOVAI8',1);
insert into offrir values(187,'EVILR7',3);
insert into offrir values(188,'INSXT5',4);
insert into offrir values(188,'LIDOXY23',4);
insert into offrir values(189,'BACTIG10',1);
insert into offrir values(189,'INSXT5',4);
insert into offrir values(190,'DIMIRTAM6',2);
insert into offrir values(191,'PIRIZ8',3);
insert into offrir values(191,'DOLRIL7',4);
insert into offrir values(192,'LITHOR12',4);
insert into offrir values(193,'TROXT21',1);
insert into offrir values(193,'AMOXIG12',1);
insert into offrir values(194,'TXISOL22',2);
insert into offrir values(195,'TROXT21',4);
insert into offrir values(196,'APATOUX22',1);
insert into offrir values(197,'EQUILARX6',4);
insert into offrir values(198,'BITALV',1);
insert into offrir values(199,'BACTIG10',3);
insert into offrir values(199,'AMOPIL7',1);
insert into offrir values(200,'DORNOM8',1);
insert into offrir values(200,'INSXT5',1);
insert into offrir values(201,'DEPRIL9',4);
insert into offrir values(202,'PARMOL16',3);
insert into offrir values(202,'LIDOXY23',3);
insert into offrir values(203,'PARMOL16',2);
insert into offrir values(203,'INSXT5',3);
insert into offrir values(204,'DIMIRTAM6',2);
insert into offrir values(205,'EVILR7',3);
insert into offrir values(206,'JOVAI8',3);
insert into offrir values(207,'JOVAI8',4);
insert into offrir values(207,'EVILR7',1);
insert into offrir values(208,'ADIMOL9',1);
insert into offrir values(209,'LITHOR12',3);
insert into offrir values(209,'PHYSOI8',4);
insert into offrir values(210,'BACTIV13',3);
insert into offrir values(210,'DIMIRTAM6',2);
insert into offrir values(211,'BACTIG10',2);
insert into offrir values(211,'DOLRIL7',4);
insert into offrir values(212,'EVILR7',3);
insert into offrir values(213,'PARMOL16',3);
insert into offrir values(213,'TROXT21',2);
insert into offrir values(214,'DOLRIL7',3);
insert into offrir values(214,'JOVAI8',1);
insert into offrir values(215,'AMOXIG12',3);
insert into offrir values(215,'INSXT5',3);
insert into offrir values(216,'BACTIG10',3);
insert into offrir values(216,'TROXT21',4);
insert into offrir values(217,'POMDI20',1);
insert into offrir values(218,'AMOX45',2);
insert into offrir values(218,'AMOXIG12',2);
insert into offrir values(219,'BACTIG10',4);
insert into offrir values(220,'TXISOL22',3);
insert into offrir values(220,'DEPRIL9',2);
insert into offrir values(221,'EVILR7',2);
insert into offrir values(221,'AMOX45',2);
insert into offrir values(222,'POMDI20',1);
insert into offrir values(223,'BACTIV13',4);
insert into offrir values(224,'LIDOXY23',3);
insert into offrir values(225,'BACTIV13',2);
insert into offrir values(226,'CARTION6',3);
insert into offrir values(226,'LITHOR12',1);
insert into offrir values(227,'AMOX45',2);
insert into offrir values(227,'3MYC7',2);
insert into offrir values(228,'BACTIG10',4);
insert into offrir values(229,'TROXT21',2);
insert into offrir values(230,'AMOXIG12',3);
insert into offrir values(231,'PHYSOI8',2);
insert into offrir values(232,'3MYC7',4);
insert into offrir values(233,'PIRIZ8',2);
insert into offrir values(233,'TXISOL22',3);
insert into offrir values(234,'TROXT21',3);
insert into offrir values(234,'BITALV',1);
insert into offrir values(235,'JOVAI8',3);
insert into offrir values(236,'PARMOL16',1);
insert into offrir values(236,'LIDOXY23',2);
insert into offrir values(237,'DIMIRTAM6',4);
insert into offrir values(237,'AMOX45',1);
insert into offrir values(238,'TROXT21',2);
insert into offrir values(238,'DIMIRTAM6',3);
insert into offrir values(239,'DOLRIL7',2);
insert into offrir values(240,'LIDOXY23',4);
insert into offrir values(241,'TROXT21',3);
insert into offrir values(242,'BACTIV13',4);
insert into offrir values(243,'EQUILARX6',3);
insert into offrir values(244,'LITHOR12',3);
insert into offrir values(245,'EVILR7',4);
insert into offrir values(245,'TXISOL22',1);
insert into offrir values(246,'CARTION6',3);
insert into offrir values(247,'DEPRIL9',4);
insert into offrir values(248,'3MYC7',2);
insert into offrir values(249,'BITALV',3);
insert into offrir values(250,'INSXT5',4);
insert into offrir values(250,'TXISOL22',3);
insert into offrir values(251,'PIRIZ8',2);
insert into offrir values(252,'3MYC7',1);
insert into offrir values(253,'BACTIV13',3);
insert into offrir values(253,'TXISOL22',1);
insert into offrir values(254,'JOVAI8',4);
insert into offrir values(255,'AMOPIL7',2);
insert into offrir values(255,'CLAZER6',4);
insert into offrir values(256,'LITHOR12',4);
insert into offrir values(257,'BACTIG10',2);
insert into offrir values(258,'EVILR7',1);
insert into offrir values(259,'LITHOR12',2);
insert into offrir values(260,'EVILR7',1);
insert into offrir values(260,'DOLRIL7',4);
insert into offrir values(261,'PIRIZ8',1);
insert into offrir values(261,'BACTIV13',3);
insert into offrir values(262,'POMDI20',4);
insert into offrir values(262,'BACTIG10',3);
insert into offrir values(263,'BACTIV13',3);
insert into offrir values(263,'DOLRIL7',2);
insert into offrir values(264,'AMOX45',4);
insert into offrir values(265,'AMOPIL7',3);
insert into offrir values(265,'APATOUX22',4);
insert into offrir values(266,'DEPRIL9',4);
insert into offrir values(267,'PARMOL16',3);
insert into offrir values(268,'PARMOL16',3);
insert into offrir values(269,'PHYSOI8',3);
insert into offrir values(270,'CARTION6',3);
insert into offrir values(270,'EQUILARX6',4);
insert into offrir values(271,'BITALV',1);
insert into offrir values(272,'CLAZER6',2);
insert into offrir values(272,'EVILR7',2);
insert into offrir values(273,'AMOXIG12',3);
insert into offrir values(274,'AMOX45',2);
insert into offrir values(274,'BACTIG10',2);
insert into offrir values(275,'TXISOL22',4);
insert into offrir values(275,'LITHOR12',3);
insert into offrir values(276,'BACTIG10',4);
insert into offrir values(277,'TXISOL22',4);
insert into offrir values(277,'JOVAI8',4);
insert into offrir values(278,'PIRIZ8',3);
insert into offrir values(278,'BACTIV13',1);
insert into offrir values(279,'DEPRIL9',1);
insert into offrir values(280,'INSXT5',1);
insert into offrir values(281,'LITHOR12',2);
insert into offrir values(282,'PHYSOI8',1);
insert into offrir values(283,'TROXT21',3);
insert into offrir values(284,'DORNOM8',2);
insert into offrir values(285,'PHYSOI8',2);
insert into offrir values(285,'TXISOL22',1);
insert into offrir values(286,'TROXT21',2);
insert into offrir values(287,'POMDI20',3);
insert into offrir values(288,'BACTIV13',1);
insert into offrir values(289,'AMOX45',2);
insert into offrir values(289,'PARMOL16',1);
insert into offrir values(290,'CARTION6',4);
insert into offrir values(290,'DORNOM8',3);
insert into offrir values(291,'PIRIZ8',4);
insert into offrir values(291,'PHYSOI8',2);
insert into offrir values(292,'AMOX45',3);
insert into offrir values(292,'CLAZER6',3);
insert into offrir values(293,'DEPRIL9',3);
insert into offrir values(293,'3MYC7',2);
insert into offrir values(294,'AMOX45',1);
insert into offrir values(294,'INSXT5',2);
insert into offrir values(295,'AMOPIL7',1);
insert into offrir values(296,'DOLRIL7',2);
insert into offrir values(296,'DORNOM8',4);
insert into offrir values(297,'EVILR7',4);
insert into offrir values(298,'BACTIV13',3);
insert into offrir values(298,'CLAZER6',1);
insert into offrir values(299,'AMOPIL7',4);
insert into offrir values(300,'PARMOL16',4);
insert into offrir values(301,'LITHOR12',2);
insert into offrir values(301,'ADIMOL9',3);
insert into offrir values(302,'DEPRIL9',1);
insert into offrir values(303,'AMOX45',1);
insert into offrir values(303,'BACTIG10',3);
insert into offrir values(304,'PARMOL16',2);
insert into offrir values(304,'BITALV',1);
insert into offrir values(305,'BITALV',3);
insert into offrir values(306,'DORNOM8',4);
insert into offrir values(306,'AMOXIG12',4);
insert into offrir values(307,'APATOUX22',3);
insert into offrir values(307,'3MYC7',2);
insert into offrir values(308,'DOLRIL7',2);
insert into offrir values(309,'BITALV',2);
insert into offrir values(310,'PIRIZ8',1);
insert into offrir values(311,'ADIMOL9',4);
insert into offrir values(312,'LITHOR12',1);
insert into offrir values(312,'AMOXIG12',4);
insert into offrir values(313,'TXISOL22',4);
insert into offrir values(314,'TXISOL22',2);
insert into offrir values(314,'BITALV',1);
insert into offrir values(315,'DEPRIL9',4);
insert into offrir values(316,'LITHOR12',1);
insert into offrir values(316,'CLAZER6',3);
insert into offrir values(317,'TROXT21',4);
insert into offrir values(317,'AMOXIG12',2);
insert into offrir values(318,'PIRIZ8',4);
insert into offrir values(319,'BITALV',4);
insert into offrir values(320,'TXISOL22',3);
insert into offrir values(321,'AMOX45',3);
insert into offrir values(322,'PARMOL16',3);
insert into offrir values(322,'BACTIG10',2);
insert into offrir values(323,'3MYC7',1);
insert into offrir values(324,'AMOPIL7',4);
insert into offrir values(324,'DORNOM8',1);
insert into offrir values(325,'AMOX45',3);
insert into offrir values(326,'TXISOL22',4);
insert into offrir values(327,'TXISOL22',2);
insert into offrir values(328,'AMOPIL7',4);
insert into offrir values(328,'EVILR7',3);
insert into offrir values(329,'PHYSOI8',1);
insert into offrir values(329,'EQUILARX6',2);
insert into offrir values(330,'POMDI20',4);
insert into offrir values(330,'DEPRIL9',3);
insert into offrir values(331,'DEPRIL9',3);
insert into offrir values(331,'LITHOR12',1);
insert into offrir values(332,'CLAZER6',4);
insert into offrir values(333,'3MYC7',4);
insert into offrir values(334,'PHYSOI8',4);
insert into offrir values(334,'JOVAI8',2);
insert into offrir values(335,'LITHOR12',2);
insert into offrir values(335,'PHYSOI8',3);
insert into offrir values(336,'PHYSOI8',3);
insert into offrir values(337,'APATOUX22',4);
insert into offrir values(338,'EVILR7',4);
insert into offrir values(338,'BITALV',2);
insert into offrir values(339,'TXISOL22',3);
insert into offrir values(339,'EQUILARX6',1);
insert into offrir values(340,'PIRIZ8',1);
insert into offrir values(340,'EQUILARX6',1);
insert into offrir values(341,'EQUILARX6',3);
insert into offrir values(341,'JOVAI8',4);
insert into offrir values(342,'POMDI20',1);
insert into offrir values(343,'AMOX45',3);
insert into offrir values(343,'EQUILARX6',1);
insert into offrir values(344,'EQUILARX6',1);
insert into offrir values(345,'TROXT21',3);
insert into offrir values(346,'BITALV',3);
insert into offrir values(346,'JOVAI8',3);
insert into offrir values(347,'PHYSOI8',2);
insert into offrir values(348,'AMOXIG12',2);
insert into offrir values(349,'BITALV',2);
insert into offrir values(349,'DIMIRTAM6',3);
insert into offrir values(350,'PARMOL16',4);
insert into offrir values(351,'DIMIRTAM6',3);
insert into offrir values(352,'PIRIZ8',1);
insert into offrir values(352,'LIDOXY23',1);
insert into offrir values(353,'CLAZER6',1);
insert into offrir values(353,'TROXT21',1);
insert into offrir values(354,'BITALV',3);
insert into offrir values(354,'PHYSOI8',1);
insert into offrir values(355,'AMOXIG12',3);
insert into offrir values(355,'AMOX45',4);
insert into offrir values(356,'PIRIZ8',3);
insert into offrir values(356,'BACTIG10',2);
insert into offrir values(357,'EQUILARX6',3);
insert into offrir values(358,'CLAZER6',2);
insert into offrir values(359,'APATOUX22',1);
insert into offrir values(359,'LIDOXY23',3);
insert into offrir values(360,'PIRIZ8',4);
insert into offrir values(360,'TROXT21',1);
insert into offrir values(361,'AMOPIL7',4);
insert into offrir values(362,'EQUILARX6',3);
insert into offrir values(363,'DEPRIL9',3);
insert into offrir values(363,'APATOUX22',1);
insert into offrir values(364,'PHYSOI8',3);
insert into offrir values(365,'TROXT21',2);
insert into offrir values(366,'DEPRIL9',4);
insert into offrir values(366,'LIDOXY23',3);
insert into offrir values(367,'APATOUX22',1);
insert into offrir values(367,'DIMIRTAM6',1);
insert into offrir values(368,'CARTION6',2);
insert into offrir values(369,'BACTIV13',1);
insert into offrir values(369,'JOVAI8',3);
insert into offrir values(370,'BACTIV13',2);
insert into offrir values(371,'TROXT21',4);
insert into offrir values(371,'PIRIZ8',4);
insert into offrir values(372,'INSXT5',3);
insert into offrir values(373,'3MYC7',2);
insert into offrir values(374,'DIMIRTAM6',1);
insert into offrir values(374,'ADIMOL9',2);
insert into offrir values(375,'BITALV',4);
insert into offrir values(375,'POMDI20',1);
insert into offrir values(376,'AMOXIG12',1);
insert into offrir values(376,'BITALV',3);
insert into offrir values(377,'DEPRIL9',1);
insert into offrir values(377,'ADIMOL9',4);
insert into offrir values(378,'ADIMOL9',1);
insert into offrir values(378,'DIMIRTAM6',4);
insert into offrir values(379,'PARMOL16',3);
insert into offrir values(379,'EQUILARX6',2);
insert into offrir values(380,'AMOPIL7',1);
insert into offrir values(381,'PHYSOI8',2);
insert into offrir values(381,'PARMOL16',4);
insert into offrir values(382,'TROXT21',1);
insert into offrir values(383,'DEPRIL9',3);
insert into offrir values(383,'LITHOR12',4);
insert into offrir values(384,'INSXT5',4);
insert into offrir values(385,'BACTIG10',4);
insert into offrir values(386,'POMDI20',2);
insert into offrir values(386,'ADIMOL9',4);
insert into offrir values(387,'DOLRIL7',4);
insert into offrir values(388,'APATOUX22',3);
insert into offrir values(388,'TXISOL22',2);
insert into offrir values(389,'BACTIV13',2);
insert into offrir values(390,'3MYC7',2);
insert into offrir values(391,'AMOX45',3);
insert into offrir values(391,'AMOXIG12',3);
insert into offrir values(392,'ADIMOL9',1);
insert into offrir values(393,'CARTION6',4);
insert into offrir values(394,'AMOPIL7',4);
insert into offrir values(394,'AMOX45',2);
insert into offrir values(395,'DEPRIL9',2);
insert into offrir values(395,'PHYSOI8',4);
insert into offrir values(396,'ADIMOL9',2);
insert into offrir values(396,'BITALV',4);
insert into offrir values(397,'TXISOL22',3);
insert into offrir values(397,'DOLRIL7',4);
insert into offrir values(398,'PHYSOI8',4);
insert into offrir values(399,'PHYSOI8',4);
insert into offrir values(400,'LITHOR12',3);
insert into offrir values(400,'TROXT21',4);
insert into offrir values(401,'DORNOM8',4);
insert into offrir values(402,'DEPRIL9',1);
insert into offrir values(403,'INSXT5',2);
insert into offrir values(404,'PARMOL16',1);
insert into offrir values(405,'ADIMOL9',1);
insert into offrir values(405,'BITALV',4);
insert into offrir values(406,'LITHOR12',1);
insert into offrir values(406,'DORNOM8',3);
insert into offrir values(407,'CLAZER6',4);
insert into offrir values(408,'DIMIRTAM6',2);
insert into offrir values(409,'AMOXIG12',3);
insert into offrir values(409,'LIDOXY23',4);
insert into offrir values(410,'CARTION6',3);
insert into offrir values(410,'DEPRIL9',4);
insert into offrir values(411,'DOLRIL7',3);
insert into offrir values(412,'AMOPIL7',4);
insert into offrir values(412,'JOVAI8',3);
insert into offrir values(413,'BITALV',4);
insert into offrir values(414,'PIRIZ8',2);
insert into offrir values(415,'APATOUX22',3);
insert into offrir values(415,'EQUILARX6',1);
insert into offrir values(416,'3MYC7',1);
insert into offrir values(416,'BACTIV13',2);
insert into offrir values(417,'BITALV',3);
insert into offrir values(418,'DOLRIL7',4);
insert into offrir values(418,'ADIMOL9',2);
insert into offrir values(419,'CARTION6',3);
insert into offrir values(420,'CARTION6',3);
insert into offrir values(421,'TXISOL22',1);
insert into offrir values(422,'TXISOL22',2);
insert into offrir values(423,'PIRIZ8',1);
insert into offrir values(423,'DEPRIL9',2);
insert into offrir values(424,'PIRIZ8',2);
insert into offrir values(425,'PARMOL16',3);
insert into offrir values(426,'PARMOL16',3);
insert into offrir values(426,'EVILR7',2);
insert into offrir values(427,'EVILR7',2);
insert into offrir values(427,'LIDOXY23',4);
insert into offrir values(428,'EVILR7',3);
insert into offrir values(428,'TROXT21',2);
insert into offrir values(429,'PHYSOI8',2);
insert into offrir values(429,'AMOXIG12',3);
insert into offrir values(430,'AMOPIL7',4);
insert into offrir values(430,'LITHOR12',1);
insert into offrir values(431,'BACTIV13',2);
insert into offrir values(432,'3MYC7',4);
insert into offrir values(433,'DIMIRTAM6',3);
insert into offrir values(433,'EQUILARX6',3);
insert into offrir values(434,'AMOPIL7',4);
insert into offrir values(434,'DEPRIL9',3);
insert into offrir values(435,'BACTIV13',2);
insert into offrir values(436,'BACTIV13',3);
insert into offrir values(436,'DOLRIL7',1);
insert into offrir values(437,'3MYC7',4);
insert into offrir values(437,'AMOXIG12',2);
insert into offrir values(438,'PHYSOI8',4);
insert into offrir values(439,'DEPRIL9',1);
insert into offrir values(439,'BACTIV13',2);
insert into offrir values(440,'JOVAI8',1);
insert into offrir values(441,'AMOXIG12',4);
insert into offrir values(441,'CARTION6',3);
insert into offrir values(442,'LITHOR12',2);
insert into offrir values(443,'3MYC7',2);
insert into offrir values(443,'PHYSOI8',3);
insert into offrir values(444,'POMDI20',3);
insert into offrir values(444,'LITHOR12',1);
insert into offrir values(445,'3MYC7',4);
insert into offrir values(445,'PARMOL16',1);
insert into offrir values(446,'LITHOR12',4);
insert into offrir values(446,'PIRIZ8',3);
insert into offrir values(447,'AMOXIG12',1);
insert into offrir values(447,'AMOPIL7',3);
insert into offrir values(448,'TXISOL22',1);
insert into offrir values(449,'AMOXIG12',2);
insert into offrir values(449,'DIMIRTAM6',2);
insert into offrir values(450,'DEPRIL9',1);
insert into offrir values(450,'PHYSOI8',1);
insert into offrir values(451,'TROXT21',3);
insert into offrir values(452,'DORNOM8',1);
insert into offrir values(453,'JOVAI8',1);
insert into offrir values(454,'TROXT21',1);
insert into offrir values(455,'PHYSOI8',1);
insert into offrir values(455,'AMOPIL7',3);
insert into offrir values(456,'PHYSOI8',1);
insert into offrir values(456,'BACTIG10',1);
insert into offrir values(457,'PARMOL16',1);
insert into offrir values(457,'EVILR7',4);
insert into offrir values(458,'LIDOXY23',1);
insert into offrir values(459,'TXISOL22',3);
insert into offrir values(460,'DORNOM8',4);
insert into offrir values(460,'AMOX45',3);
insert into offrir values(461,'ADIMOL9',3);
insert into offrir values(461,'POMDI20',1);
insert into offrir values(462,'AMOXIG12',2);
insert into offrir values(462,'EQUILARX6',3);
insert into offrir values(463,'AMOXIG12',1);
insert into offrir values(464,'CLAZER6',3);
insert into offrir values(464,'LITHOR12',1);
insert into offrir values(465,'LITHOR12',2);
insert into offrir values(466,'CARTION6',2);
insert into offrir values(466,'TROXT21',1);
insert into offrir values(467,'TXISOL22',3);
insert into offrir values(467,'PIRIZ8',2);
insert into offrir values(468,'TXISOL22',4);
insert into offrir values(469,'PARMOL16',3);
insert into offrir values(469,'CARTION6',4);
insert into offrir values(470,'EVILR7',3);
insert into offrir values(471,'BACTIG10',4);
insert into offrir values(472,'AMOX45',2);
insert into offrir values(472,'EQUILARX6',1);
insert into offrir values(473,'BITALV',4);
insert into offrir values(473,'CLAZER6',2);
insert into offrir values(474,'JOVAI8',2);
insert into offrir values(474,'TROXT21',1);
insert into offrir values(475,'AMOXIG12',4);
insert into offrir values(476,'BACTIG10',1);
insert into offrir values(476,'APATOUX22',1);
insert into offrir values(477,'EVILR7',4);
insert into offrir values(477,'DEPRIL9',2);
insert into offrir values(478,'AMOX45',3);
insert into offrir values(478,'PIRIZ8',1);
insert into offrir values(479,'CLAZER6',4);
insert into offrir values(480,'DEPRIL9',2);
insert into offrir values(481,'3MYC7',2);
insert into offrir values(481,'EQUILARX6',3);
insert into offrir values(482,'AMOPIL7',2);
insert into offrir values(483,'JOVAI8',4);
insert into offrir values(484,'EQUILARX6',2);
insert into offrir values(485,'PARMOL16',2);
insert into offrir values(485,'TXISOL22',3);
insert into offrir values(486,'APATOUX22',3);
insert into offrir values(486,'TROXT21',4);
insert into offrir values(487,'DORNOM8',4);
insert into offrir values(488,'PARMOL16',3);
insert into offrir values(488,'BACTIV13',4);
insert into offrir values(489,'INSXT5',4);
insert into offrir values(489,'BACTIG10',3);
insert into offrir values(490,'DIMIRTAM6',3);
insert into offrir values(490,'DORNOM8',3);
insert into offrir values(491,'INSXT5',1);
insert into offrir values(492,'AMOX45',3);
insert into offrir values(492,'INSXT5',1);
insert into offrir values(493,'EVILR7',2);
insert into offrir values(493,'AMOX45',2);
insert into offrir values(494,'CARTION6',2);
insert into offrir values(495,'CLAZER6',3);
insert into offrir values(496,'PHYSOI8',2);
insert into offrir values(496,'JOVAI8',4);
insert into offrir values(497,'LIDOXY23',1);
insert into offrir values(497,'JOVAI8',3);
insert into offrir values(498,'DEPRIL9',3);
insert into offrir values(498,'DORNOM8',2);
insert into offrir values(499,'EQUILARX6',2);
insert into offrir values(499,'BITALV',2);
insert into offrir values(500,'DOLRIL7',2);
insert into offrir values(501,'BITALV',3);
insert into offrir values(502,'APATOUX22',2);
insert into offrir values(503,'BITALV',2);
insert into offrir values(504,'3MYC7',1);
insert into offrir values(505,'BITALV',4);
insert into offrir values(506,'3MYC7',2);
insert into offrir values(507,'CARTION6',2);
insert into offrir values(507,'LITHOR12',1);
insert into offrir values(508,'PARMOL16',4);
insert into offrir values(509,'LIDOXY23',4);
insert into offrir values(509,'ADIMOL9',1);
insert into offrir values(510,'CARTION6',1);
insert into offrir values(511,'CARTION6',2);
insert into offrir values(512,'DORNOM8',3);
insert into offrir values(513,'APATOUX22',3);
insert into offrir values(514,'EVILR7',2);
insert into offrir values(515,'DOLRIL7',3);
insert into offrir values(516,'BACTIV13',1);
insert into offrir values(517,'AMOX45',4);
insert into offrir values(517,'EVILR7',2);
insert into offrir values(518,'JOVAI8',2);
insert into offrir values(519,'EQUILARX6',3);
insert into offrir values(519,'BACTIG10',4);
insert into offrir values(520,'PARMOL16',1);
insert into offrir values(520,'PHYSOI8',3);
insert into offrir values(521,'TXISOL22',4);
insert into offrir values(521,'POMDI20',4);
insert into offrir values(522,'AMOXIG12',3);
insert into offrir values(523,'DEPRIL9',3);
insert into offrir values(523,'ADIMOL9',1);
insert into offrir values(524,'PARMOL16',1);
insert into offrir values(524,'PHYSOI8',1);
insert into offrir values(525,'PIRIZ8',1);
insert into offrir values(526,'CARTION6',1);
insert into offrir values(527,'PARMOL16',3);
insert into offrir values(527,'BITALV',2);
insert into offrir values(528,'EQUILARX6',4);
insert into offrir values(528,'JOVAI8',4);
insert into offrir values(529,'BACTIV13',1);
insert into offrir values(530,'AMOX45',4);
insert into offrir values(530,'DIMIRTAM6',3);
insert into offrir values(531,'BACTIV13',3);
insert into offrir values(532,'DEPRIL9',4);
insert into offrir values(532,'DIMIRTAM6',4);
insert into offrir values(533,'EQUILARX6',1);
insert into offrir values(533,'TXISOL22',3);
insert into offrir values(534,'INSXT5',3);
insert into offrir values(535,'APATOUX22',3);
insert into offrir values(536,'AMOX45',4);
insert into offrir values(536,'PIRIZ8',4);
insert into offrir values(537,'APATOUX22',1);
insert into offrir values(538,'PARMOL16',1);
insert into offrir values(538,'AMOPIL7',2);
insert into offrir values(539,'CLAZER6',2);
insert into offrir values(540,'DEPRIL9',4);
insert into offrir values(541,'LIDOXY23',4);
insert into offrir values(542,'AMOXIG12',4);
insert into offrir values(542,'PARMOL16',3);
insert into offrir values(543,'AMOXIG12',3);
insert into offrir values(544,'DORNOM8',4);
insert into offrir values(545,'EQUILARX6',3);
insert into offrir values(546,'CLAZER6',4);
insert into offrir values(547,'BACTIG10',4);
insert into offrir values(548,'AMOX45',3);
insert into offrir values(548,'DIMIRTAM6',4);
insert into offrir values(549,'AMOXIG12',4);
insert into offrir values(549,'EQUILARX6',2);
insert into offrir values(550,'PHYSOI8',4);
insert into offrir values(551,'EVILR7',4);
insert into offrir values(551,'PIRIZ8',1);
insert into offrir values(552,'PARMOL16',4);
insert into offrir values(552,'POMDI20',2);
insert into offrir values(553,'AMOXIG12',1);
insert into offrir values(553,'PHYSOI8',4);
insert into offrir values(554,'JOVAI8',3);
insert into offrir values(555,'AMOX45',4);
insert into offrir values(555,'POMDI20',2);
insert into offrir values(556,'DORNOM8',1);
insert into offrir values(556,'AMOXIG12',1);
insert into offrir values(557,'ADIMOL9',1);
insert into offrir values(558,'AMOPIL7',2);
insert into offrir values(559,'TROXT21',2);
insert into offrir values(559,'DORNOM8',4);
insert into offrir values(560,'DEPRIL9',4);
insert into offrir values(560,'ADIMOL9',4);
insert into offrir values(561,'BACTIV13',3);
insert into offrir values(562,'BITALV',4);
insert into offrir values(562,'POMDI20',4);
insert into offrir values(563,'LIDOXY23',4);
insert into offrir values(563,'ADIMOL9',1);
insert into offrir values(564,'BITALV',1);
insert into offrir values(565,'EQUILARX6',3);
insert into offrir values(566,'AMOX45',1);
insert into offrir values(566,'ADIMOL9',3);
insert into offrir values(567,'POMDI20',3);
insert into offrir values(568,'LIDOXY23',3);
insert into offrir values(569,'TXISOL22',4);
insert into offrir values(569,'EVILR7',2);
insert into offrir values(570,'BITALV',2);

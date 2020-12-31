-- Base de données: `Formation`
--------------------------------------------------------


create schema TP1_bdd_formation;
SET search_path=TP1_bdd_formation;
--
-- Structure de la table `formateur`
--

CREATE TABLE formateur (
  id_formateur SERIAL NOT NULL ,
  nom_formateur varchar(30) default NULL,
  prenom_formateur varchar(30) default NULL,
  PRIMARY KEY (id_formateur)
)  ;
-- --------------------------------------------------------

--
-- Structure de la table `stagiaires`
--

CREATE TABLE stagiaires (
  id_stagiaire varchar(20) NOT NULL default '',
  nomunion varchar(30) default NULL,
  Prenom varchar(20) default NULL,
  nomnaissance varchar(20) default NULL,
  etab varchar(10) default NULL,
  numcasier int default NULL,
  PRIMARY KEY  (id_stagiaire)
)  ;


-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE niveau (
  niveau varchar(50) PRIMARY KEY
  
)  ;
-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE formation (
  id_formation SERIAL NOT NULL,
  intitule_formation TEXT,
  nbheures  int default '0',
  niveau varchar(50) default NULL,
  PRIMARY KEY  (id_formation)
)  ;

-- --------------------------------------------------------

--
-- Structure de la table `planifier`
--

CREATE TABLE planifier (
  id_formation  int NOT NULL references formation(id_formation),
  id_formateur  int NOT NULL references formateur(id_formateur),
  dateform date NOT NULL default '2000-01-01',
  groupe int NOT NULL default 1,
  duree  int default '0',
  numseance  int default '0',
  mat_am varchar(50) default NULL,
  numsalle varchar(20) default NULL,
  PRIMARY KEY (id_formation,id_formateur,dateform,groupe)
) ;
-- --------------------------------------------------------


--
-- Structure de la table `inscrire`
--

CREATE TABLE inscrire (
  id_formation int NOT NULL references formation(id_formation),
  id_stagiaire varchar(20)  NOT NULL references stagiaires(id_stagiaire),
  groupe  int default '0',
  PRIMARY KEY (id_formation,id_stagiaire)
) ;


--
-- Contenu de la table `formateur`
--
INSERT INTO formateur (id_formateur, nom_formateur, prenom_formateur) VALUES (1, 'Legrand', 'Sarah');
INSERT INTO formateur (id_formateur, nom_formateur, prenom_formateur) VALUES (2, 'Cancel', 'Christophe');
INSERT INTO formateur (id_formateur, nom_formateur, prenom_formateur) VALUES (3, 'Maurel', 'Olivier');
INSERT INTO formateur (id_formateur, nom_formateur, prenom_formateur) VALUES (4, 'Pleuveraux', 'François');
INSERT INTO formateur (id_formateur, nom_formateur, prenom_formateur) VALUES (5, 'Carmignac', 'Laurent');

-- initialisation de la valeur du compteur de séquence
select setval('formateur_id_formateur_seq',5);

--
-- Contenu de la table `niveau`
--
INSERT INTO niveau (niveau) VALUES ('Confirme');
INSERT INTO niveau (niveau) VALUES ('Courant');
INSERT INTO niveau (niveau) VALUES ('Debutant');
--
-- Contenu de la table `professeur`
--
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('10198', 'LEFAUCONNIER', 'SUZANNE', 'VALLIER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('10600', 'OLIVIER', 'MICHELE', 'CALVANELLI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('11020', 'BARTHELEMY', 'ODILE', 'ESCUDIE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('11633', 'MICHEL', 'RENEE', 'BARRASSON', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('12043', 'MARCH', 'ANNIE', 'CARNUS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('12170', 'PURPO BLANC', 'CHRISTIANE', 'EX LENTINI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('12330', 'BLATT', 'JEANNINE', 'BLATT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('12337', 'LEONETTI', 'MARIE THERESE', 'LEONETTI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('12445', 'DUBOIS', 'CLAUDINE', 'BOUCHERAT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('12456', 'GHIBAUDO', 'EVELYNE', 'BASSO', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('12615', 'GUILHEM', 'NADINE', 'BOGELMANN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('12955', 'KURDOGLIAN', 'MARIE ANNE', 'KURDOGLIAN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('13073', 'MANIN', 'ANNE MARIE', 'LECURET', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('13150', 'ESPIE', 'SIMONE', 'TERRAS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('13167', 'PLISSONNEAU', 'JOSETTE', 'RIEGER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('13211', 'JOURET', 'GENEVIEVE', 'MARTIN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('13425', 'POGGIOLI', 'NICOLE', 'OUVRY', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('13516', 'MATHIOT', 'ELISABETH', 'RAVEL', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('13677', 'GAUTIER', 'MICHELE', 'LUCKAS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('13972', 'JULIEN', 'HELENE', 'RAOULX', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('14001', 'MASUREL', 'CHRISTIANE', 'RUIZ', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('14186', 'NAHON', 'JOSETTE', 'NAHON', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('14187', 'PLAS', 'CHRISTINE', 'MASSE', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('14487', 'TROTMAN', 'MARIE HELE', 'TROTMAN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('14732', 'RANCE', 'MARTINE', 'RANCE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('14780', 'COHEN', 'DOMINIQUE', 'COHEN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('14879', 'CARLUE', 'ANNIE', 'CARLUE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('14899', 'CARIOU', 'MAGALI', 'PONS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('14918', 'MARTIN CAZAENTRE', 'ROSELYNE', 'MARTIN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('15118', 'GOUDENECHE', 'MONIQUE', 'SIMON', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('15253', 'MOSNIER', 'ANNIE', 'BESTAGNO', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('15277', 'LE MERRER', 'JOELLE', 'LE MERRER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('15300', 'GOMES', 'MARTINE', 'GOMES', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('15419', 'TREMELAT', 'DOMNINE', 'TREMELAT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('15664', 'BLANCHARD', 'COLETTE', 'BLANCHARD', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('15763', 'SMER', 'MARTINE', 'PARIS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('15792', 'ANTOGNELLI', 'AGNES', 'CROVI', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('16034', 'BAYLE', 'REGINE', 'BAYLE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('16546', 'ZUMTANGWALD', 'GISELE', 'FRIEDRICH', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('16848', 'MIKHTARIAN', 'CLAIRE', 'MAQUIN', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('18142', 'GIROUD', 'PAULETTE', 'GIROUD', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('18357', 'DAUXIN', 'NICOLE', 'DAUXIN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('18452', 'SOUCHAY', 'ALAIN', 'SOUCHAY', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('18575', 'REYMOND', 'BRUNO', 'REYMOND', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('18812', 'CHARBONNIER', 'GIL', 'CHARBONNIER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('19064', 'MONTOY', 'JEAN PIERR', 'MONTOY', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('19268', 'COLOMER', 'PIERRE', 'COLOMER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('19362', 'FENOULHET', 'MARION', 'PONCET', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('19411', 'SMITH', 'PIERRE', 'SMITH', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('20467', 'KAMECKI', 'LUCE', 'DURIEZ', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('20488', 'CRUZ', 'ALAIN', 'CRUZ', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('20823', 'PAUL', 'RICHARD', 'PAUL', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('20855', 'AUBERT', 'EMMANUELLE', 'AUBERT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('20887', 'LORIENTE', 'PIERRE', 'LORIENTE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('21372', 'STRICKER', 'CHRISTIAN', 'STRICKER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('21424', 'JACOB CHAMPEAU', 'MARCELINE', 'CHAMPEAU', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('21435', 'DE BUTLER', 'PASQUALINE', 'DE BUTLER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('21524', 'MATHIEU', 'JEAN CHARLES', 'MATHIEU', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('21699', 'KHALED', 'SANDRINE', 'NAJAR', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('22235', 'MARTINEZ', 'ANTOINE', 'MARTINEZ', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('22368', 'DECAUX', 'JEAN FRED', 'DECAUX', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('22538', 'JAPPERT', 'PASCALE', 'HEINRICH', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('22691', 'VANNI', 'ERIC', 'VANNI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('22783', 'GAILHARDOU', 'CORINNE', 'GAILHARDOU', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('23072', 'VIAL', 'ALAIN', 'VIAL', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('23248', 'PELLEGRIN', 'MARIE CHRI', 'PELLEGRIN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('23314', 'BAZZICONI', 'JEAN PIERR', 'BAZZICONI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('23400', 'ROUBIN', 'JEAN PIERR', 'ROUBIN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('23647', 'QUEMENEUR', 'ANNE', 'QUEMENEUR', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('23754', 'PITZALIS', 'FRANCOISE', 'CHAIX', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('23975', 'RICHARD', 'ANNE MARIE', 'GARCHIER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('24210', 'RIGAT', 'PIERRE', 'RIGAT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('24451', 'GOMEZ', 'PATRICK', 'GOMEZ', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('24457', 'KOMINO', 'PASCAL', 'KOMINO', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('24492', 'HENRION', 'STEPHANE', 'HENRION', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('24889', 'CAMOIN', 'JEAN YVES', 'CAMOIN', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('24954', 'ROMBI', 'SOPHIE', 'ROMBI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('25003', 'MATHIEU', 'ERIC', 'MATHIEU', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('25163', 'DANTIN', 'LAURENT', 'DANTIN', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('25257', 'MACCHI', 'GENEVIEVE', 'MACCHI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('25264', 'TAFFIN', 'FRANCINE', 'TAFFIN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('25378', 'DAVIET', 'CLAUDE', 'DAVIET', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('25537', 'L HEVEDER', 'JACQUELINE', 'GUAFFI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('26330', 'DADOU', 'YVES', 'DADOU', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('26885', 'SOLAL', 'PHILIPPE', 'SOLAL', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('26991', 'DECHAVANNE', 'ISABELLE', 'DECHAVANNE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('27053', 'BERENI', 'JEANNE MAR', 'BERENI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('27057', 'DESBOIS', 'VALERIE', 'DESBOIS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('27110', 'JACQUE SABATIER', 'FRANCOISE', 'SABATIER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('27210', 'BARTOLI', 'MARIE CHRI', 'CHANUT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('27503', 'GUILBERT', 'BENOIT', 'GUILBERT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('27615', 'ROUX', 'HERVE', 'ROUX', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('27691', 'SAUNIER', 'KARINE', 'FARSY', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('28053', 'GIRAUD', 'THIERRY', 'GIRAUD', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('28882', 'LUMBROSO', 'JEAN PIERR', 'LUMBROSO', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('28895', 'SOLLAZZO', 'GILBERT', 'SOLLAZZO', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('28901', 'SCHVAN BONNET', 'VALERIE', 'SCHVAN', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('28944', 'BERGERAT', 'THIERRY', 'BERGERAT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('29032', 'MAZERAT', 'CHRISTOPHE', 'MAZERAT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('29060', 'COLLET', 'THIERRY', 'COLLET', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('29239', 'LE BLANC', 'PASCALE', 'LE BLANC', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('29428', 'CASTELAN', 'DIDIER', 'CASTELAN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('29464', 'GALLET', 'GERARD', 'GALLET', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('29528', 'ISTRIA', 'FLORENCE', 'ISTRIA', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('2953', 'PIPERAUD', 'ROBERT', 'PIPERAUD', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('29557', 'HAQUETTE', 'CHRISTOPHE', 'HAQUETTE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('29643', 'SANDRI', 'MICHEL', 'SANDRI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('30253', 'NEEL', 'PATRICK', 'NEEL', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('30279', 'AGARD', 'HERVE', 'AGARD', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('32166', 'NICOLAS', 'ODILE', 'TESTANIERE', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('32713', 'DUBOIS', 'JEROME', 'DUBOIS', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('32714', 'GROZNER', 'THIERRY', 'GROZNER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('32884', 'BARROS', 'JOSE', 'BARROS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('33971', 'NARDI CADIOU', 'ISABELLE', 'NARDI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('3429', 'BARRET', 'PIERRE', 'BARRET', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('3449', 'GUILHEM', 'JEAN PIERR', 'GUILHEM', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('34595', 'CHARMET', 'PASCALE', 'CHARMET', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('34633', 'CHARNAY', 'PHILIPPE', 'CHARNAY', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('3472', 'MAUREL', 'GILBERT', 'MAUREL', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('35046', 'COSTES', 'J PHILIPPE', 'COSTES', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('35115', 'MOLINATTI', 'GREGOIRE', 'MOLINATTI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('35609', 'MICHEL', 'SYLVIE', 'MICHEL', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('35648', 'JACQUES', 'DIDIER', 'JACQUES', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('35948', 'TIMM SOLEILHAVOUP', 'GENEVIEVE', 'SOLEILHAVOUP', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('36490', 'GOGOL', 'NICOLAS', 'GOGOL', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('37480', 'CHARLEAU', 'BENOIT', 'CHARLEAU', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('37664', 'MARCHE', 'LAURENT', 'MARCHE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('37694', 'PISTONO', 'MICHEL', 'PISTONO', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('37829', 'VICARI', 'BRUNO', 'VICARI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('3803', 'JEAN', 'MICHEL', 'JEAN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('38130', 'GAMET', 'ELIZABETH', 'GAMET', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('38303', 'THOLOZAN', 'YANN', 'THOLOZAN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('38424', 'VINCENT', 'MARIE FRAN', 'VINCENT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('38764', 'RABAH', 'BELKACEM', 'RABAH', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('3933', 'PANETTA', 'FRANCESCO', 'PANETTA', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4029', 'NAHMIYAZ', 'HERVE', 'NAHMIYAZ', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('41078', 'MALBRANCHE', 'ESTELLE', 'MALBRANCHE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('41082', 'MASSIANI', 'MARGARET', 'MILLS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('41181', 'BRAEMS', 'NICOLAS', 'BRAEMS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('41206', 'RICHARD', 'CLAUDE JAC', 'RICHARD', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('41234', 'GIOVANNANGELI', 'LILIANE', 'TRAMONI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('41254', 'COLLOC H', 'MICHEL', 'COLLOC H', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('41436', 'COLOMBE', 'LAETITIA', 'ASCENCI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('41581', 'MONJOU', 'ANNE', 'DE CARMANTRAND', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4159', 'HENNEBERT', 'FRANCOIS', 'HENNEBERT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('41593', 'CHEMIN', 'CHRISTIAN', 'CHEMIN', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('42049', 'VILAIN', 'YANNICK DANIEL', 'VILAIN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('43479', 'CASTRO', 'NATALI', 'CASTRO', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4373', 'PESTY', 'JEAN PIERR', 'PESTY', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4377', 'DIETLIN', 'PIERRE', 'DIETLIN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4414', 'TIEBOIS', 'MICHEL', 'TIEBOIS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4425', 'NOLOT', 'GILLES', 'NOLOT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('44361', 'OUAZINE', 'PASCAL', 'OUAZINE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('44365', 'PAPAZIAN', 'JEAN-CHARLES', 'PAPAZIAN', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4453', 'CHIGE', 'JEAN LOUIS', 'CHIGE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('44540', 'BOURGEOIS', 'MARC', 'BOURGEOIS', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('44608', 'ACHARD', 'MICHEL', 'ACHARD', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('44609', 'GUYON', 'BRUNO', 'GUYON', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('44961', 'CAMOIN', 'ANNA', 'NICOLAS', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('45026', 'FILLY', 'MAGALI JULIETTE', 'FILLY', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('45204', 'DRACHSLER', 'VERONIQUE', 'DRACHSLER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('45452', 'TSCHUDY', 'CECILE', 'CART', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('45604', 'CASTEL', 'STEPHANE', 'CASTEL', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4571', 'LOCUBICHE', 'CHRISTOPHE', 'LOCUBICHE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4679', 'BENTZ', 'BERNARD', 'BENTZ', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('47722', 'JOLY', 'JEAN LUC', 'JOLY', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('47728', 'BORRELLY', 'CYRIL', 'BORRELLY', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('47828', 'FONTA', 'CORINNE', 'FONTA', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('48010', 'GLINEUR', 'JEAN MARC', 'GLINEUR', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4802', 'SERRES', 'JEAN CLAUD', 'SERRES', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4817', 'MESTRIES', 'JEAN CLAUD', 'MESTRIES', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4826', 'PLAS', 'JACQUES', 'PLAS', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4830', 'MARTIGNE', 'GEORGES', 'MARTIGNE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4851', 'MARROU', 'JEAN MICHE', 'MARROU', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('48713', 'FUCHS', 'EMMANUELLE', 'FUCHS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('49161', 'FAILLAT', 'CYRIL', 'FAILLAT', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4917', 'BOUTIER', 'GEORGES', 'BOUTIER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('49877', 'BERTONE', 'CEDRIC', 'BERTONE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4996', 'VIDAL', 'MICHEL', 'VIDAL', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('4997', 'CELERIER', 'MARC', 'CELERIER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5016', 'RIVAT', 'DANIEL', 'RIVAT', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('51272', 'DONNET', 'SYLVIE', 'AUDOYE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5143', 'MATHIEU', 'RENE', 'MATHIEU', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('51568', 'ROUSSEAU', 'PATRICK', 'ROUSSEAU', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5201', 'ANEZO', 'DOMINIQUE', 'ANEZO', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5205', 'JOURET', 'HELEN RAOU', 'JOURET', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('52166', 'ROUX', 'ISABELLE', 'ROUX', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5256', 'LEMBO', 'GERARD', 'LEMBO', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5321', 'BROUET', 'GUY', 'BROUET', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5340', 'DURAND', 'MARC', 'DURAND', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5450', 'MICHEL', 'JEAN', 'MICHEL', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5489', 'RACON', 'JEAN', 'RACON', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('54941', 'DEVILLARD', 'CHRISTINE', 'LEMACON', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('54983', 'PISANI', 'HUGO PIERRE', 'PISANI', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('55116', 'ALBISSER', 'MARIE YVETTE', 'ALBISSER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('55415', 'DUPIN', 'SEVERINE', 'DUPIN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('55982', 'REYNAUD', 'OLIVIER JEAN JA', 'REYNAUD', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5607', 'SIROT', 'DOMINIQUE', 'SIROT', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5634', 'BONNAFOUX', 'ALAIN', 'BONNAFOUX', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5653', 'ALCARAZ', 'ALAIN', 'ALCARAZ', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('56586', 'PY BALIBAR', 'ISABELLE', 'PY', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('56949', 'SOLIVERI', 'JORE ROCH', 'SOLIVERI', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5701', 'GERVASONI', 'JACQUES', 'GERVASONI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5704', 'SZUBAN', 'CHRISTIAN', 'SZUBAN', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5729', 'NERKOWSKI', 'EDWIN', 'NERKOWSKI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5790', 'NICOL', 'PATRICK', 'NICOL', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5810', 'GALLOIS', 'ALAIN', 'GALLOIS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5878', 'RECOUS', 'JACQUES', 'RECOUS', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5902', 'HIVERNAT', 'REGIS', 'HIVERNAT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5920', 'DUTERQUE', 'MICHEL', 'DUTERQUE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5927', 'DUPONT', 'BERTRAND', 'DUPONT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5929', 'PLEUVERAUX', 'FRANCOIS', 'PLEUVERAUX', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('5930', 'RAMPONI', 'MICHEL', 'RAMPONI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('59352', 'GHANMI', 'ABDESSELEM', 'GHANMI', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('59389', 'DARTOIS', 'JEROME', 'DARTOIS', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('59467', 'RANC', 'JEAN PHILI', 'RANC', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('59845', 'DUBOURDIEU', 'ROLAND', 'DUBOURDIEU', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('60009', 'CONVARD', 'LUCIE', 'CONVARD', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('61031', 'NOEMIE', 'SABRINA', 'NOEMIE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('61094', 'MINNE', 'MATHILDE ADRIEN', 'MINNE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6124', 'DELPRAT', 'REGIS', 'DELPRAT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('61260', 'KUNSTLER', 'RAPHAEL', 'KUNSTLER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('61262', 'PEREZ', 'ANNELISE', 'PEREZ', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('61271', 'PASCAIL', 'AUDE', 'PASCAIL', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('61276', 'BERNARD', 'FLORENCE LILIAN', 'BERNARD', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('61359', 'DAUMAS', 'AUDREY ANNIE DO', 'DAUMAS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('61380', 'SCOTTO DI PERTA', 'PHILIPPE JULIEN', 'SCOTTO DI PERTA', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('61389', 'BOIN', 'MATHIAS SEBASTI', 'BOIN', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('61394', 'SANTUCCI', 'STEPHANIE NATHA', 'SANTUCCI', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('61422', 'JEGHI', 'RADOUANE', 'JEGHI', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('61424', 'SAUDADIER', 'ALAIN', 'SAUDADIER', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6201', 'NOUGUE', 'JEAN PAUL', 'NOUGUE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6246', 'TRICHE', 'YVES', 'TRICHE', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6302', 'LAUZIER', 'MICHEL', 'LAUZIER', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6348', 'TESTUCCI', 'CHRISTIAN', 'TESTUCCI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6367', 'SZNAPER', 'PIERRE', 'SZNAPER', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6439', 'PES', 'PHILIPPE', 'PES', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6485', 'VOVANTAO', 'BERNARD', 'VOVANTAO', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6490', 'GIORDANO', 'CHRISTIAN', 'GIORDANO', 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6564', 'CAMOIN', 'YVES', 'CAMOIN', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6725', 'LANGOT', 'FRANCIS', 'LANGOT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6761', 'LEVRAUX', 'JEAN FRANC', 'LEVRAUX', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6766', 'DAUTHEUIL', 'DOMINIQUE', 'DAUTHEUIL', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6777', 'KHEIRBECK', 'NAJIB', 'KHEIRBECK', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('6883', 'ROLLAND', 'THIERRY', 'ROLLAND', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('X00001', 'BRENS', 'EMMANUELLE', 'BRENS', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('X00002', 'CHALUMEAU', 'FRANCOIS', 'CHALUMEAU', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('X00003', 'MONTEIL', 'FRANCOISE', 'MONTEIL', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('X00004', 'GAMBINI', 'JACQUES', 'GAMBINI', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('X00005', 'BICKFORD SMITH', 'JACQUELINE', 'BICKFORD SMITH', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('X00011', 'CHOUREUX', 'FREDERIQUE', NULL, 'LEP');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('x00015', 'VACHEROT', 'GEORGES', 'VACHEROT', 'LG');
INSERT INTO stagiaires (id_stagiaire, nomunion, Prenom, nomnaissance, etab) VALUES ('X00016', 'REVALOR', 'CATHERINE', 'REVALOR', 'LG');
--
-- Contenu de la table `formation`
--
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (21, 'Utilisation de l''ordinateur dans l''environnement Windows', 0, 'Debutant');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (22, 'Utilisation du reseau', 0, 'Debutant');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (23, 'Formation Internet Recherche & navigation', 4, 'Debutant');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (24, 'Messagerie electronique Via le WEB ou un client de messagerie (outlook)', 4, 'Debutant');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (25, 'Formation Word', 8, 'Debutant');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (26, 'Formation Excel', 8, 'Debutant');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (27, 'Presentation des contenus pedagogiques en ligne', 0, 'Courant');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (28, 'Logiciels specialises : langues, maths ..', 0, 'Courant');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (30, 'Utilisation pedagogique de IACA et du reseau', 4, 'Courant');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (31, 'Formation Word Avancee', 8, 'Courant');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (32, 'Formation Excel avancee', 8, 'Courant');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (33, 'Formation utilisation de Moliere (gestion des absences)', 4, 'Courant');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (34, 'Creation de supports pedagogiques', 8, 'Confirme');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (35, 'Bases de donnees (Access)', 12, 'Confirme');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (37, 'Initiation a Linux', 12, 'Confirme');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (39, 'Developpement de pages WEB statiques et dynamiques (HTML)', 8, 'Confirme');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (40, 'Developpement de pages WEB statiques et dynamiques (PHP/MySQL)', 16, 'Confirme');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (41, 'Developpement de pages WEB statiques et dynamiques (SPIP)', 4, 'Confirme');
INSERT INTO formation (id_formation, intitule_formation, nbheures, niveau) VALUES (42, 'Utilisation du reseau et Utilisation de l''ordinateur Windows', 4, 'Debutant');

-- initialisation de la valeur du compteur de séquence
select setval('formation_id_formation_seq',42);

--
-- Contenu de la table `planifier`
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (23,1,'2004-12-13' ,1,4,1,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (23,1,'2004-12-16' ,2,4,1,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (24,2,'2006-01-13' ,2,4,1,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (24,2,'2006-01-14' ,1,4,1,'Matin','multilycee');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (25,5,'2006-01-27' ,2,4,1,'Matin','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (25,5,'2006-02-1' ,1,4,1,'Matin','G124');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (25,5,'2006-02-3' ,2,4,2,'Matin','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (25,5,'2006-02-24' ,1,4,2,'Matin','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (26,5,'2006-02-22' ,1,4,1,'Matin','G124');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (26,5,'2006-02-24' ,2,4,1,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (26,5,'2006-03-1' ,2,4,2,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (26,5,'2006-03-3' ,1,4,2,'Matin','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (30,3,'2006-01-18' ,1,4,1,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (30,3,'2006-01-24' ,2,4,1,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (34,4,'2006-03-8' ,2,4,1,'Matin','G124');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (34,4,'2006-03-9' ,1,4,1,'AM','G124');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (34,4,'2006-03-21' ,1,4,2,'Matin','G124');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (34,4,'2006-03-22' ,2,4,2,'Matin','G124');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (35,3,'2006-01-25' ,1,4,1,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (35,3,'2006-01-31' ,1,4,2,'Matin','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (35,3,'2006-02-21' ,1,4,3,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (37,4,'2006-04-4' ,1,4,1,'Matin','E203');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (37,4,'2006-04-5' ,2,4,1,'Matin','E203');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (37,4,'2006-04-25' ,1,4,2,'Matin','E203');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (37,4,'2006-04-26' ,2,4,2,'Matin','E203');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (37,4,'2006-05-10' ,1,4,3,'Matin','E203');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (37,4,'2006-05-11' ,2,4,3,'AM','E203');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (37,4,'2006-05-17' ,3,4,1,'Matin','E203');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (37,4,'2006-05-24' ,3,4,2,'Matin','E203');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (37,4,'2006-05-31' ,3,4,3,'Matin','E203');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (39,5,'2006-04-7' ,1,4,1,'Matin','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (39,5,'2006-04-7' ,2,4,1,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (39,5,'2006-04-28' ,1,4,2,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (39,5,'2006-04-28' ,2,4,2,'Matin','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (40,5,'2006-05-2' ,1,4,1,'Matin','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (40,5,'2006-05-2' ,2,4,1,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (40,5,'2006-05-12' ,1,4,2,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (40,5,'2006-05-12' ,2,4,2,'Matin','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (40,5,'2006-05-19' ,1,4,3,'Matin','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (40,5,'2006-05-19' ,2,4,3,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (40,5,'2006-05-24' ,2,4,4,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (40,5,'2006-05-26' ,1,4,4,'Matin','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (41,3,'2006-03-7' ,1,4,1,'AM','G124');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (41,3,'2006-03-14' ,2,4,1,'AM','G124');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (42,2,'2006-01-6' ,1,4,1,'AM','E410');
INSERT INTO planifier (id_formation, id_formateur, dateform, groupe, duree, numseance, mat_am, numsalle) VALUES (42,2,'2006-01-7' ,2,4,1,'Matin','G124');
--
-- Contenu de la table `inscrire`
--
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'12170', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'12337', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'13073', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'13516', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'13677', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'13972', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'14186', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'14487', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'14780', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'14899', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'14918', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'15118', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'15763', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'18575', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'19362', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'21435', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'23248', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'29239', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'3803', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'38424', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'41206', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'4453', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (23,'44961', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'12337', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'13073', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'13677', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'14186', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'14487', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'14780', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'14899', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'14918', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'15118', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'15763', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'18575', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'19362', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'23248', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'29239', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'29428', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'3803', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'41206', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'4453', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (24,'44961', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'12170', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'12337', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'13073', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'13150', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'13516', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'13677', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'14186', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'14487', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'14780', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'14899', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'14918', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'15300', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'15763', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'18575', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'19362', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'21435', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'23248', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'27053', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'29239', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'3803', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'38424', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'41181', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'41206', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'4453', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'44608', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'44961', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'6564', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (25,'6725', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'10600', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'12456', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'13073', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'13150', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'13516', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'13677', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'14186', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'14487', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'14899', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'14918', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'15118', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'19362', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'21435', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'23248', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'27053', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'29239', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'29428', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'3803', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'38424', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'41078', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'41181', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'41206', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'4453', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'44961', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'6564', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (26,'6725', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'12456', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'13972', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'14187', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'14879', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'18575', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'21699', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'24954', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'25537', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'26991', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'27057', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'27210', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'28895', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'29239', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'3449', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'3472', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'35948', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'37694', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'41078', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'41082', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'41181', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'45204', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'47828', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'4830', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (27,'6761', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'14001', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'14187', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'14879', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'15300', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'20467', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'21435', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'25163', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'25264', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'26991', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'27057', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'29239', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'3472', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'35948', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'41078', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'41082', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'41181', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'45204', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'4851', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'54941', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (28,'6761', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'12456', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'14879', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'15253', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'24457', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'24954', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'25264', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'25537', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'26991', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'27053', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'27210', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'29239', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'34633', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'37694', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'45204', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'47828', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'4851', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'6201', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (30,'6761', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'10600', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'14001', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'15419', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'19064', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'19268', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'20467', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'21699', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'25163', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'25537', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'27053', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'27057', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'27210', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'27615', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'28053', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'28895', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'29239', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'29428', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'3449', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'34633', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'35948', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'3933', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'41078', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'41082', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'41181', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'45204', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'4826', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'4830', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'54941', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'5701', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'6201', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (31,'6777', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'14001', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'14879', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'15253', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'15419', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'19064', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'19268', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'20467', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'25163', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'27053', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'27210', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'27615', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'28053', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'28895', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'29239', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'34633', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'35948', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'3933', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'41078', 0);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'41082', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'41181', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'45204', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'45452', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'4826', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'4830', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'54941', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'5701', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'5930', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'6201', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (32,'6777', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (33,'27615', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (33,'45204', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (33,'5607', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'14879', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'18142', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'23400', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'23975', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'24210', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'24457', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'24954', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'25163', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'25378', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'26330', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'27110', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'27615', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'32884', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'34633', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'3933', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'41181', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'4414', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'45026', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'45452', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'47728', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'48010', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'4802', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'4997', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'5256', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'6201', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'6246', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'6761', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'6777', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (34,'x00015', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'34633', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'35648', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'3933', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'41181', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'42049', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'44608', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'45026', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'48010', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'49161', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'5256', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'5920', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'6201', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'6302', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'x00015', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (35,'X00016', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'23975', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'24210', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'24954', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'27110', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'32884', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'34633', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'37694', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'41181', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'4159', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'4414', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'45026', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'47728', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'48010', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'4802', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'49161', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'4997', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'5701', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'5902', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'5920', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'6201', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'6246', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'6302', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'6777', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'x00015', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (37,'X00016', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'14879', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'23975', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'24210', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'24954', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'25163', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'25378', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'27110', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'27615', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'29060', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'29643', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'32884', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'34633', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'37694', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'41078', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'41181', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'4414', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'47728', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'4802', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'49161', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'4997', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'5256', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'5607', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'5701', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'5902', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'6302', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'6777', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'x00015', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (39,'X00016', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'14879', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'23400', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'23975', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'24210', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'25163', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'25378', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'29060', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'29557', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'32884', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'34633', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'41181', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'42049', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'45452', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'47722', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'4996', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'4997', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'5321', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'5607', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'5902', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'6246', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'6302', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'6777', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'x00015', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (40,'X00016', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'14879', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'23975', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'25163', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'25378', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'27110', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'29060', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'32884', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'34633', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'41181', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'42049', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'4414', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'47728', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'4802', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'4996', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'4997', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'5256', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'5607', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'5701', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'5902', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'5920', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'6302', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'6777', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'x00015', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (41,'X00016', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'12170', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'12337', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'13073', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'13150', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'13516', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'13677', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'14186', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'14487', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'14780', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'14899', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'14918', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'15118', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'15763', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'18575', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'19362', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'23248', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'29239', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'38424', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'41206', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'4453', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'44961', 1);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'6564', 2);
INSERT INTO inscrire (id_formation, id_stagiaire, groupe) VALUES (42,'6725', 2);

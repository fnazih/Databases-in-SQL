-- 1) Correction d’erreurs d’insertion :
--1.a)
INSERT INTO formateur VALUES(default, 'Jacques', 'Mesrine');
--(l’dentifiant 1 ayant déjà été pris, on utilise le premier disponible a la suite grace a la commande default qui a été initialisee avec l’auto-incrementation).

--1.b)
INSERT INTO inscrire VALUES(21, 'X00005', 1);
--(Il suffit simplement de mettre un numero de formation existant dans la table « formation »).

--1.c)
INSERT INTO inscrire VALUES(42, 10198, 1);
--(il suffit simplement de mettre un identifiant de stagiaire déjà present dans la table « stagiaire »).

--1.d)
INSERT INTO planifier VALUES(42, 6, '2019-01-23', 1, 2, 1, 'Matin', 'E410');
--(la valeur NULL est interdite dans la colonne « groupe », il suffit de mettre une valeur de groupe correcte).

-- 2) Modification de la date d’une formation :
UPDATE planifier
SET dateform = dateform + 9
WHERE id_formation = 37;

-- 3) Suppression de la formation « Bases de donnees (ACCESS) » :
DELETE FROM inscrire
WHERE id_formation = 35;
DELETE FROM planifier
WHERE id_formation = 35;
DELETE FROM formation
WHERE id_formation = 35;

-- 4) Conversion en minuscules :
UPDATE formateur
SET nom_formateur = LOWER(nom_formateur),
prenom_formateur = LOWER(prenom_formateur);

-- 5) Conversion en majuscules :
UPDATE formateur
SET nom_formateur = INITCAP(nom_formateur),
prenom_formateur = INITCAP(prenom_formateur);

-- 6) Modification de salle :
UPDATE planifier
SET numsalle = 'G333'
WHERE dateform BETWEEN '09-04-2006' AND '08-05-2006';

-- 7) Modification de la date de formation :
UPDATE planifier
SET dateform = dateform + 3
WHERE dateform = date '01-01-2006' + INTERVAL '138 DAY';

-- 8) Depart d’un formateur, qui sera remplace par un nouveau :
--8.A)
SELECT p.id_formation, p.id_formateur, TO_CHAR(p.dateform, 'dd/mm/YY') AS "Date formation", p.groupe, p.duree, p.numseance, p.mat_am, p.numsalle, f.nom_formateur, f.prenom_formateur, f1.intitule_formation
FROM planifier p INNER JOIN formateur f ON p.id_formateur = f.id_formateur
INNER JOIN formation f1 ON p.id_formation = f1.id_formation;

--8.B.a)
INSERT INTO formateur VALUES(default, 'Durant', 'Pierre') ;

--8.B.b) 
UPDATE planifier
SET id_formateur = (SELECT id_formateur FROM formateur WHERE nom_formateur LIKE 'Durant' AND prenom_formateur LIKE 'Pierre')
WHERE id_formateur = (SELECT id_formateur FROM formateur WHERE nom_formateur LIKE 'Cancel' AND prenom_formateur LIKE 'Christophe');

--8.C)
SELECT *
FROM planifier ;

-- 9) Ajout d’une formation et inscription :
--9.A)
INSERT INTO formation VALUES(default, 'JavaScript', 12, 'Confirme');

--9.B)
INSERT INTO inscrire(id_formation, id_stagiaire, groupe)
SELECT (SELECT id_formation FROM formation WHERE intitule_formation = 'JavaScript'), id_stagiaire, groupe
FROM inscrire
WHERE id_formation = 26;

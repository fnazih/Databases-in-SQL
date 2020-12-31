-- Part 1 :

--1.1)
SELECT *
FROM client;

--1.2)
SELECT *
FROM client
WHERE categorie = 'PRIVILEGIE';

--1.3)
SELECT nom, prenom
FROM client
WHERE ville = 'MARSEILLE';

--1.4)
SELECT nom
FROM client
WHERE prenom LIKE '%R%' AND ville = 'MARSEILLE';

--1.5)
SELECT reservation.numcl, reservation.idv
FROM reservation
WHERE dateres BETWEEN '01/03/2003' AND '31/01/2004';

--1.6)
SELECT voyage.idv, voyage.duree
FROM voyage
WHERE paysarr = 'MAROC' OR hotel = 'ANTIQUE';

--1.7)
SELECT DISTINCT villearr
FROM voyage
WHERE paysarr = 'MAROC';

--1.8)
SELECT optionv.code, optionv.libelle
FROM optionv
WHERE libelle LIKE '%VISITE%';

--1.9)
SELECT datedep
FROM planning
WHERE idv = '927' AND datedep BETWEEN '01/06/2004' AND '30/07/2004'
ORDER BY datedep ASC;

--1.10)
SELECT client.numcl, client.nom, client.prenom
FROM client
WHERE ville != 'PARIS' AND ville != 'MARSEILLE';

--ou alors

SELECT client.numcl, client.nom, client.prenom
FROM client
WHERE ville NOT LIKE 'PARIS' AND ville NOT LIKE 'MARSEILLE';

--1.11)
SELECT client.numcl, client.nom
FROM client
WHERE adresse IS NULL;


-- Part 2

--2.1)
SELECT DISTINCT v.idv, v.villearr, v.paysarr
FROM planning p INNER JOIN voyage v ON p.idv = v.idv
WHERE p.tarif = (SELECT MIN(tarif) FROM planning);

--2.2)
SELECT DISTINCT v.paysarr, v.villearr
FROM planning p INNER JOIN voyage v ON p.idv = v.idv
WHERE p.tarif = (SELECT MAX(tarif) FROM planning);

--2.3)
SELECT DISTINCT v.villedep
FROM voyage v
WHERE v.villedep IN (SELECT DISTINCT c.ville from client c);

--2.4)
SELECT DISTINCT libelle
FROM optionv o JOIN carac ON o.code = carac.code
JOIN voyage v ON carac.idv = v.idv
WHERE libelle IN (SELECT libelle FROM optionv JOIN carat ON option.code = carac.code WHERE carac.idv = 952);

--2.5)
SELECT voyage.idv, villearr, paysarr
FROM voyage
EXCEPT
SELECT DISTINCT voyage.idv, villearr, paysarr
FROM voyage INNER JOIN reservation ON voyage.idv = reservation.idv;

--2.6)
SELECT libelle
FROM optionv INNER JOIN carac ON optionv.code = carac.code
WHERE carac.idv = '354' AND prix IS NULL
UNION
SELECT libelle
FROM optionv INNER JOIN carac ON optionv.code = carac.code
WHERE carac.idv = '952' AND prix IS NOT NULL;

--2.7) 
SELECT DISTINCT voyage.idv, villearr, paysarr
FROM voyage INNER JOIN carac ON voyage.idv = carac.idv
INNER JOIN optionv ON carac.code = optionv.code
WHERE libelle LIKE 'VISITE GUIDEE'
INTERSECT
SELECT DISTINCT voyage.idv, villearr, paysarr
FROM voyage INNER JOIN carac ON voyage.idv = carac.idv
INNER JOIN optionv ON carac.code = optionv.code
WHERE libelle LIKE 'PISCINE';

--2.8)
SELECT nom, prenom
FROM client
EXCEPT
SELECT nom, prenom
FROM client INNER JOIN reservation ON client.numcl = reservation.numcl
ORDER BY nom;

--2.9)
SELECT DISTINCT villearr, paysarr
FROM voyage v
WHERE villedep NOT LIKE 'MARSEILLE'
EXCEPT
SELECT DISTINCT villearr, paysarr
FROM voyage v
WHERE villedep LIKE 'MARSEILLE';

--2.10)
SELECT DISTINCT o.code, libelle
FROM optionv o INNER JOIN carac c ON o.code = c.code
INNER JOIN voyage v ON c.idv = v.idv
EXCEPT
SELECT DISTINCT o.code, libelle
FROM optionv o INNER JOIN carac c ON o.code = c.code
INNER JOIN voyage v ON c.idv = v.idv
WHERE paysarr LIKE 'CHYPRE';

--2.11)
SELECT DISTINCT hotel, villearr, paysarr
FROM voyage v
WHERE nbetoiles >= ALL(SELECT nbetoiles FROM voyage);

--2.12)
SELECT DISTINCT paysarr
FROM voyage
WHERE nbetoiles <= ALL(SELECT nbetoiles FROM voyage);


-- Part 3

--3.1)
SELECT paysarr, COUNT(idv) AS "Nombre de voyages"
FROM voyage
GROUP BY paysarr;

--3.2)
SELECT paysarr, villearr, COUNT(idv) AS "Nombre de voyages"
FROM voyage
GROUP BY villearr, paysarr
ORDER BY paysarr;

--3.3)
SELECT paysarr, COUNT(DISTINCT villearr) AS "Nombre de villes"
FROM voyage
GROUP BY paysarr;

--3.4)
SELECT DISTINCT v.idv, villearr, COUNT(DISTINCT datedep)
FROM voyage v INNER JOIN planning p ON v.idv = p.idv
GROUP BY v.idv, villearr;

--3.5)
SELECT v.idv, villearr, COUNT(DISTINCT code) AS "Nombre d options gratuites"
FROM voyage v INNER JOIN carac c ON v.idv = c.idv
WHERE prix IS NULL
GROUP BY v.idv, villearr;

--3.6)
SELECT COUNT(DISTINCT numcl) AS "Nombre de clients",
CASE WHEN categorie IS NULL
THEN 'SANS'
ELSE CASE WHEN categorie LIKE 'BON'
THEN 'BON'
ELSE 'PRIVILEGIE'
END
END AS "CATEGORIE"
FROM client
GROUP BY categorie;

--3.7)
SELECT DISTINCT v.idv, villearr, COUNT(r.idv) AS "Nombre de reservations", SUM(r.nbpers) AS "Nombre de personnes"
FROM voyage v INNER JOIN reservation r ON v.idv = r.idv
GROUP BY v.idv, villearr;

--3.8)
SELECT voyage.idv, AVG(COAELESCE(prix, 0) AS "Moyenne prix des options"
FROM voyage INNER JOIN carac ON voyage.idv = carac.idv
GROUP BY voyage.idv;

--3.9)
SELECT ville, COUNT(DISTINCT numcl)
FROM client
GROUP BY ville
HAVING COUNT(DISTINCT numcl) > 5;

--3.10)
SELECT DISTINCT v.idv, paysarr, SUM(tarif) AS "Montant total"
FROM voyage v INNER JOIN planning p ON v.idv = p.idv
INNER JOIN reservation r ON v.idv = r.idv
GROUP BY v.idv;

--3.11)
SELECT DISTINCT nom, prenom, r.idv, r.datedep, SUM(tarif) AS "Montant regle"
FROM client c INNER JOIN reservation r ON c.numcl = r.numcl
INNER JOIN planning p ON r.idv = p.idv
GROUP BY nom, prenom, r.idv, r.datedep
ORDER BY 1, 2;

--3.12)
SELECT paysarr
FROM voyage v INNER JOIN reservation r ON v.idv = r.idv
GROUP BY paysarr
HAVING COUNT(DISTINCT numcl) > (SELECT COUNT(DISTINCT numcl) FROM reservation r1 INNER JOIN voyage v1 ON r1.idv = v1.idv WHERE paysarr LIKE 'ESPAGNE');

--3.13)
SELECT categorie
FROM client
GROUP BY categorie
HAVING COUNT(numcl) < ANY(SELECT COUNT(categorie) FROM client GROUP BY categorie);

--3.14)
SELECT DISTINCT paysarr
FROM voyage v INNER JOIN reservation r ON v.idv = r.idv
GROUP BY paysarr
HAVING COUNT(numcl) >= ALL(SELECT DISTINCT paysarr FROM voyage v1 INNER JOIN reservation r1 ON v1.idv = r1.idv GROUP BY paysarr);

--3.15)
SELECT paysarr, COUNT(hotel)
FROM voyage
GROUP BY paysarr, nbetoiles
HAVING nbetoiles = 5;

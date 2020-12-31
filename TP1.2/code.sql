--1)
SELECT p.nompilote, p.prenompilote, ci.nomcircuit
FROM pilote p INNER JOIN courir co ON p.idpilote = co.idpilote
INNER JOIN circuit ci ON ci.id_circuit = co.idgp
WHERE co.positionarrivee = 'A'
ORDER BY 1, 3;

--2)
SELECT points AS "Si plus de la moitie des tours", points/2::real AS "Si plus de 2 tours mais moins de la moitie des tours"
FROM bareme;

--3)
SELECT nomgp, nbtour, nbtourseffectue, nbtourseffectue/nbtour::real AS "Rapport de tours realises"
FROM grandprix
ORDER BY 1;

--4)
SELECT nomgp, longpiste*nbtour AS "Distance effectuee"
FROM grandprix g INNER JOIN circuit c ON g.id_circuit = c.id_circuit
ORDER BY 2;	

--5)
SELECT nomgp AS "Nom du Grand Prix", nompilote AS "Nom", prenompilote AS "Prenom", points AS "Nombre de points acquis", positionarrivee AS "Position a l arrivee", nbtourseffectue/nbtour::real AS "Rapport de tours realises"
FROM pilote p INNER JOIN courir co ON p.idpilote = co.idpilote
INNER JOIN grandprix g ON g.idgp = co.idgp
LEFT OUTER JOIN bareme b ON b.place::varchar = co.positionarrivee
GROUP BY nomgp, nompilote, prenompilote, points, positionarrivee, nbtourseffectue/nbtour::real
HAVING positionarrivee NOT LIKE '0' AND positionarrivee NOT LIKE 'A'
ORDER BY 1, 5;

--6)
SELECT nomgp, nomecurie, SUM(points) AS "Nombre de points acquis par l ecurie"
FROM grandprix g INNER JOIN courir co ON g.idgp = co.idgp
LEFT OUTER JOIN bareme b ON b.place::varchar = co.positionarrivee
INNER JOIN voiture v ON co.numvoiture = v.numvoiture
INNER JOIN ecurie e ON v.id_ecurie = e.id_ecurie
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

--7)
SELECT DISTINCT p.idpilote, nompilote, prenompilote, SUM(points) AS « Nombre total de points acquis »
FROM pilote p INNER JOIN courir co ON p.idpilote = co.idpilote
INNER JOIN bareme b ON b.place::varchar = co.positionarrivee
GROUP BY p.idpilote, nompilote, prenompilote
ORDER BY 4 DESC;

--8)
SELECT nomecurie, SUM(points) AS "Nombre total de points acquis par l ecurie"
FROM grandprix g INNER JOIN courir co ON g.idgp = co.idgp
LEFT OUTER JOIN bareme b ON b.place::varchar = co.positionarrivee
INNER JOIN voiture v ON co.numvoiture = v.numvoiture
INNER JOIN ecurie e ON v.id_ecurie = e.id_ecurie
GROUP BY 1
ORDER BY 2 DESC;

--9)
-- First method
SELECT DISTINCT nompilote, prenompilote
FROM pilote
EXCEPT
SELECT DISTINCT nompilote, prenompilote
FROM pilote p INNER JOIN courir co ON p.idpilote = co.idpilote
WHERE positiongrille > 0
ORDER BY 1;

--Second method
SELECT DISTINCT nompilote, prenompilote
FROM pilote p INNER JOIN courir co ON p.idpilote = co.idpilote
GROUP BY p.idpilote, positiongrille
HAVING positiongrille = 0
ORDER BY 1;

--Third method
SELECT DISTINCT nompilote, prenompilote
FROM pilote
WHERE idpilote NOT IN (SELECT idpilote FROM courir WHERE positiongrille != 0)
ORDER BY 1;

--10)
SELECT nompilote, prenompilote
FROM pilote INNER JOIN courir ON pilote.idpilote = courir.idpilote
GROUP BY 1, 2
HAVING COUNT(positionarrivee) = 2
ORDER BY 1;

--11)
SELECT SUM(longpiste*nbtourseffectue) AS "longueur totale de la saison (km)"
FROM circuit INNER JOIN grandprix ON circuit.id_circuit = grandprix.id_circuit;

--12)
SELECT nompilote, prenompilote, SUM(longpiste*nbtour) AS "longueur totale de la saison (km)"
FROM circuit INNER JOIN grandprix ON circuit.id_circuit = grandprix.id_circuit
INNER JOIN courir ON courir.idgp = grandprix.idgp
RIGHT OUTER JOIN pilote ON courir.idpilote = pilote.idpilote
GROUP BY 1, 2
ORDER BY 1, 3;

--13)
--First method
SELECT nompilote, prenompilote
FROM pilote INNER JOIN courir ON pilote.idpilote = courir.idpilote
GROUP BY 1, 2
HAVING COUNT(positionarrivee) = (SELECT COUNT(idgp) FROM grandprix)
ORDER BY 1;

--Second method
SELECT nompilote, prenompilote
FROM pilote
GROUP BY 1, 2, idpilote
HAVING (SELECT COUNT(grandprix.idgp) FROM grandprix INNER JOIN courir ON grandprix.idgp = courir.idgp WHERE courir.idpilote = pilote.idpilote) = (SELECT COUNT(DISTINCT idgp) FROM grandprix)
ORDER BY 1;

--14)
SELECT DISTINCT nompilote, prenompilote, SUM(longpiste*nbtour) AS "Total parcouru (en km)", SUM(points) AS "Total de points", COUNT(positionarrivee NOT LIKE 'A' AND positionarrivee NOT LIKE '0') AS "Nombre de GP effectues sans avoir abandonne", COUNT(positionarrivee = 'A' OR positionarrivee = '0') AS "Nombre d abandons/disqualifications"
FROM pilote p INNER JOIN courir co ON p.idpilote = co.idpilote
INNER JOIN grandprix gp ON gp.idgp = co.idgp
INNER JOIN circuit ci ON ci.id_circuit = gp.id_circuit
INNER JOIN bareme b ON b.place::varchar = co.positionarrivee
GROUP BY p.idpilote
ORDER BY 4 DESC;

--15)
SELECT nomsponsor
FROM soutenir
WHERE idpilote = (SELECT idpilote FROM pilote WHERE nompilote = 'Alonso')
INTERSECT
SELECT nomsponsor
FROM soutenir
WHERE idpilote = (SELECT idpilote FROM pilote WHERE nompilote = 'di Resta');

--16)
SELECT DISTINCT sponsoriser.nomsponsor
FROM sponsoriser INNER JOIN soutenir ON sponsoriser.nomsponsor = soutenir.nomsponsor
WHERE (soutenir.idpilote, sponsoriser.id_ecurie) IN (SELECT courir.idpilote, voiture.id_ecurie FROM courir INNER JOIN voiture ON courir.numvoiture = voiture.numvoiture ORDER BY idpilote);

--17)
SELECT nomecurie, COUNT(nomsponsor)
FROM ecurie INNER JOIN sponsoriser ON ecurie.id_ecurie = sponsoriser.id_ecurie
GROUP BY 1
ORDER BY 1;

--18)
SELECT nomecurie,COUNT(nomsponsor)/(SELECT COUNT(DISTINCT nomsponsor) from sponsor)::real
FROM ecurie JOIN sponsoriser ON ecurie.id_ecurie = sponsoriser.id_ecurie
GROUP BY 1;

--19)
SELECT DISTINCT COUNT(DISTINCT positiongrille = 1) AS "Nombre maximal de poles position"
FROM courir
GROUP BY idpilote
HAVING COUNT(DISTINCT positiongrille = 1) >= ALL(SELECT COUNT(DISTINCT positiongrille = 1) FROM courir GROUP BY idpilote);

--20)
SELECT DISTINCT nompilote, prenompilote, COUNT(DISTINCT positiongrille = 1) AS "Nombre maximal de poles position"
FROM courir INNER JOIN pilote ON courir.idpilote = pilote.idpilote
GROUP BY pilote.idpilote
HAVING COUNT(DISTINCT positiongrille = 1) >= ALL(SELECT DISTINCT COUNT(DISTINCT positiongrille = 1) FROM courir GROUP BY idpilote)
ORDER BY 1;


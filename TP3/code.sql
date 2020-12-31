--Question 1.1)
SELECT idt, libelle
FROM theme
WHERE idt NOT IN (SELECT idtpere FROM theme WHERE idtpere IS NOT NULL)
ORDER BY 1;

--Question 1.2)
WITH RECURSIVE fam(idt, libelle, idtpere) AS(
SELECT idt, libelle, idtpere
FROM theme
WHERE libelle LIKE 'JOINTURE EXTERNE'
UNION ALL
SELECT theme.idt, theme.libelle, theme.idtpere
FROM fam JOIN theme ON fam.idtpere = theme.idt
) SELECT * FROM fam;

--Question 1.3)
SELECT idt, libelle
FROM theme
WHERE idtpere IS NULL;

--Question 1.4)
Toute la hierarchie descendante :
WITH RECURSIVE fam(idt, libelle, idtpere) AS(
SELECT idt, libelle, idtpere
FROM theme
WHERE libelle LIKE 'LANGAGE DE REQUETES'
UNION ALL
SELECT fam.idt, fam.libelle, fam.idtpere
FROM fam JOIN theme ON theme.idt = fam.idtpere	 A CORRIGER
) SELECT * FROM fam;
Seulement les fils directs :
SELECT idt, libelle
FROM theme
WHERE idtpere = 4
ORDER BY 1;

--Question 1.5)
WITH RECURSIVE ordre(idt, libelle, idtpere) AS
(
SELECT idt, libelle, idtpere
FROM theme
WHERE libelle = 'JOINTURE'
UNION ALL
SELECT t.idt, t.libelle, t.idtpere
FROM ordre o JOIN theme t ON o.idt = t.idtpere
WHERE t.libelle NOT LIKE 'JOINTURE IMBRIQUEE'
)
SELECT* FROM ordre
ORDER BY 1;

--Question 1.6)
WITH RECURSIVE ordre(idt, libelle, idtpere) AS
(
SELECT idt, libelle, idtpere
FROM theme
WHERE libelle = 'JOINTURE'
UNION ALL
SELECT t.idt, t.libelle, t.idtpere
FROM ordre o JOIN theme t ON o.idt = t.idtpere
)
SELECT* FROM ordre
EXCEPT
SELECT idt, libelle, idtpere
FROM ordre
WHERE libelle = 'JOINTURE IMBRIQUEE'
ORDER BY 1;

--Question 1.7)
SELECT q.idq, q.numtp
FROM question q INNER JOIN themquest tq ON q.idq = tq.idq
INNER JOIN theme t ON t.idt = tq.idt
GROUP BY 1, 2, t.idt
HAVING (t.idt, t.libelle, t.idtpere) IN (WITH RECURSIVE ordre(idt, libelle, idtpere) AS
(
SELECT idt, libelle, idtpere
FROM theme
WHERE libelle = 'JOINTURE'
UNION ALL
SELECT t.idt, t.libelle, t.idtpere
FROM ordre o JOIN theme t ON o.idt = t.idtpere
)
SELECT* FROM ordre
EXCEPT
SELECT idt, libelle, idtpere
FROM ordre
WHERE libelle = 'JOINTURE IMBRIQUEE'
)
ORDER BY 1, 2;

--Question 1.8)
(WITH RECURSIVE parent(idt, libelle, idtpere) AS
(
SELECT idt, libelle, idtpere
FROM theme
WHERE libelle = 'JOINTURE'
UNION ALL
SELECT t.idt, t.libelle, t.idtpere
FROM parent p JOIN theme t ON t.idt = p.idtpere
WHERE p.idtpere IS NOT NULL
) SELECT * FROM parent
)

UNION

(
WITH RECURSIVE parent2(idt, libelle, idtpere) AS
(
SELECT idt, libelle, idtpere
FROM theme
WHERE libelle = 'SELECTION SIMPLE'
UNION ALL
SELECT t.idt, t.libelle, t.idtpere
FROM parent2 p2 JOIN theme t ON t.idt = p2.idtpere
WHERE p2.idtpere IS NOT NULL
) SELECT * FROM parent2
)

--Question 1.9)
(WITH RECURSIVE parent(idt, libelle, idtpere) AS
(
SELECT idt, libelle, idtpere
FROM theme
WHERE libelle = 'JOINTURE'
UNION ALL
SELECT t.idt, t.libelle, t.idtpere
FROM parent p JOIN theme t ON t.idt = p.idtpere
WHERE p.idtpere IS NOT NULL
) SELECT * FROM parent
)
INTERSECT
(
WITH RECURSIVE parent2(idt, libelle, idtpere) AS
(
SELECT idt, libelle, idtpere
FROM theme
WHERE libelle = 'SELECTION SIMPLE'
UNION ALL
SELECT t.idt, t.libelle, t.idtpere
FROM parent2 p2 JOIN theme t ON t.idt = p2.idtpere
WHERE p2.idtpere IS NOT NULL
) SELECT * FROM parent2)

--Question 1.10)
SELECT DISTINCT nom, prenom
FROM etudiant INNER JOIN evaluation ON etudiant.numet = evaluation.numet
INNER JOIN question ON evaluation.idq = question.idq
GROUP BY 1, 2, numtp
HAVING COUNT(resultat = 'JUSTE') = (SELECT COUNT(DISTINCT idq) FROM question WHERE numtp = 1) AND numtp = 1;

Question 1.11)
SELECT S.groupe AS "Groupe", S.etu_s, STI.etu_sti
FROM (SELECT groupe, COUNT(typebac) AS "etu_s" FROM etudiant GROUP BY groupe, typebac HAVING typebac = 'S')S LEFT OUTER JOIN (SELECT groupe, COUNT(typebac) AS "etu_sti" FROM etudiant GROUP BY groupe, typebac HAVING typebac = 'STI')STI ON S.groupe = STI.groupe
GROUP BY 1, 2, 3
ORDER BY 1;

--Question 1.12)
SELECT groupe AS "Groupe"
FROM etudiant
GROUP BY groupe
HAVING COUNT(DISTINCT typebac) = (SELECT COUNT(DISTINCT typebac) FROM etudiant);

--Question 1.13)
SELECT groupe AS "Groupe"
FROM etudiant et INNER JOIN evaluation ev ON et.numet = ev.numet
INNER JOIN question q ON ev.idq = q.idq
GROUP BY 1, et.numet
HAVING et.numet IN (SELECT e1.numet FROM etudiant e1 INNER JOIN evaluation e2 ON e1.numet = e2.numet INNER JOIN question q1 ON e2.idq = q1.idq GROUP BY e1.numet HAVING COUNT(DISTINCT numtp) = (SELECT COUNT(DISTINCT numtp) FROM question));

--Question 1.14)
WITH RECURSIVE absent(idt, libelle, idtpere) AS
(
SELECT theme.idt, theme.libelle, theme.idtpere
FROM theme
WHERE libelle = 'SQL LMD'
UNION ALL
SELECT a.idt, a.libelle, a.idtpere
FROM absent a INNER JOIN theme th ON a.idt = th.idtpere
GROUP BY a.idt, a.libelle, a.idtpere, th.idt
HAVING th.idt IN (SELECT theme.idt FROM theme LEFT OUTER JOIN themquest ON theme.idt = themquest.idt WHERE idq IS NULL)
) SELECT * FROM absent;

--Question 1.15)
SELECT et.nom, et.prenom, T1.count AS "TP1", T2.count AS "TP2"
FROM etudiant et RIGHT OUTER JOIN (SELECT nom, prenom, COUNT(resultat = 'JUSTE') AS "count" FROM etudiant INNER JOIN evaluation ON etudiant.numet = evaluation.numet INNER JOIN question ON evaluation.idq = question.idq GROUP BY 1, 2, numtp HAVING numtp = 1)T1 ON T1.numet = et.numet RIGHT OUTER JOIN (SELECT nom, prenom, COUNT(resultat = 'JUSTE') AS "count" FROM etudiant INNER JOIN evaluation ON etudiant.numet = evaluation.numet INNER JOIN question ON evaluation.idq = question.idq GROUP BY 1, 2, numtp HAVING numtp = 2)T2;


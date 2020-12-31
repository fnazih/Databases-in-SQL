--Question 1 : Recherche nom département :
CREATE OR REPLACE FUNCTION departement(numemp integer) RETURNS varchar AS $$
DECLARE nomdept varchar(60);
BEGIN
SELECT d.nom INTO nomdept
FROM departement d INNER JOIN employes e ON d.nodept = e.nodept
WHERE noemp = numemp;
RETURN nomdept;
END;$$
LANGUAGE plpgsql;

--Appel de la fonction : SELECT departement(1) ;

--Question 2 : Retourner les collègues :
CREATE OR REPLACE FUNCTION collegue(numemp integer) RETURNS setof record AS $$
DECLARE
associes RECORD;
BEGIN
FOR associes IN SELECT nom, prenom
FROM employes
WHERE nodept = (SELECT nodept FROM employes WHERE noemp = numemp)
EXCEPT
SELECT nom, prenom
FROM employes WHERE noemp = numemp
LOOP
RETURN NEXT associes;
END LOOP;
RETURN;
END;$$
LANGUAGE plpgsql;

--Appel de la fonction : SELECT * FROM collegue(2) AS (n varchar, p varchar);

--Question 3 : Nom et prénom des supérieurs :
CREATE OR REPLACE FUNCTION superieurs(numemp integer) RETURNS setof record AS $$
DECLARE
sup RECORD;
num integer;
BEGIN
SELECT nosupr INTO num
FROM employes
WHERE noemp = numemp;
WHILE NOT (num IS NULL)
LOOP
SELECT nom, prenom INTO sup FROM employes WHERE noemp = num;
num := (SELECT nosupr FROM employes WHERE noemp = num);
RETURN NEXT sup;
END LOOP;
RETURN;
END;$$
LANGUAGE plpgsql;

--Appel de la fonction : SELECT * FROM superieurs(10) AS (n varchar, p varchar);

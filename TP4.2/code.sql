--Question 1 :
--Fonction de trigger :
CREATE OR REPLACE FUNCTION trigger1() RETURNS trigger AS $$
BEGIN
PERFORM no_pdt FROM produit WHERE no_pdt = NEW.no_pdt;

IF FOUND THEN
PERFORM no_pdt, no_cde FROM ligne_cde WHERE no_pdt = NEW.no_pdt AND no_cde = NEW.no_cde;

ELSIF NOT FOUND THEN
RAISE EXCEPTION 'Produit inexistant';

END IF;

IF FOUND THEN
RAISE EXCEPTION 'Produit deja commande';

ELSIF NOT FOUND THEN
PERFORM stock FROM produit WHERE no_pdt = NEW.no_pdt AND stock >= NEW.qte;

END IF;

IF FOUND THEN
PERFORM no_cde FROM ligne_cde WHERE no_cde = NEW.no_cde;

ELSIF NOT FOUND THEN
RAISE EXCEPTION 'Pas assez de stock';

END IF;

IF FOUND THEN
NEW.num_ligne := (SELECT MAX(num_ligne) FROM ligne_cde WHERE no_cde = NEW.no_cde) + 1;
UPDATE produit
SET stock = stock - NEW.qte
WHERE no_pdt = NEW.no_pdt;
UPDATE commande
SET montant = montant + NEW.qte*(SELECT pu FROM produit WHERE no_pdt = NEW.no_pdt)
WHERE no_cde = NEW.no_cde;
RETURN NEW;

ELSIF NOT FOUND THEN
NEW.num_ligne = 1;
RETURN NEW;

END IF;

RETURN NULL;
END;$$LANGUAGE plpgsql ;

Création du trigger :
CREATE TRIGGER trig1 AFTER INSERT
ON ligne_cde FOR EACH ROW
EXECUTE PROCEDURE trigger1();


--Question 2.1 :
--Fonction du trigger :
CREATE OR REPLACE FUNCTION trigger2() RETURNS trigger AS $$
BEGIN
PERFORM no_pdt FROM produit WHERE no_pdt = NEW.no_pdt;

IF FOUND THEN
PERFORM no_cde, no_pdt FROM ligne_cde WHERE no_cde = NEW.no_cde AND no_pdt = NEW.no_pdt;

ELSIF NOT FOUND THEN
RAISE EXCEPTION 'Erreur dans le code de produit';

END IF;

IF FOUND THEN
PERFORM stock FROM produit WHERE no_pdt = NEW.no_pdt AND stock >= NEW.qte;

ELSIF NOT FOUND THEN
RAISE EXCEPTION 'Produit pas encore commande. (INSERT INTO)';

END IF;

IF FOUND THEN
PERFORM qte FROM ligne_cde WHERE no_cde = NEW.no_cde AND no_pdt = NEW.no_pdt AND qte + NEW.qte > 0;

ELSIF NOT FOUND THEN
RAISE EXCEPTION 'Pas assez de stock';

END IF;

IF FOUND THEN
UPDATE ligne_cde
SET qte = OLD.qte + NEW.qte
WHERE no_cde = NEW.no_cde AND no_pdt = NEW.no_pdt;

ELSIF NOT FOUND THEN
DELETE FROM ligne_cde WHERE no_cde = NEW.no_cde AND no_pdt = NEW.no_pdt;
UPDATE commande
SET montant = montant - OLD.qte*(SELECT pu FROM produit WHERE no_pdt = OLD.no_pdt)
WHERE no_cde = OLD.no_cde;

RETURN NEW;

END IF;

RETURN NULL;
END;$$LANGUAGE plpgsql;

--Création du trigger :
CREATE TRIGGER trig2 AFTER UPDATE
ON ligne_cde FOR EACH ROW
EXECUTE PROCEDURE trigger2();


--Question 2.2 :
--Fonction du trigger :
CREATE OR REPLACE FUNCTION trigger1_bis() RETURNS trigger AS $$
BEGIN
PERFORM no_pdt FROM produit WHERE no_pdt = NEW.no_pdt;

IF FOUND THEN
PERFORM no_pdt, no_cde FROM ligne_cde WHERE no_pdt = NEW.no_pdt AND no_cde = NEW.no_cde;

ELSIF NOT FOUND THEN
RAISE EXCEPTION 'Produit inexistant';

END IF;

IF FOUND THEN
UPDATE ligne_cde
SET qte = OLD.qte + NEW.qte
WHERE no_cde = NEW.no_cde AND no_pdt = NEW.no_pdt;
RETURN NEW;

ELSIF NOT FOUND THEN
PERFORM stock FROM produit WHERE no_pdt = NEW.no_pdt AND stock >= NEW.qte;

END IF;

IF FOUND THEN
PERFORM no_cde FROM ligne_cde WHERE no_cde = NEW.no_cde;

ELSIF NOT FOUND THEN
RAISE EXCEPTION 'Pas assez de stock';

END IF;

IF FOUND THEN
NEW.num_ligne := (SELECT MAX(num_ligne) FROM ligne_cde WHERE no_cde = NEW.no_cde) + 1;
UPDATE produit
SET stock = stock - NEW.qte
WHERE no_pdt = NEW.no_pdt;
UPDATE commande
SET montant = montant + NEW.qte*(SELECT pu FROM produit WHERE no_pdt = NEW.no_pdt)
WHERE no_cde = NEW.no_cde;
RETURN NEW;

ELSIF NOT FOUND THEN
NEW.num_ligne = 1;
RETURN NEW;

END IF;

RETURN NULL;
END;$$LANGUAGE plpgsql;

--Création du trigger :
CREATE TRIGGER trig1bis AFTER INSERT
ON ligne_cde FOR EACH ROW
EXECUTE PROCEDURE trigger1_bis();


--Question 3 :
--Fonction du trigger :
CREATE OR REPLACE FUNCTION suppression() RETURNS trigger AS $$
BEGIN

PERFORM no_cde, no_pdt FROM ligne_cde WHERE no_cde = OLD.no_cde AND no_pdt = OLD.no_pdt;

IF FOUND THEN
DELETE FROM ligne_cde WHERE no_cde = OLD.no_cde AND no_pdt = OLD.no_pdt;

ELSIF NOT FOUND THEN
RAISE EXCEPTION 'La ligne ne peut pas etre supprimee car elle nexiste pas.';

END IF;

UPDATE commande
SET montant = montant - OLD.qte*(SELECT pu FROM produit WHERE no_pdt = OLD.no_pdt) WHERE no_cde = OLD.no_pdt;

UPDATE produit
SET stock = stock + OLD.qte
WHERE no_pdt = OLD.no_pdt;

PERFORM num_ligne FROM ligne_cde WHERE num_ligne > OLD.num_ligne AND no_cde = OLD.no_cde;

IF FOUND THEN
UPDATE ligne_cde
SET num_ligne = num_ligne - 1
WHERE no_cde = OLD.no_cde AND num_ligne > OLD.num_ligne;

END IF;

RETURN NULL;
END;$$LANGUAGE plpgsql;

--Création du trigger :
CREATE TRIGGER sup AFTER DELETE
ON ligne_cde FOR EACH ROW
EXECUTE PROCEDURE suppression();

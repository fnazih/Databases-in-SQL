create schema TP_Produit;
SET search_path=TP_Produit; 

--création de la Table produit
Create Table produit (
	no_pdt integer not null primary key,
	design_pdt varchar(50) ,
 	pu float not null,
 	stock integer default 0
);

--création de la Table commande
Create Table commande(
	no_cde integer not null primary key, 
	date_com date,
	montant float default 0
);

--création de la Table Ligne de commande
Create Table Ligne_Cde (
  num_ligne integer not null,
	no_cde integer not null, 
	qte integer not null,
	no_pdt integer not null, 
	Primary key(num_ligne,no_cde,no_pdt),
	foreign key (no_cde) references commande(no_cde),
	foreign key (no_pdt) references produit(no_pdt)
);

-- une commande
INSERT INTO commande VALUES(100,'2008-11-10',234);

--quelques Produits
--
insert into Produit values(10,'Cerveau',152,10);
insert into Produit values(20,'intelligence',100,10);
insert into Produit values(30,'logique',200,10);
insert into Produit values(40,'bon sens',250,10);
insert into Produit values(50,'humour',120,10);

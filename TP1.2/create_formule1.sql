create schema TP_formule1;
set search_path=TP_formule1;



/*==============================================================*/
/* Table : Circuit*/
/*==============================================================*/
create table Circuit (
id_circuit SERIAL ,
nomcircuit varchar(150)	not null,
paysCircuit varchar(45) 	null,
longPiste decimal(5,2)	null,
nbSpectateur integer 		null,
constraint PK_CIRCUIT primary key (id_circuit)
);



/*==============================================================*/
/* Table : Courir */
/*==============================================================*/
create table Courir (
idGP int not null,
idPilote integer		not null,
numVoiture integer		null,
positionGrille integer 		null,
positionArrivee varchar(2) 	null,
constraint PK_COURIR primary key (idGP, idPilote)
);

/*==============================================================*/
/* Table : Ecurie */
/*==============================================================*/
create table Ecurie (
id_ecurie SERIAL ,
nomecurie varchar(75) 	not null,
idFour integer 		not null,
adrSiege varchar(75) 	null,
villeSiege varchar(45) 	null,
cpSiege decimal(5,0)	null,
directeur varchar(45)	null,
constraint PK_ECURIE primary key (id_ecurie )
);

/*==============================================================*/
/* Table : Fournisseur*/
/*==============================================================*/
create table Fournisseur (
idFour SERIAL		not null,
nomFour varchar(45)	null,
adr varchar(75)	null,
ville varchar(45)	null,
cp decimal(5,0) 	null,
dateAccordFISA DATE 	null,
constraint PK_FOURNISSEUR primary key (idFour)
);

/*==============================================================*/
/* Table : GrandPrix*/
/*==============================================================*/
create table GrandPrix (
idGP SERIAL		not null,
id_circuit int	not null,
nomGP varchar(45) 	not null,
NbTour integer 		null,
DateGP DATE 	null,
NbQualif integer 		null,
nbToursEffectue integer 		null,
constraint PK_GRANDPRIX primary key (idGP)
);

/*==============================================================*/
/* Table : Pilote */
/*==============================================================*/
create table Pilote (
idPilote SERIAL		not null,
prenomPilote varchar(45) 	null,
nomPilote varchar(45)	null,
constraint PK_PILOTE primary key (idPilote)
);

/*==============================================================*/
/* Table : Sponsor*/
/*==============================================================*/
create table Sponsor (
nomSponsor varchar(45)		not null,
secteur varchar(45) 	null,
constraint PK_SPONSOR primary key (nomSponsor)
);

/*==============================================================*/
/* Table : Voiture*/
/*==============================================================*/
create table Voiture (
numVoiture integer 		not null,
id_ecurie integer	not null,
type varchar(75)	null,
constraint PK_VOITURE primary key (numVoiture)
);

/*==============================================================*/
/* Table : soutenir */
/*==============================================================*/
create table soutenir (
nomSponsor varchar(45)	not null,
idPilote integer		not null,
constraint PK_SOUTENIR primary key (nomSponsor, idPilote)
);

/*==============================================================*/
/* Table : sponsoriser*/
/*==============================================================*/
create table sponsoriser (
id_ecurie integer not null,
nomSponsor varchar(45)not null,
constraint PK_SPONSORISER primary key (id_ecurie, nomSponsor)
);

alter table Courir
 add constraint FK_COURIR____GRANDPRI foreign key (idGP)
references GrandPrix (idGP)
on delete restrict on update restrict;

alter table Courir
 add constraint FK_COURIR____PILOTE foreign key (idPilote)
references Pilote (idPilote)
on delete restrict on update restrict;

alter table Courir
 add constraint FK_COURIR___VOITURE foreign key (numVoiture)
references voiture (numVoiture)
on delete restrict on update restrict;


alter table Ecurie
 add constraint FK_ECURIE_ACCORDER_FOURNISS foreign key (idFour)
references Fournisseur (idFour)
on delete restrict on update restrict;

alter table GrandPrix
 add constraint FK_GRANDPRI_DEROULER_CIRCUIT foreign key (id_circuit)
references Circuit (id_circuit)
on delete restrict on update restrict;


alter table Voiture
 add constraint FK_VOITURE_ALIGNER_ECURIE foreign key (id_ecurie)
references Ecurie (id_ecurie)
on delete restrict on update restrict;

alter table soutenir
 add constraint FK_SOUTENIR_SOUTENIR_PILOTE foreign key (idPilote)
references Pilote (idPilote)
on delete restrict on update restrict;

alter table soutenir
 add constraint FK_SOUTENIR_SOUTENIR_SPONSOR foreign key (nomSponsor)
references Sponsor (nomSponsor)
on delete restrict on update restrict;

alter table sponsoriser
 add constraint FK_SPONSORI_SPONSORIS_ECURIE foreign key (id_ecurie)
references Ecurie (id_ecurie)
on delete restrict on update restrict;

alter table sponsoriser
 add constraint FK_SPONSORI_SPONSORIS_SPONSOR foreign key (nomSponsor)
references Sponsor (nomSponsor)
on delete restrict on update restrict;

/* insertion des données */
insert into circuit values(default,'Circuit de l''Albert Park (Melbourne Grand Prix Circuit)','australie',3.7,34000),
(default,'Circuit des Amériques (Circuit of the Americas)','US',5.515,56900),
(default,'Circuit international de Sakhir (Barhain International Circuit)','Bahreïn','5.411','50000'),
(default,'Circuit de Catalogne (Circuit de Catalunya)','Espagne','6.9','34560'),
(default,'Circuit Gilles-Villeneuve','Canada','3.9','23000'),
(default,'Circuit d''Hockenheim (Hockenheimring)','Allemagne','7.5','34000'),
(default,'Hungaroring','Hongrie','4.7','67000'),
(default,'Circuit José Carlos Pace d''Interlagos (Autodromo José Carlos Pace)','Brésil','9.6','56789'),
(default,'Circuit de Monaco','Monaco','5.8','43000'),
(default,'Circuit de Monza (Autodromo Nazionale di Monza)','Italie','6.3','76000'),
(default,'Red Bull Ring','Autriche','4.9','54000'),
(default,'Circuit international de Sepang (Sepang International Circuit)','Malaisie','7.89','120000'),
(default,'Circuit international de Shanghai (Shanghai International Circuit)','Chine','10.3','12000'),
(default,'Circuit de Silverstone (Silverstone Circuit)','Grande-Bretagne','4.9','65000'),
(default,'Circuit urbain de Singapour (Marina Bay Street Circuit)','Singapour','3.9','78000'),
(default,'Circuit de Spa-Francorchamps','Belgique','6.1','35300'),
(default,'Circuit urbain international de Sotchi','Russie','9.4','12300'),
(default,'Circuit de Suzuka (Suzuka Circuit)','Japon','3.3','65800'),
(default,'Circuit Yas Marina (Yas Marina Circuit)','Abou Dabi','2.9','5690');

INSERT INTO fournisseur (idfour,nomfour,adr,ville,cp,dateAccordFISA)
VALUES (1,'Michelin','P.O. Box 461, 2514 Volutpat. St.','Gliwice','63000','22/11/2016');
INSERT INTO fournisseur (idfour,nomfour,adr,ville,cp,dateAccordFISA)
VALUES (2,'Pirelli','4481 Pellentesque Street','Sainte-Ode','25348','18/02/2017');
INSERT INTO fournisseur (idfour,nomfour,adr,ville,cp,dateAccordFISA)
VALUES (3,'Fireston','P.O. Box 815, 2101 Enim Rd.','Birori','55864','15/11/2015');



insert into ecurie values (default,'Mercedes AMG','1','2993 Arcu. St.','Palmerston North','83175','Maddox'),
(default,'Scuderia Ferrari','3','467-198 In Rd.','Walsall','14652','Noble'),
(default,'Williams Martini Racing','2','6450 Et, Rd.','Tire','63896','Castaneda'),
(default,'Red Bull Racing','1','1310 Pellentesque Rd.','Gignod','41087','Ruiz'),
(default,'Sahara Force India F1 Team','3','Ap #197-7116 Metus Street','Sant''Egidio alla Vibrata','55219','Wheeler'),
(default,'Renault Sport Formula 1 Team','2','617 Cursus, Street','Whitchurch','53752','Gonzales'),
(default,'Scuderia Toro Rosso','1','P.O. Box 800, 1255 Lacus, St.','Duffel','82118','Ruiz'),
(default,'Sauber F1 Team','1','9169 Lectus St.','Leighton Buzzard','77992','Delaney'),
(default,'McLaren Honda Formula 1 Team','2','195-3559 Curabitur Av.','Middelkerke','64288','Rich'),
(default,'Manor Racing MRT','1','332-7330 Nibh Rd.','Springdale','68563','Huffman'),
(default,'Haas F1 Team','1','560-4975 At St.','Moe','21246','Pierce');


INSERT INTO grandprix VALUES (default,1,'Grand Prix d''Australie',156,'26/01/2016',20,156),
(default,2,'Grand Prix des Etats-Unis',194,'24/04/2016',18,194),
(default,3,'Grand Prix de Bahreïn',246,'01/04/2016',19,230),
(default,4,'Grand Prix d''Espagne',166,'10/02/2017',22,166),
(default,5,'Grand Prix du Canada',210,'13/12/2016',18,210),
(default,6,'Grand Prix d''Allemagne',178,'01/12/2016',20,178),
(default,7,'Grand Prix de Hongrie',196,'11/09/2016',18,196),
(default,8,'Grand Prix du Brésil',124,'10/01/2017',22,124),
(default,9,'Grand Prix de Monaco',146,'22/08/2017',20,146),
(default,6,'Grand Prix d''Italie',254,'07/12/2016',19,254),
(default,11,'Grand Prix d''Autriche',452,'09/11/2015',21,350),
(default,12,'Grand Prix de Malaisie',128,'06/04/2017',21,128),
(default,13,'Grand Prix de Chine',298,'14/12/2015',19,298),
(default,14,'Grand Prix de Grande-Bretagne',300,'28/06/2017',19,100),
(default,15,'Grand Prix de Singapour',214,'13/11/2016',21,200),
(default,16,'Grand Prix de Belgique',400,'03/10/2016',21,400),
(default,17,'Grand Prix de Russie',326,'11/07/2017',20,326),
(default,18,'Grand Prix du Japon',426,'21/02/2017',22,200),
(default,19,'Grand Prix d''Abou Dabi',264,'21/07/2016',20,264);



insert into pilote values (1,'Lewis','Hamilton'),
(2,'Nico','Rosberg'),
(3,'Sebastian','Vettel'),
(4,'Kimi','Räikkönen'),
(5,'Felipe','Massa'),
(6,'Valtteri','Bottas'),
(7,'Daniel','Ricciardo'),
(8,'Daniil','Kvyat'),
(9,'Max','Verstappen'),
(10,'Nico','Hülkenberg'),
(11,'Sergio','Pérez'),
(12,'Kevin','Magnussen'),
(13,'Jolyon','Palmer'),
(15,'Carlos','Sainz Jr.'),
(17,'Marcus','Ericsson'),
(18,'Felipe','Nasr'),
(19,'Fernando','Alonso'),
(20,'Jenson','Button'),
(21,'Stoffel','Vandoorne'),
(22,'Pascal','Wehrlein'),
(23,'Rio','Haryanto'),
(25,'Romain','Grosjean'),
(26,'Esteban','Gutiérrez'),
(30,'Jean-Eric','Vergne'),
(32,'Antonio','Fuoco'),
(33,'Paul','di Resta'),
(34,'Alex','Lynn'),
(35,'Gary','Paffett'),
(36,'Lance','Stroll'),
(37,'Pierre','Gasly'),
(38,'Sébastien','Buemi'),
(39,'Alfonso','Celis Jr.'),
(40,'Nikita','Mazepin'),
(41,'Esteban','Ocon'),
(42,'Nicholas','Latifi'),
(43,'Carmen','Jordá'),
(44,'Sergey','Sirotkin'),
(46,'Sérgio','Sette Câmara'),
(48,'Nobuharu','Matsushita'),
(49,'Alexander','Rossi'),
(51,'Jordan','King'),
(52,'Charles','Leclerc'),
(53,'Santino','Ferrucci');

insert into sponsor values ('malboro','cigarette'),
('Heineken','boisson'),
('tropico','boisson'),
('BNP','banque'),
('suez','energie'),
('engie','energie'),
('Winston','cigarette'),
('cocacola','boisson'),
('Castrol','Carburant');


insert into voiture values (44,1,'F1 W07'),
(6,1,'F1 W08'),
(5,2,'SF16-H'),
(7,2,'SF16-H1'),
(19,3,'FW38'),
(77,3,'FW39'),
(3,4,'RB12'),
(26,4,'RB13'),
(27,5,'VJM09'),
(11,5,'VJM10'),
(20,6,'RS16'),
(30,6,'RS17'),
(33,7,'STR11'),
(55,7,'STR12'),
(9,8,'C35'),
(12,8,'C36'),
(14,9,'MP4-31'),
(22,9,'MP4-32'),
(94,10,'MRT05'),
(88,10,'MRT06'),
(8,11,'VF-16'),
(21,11,'VF-17');

insert into courir values(1,19,14,0,0);
insert into courir values(1,20,22,0,0);
insert into courir values(1,4,7,1,4);
insert into courir values(1,1,44,2,1);
insert into courir values(1,2,6,3,2);
insert into courir values(1,3,5,4,3);
insert into courir values(1,8,26,5,8);
insert into courir values(1,10,27,6,9);
insert into courir values(1,5,19,7,5);
insert into courir values(1,6,77,8,6);
insert into courir values(1,11,11,9,10);
insert into courir values(1,12,20,10,11);
insert into courir values(1,7,3,11,7);
insert into courir values(1,13,30,12,12);
insert into courir values(1,9,33,13,13);
insert into courir values(1,15,55,14,14);
insert into courir values(1,17,9,15,15);
insert into courir values(1,18,12,16,16);
insert into courir values(1,22,94,17,17);
insert into courir values(1,26,21,18,20);
insert into courir values(1,23,88,19,18);
insert into courir values(1,25,8,20,19);
insert into courir values(2,17,9,0,0);
insert into courir values(2,18,12,0,0);
insert into courir values(2,7,3,0,0);
insert into courir values(2,13,30,0,0);
insert into courir values(2,25,8,1,9);
insert into courir values(2,12,20,2,11);
insert into courir values(2,6,77,3,14);
insert into courir values(2,19,14,4,15);
insert into courir values(2,4,7,5,5);
insert into courir values(2,11,11,6,3);
insert into courir values(2,5,19,7,'A');
insert into courir values(2,10,27,8,2);
insert into courir values(2,1,44,9,17);
insert into courir values(2,23,88,10,18);
insert into courir values(2,3,5,11,1);
insert into courir values(2,20,22,12,8);
insert into courir values(2,15,55,13,10);
insert into courir values(2,22,94,14,12);
insert into courir values(2,26,21,15,7);
insert into courir values(2,2,6,16,16);
insert into courir values(2,8,26,17,13);
insert into courir values(2,9,33,18,6);
insert into courir values(3,18,12,0,0);
insert into courir values(3,8,26,0,0);
insert into courir values(3,11,11,0,0);
insert into courir values(3,19,14,14,1);
insert into courir values(3,20,22,15,2);
insert into courir values(3,7,3,7,3);
insert into courir values(3,9,33,11,4);
insert into courir values(3,10,27,8,5);
insert into courir values(3,22,94,16,6);
insert into courir values(3,4,7,4,7);
insert into courir values(3,6,77,6,9);
insert into courir values(3,25,8,18,10);
insert into courir values(3,1,44,1,11);
insert into courir values(3,15,55,12,12);
insert into courir values(3,3,5,3,13);
insert into courir values(3,26,21,19,14);
insert into courir values(3,13,30,10,15);
insert into courir values(3,51,88,17,16);
insert into courir values(3,17,9,13,17);
insert into courir values(3,12,20,9,18);
insert into courir values(3,5,19,5,19);
insert into courir values(3,2,6,2,'A');
insert into courir values(4,10,27,16,1);
insert into courir values(4,15,55,6,2);
insert into courir values(4,22,94,3,3);
insert into courir values(4,17,9,7,4);
insert into courir values(4,4,7,12,5);
insert into courir values(4,11,11,20,6);
insert into courir values(4,3,5,4,7);
insert into courir values(4,2,6,2,8);
insert into courir values(4,9,33,21,9);
insert into courir values(4,1,44,1,10);
insert into courir values(4,43,30,17,11);
insert into courir values(4,6,77,8,13);
insert into courir values(4,5,19,18,14);
insert into courir values(4,20,22,9,15);
insert into courir values(4,18,12,10,16);
insert into courir values(4,26,21,5,17);
insert into courir values(4,23,88,13,18);
insert into courir values(4,19,14,15,20);
insert into courir values(4,12,20,19,21);
insert into courir values(4,7,3,22,22);
insert into courir values(4,39,26,11,'A');
insert into courir values(4,25,8,14,'A');
insert into courir values(5,11,11,0,0);
insert into courir values(5,25,8,0,0);
insert into courir values(5,26,21,0,0);
insert into courir values(5,18,12,0,0);
insert into courir values(5,5,19,8,1);
insert into courir values(5,2,6,2,2);
insert into courir values(5,51,88,22,3);
insert into courir values(5,7,3,1,4);
insert into courir values(5,19,14,9,'A');
insert into courir values(5,8,26,20,6);
insert into courir values(5,3,5,15,7);
insert into courir values(5,35,77,17,8);
insert into courir values(5,12,20,6,9);
insert into courir values(5,22,94,7,10);
insert into courir values(5,20,22,10,11);
insert into courir values(5,10,27,5,12);
insert into courir values(5,9,33,13,13);
insert into courir values(5,4,7,18,14);
insert into courir values(5,1,44,3,15);
insert into courir values(5,15,55,4,16);
insert into courir values(5,13,30,11,17);
insert into courir values(5,17,9,21,18);
insert into courir values(6,15,55,0,0);
insert into courir values(6,11,11,0,0);
insert into courir values(6,10,27,4,1);
insert into courir values(6,1,44,12,2);
insert into courir values(6,12,20,17,3);
insert into courir values(6,34,19,11,4);
insert into courir values(6,17,9,3,5);
insert into courir values(6,13,30,19,6);
insert into courir values(6,2,6,14,7);
insert into courir values(6,25,8,16,8);
insert into courir values(6,4,7,10,9);
insert into courir values(6,18,12,13,10);
insert into courir values(6,6,77,15,'A');
insert into courir values(6,26,21,7,12);
insert into courir values(6,23,88,20,13);
insert into courir values(6,3,5,5,14);
insert into courir values(6,9,33,6,15);
insert into courir values(6,20,22,9,16);
insert into courir values(6,19,14,1,17);
insert into courir values(6,8,26,2,18);
insert into courir values(6,7,3,8,19);
insert into courir values(6,22,94,18,20);
insert into courir values(7,23,88,0,0);
insert into courir values(7,7,3,0,0);
insert into courir values(7,20,22,0,0);
insert into courir values(7,3,5,0,0);
insert into courir values(7,17,9,8,1);
insert into courir values(7,25,8,10,2);
insert into courir values(7,26,21,4,3);
insert into courir values(7,22,94,2,4);
insert into courir values(7,18,12,9,5);
insert into courir values(7,1,44,16,6);
insert into courir values(7,11,11,7,7);
insert into courir values(7,15,55,14,8);
insert into courir values(7,8,26,6,9);
insert into courir values(7,4,7,17,10);
insert into courir values(7,6,77,15,11);
insert into courir values(7,5,19,18,12);
insert into courir values(7,19,14,3,13);
insert into courir values(7,9,33,13,14);
insert into courir values(7,12,20,1,15);
insert into courir values(7,2,6,12,16);
insert into courir values(7,13,30,5,17);
insert into courir values(7,10,27,11,18);
insert into courir values(8,19,14,8,1);
insert into courir values(8,17,9,16,2);
insert into courir values(8,9,33,7,3);
insert into courir values(8,3,5,13,4);
insert into courir values(8,4,7,3,5);
insert into courir values(8,13,30,10,6);
insert into courir values(8,15,55,5,7);
insert into courir values(8,8,26,9,8);
insert into courir values(8,1,44,6,9);
insert into courir values(8,2,6,12,10);
insert into courir values(8,7,3,15,11);
insert into courir values(8,6,77,4,12);
insert into courir values(8,25,8,19,13);
insert into courir values(8,26,21,17,14);
insert into courir values(8,11,11,2,15);
insert into courir values(8,18,12,22,16);
insert into courir values(8,10,27,1,17);
insert into courir values(8,20,22,11,18);
insert into courir values(8,12,20,18,'A');
insert into courir values(8,5,19,14,20);
insert into courir values(8,23,88,20,21);
insert into courir values(8,22,94,21,22);
insert into courir values(9,15,55,1,1);
insert into courir values(9,13,30,7,2);
insert into courir values(9,10,27,18,3);
insert into courir values(9,12,20,10,4);
insert into courir values(9,11,11,0,0);
insert into courir values(9,5,19,9,5);
insert into courir values(9,19,14,0,0);
insert into courir values(9,17,9,12,6);
insert into courir values(9,1,44,16,7);
insert into courir values(9,8,26,4,8);
insert into courir values(9,4,7,17,9);
insert into courir values(9,2,6,11,10);
insert into courir values(9,23,88,19,11);
insert into courir values(9,22,94,13,12);
insert into courir values(9,21,22,5,13);
insert into courir values(9,3,5,14,14);
insert into courir values(9,7,3,3,15);
insert into courir values(9,18,12,20,16);
insert into courir values(9,6,77,2,17);
insert into courir values(9,9,33,15,18);
insert into courir values(9,25,8,8,19);
insert into courir values(9,26,21,6,20);
insert into courir values(10,17,9,1,1);
insert into courir values(10,10,27,2,2);
insert into courir values(10,1,44,14,3);
insert into courir values(10,26,21,3,4);
insert into courir values(10,11,11,8,5);
insert into courir values(10,20,22,13,6);
insert into courir values(10,3,5,0,0);
insert into courir values(10,2,6,0,0);
insert into courir values(10,42,30,6,7);
insert into courir values(10,34,7,16,8);
insert into courir values(10,35,19,12,9);
insert into courir values(10,43,33,17,10);
insert into courir values(10,18,12,0,0);
insert into courir values(10,22,94,5,11);
insert into courir values(10,15,55,15,12);
insert into courir values(10,7,3,4,13);
insert into courir values(10,8,26,7,14);
insert into courir values(10,25,8,10,15);
insert into courir values(10,12,20,11,16);
insert into courir values(10,19,14,18,17);
insert into courir values(10,6,77,19,18);
insert into courir values(10,23,88,9,19);
insert into courir values(11,8,26,7,1);
insert into courir values(11,7,3,12,2);
insert into courir values(11,4,7,4,3);
insert into courir values(11,12,20,11,4);
insert into courir values(11,5,19,5,5);
insert into courir values(11,26,21,10,6);
insert into courir values(11,9,33,19,7);
insert into courir values(11,13,30,1,8);
insert into courir values(11,2,6,16,9);
insert into courir values(11,1,44,3,'A');
insert into courir values(11,3,5,0,0);
insert into courir values(11,6,77,15,11);
insert into courir values(11,22,94,2,12);
insert into courir values(11,17,9,17,13);
insert into courir values(11,25,8,20,14);
insert into courir values(11,23,88,14,15);
insert into courir values(11,20,22,9,'A');
insert into courir values(11,15,55,18,17);
insert into courir values(11,10,27,13,18);
insert into courir values(11,19,14,8,19);
insert into courir values(11,11,11,21,20);
insert into courir values(11,18,12,6,21);
insert into courir values(12,2,6,5,1);
insert into courir values(12,8,26,7,2);
insert into courir values(12,6,77,8,3);
insert into courir values(12,18,12,10,4);
insert into courir values(12,11,11,3,5);
insert into courir values(12,10,27,11,6);
insert into courir values(12,5,19,18,7);
insert into courir values(12,7,3,1,8);
insert into courir values(12,1,44,2,9);
insert into courir values(12,26,21,6,10);
insert into courir values(12,19,14,15,11);
insert into courir values(12,20,22,17,12);
insert into courir values(12,25,8,21,13);
insert into courir values(12,13,30,12,14);
insert into courir values(12,12,20,13,'A');
insert into courir values(12,9,33,19,16);
insert into courir values(12,4,7,16,17);
insert into courir values(12,17,9,20,18);
insert into courir values(12,3,5,9,19);
insert into courir values(12,22,94,4,20);
insert into courir values(12,23,88,0,0);
insert into courir values(12,15,55,14,21);
insert into courir values(13,23,88,12,1);
insert into courir values(13,5,19,11,2);
insert into courir values(13,19,14,4,3);
insert into courir values(13,3,5,6,4);
insert into courir values(13,8,26,0,0);
insert into courir values(13,2,6,0,0);
insert into courir values(13,7,3,8,5);
insert into courir values(13,25,8,17,6);
insert into courir values(13,18,12,13,7);
insert into courir values(13,21,22,19,8);
insert into courir values(13,9,33,3,9);
insert into courir values(13,10,27,2,10);
insert into courir values(13,26,21,14,11);
insert into courir values(13,6,77,0,0);
insert into courir values(13,12,20,7,12);
insert into courir values(13,13,30,9,13);
insert into courir values(13,1,44,18,14);
insert into courir values(13,11,11,16,15);
insert into courir values(13,15,55,10,16);
insert into courir values(13,22,94,5,17);
insert into courir values(13,17,9,15,18);
insert into courir values(13,4,7,1,19);
insert into courir values(14,13,30,0,0);
insert into courir values(14,23,88,0,0);
insert into courir values(14,6,77,0,0);
insert into courir values(14,4,7,6,1);
insert into courir values(14,22,94,6,2);
insert into courir values(14,3,5,16,3);
insert into courir values(14,19,14,18,4);
insert into courir values(14,18,12,2,5);
insert into courir values(14,12,20,7,6);
insert into courir values(14,11,11,15,7);
insert into courir values(14,7,3,18,8);
insert into courir values(14,1,44,8,9);
insert into courir values(14,2,6,13,10);
insert into courir values(14,17,9,20,11);
insert into courir values(14,5,19,20,12);
insert into courir values(14,26,21,8,13);
insert into courir values(14,25,8,9,14);
insert into courir values(14,10,27,4,15);
insert into courir values(14,15,55,10,16);
insert into courir values(14,20,22,19,17);
insert into courir values(14,9,33,3,18);
insert into courir values(14,8,26,20,19);
insert into courir values(15,6,77,0,0);
insert into courir values(15,22,94,17,1);
insert into courir values(15,15,55,4,2);
insert into courir values(15,25,8,6,3);
insert into courir values(15,7,3,2,4);
insert into courir values(15,13,30,10,5);
insert into courir values(15,17,9,20,6);
insert into courir values(15,8,26,3,7);
insert into courir values(15,26,21,1,'A');
insert into courir values(15,2,6,8,9);
insert into courir values(15,4,7,21,10);
insert into courir values(15,20,22,9,11);
insert into courir values(15,11,11,7,12);
insert into courir values(15,1,44,12,13);
insert into courir values(15,10,27,15,14);
insert into courir values(15,9,33,16,15);
insert into courir values(15,18,12,19,16);
insert into courir values(15,3,5,13,17);
insert into courir values(15,19,14,18,18);
insert into courir values(15,23,88,5,19);
insert into courir values(15,12,20,11,20);
insert into courir values(15,5,19,14,21);
insert into courir values(16,23,88,0,0);
insert into courir values(16,2,6,4,1);
insert into courir values(16,6,77,7,2);
insert into courir values(16,3,5,5,3);
insert into courir values(16,5,19,1,4);
insert into courir values(16,26,21,3,'A');
insert into courir values(16,25,8,14,6);
insert into courir values(16,10,27,20,7);
insert into courir values(16,7,3,15,8);
insert into courir values(16,9,33,8,9);
insert into courir values(16,20,22,9,10);
insert into courir values(16,8,26,13,11);
insert into courir values(16,4,7,17,12);
insert into courir values(16,12,20,18,13);
insert into courir values(16,19,14,21,14);
insert into courir values(16,18,12,12,15);
insert into courir values(16,22,94,10,16);
insert into courir values(16,11,11,19,17);
insert into courir values(16,15,55,11,18);
insert into courir values(16,17,9,2,19);
insert into courir values(16,13,30,16,20);
insert into courir values(16,1,44,6,21);
insert into courir values(17,11,11,0,0);
insert into courir values(17,23,88,0,0);
insert into courir values(17,19,14,7,1);
insert into courir values(17,25,8,10,2);
insert into courir values(17,22,94,14,3);
insert into courir values(17,4,7,15,4);
insert into courir values(17,17,9,19,5);
insert into courir values(17,20,22,1,6);
insert into courir values(17,9,33,6,7);
insert into courir values(17,13,30,9,8);
insert into courir values(17,10,27,5,9);
insert into courir values(17,18,12,11,10);
insert into courir values(17,26,21,20,'A');
insert into courir values(17,8,26,8,12);
insert into courir values(17,5,19,18,13);
insert into courir values(17,2,6,2,14);
insert into courir values(17,3,5,3,15);
insert into courir values(17,1,44,17,16);
insert into courir values(17,6,77,12,17);
insert into courir values(17,7,3,4,18);
insert into courir values(17,12,20,13,19);
insert into courir values(17,15,55,16,20);

insert into courir values(18,1,44,14,8);
insert into courir values(18,2,6,15,9);
insert into courir values(18,3,5,16,7);
insert into courir values(18,4,7,21,11);
insert into courir values(18,5,19,9,6);
insert into courir values(18,6,77,11,22);
insert into courir values(18,7,3,12,14);
insert into courir values(18,8,26,5,12);
insert into courir values(18,10,27,10,19);
insert into courir values(18,11,11,18,5);
insert into courir values(18,12,20,7,21);
insert into courir values(18,13,30,19,4);
insert into courir values(18,9,33,3,17);
insert into courir values(18,15,55,1,10);
insert into courir values(18,17,9,2,13);
insert into courir values(18,18,12,6,16);
insert into courir values(18,19,14,13,18);
insert into courir values(18,20,22,8,15);
insert into courir values(18,22,94,17,3);
insert into courir values(18,23,88,4,20);
insert into courir values(18,25,8,22,2);
insert into courir values(18,26,21,20,1);

insert into courir values(19,20,22,0,0);
insert into courir values(19,9,33,0,0);
insert into courir values(19,18,12,8,1);
insert into courir values(19,19,14,20,2);
insert into courir values(19,5,19,4,3);
insert into courir values(19,1,44,9,4);
insert into courir values(19,3,5,10,5);
insert into courir values(19,22,94,6,6);
insert into courir values(19,26,21,15,7);
insert into courir values(19,23,88,19,8);
insert into courir values(19,12,20,11,9);
insert into courir values(19,11,11,3,10);
insert into courir values(19,10,27,7,11);
insert into courir values(19,17,9,12,12);
insert into courir values(19,2,6,14,13);
insert into courir values(19,4,7,16,14);
insert into courir values(19,25,8,17,15);
insert into courir values(19,7,3,5,16);
insert into courir values(19,6,77,1,17);
insert into courir values(19,8,26,2,18);
insert into courir values(19,13,30,13,19);
insert into courir values(19,15,55,18,'A');

insert into soutenir values ('Heineken',1);
insert into soutenir values ('Heineken',2);
insert into soutenir values ('Heineken',3);
insert into soutenir values ('Heineken',4);
insert into soutenir values ('Heineken',5);
insert into soutenir values ('Heineken',6);
insert into soutenir values ('cocacola',7);
insert into soutenir values ('cocacola',8);
insert into soutenir values ('cocacola',9);
insert into soutenir values ('cocacola',10);
insert into soutenir values ('cocacola',11);
insert into soutenir values ('cocacola',12);
insert into soutenir values ('cocacola',13);
insert into soutenir values ('cocacola',15);
insert into soutenir values ('cocacola',17);
insert into soutenir values ('Winston',18);
insert into soutenir values ('Winston',19);
insert into soutenir values ('Winston',20);
insert into soutenir values ('Winston',21);
insert into soutenir values ('Winston',22);
insert into soutenir values ('Winston',23);
insert into soutenir values ('Winston',25);
insert into soutenir values ('Winston',26);
insert into soutenir values ('Winston',30);
insert into soutenir values ('Winston',32);
insert into soutenir values ('Winston',33);
insert into soutenir values ('Winston',34);
insert into soutenir values ('Winston',35);
insert into soutenir values ('Winston',36);
insert into soutenir values ('Winston',37);
insert into soutenir values ('Winston',38);
insert into soutenir values ('Winston',39);
insert into soutenir values ('Winston',40);
insert into soutenir values ('Winston',41);
insert into soutenir values ('Winston',42);
insert into soutenir values ('engie',43);
insert into soutenir values ('engie',44);
insert into soutenir values ('engie',46);
insert into soutenir values ('engie',48);
insert into soutenir values ('engie',49);
insert into soutenir values ('engie',51);
insert into soutenir values ('engie',52);
insert into soutenir values ('engie',53);
insert into soutenir values ('BNP',1);
insert into soutenir values ('BNP',2);
insert into soutenir values ('BNP',3);
insert into soutenir values ('BNP',4);
insert into soutenir values ('BNP',5);
insert into soutenir values ('BNP',6);
insert into soutenir values ('BNP',7);
insert into soutenir values ('BNP',8);
insert into soutenir values ('BNP',9);
insert into soutenir values ('BNP',10);
insert into soutenir values ('BNP',11);
insert into soutenir values ('BNP',12);
insert into soutenir values ('BNP',13);
insert into soutenir values ('BNP',15);
insert into soutenir values ('BNP',17);
insert into soutenir values ('BNP',18);
insert into soutenir values ('BNP',19);
insert into soutenir values ('BNP',20);
insert into soutenir values ('BNP',21);
insert into soutenir values ('BNP',22);
insert into soutenir values ('BNP',23);
insert into soutenir values ('BNP',25);
insert into soutenir values ('BNP',26);
insert into soutenir values ('BNP',30);
insert into soutenir values ('BNP',32);
insert into soutenir values ('BNP',33);
insert into soutenir values ('BNP',34);
insert into soutenir values ('BNP',35);
insert into soutenir values ('Castrol',36);
insert into soutenir values ('Castrol',37);
insert into soutenir values ('Castrol',38);
insert into soutenir values ('Castrol',39);
insert into soutenir values ('Castrol',40);
insert into soutenir values ('Castrol',41);
insert into soutenir values ('Castrol',42);
insert into soutenir values ('Castrol',43);
insert into soutenir values ('Castrol',44);
insert into soutenir values ('Castrol',46);
insert into soutenir values ('Castrol',48);
insert into soutenir values ('Castrol',49);
insert into soutenir values ('Castrol',51);
insert into soutenir values ('Castrol',52);
insert into soutenir values ('Castrol',53);
insert into soutenir values ('suez',1);
insert into soutenir values ('suez',2);


insert into sponsoriser(nomsponsor,id_ecurie)values ('Heineken',1);
insert into sponsoriser(nomsponsor,id_ecurie)values ('Heineken',2);
insert into sponsoriser(nomsponsor,id_ecurie)values ('Heineken',3);
insert into sponsoriser(nomsponsor,id_ecurie)values ('Heineken',4);
insert into sponsoriser(nomsponsor,id_ecurie)values ('Heineken',5);
insert into sponsoriser(nomsponsor,id_ecurie)values ('Heineken',6);
insert into sponsoriser(nomsponsor,id_ecurie)values ('Winston',7);
insert into sponsoriser(nomsponsor,id_ecurie)values ('Winston',8);
insert into sponsoriser(nomsponsor,id_ecurie)values ('Winston',9);
insert into sponsoriser(nomsponsor,id_ecurie)values ('Winston',10);
insert into sponsoriser(nomsponsor,id_ecurie)values ('Winston',11);
insert into sponsoriser(nomsponsor,id_ecurie)values ('engie',1);
insert into sponsoriser(nomsponsor,id_ecurie)values ('engie',2);
insert into sponsoriser(nomsponsor,id_ecurie)values ('engie',3);
insert into sponsoriser(nomsponsor,id_ecurie)values ('engie',4);
insert into sponsoriser(nomsponsor,id_ecurie)values ('BNP',7);
insert into sponsoriser(nomsponsor,id_ecurie)values ('BNP',9);
insert into sponsoriser(nomsponsor,id_ecurie)values ('BNP',10);
insert into sponsoriser(nomsponsor,id_ecurie)values ('BNP',11);
insert into sponsoriser(nomsponsor,id_ecurie)values ('Castrol',1);
insert into sponsoriser(nomsponsor,id_ecurie)values ('Castrol',3);
insert into sponsoriser(nomsponsor,id_ecurie)values ('Castrol',4);
insert into sponsoriser(nomsponsor,id_ecurie)values ('suez',5);
insert into sponsoriser(nomsponsor,id_ecurie)values ('suez',6);
insert into sponsoriser(nomsponsor,id_ecurie)values ('suez',7);
insert into sponsoriser(nomsponsor,id_ecurie)values ('suez',8);
insert into sponsoriser(nomsponsor,id_ecurie)values ('suez',10);
insert into sponsoriser(nomsponsor,id_ecurie)values ('suez',11);
insert into sponsoriser(nomsponsor,id_ecurie)values ('tropico',1);
insert into sponsoriser(nomsponsor,id_ecurie)values ('tropico',2);
insert into sponsoriser(nomsponsor,id_ecurie)values ('tropico',3);
insert into sponsoriser(nomsponsor,id_ecurie)values ('tropico',5);
insert into sponsoriser(nomsponsor,id_ecurie)values ('tropico',8);
insert into sponsoriser(nomsponsor,id_ecurie)values ('tropico',9);
insert into sponsoriser(nomsponsor,id_ecurie)values ('tropico',10);
insert into sponsoriser(nomsponsor,id_ecurie)values ('tropico',11);

  -- table de parametre pour le bareme
  create table bareme
    (place integer,
     points  integer);

  insert into bareme values(1, 25),
                            (2, 18 ),
                            (3, 15 ),
                            (4, 12 ),
                            (5, 10 ),
                            (6, 8 ),
                            (7, 6 ),
                            (8, 4 ),
                            (9, 2 ),
                            (10, 1 );

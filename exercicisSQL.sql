/* EXERCICIS SQL */

/* Exercici 1.1 */

CREATE TABLE Alumnes_vells AS
SELECT *
FROM Alumne
WHERE idalumne < 4;


/* Exercici 1.2 */

CREATE TABLE Llistat AS
SELECT a.idassignatura, a.nom
FROM Assignatura a, Notes n
WHERE a.idassignatura = n.idassignatura AND n.idalumne = 1;


/* Exercici 1.3 */

CREATE VIEW VistaSaturades AS
SELECT *
FROM Assignatura
WHERE numalumnes > 50;


/* Exercici 1.4 */

CREATE VIEW VistaManresa AS
SELECT * 
FROM Alumne
WHERE ciutat = 'Manresa';


/* Exercici 1.5 */

ALTER TABLE Notes 
	ADD HaCopiat text CHECK (HaCopiat = 'Si' OR HaCopiat = 'No');


/* Exercici 1.6 */

ALTER TABLE Alume
	ADD Coeficient int DEFAULT 50;
	

/* Exercici 1.7 */

ALTER TABLE Assignatura 
	ALTER nom SET DEFAULT 'Indefinit';
	

/* Exercici 1.8 */

ALTER TABLE Alumne 
	RENAME nom TO Descripcio;
	

/* Exercici 1.9 */

ALTER TABLE Notes 
	RENAME TO Qualificacions;
	
	
/* Exercici 1.10 */

ALTER TABLE Alumne 
	RENAME TO Assistents;

ALTER TABLE Assignatura 
	RENAME TO Materia;
	
	
Explicació: si


/* Exercici 1.11 */

INSERT INTO Assignatura VALUES ('1', 'Bases de dades', '40');


/* Exercici 1.12 */

INSERT TO Alumne (nom, edat, ciutat) VALUES ('Laura', '21', 'Lleida');


/* Exercici 1.13 */

CREATE TABLE Alumnes_vells (
	idalumne serial primary key,
	nom varchar(20),
	ciutat varchar(15) );

INSERT INTO Alumnes_vells SELECT * FROM Alumne WHERE edad > 19;


/* Exercici 1.14 */

CREATE TABLE assignatura_massificada (
	idassignatura serial primary key,
	nom varchar(20) );

INSERT INTO assignatura_massificada SELECT * FROM Assignatura WHERE numalumnes > 40;


/* Exercici 1.15 */

UPDATE Alumne SET edat = edat + 5;


/* Exercici 1.16 */


UPDATE Alumne SET nom = 'Juan' WHERE nom = 'Joan';


/* Exercici 1.17 */

UPDATE Assignatura SET nom = 'E.D.I' AND numalumnes = 250 WHERE nom = 'EDI';


/* Exercici 1.18 */

UPDATE Notes n SET n.nota = n.nota - 1 
	FROM Assignatura a 
	WHERE n.idassignatura = a.idassignatura AND a.nom = 'IBD' AND n.nota != NULL;


/* Exercici 1.19 */

UPDATE Notes n SET n.nota = n.nota + 1 
	FROM Assignatura ass , Alumne al
	WHERE n.idassignatura = ass.idassignatura AND 
		n.idalume = al.idalumne AND ass.nom = 'IBD' AND al.edat > 19 ;



/* Exercici 1.19 */





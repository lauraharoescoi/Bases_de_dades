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

INSERT INTO assignatura VALUES ('1', 'Bases de dades', '40');



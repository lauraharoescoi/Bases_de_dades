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


/* Exercici 1.20 */

DELETE FROM Alumne;

/* Per a poder fer aquest delete, primer hauriem de eliminar la tupla de la taula Notes
la qual està relacionada amb la taula Alumne (idalumne) */


/* Exercici 1.21 */

DELETE FROM Notes;


/* Exercici 1.22 */

DELETE FROM Notes
	WHERE nota < 6 ;


/* Exercici 1.23 */

DELETE FROM Alumne 
	WHERE nom = 'Abel' ;


/* Exercici 1.24 */

DELETE FROM Notes
WHERE nota > 8 AND idassignatura IN (SELECT idassignatura FROM Assignatura WHERE nom = 'IBD');


/* Exercici 1.25 */

SELECT nom
FROM Assignatura
ORDER BY nom;


/* Exercici 1.26 */

SELECT ciutat
FROM Alumne 
WHERE edat > 18 ;


/* Exercici 1.27 */

SELECT DISTINCT ciutat
FROM Alumne 
WHERE edat > 18 ;


/* Exercici 1.28 */

SELECT *
FROM Assignatura
WHERE nom = 'LABOSOFT';


/* Exercici 1.29 */

SELECT nom, edat
FROM Alumne
WHERE ciutat = 'Lleida'
ORDER BY nom;


/* Exercici 1.30 */

/* No es possible fer aquesta consulta ja que la taula assignatura no té 4 columnes*/


/* Exercici 1.31 */

SELECT *
FROM Alumne
WHERE edat >= 18
ORDER BY ciutat ASC, edat DESC ;


/* Exercici 1.32 */

SELECT nom AS IDENTITAT, ciutat AS ORIGEN
FROM Alumne
WHERE edat >= 18
ORDER BY ciutat ASC, edat DESC ;


/* Exercici 1.33 */

SELECT nom, edat, date_part('year', current_date) - edat AS dataNaixement
FROM Alumne
ORDER BY dataNaixement DESC;

/* Exercici 1.34 */

SELECT *
FROM Assignatura
WHERE numalumnes < (SELECT numalumnes FROM Assignatura WHERE nom = 'EDI') - 20 ;

/* Exercici 1.35 */ 

SELECT nom
FROM Alumne
WHERE edat IS NULL
ORDER BY nom;

SELECT nom
FROM Alumne
WHERE edat IS NOT NULL ;


/* Exercici 1.36 */

SELECT idalumne
FROM Alumne
WHERE edat >= 18
EXCEPT
SELECT idalumne
FROM Notes
WHERE nota = 10 ;


/* Exercici 1.37 */

SELECT idassignatura
FROM Assignatura
WHERE numalumnes >= 50
UNION
SELECT idassignatura
FROM Notes
WHERE nota = 10;


/* Exercici 1.38 */

/* Sense BETWEEN */
SELECT nom
FROM Alumne
WHERE edat >= 19 AND edat <= 21
ORDER BY nom;

/* Amb BETWEEN */
SELECT nom
FROM Alumne
WHERE edat BETWEEN 19 AND 21
ORDER BY nom;


/* Exercici 1.39 */

SELECT nom
FROM Alumne
WHERE nom LIKE 'A%' OR nom LIKE 'M%' ;


/* Exercici 1.40 */

SELECT nom 
FROM Alumne
WHERE nom LIKE '______%';

/* Exercici 1.41 */

SELECT *
FROM Assignatura
WHERE numalumnes IN (30,60)
ORDER BY nom;

/* Exercici 1.42 */

SELECT nom
FROM Alumne
EXCEPT
SELECT nom
FROM Alumne al JOIN Notes ON al.idalumne = n.idalumne;

/* Exercici 1.43 */

SELECT nom
FROM Alumne
WHERE EXIST (SELECT * 
			FROM Notes
			WHERE nota > 5);


/* Exercici 1.44 */

INSERT INTO Assignatura (Nom, numalumnes) VALUES ('PROG', 120);
INSERT INTO Assignatura (Nom, numalumnes) VALUES ('MATDIS', 180);

SELECT *
FROM Assignatura

EXCEPT

SELECT *
FROM Assignatura
WHERE EXIST (SELECT *
			FROM Notes
			WHERE nota IS NOT NULL);


/* Exercici 1.45 */

SELECT nom ||''|| COALESCE(edat, '-666') AS "Nom i edat"
FROM Alumne;


/* Exercici 1.46 */

SELECT nom
FROM Assignatura
WHERE LENGTH(nom) = 5
ORDER BY nom;


/* Exercici 1.47 */

SELECT SUBSTR(nom, 1, 2) AS "TRES PRIMERES"
FROM Alumne
WHERE SUBSTR(nom, 1, 1) = 'M';


/* Exercici 1.48 */

SELECT SUBSTR(nom, 1, 3) AS "TRES PRIMERES"
FROM Alumne
WHERE nom LIKE 'A%'


/* Exercici 1.49 */

SELECT SUBSTR(ciutat, LENGTH(ciutat) - 3, 4) AS "QUATRE DARRERES"
FROM Alumne


/* Exercici 1.50 */

SELECT TRANSLATE(nom, 'a', '*')  AS "NOM CANVIAT"
FROM Alumne
/*Exercici 3.a*/

SELECT p.titulo, per.nombre, SUM(pro.espectadores) AS Total
FROM pelicula p
	INNER JOIN Dirige dg ON p.idPeli = dg.idPeli
	INNER JOIN Persona per ON p.NSS = per.NSS
	INNER JOIN Proyeccion pro ON p.idPeli = pro.idPeli 
		AND pro.fecha BETWEEN ('01/01/2019' AND '31/12/2019')
	INNER JOIN Cine c ON pro.idCine = c.idCine AND c.ciudad = 'Lleida'
GROUP BY p.titulo, per.nombre 
ORDER BY Total DESC
LIMIT 10
	
/*Exercici 3.b*/	

R1 = Proyeccion ('01/01/2021' AND '31/12/2021')
R2 = (Actor * Interviene) [ciudad, IdPeli, NSS]
R3 = R1 * R2 [idCine, idPeli, ciudad]
R4 = Cine [ciudad = ciudad' AND idCine = idCine'] R3 [idCine, idPeli]
R5 = R4 [idPeli != idPeli] R4 [idCine] 
R6 = (R5 * Cine) [nombre, direccion, ciudad]


/*Exercici 3.c*/


CREATE FUNCTION Comprova_aforament() RETURNS TRIGGER AS $$
DECLARE
total_espectadors int;
capacidad_sala Sala.capacidad%TYPE;

BEGIN
	SELECT SUM(espectadores) INTO total_espectadors
	FROM proyeccion 
	WHERE idCine = NEW.idCine AND idSala = NEW.idSala 
		AND idPeli = NEW.idPeli AND fecha = NEW.fecha 
		AND hora = NEW.hora
	GROUP BY idPeli;
	
	SELECT capacidad INTO capacidad_sala
	FROM Sala s
	WHERE s.idSala = NEW.idSala;
	
	IF total_espectadors + NEW.espectadores > capacidad_sala THEN 
	UPDATE Sala SET capacidad = total_espectadors + NEW.espectadores
	WHERE idSala = NEW.idSala;
	END IF;
	
	RETURN NEW;
END;
$$
Language 'plpgsql';


CREATE TRIGGER trig_aforament
	BEFORE INSERT OR UPDATE
	ON total_espectadors
	FOR EACH ROW
EXECURE PROCEDURE Comprova_aforament();
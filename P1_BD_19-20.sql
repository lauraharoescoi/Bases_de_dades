/*Exercici 3.a*/

SELECT p.titulo, per.nombre, SUM(pro.espectadores) AS Total
FROM pelicula p
	INNER JOIN Dirige dg ON p.idPeli = dg.idPeli
	INNER JOIN Persona per ON p.NSS = per.NSS
	INNER JOIN Proyeccion pro ON p.idPeli = pro.idPeli
	INNER JOIN Cine c ON pro.idCine = c.idCine
GROUP BY p.titulo, per.nombre
HAVING pro.fecha BETWEEN ('01/01/2019' AND '31/12/2019') AND c.ciudad = 'Lleida'
ORDER BY Total DESC
LIMIT 10
	
/*Exercici 3.b*/	

R1 = Actor * Persona [NSS, ciudad]
R2 = R1 * Interviene [IdPeli, ciudad]
R3 = Cine * Proyeccion [IdCine, IdPeli, ciudad, nombre, direccion]
R4 = R3 [ciudad / ciudad] R2 
R5 = 


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
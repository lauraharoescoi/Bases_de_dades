/*Exercici 14.6*/

CREATE FUNCTION deleteEnv (int, int) RETURN int AS
$$
DECLARE
    Enviament enviaments.quantitat%TYPE;

BEGIN
    SELECT INTO Enviament quantitat 
    FROM enviaments
    WHERE idproveidor = $1 AND idPart = $2;

    IF FOUND THEN 
        DELETE FROM enviaments WHERE idproveidor = $1 AND idPart = $2;
        RETURN Enviament;
    END IF;
    RETURN -1;
END;
$$
Language 'plpgsql'


/*Exercici 14.16 */

CREATE FUNCTION checkCiutat() RETURN TRIGGER AS
$$
DECLARE
    ciutatParts parts.ciutat%TYPE
    ciutatProveidor proveidor.ciutat%TYPE;

BEGIN 
    SELECT INTO ciutatParts ciutat 
    FROM parts
    WHERE idpart = NEW.idPart;

    SELECT INTO ciutatProveidor ciutat
    FROM proveidor 
    WHERE idproveidor = NEW.idproveidor;

    IF (ciutatParts = ciutatProveidor) THEN
        NEW.cost = 0;
    END IF;
    RETURN NEW;
END;
$$
Language 'plpgsql'

CREATE TRIGGER checkDescompte
BEFORE INSERT ON Enviament
FOR EACH ROW
EXECUTE PROCEDURE checkCiutat();


/*Exercici 14.17 */

CREATE FUNCTION checkProveidors() RETURN TRIGGER AS
$$
DECLARE
    numProveidors int;

BEGIN 
    SELECT INTO numProveidors COUNT(idproveidor)
    FROM proveidor
    WHERE NEW.ciutat = proveidor.ciutat;
    
    IF (numProveidors > 10) THEN
        RETURN NULL;
    END IF;
    RETURN NEW;
END;
$$
Language 'plpgsql'

CREATE TRIGGER nigger
BEFORE INSERT ON proveidor
FOR EACH ROW
EXECUTE PROCEDURE checkProveidors();

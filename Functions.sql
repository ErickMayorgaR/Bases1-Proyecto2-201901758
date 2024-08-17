USE Proyecto2Bases1


DELIMITER $$

CREATE FUNCTION ValidarCorreo(correo_ VARCHAR(100)) 
RETURNS BOOLEAN 
DETERMINISTIC 
BEGIN DECLARE resp BOOLEAN;

IF (
    SELECT
        REGEXP_INSTR(correo_, '(.*)@(.*)\.(.*)')
) THEN
SELECT
    TRUE INTO resp;
ELSE
SELECT
    FALSE INTO resp;

END IF;

RETURN (resp);
END $$
DELIMITER ; 




use proyecto2bases1;
DELIMITER $$
CREATE FUNCTION validar_numero(valor INT) 
RETURNS BOOLEAN 
DETERMINISTIC
BEGIN 
    DECLARE resultado BOOLEAN; 
    IF valor >= 0 THEN 
        SET resultado = TRUE; 
    ELSE 
        SET resultado = FALSE; 
    END IF; 
    RETURN resultado; 
END $$


use proyecto2bases1;
/*
 Drop Procedure RegistrarRestaurante;
 */

DELIMITER $$
CREATE PROCEDURE RegistrarRestaurante(
    IN Id VARCHAR(50),
    IN Direccion VARCHAR(100),
    IN MunicipioNombre VARCHAR(50),
    IN Zona INT ,
    IN Telefono BIGINT,
    IN Personal INT UNSIGNED,
    IN TieneParqueo BIT(1)
)
createRestaurant:BEGIN
    DECLARE municipio_id INT;
    DECLARE restaurante_id VARCHAR(50);
    
    -- Validar que la zona sea mayor o igual a cero
    IF NOT validar_numero(Zona) THEN
        SELECT 'Error: la zona debe ser mayor o igual a cero.' as Msg_Error;
        LEAVE createRestaurant;
    END IF;
    
    -- Verificar si el municipio ya existe en la tabla municipios
    SELECT idMunicipio INTO municipio_id FROM municipio WHERE nombre = MunicipioNombre;
    
    -- Si no existe, insertar el municipio en la tabla
    IF municipio_id IS NULL THEN
        INSERT INTO municipio (nombre) VALUES (MunicipioNombre);
        SET municipio_id = LAST_INSERT_ID();
    END IF;
    
    -- Verificar si ya existe un restaurante con el mismo nombre en la tabla restaurante
    SELECT idRestaurante INTO restaurante_id FROM restaurante WHERE idRestaurante = Id;
    
    IF restaurante_id IS NULL THEN
        -- Insertar el nuevo restaurante
        INSERT INTO restaurante (IdRestaurante, direccion, Municipio_idMunicipio, zona, telefono, noPersonal, tieneParqueo)
        VALUES (Id, Direccion, municipio_id, Zona, Telefono, Personal, TieneParqueo);
    
    ELSE
            -- Actualizar el registro existente
            select 'Error: Ya existe un restaurante con el mismo nombre.' as Msg_Error;
            LEAVE createRestaurant;
    END IF;
    SELECT restaurante_id AS id;
END $$
DELIMITER ;








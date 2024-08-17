USE Proyecto2Bases1

------------------------------------------------------Registrar Restaurante
DELIMITER $$
CREATE PROCEDURE RegistrarRestaurante(
    IN Id VARCHAR(50),
    IN Direccion VARCHAR(100),
    IN MunicipioNombre VARCHAR(50),
    IN Zona INT UNSIGNED,
    IN Telefono BIGINT,
    IN Personal INT UNSIGNED,
    IN TieneParqueo BIT(1)
)
createRestaurant:BEGIN
    DECLARE municipio_id INT;
    DECLARE restaurante_id VARCHAR(50);
    
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

------------------------------------------------------Registrar Puesto


DELIMITER $$
DELIMITER $$
CREATE PROCEDURE RegistrarPuesto(
  IN Nombre VARCHAR(50),
  IN Descripcion VARCHAR(100),
  IN Salario DECIMAL(10,2)
)
BEGIN
  IF Salario <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El salario debe ser mayor que cero';
  ELSE
    INSERT INTO Puesto(nombre, descripcion, salario) VALUES(Nombre, Descripcion, Salario);
  END IF;
END $$
DELIMITER ;

------------------------------------------------------ Crear Empleado 


DELIMITER $$
CREATE PROCEDURE CrearEmpleado(
    IN nombres VARCHAR(45),
    IN apellidos VARCHAR(45),
    IN fechaNacimiento DATE,
    IN correo VARCHAR(45),
    IN telefono BIGINT,
    IN direccion VARCHAR(45),
    IN dpi BIGINT,
    IN fechaInicio DATE,
    IN puesto_id INT UNSIGNED,
    IN restaurante_id VARCHAR(50)
)
BEGIN 
    DECLARE correo_valido TINYINT;
    DECLARE puesto_existente TINYINT;
    DECLARE restaurante_existente TINYINT;
    
    -- Validar correo electrónico
    SET correo_valido = (SELECT correo REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' FROM dual);
    IF correo_valido = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico ingresado es inválido';
    END IF;
    
    -- Validar que el puesto de trabajo exista
    SET puesto_existente = (SELECT EXISTS(SELECT 1 FROM puesto WHERE idPuesto = puesto_id));
    IF puesto_existente = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El puesto de trabajo ingresado no existe';
    END IF;
    
    -- Validar que el restaurante exista
    SET restaurante_existente = (SELECT EXISTS(SELECT 1 FROM restaurante WHERE idRestaurante = restaurante_id));
    IF restaurante_existente = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El restaurante ingresado no existe';
    END IF;
    
    -- Insertar empleado
    INSERT INTO empleado (nombres, apellidos, fechaNacimiento, correo, telefono, direccion, dpi, fechaInicio, Puesto_idPuesto, restaurante_idRestaurante)
    VALUES (nombres, apellidos, fechaNacimiento, correo, telefono, direccion, dpi, fechaInicio, puesto_id, restaurante_id);
    
    -- Obtener el último ID insertado
    SELECT LAST_INSERT_ID();
END$$
DELIMITER ;


------------------------------------------------------Registrar Cliente


DELIMITER $$
CREATE PROCEDURE RegistrarCliente();

BEGIN 
END$$
DELIMITER ; 


------------------------------------------------------Registrar Direccion 

DELIMITER $$
CREATE PROCEDURE RegistrarDireccion (
  IN cliente BIGINT,
  IN direccion VARCHAR(255),
  IN municipio VARCHAR(255),
  IN zona INT
)
BEGIN
  DECLARE municipio_id INT;

  -- validar que el cliente existe
  IF NOT EXISTS (SELECT dpi FROM Cliente WHERE dpi = cliente) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no existe';
  END IF;

  -- buscar el municipio por su nombre y obtener su id
  SELECT idMunicipio INTO municipio_id FROM Municipio WHERE nombre = municipio;

  -- validar que el municipio existe
  IF municipio_id IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El municipio no existe';
  END IF;

  -- insertar la nueva dirección
  INSERT INTO Direccion (dpi, direccion, municipio_id, zona)
  VALUES (cliente, direccion, municipio_id, zona);
END $$
DELIMITER ;

------------------------------------------------------Crear Orden



DELIMITER $$
CREATE PROCEDURE CrearOrden (
  IN DPI_cliente BIGINT,
  IN IdDireccion_cliente INT,
  IN Canal_pedido CHAR(1)
)
BEGIN
  DECLARE Restaurante_id INT;
  DECLARE Fecha_inicio DATETIME;
  DECLARE Fecha_entrega DATETIME;
  DECLARE Estado VARCHAR(20);
  
  -- Validar si el cliente existe
  IF NOT EXISTS (SELECT * FROM Cliente WHERE DPI = DPI_cliente) THEN
    SELECT 'El cliente no existe' AS Resultado;
    LEAVE;
  END IF;
  
  -- Validar si la dirección del cliente existe
  IF NOT EXISTS (SELECT * FROM Direccion WHERE IdDireccion = IdDireccion_cliente) THEN
    SELECT 'La dirección del cliente no existe' AS Resultado;
    LEAVE;
  END IF;
  
  -- Obtener la zona y municipio de la dirección del cliente
  SELECT Zona, Municipio INTO @Zona, @Municipio FROM Direccion WHERE IdDireccion = IdDireccion_cliente;
  
  -- Validar si hay un restaurante en la misma zona y municipio
  SELECT IdRestaurante INTO Restaurante_id FROM Restaurante WHERE Zona = @Zona AND Municipio = @Municipio;
  
  IF Restaurante_id IS NULL THEN
    -- No hay restaurante disponible en la zona y municipio del cliente
    INSERT INTO Orden (IdDireccion_cliente, Canal_pedido, Fecha_inicio, Fecha_entrega, Estado)
    VALUES (IdDireccion_cliente, Canal_pedido, NOW(), NULL, 'SIN COBERTURA');
    SELECT 'La orden no pudo ser atendida debido a falta de cobertura' AS Resultado;
    LEAVE;
  END IF;
  
  -- Hay un restaurante disponible en la zona y municipio del cliente
  INSERT INTO Orden (IdDireccion_cliente, IdRestaurante, Canal_pedido, Fecha_inicio, Fecha_entrega, Estado)
  VALUES (IdDireccion_cliente, Restaurante_id, Canal_pedido, NOW(), NULL, 'INICIADA');
  SELECT LAST_INSERT_ID() AS Resultado;
END $$
DELIMITER ;



DELIMITER $$
CREATE PROCEDURE AgregarIem();

BEGIN 
END$$
DELIMITER ; 


DELIMITER $$
CREATE PROCEDURE ConfirmarOrden();

BEGIN 
END$$
DELIMITER ; 


DELIMITER $$
CREATE PROCEDURE ();

BEGIN 
END$$
DELIMITER ; 


DELIMITER $$
CREATE PROCEDURE ();

BEGIN 
END$$
DELIMITER ; 


DELIMITER $$
CREATE PROCEDURE ();

BEGIN 
END$$
DELIMITER ; 


DELIMITER $$
CREATE PROCEDURE ();

BEGIN 
END$$
DELIMITER ; 


use proyecto2bases1;
-- ########################### INGRESAR Empleados ###########################
-- Si se valida xd
/*
CALL CrearEmpleado('Harry','Maguire','1990-01-01','hola.com',12347890,'Zona 15',4567098710234,
'2022-01-01',1,"R-01"); -- Correo invalido
*/
-- Tambien se valida xd
/*
CALL CrearEmpleado('Harry','Maguire','1990-01-01','hola@gmail.com',12347890,'Zona 15',4567098710234,
'2022-01-01',4,"R-01"); -- Error, puesto de trabajo inexistente
*/
/*
CALL CrearEmpleado('Harry','Maguire','1990-01-01','hola@gmail.com',12347890,'Zona 15',4567098710234,
'2022-01-01',1,"R-02"); -- Error, restaurante inexistente
*/
/*
CALL CrearEmpleado('Harry','Maguire','1990-01-01','hola@gmail.com',12347890,'Zona 15',4567098710234,
'2022-01-01',1,"R-01"); -- Ok
*/
CALL CrearEmpleado('James','Hollywood','1990-01-01','aaa@hotmail.es',12347899,'Zona 15',4567098710234,
'2022-01-01',1,"R-01"); -- Error, dpi duplicado
CALL CrearEmpleado('James','Hollywood','1990-01-01','aaa@hotmail.es',12347899,'Zona 15',4567098710235,
'2022-01-01',3,"R-01"); -- Ok


use proyecto2bases1;
/*
CALL ListarRestaurantes;
*/
/*
Drop Procedure ConsultarEmpleado;
*/
/*
DELIMITER $$
CREATE PROCEDURE ListarRestaurantes(
    IN `restaurante` VARCHAR(1000)
)
BEGIN
    SET @query = CONCAT('SELECT * FROM ', t);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END $$
*/
/*
DELIMITER $$
CREATE PROCEDURE  ListarRestaurantes()
BEGIN
  SELECT *
  FROM restaurante;
END $$
*/
/*
IN dpi BIGINT
CALL ConsultarEmpleado (00000001) ;
*/
/*
DELIMITER $$
CREATE PROCEDURE  ConsultarEmpleado(IN puesto_idpuesto_entrante BIGINT)
BEGIN
  SELECT *
  FROM empleado
  WHERE Puesto_idPuesto = puesto_idpuesto_entrante;
END $$
*/
CALL ConsultarEmpleado(00000001);


use proyecto2bases1;
/*
CALL RegistrarRestaurante ('R010', '1a CALLe zona 4', 'Guatemala', 4, 1770, 18, 1); -- ok

/*
CALL RegistrarPuesto ('Mesero', 'Encargado de atender mesas de los clientes', 3750.00) ; -- ok
*/

CALL CrearEmpleado( 'JUAN SEBASTIAN', 'CHOC BOJ', '2001-03-14', 'juan@gmail.com', 42543549, '29 av z1 1-80', 3024021520101,'2022-05-24'  , 00000001, 'R010') ; -- ok mesero 00000001

select * from empleado;

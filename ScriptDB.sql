-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Proyecto2Bases1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Proyecto2Bases1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Proyecto2Bases1` DEFAULT CHARACTER SET utf8 ;
USE `Proyecto2Bases1` ;

-- -----------------------------------------------------
-- Table `Proyecto2Bases1`.`Municipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto2Bases1`.`Municipio` (
  `idMunicipio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idMunicipio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto2Bases1`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto2Bases1`.`Cliente` (
  `dpi` BIGINT NOT NULL,
  `nombres` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `fechaNacimiento` DATE NULL,
  `correo` VARCHAR(45) NULL,
  `telefono` INT NULL,
  `nit` INT NULL,
  PRIMARY KEY (`dpi`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto2Bases1`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto2Bases1`.`Direccion` (
  `idDireccion` INT NOT NULL,
  `Cliente_dpi` BIGINT NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `Municipio_idMunicipio` INT NOT NULL,
  `zona` INT NULL,
  PRIMARY KEY (`idDireccion`),
  INDEX `fk_Direccion_Cliente1_idx` (`Cliente_dpi` ASC) VISIBLE,
  INDEX `fk_Direccion_Municipio1_idx` (`Municipio_idMunicipio` ASC) VISIBLE,
  CONSTRAINT `fk_Direccion_Cliente1`
    FOREIGN KEY (`Cliente_dpi`)
    REFERENCES `Proyecto2Bases1`.`Cliente` (`dpi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Direccion_Municipio1`
    FOREIGN KEY (`Municipio_idMunicipio`)
    REFERENCES `Proyecto2Bases1`.`Municipio` (`idMunicipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto2Bases1`.`Restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto2Bases1`.`Restaurante` (
  `idRestaurante` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `zona` INT NULL,
  `telefono` INT NULL,
  `noPersonal` INT NULL,
  `tieneParqueo` BIT NULL,
  `Municipio_idMunicipio` INT NOT NULL,
  `Direccion_idDireccion` INT NOT NULL,
  PRIMARY KEY (`idRestaurante`),
  INDEX `fk_Restaurante_Municipio1_idx` (`Municipio_idMunicipio` ASC) VISIBLE,
  INDEX `fk_Restaurante_Direccion1_idx` (`Direccion_idDireccion` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurante_Municipio1`
    FOREIGN KEY (`Municipio_idMunicipio`)
    REFERENCES `Proyecto2Bases1`.`Municipio` (`idMunicipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Restaurante_Direccion1`
    FOREIGN KEY (`Direccion_idDireccion`)
    REFERENCES `Proyecto2Bases1`.`Direccion` (`idDireccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto2Bases1`.`Puesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto2Bases1`.`Puesto` (
  `idPuesto` INT(8) ZEROFILL NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `salario` DECIMAL NULL,
  PRIMARY KEY (`idPuesto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto2Bases1`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto2Bases1`.`Empleado` (
  `idEmpleado` INT NOT NULL,
  `nombres` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `fechaNacimiento` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  `telefono` INT NULL,
  `direccion` VARCHAR(45) NULL,
  `dpi` BIGINT NULL,
  `fechaInicio` DATE NULL,
  `restaurante_idRestaurante` VARCHAR(50) NOT NULL,
  `Puesto_idPuesto` INT(8) ZEROFILL NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  INDEX `fk_empleado_restaurante_idx` (`restaurante_idRestaurante` ASC) VISIBLE,
  INDEX `fk_Empleado_Puesto1_idx` (`Puesto_idPuesto` ASC) VISIBLE,
  CONSTRAINT `fk_empleado_restaurante`
    FOREIGN KEY (`restaurante_idRestaurante`)
    REFERENCES `Proyecto2Bases1`.`Restaurante` (`idRestaurante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_Puesto1`
    FOREIGN KEY (`Puesto_idPuesto`)
    REFERENCES `Proyecto2Bases1`.`Puesto` (`idPuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto2Bases1`.`FormaPago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto2Bases1`.`FormaPago` (
  `idFormaPago` INT NOT NULL,
  `formaPago` CHAR NULL,
  PRIMARY KEY (`idFormaPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto2Bases1`.`Orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto2Bases1`.`Orden` (
  `idOrden` INT NOT NULL AUTO_INCREMENT,
  `Cliente_dpi` BIGINT NOT NULL,
  `Canal` CHAR BINARY NULL,
  `Direccion_idDireccion` INT NOT NULL,
  `inicioOrden` DATE NULL,
  `entregaOrden` DATE NULL,
  `estado` VARCHAR(45) NULL,
  `idRepartidor` INT NULL,
  `idRepartidor_empleado` INT NULL,
  `formaPago_idFormaPago` INT NOT NULL,
  INDEX `fk_Orden_Cliente1_idx` (`Cliente_dpi` ASC) VISIBLE,
  INDEX `fk_Orden_Direccion1_idx` (`Direccion_idDireccion` ASC) VISIBLE,
  PRIMARY KEY (`idOrden`),
  INDEX `fk_Orden_Empleado1_idx` (`idRepartidor_empleado` ASC) VISIBLE,
  INDEX `fk_Orden_formaPago1_idx` (`formaPago_idFormaPago` ASC) VISIBLE,
  CONSTRAINT `fk_Orden_Cliente1`
    FOREIGN KEY (`Cliente_dpi`)
    REFERENCES `Proyecto2Bases1`.`Cliente` (`dpi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orden_Direccion1`
    FOREIGN KEY (`Direccion_idDireccion`)
    REFERENCES `Proyecto2Bases1`.`Direccion` (`idDireccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orden_Empleado1`
    FOREIGN KEY (`idRepartidor_empleado`)
    REFERENCES `Proyecto2Bases1`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orden_formaPago1`
    FOREIGN KEY (`formaPago_idFormaPago`)
    REFERENCES `Proyecto2Bases1`.`FormaPago` (`idFormaPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto2Bases1`.`Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto2Bases1`.`Item` (
  `idItem` INT NOT NULL,
  `tipoProducto` CHAR NULL,
  `int` INT NULL,
  `cantidad` INT NULL,
  `observacion` VARCHAR(45) NULL,
  `Orden_idOrden` INT NOT NULL,
  PRIMARY KEY (`idItem`),
  INDEX `fk_Item_Orden1_idx` (`Orden_idOrden` ASC) VISIBLE,
  CONSTRAINT `fk_Item_Orden1`
    FOREIGN KEY (`Orden_idOrden`)
    REFERENCES `Proyecto2Bases1`.`Orden` (`idOrden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto2Bases1`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto2Bases1`.`Factura` (
  `numSerie` INT NOT NULL,
  `montoTotal` DECIMAL NULL,
  `Municipio_idMunicipio` INT NOT NULL,
  `fechaHoraFactura` DATE NULL,
  `Orden_idOrden` INT NOT NULL,
  `nit` VARCHAR(10) NULL,
  `formaPago_idFormaPago` INT NOT NULL,
  INDEX `fk_Factura_Orden1_idx` (`Orden_idOrden` ASC) VISIBLE,
  PRIMARY KEY (`numSerie`),
  INDEX `fk_Factura_formaPago1_idx` (`formaPago_idFormaPago` ASC) VISIBLE,
  INDEX `fk_Factura_Municipio1_idx` (`Municipio_idMunicipio` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_Orden1`
    FOREIGN KEY (`Orden_idOrden`)
    REFERENCES `Proyecto2Bases1`.`Orden` (`idOrden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_formaPago1`
    FOREIGN KEY (`formaPago_idFormaPago`)
    REFERENCES `Proyecto2Bases1`.`FormaPago` (`idFormaPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Municipio1`
    FOREIGN KEY (`Municipio_idMunicipio`)
    REFERENCES `Proyecto2Bases1`.`Municipio` (`idMunicipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

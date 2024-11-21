-- MySQL Script for rbooks schema

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `rbooks` DEFAULT CHARACTER SET utf8 ;
USE `rbooks` ;

-- Table Cliente
CREATE TABLE IF NOT EXISTS `Cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;

-- Table Producto
CREATE TABLE IF NOT EXISTS `Producto` (
  `idproducto` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `generos` VARCHAR(45) NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `portada` VARCHAR(45) NOT NULL,
  `sinopsis` VARCHAR(255) NOT NULL,
  `fecha_publicacion` DATETIME NOT NULL,
  `idautor` INT NOT NULL,
  PRIMARY KEY (`idproducto`))
ENGINE = InnoDB;

-- Table Producto_Cliente
CREATE TABLE IF NOT EXISTS `Producto_Cliente` (
  `idproducto` INT NOT NULL,
  `idcliente` INT NOT NULL,
  PRIMARY KEY (`idproducto`, `idcliente`),
  CONSTRAINT `fk_producto_cliente_cliente`
    FOREIGN KEY (`idcliente`)
    REFERENCES `Cliente` (`idcliente`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_producto_cliente_producto`
    FOREIGN KEY (`idproducto`)
    REFERENCES `Producto` (`idproducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB;

-- Table Ventas
CREATE TABLE IF NOT EXISTS `Ventas` (
  `idventas` INT NOT NULL AUTO_INCREMENT,
  `fecha_hora` DATETIME NOT NULL,
  `dato` DECIMAL(45) NOT NULL,
  `precio` DECIMAL(100) NOT NULL,
  `precio_sin_IVA` DECIMAL(50) NOT NULL,
  `idcliente` INT NOT NULL,
  PRIMARY KEY (`idventas`),
  INDEX `idcliente_idx` (`idcliente`),
  CONSTRAINT `fk_ventas_cliente`
    FOREIGN KEY (`idcliente`)
    REFERENCES `Cliente` (`idcliente`)
    ON DELETE CASCADE)
ENGINE = InnoDB;

-- Table Ventas_Producto
CREATE TABLE IF NOT EXISTS `Ventas_Producto` (
  `idventas` INT NOT NULL,
  `idproducto` INT NOT NULL,
  PRIMARY KEY (`idventas`, `idproducto`),
  INDEX `idproducto_idx` (`idproducto`),
  CONSTRAINT `fk_ventas_producto_ventas`
    FOREIGN KEY (`idventas`)
    REFERENCES `Ventas` (`idventas`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_ventas_producto_producto`
    FOREIGN KEY (`idproducto`)
    REFERENCES `Producto` (`idproducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB;

-- Table Pago
CREATE TABLE IF NOT EXISTS `Pago` (
  `idpago` INT NOT NULL AUTO_INCREMENT,
  `coste_total` DECIMAL(100) NOT NULL,
  `metodo_pago` VARCHAR(45) NOT NULL,
  `idventa` INT NOT NULL,
  PRIMARY KEY (`idpago`),
  INDEX `idventa_idx` (`idventa`),
  CONSTRAINT `fk_pago_ventas`
    FOREIGN KEY (`idventa`)
    REFERENCES `Ventas` (`idventas`)
    ON DELETE CASCADE)
ENGINE = InnoDB;

-- Table Garantia
CREATE TABLE IF NOT EXISTS `Garantia` (
  `idgarantia` INT NOT NULL AUTO_INCREMENT,
  `duracion` INT NOT NULL,
  `cobertura` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idgarantia`))
ENGINE = InnoDB;

-- Table Producto_Garantia
CREATE TABLE IF NOT EXISTS `Producto_Garantia` (
  `idproducto` INT NOT NULL,
  `idgarantia` INT NOT NULL,
  PRIMARY KEY (`idproducto`, `idgarantia`),
  INDEX `idgarantia_idx` (`idgarantia`),
  CONSTRAINT `fk_producto_garantia_producto`
    FOREIGN KEY (`idproducto`)
    REFERENCES `Producto` (`idproducto`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_producto_garantia_garantia`
    FOREIGN KEY (`idgarantia`)
    REFERENCES `Garantia` (`idgarantia`)
    ON DELETE CASCADE)
ENGINE = InnoDB;

-- Table Autor
CREATE TABLE IF NOT EXISTS `Autor` (
  `idautor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `correo_electronico` VARCHAR(45) NOT NULL,
  `genero_literario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idautor`))
ENGINE = InnoDB;

-- Table Editorial
CREATE TABLE IF NOT EXISTS `Editorial` (
  `ideditorial` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(255) NOT NULL,
  `correo_electronico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ideditorial`))
ENGINE = InnoDB;

-- Table Editorial_Producto
CREATE TABLE IF NOT EXISTS `Editorial_Producto` (
  `ideditorial` INT NOT NULL,
  `idproducto` INT NOT NULL,
  PRIMARY KEY (`ideditorial`, `idproducto`),
  INDEX `idproducto_idx` (`idproducto`),
  CONSTRAINT `fk_editorial_producto`
    FOREIGN KEY (`ideditorial`)
    REFERENCES `Editorial` (`ideditorial`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_producto_editorial`
    FOREIGN KEY (`idproducto`)
    REFERENCES `Producto` (`idproducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB;

-- Table Mi_Biblioteca
CREATE TABLE IF NOT EXISTS `Mi_Biblioteca` (
  `idcliente` INT NOT NULL,
  `idproducto` INT NOT NULL,
  PRIMARY KEY (`idcliente`, `idproducto`),
  INDEX `idproducto_idx` (`idproducto`),
  CONSTRAINT `fk_mibiblioteca_cliente`
    FOREIGN KEY (`idcliente`)
    REFERENCES `Cliente` (`idcliente`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_mibiblioteca_producto`
    FOREIGN KEY (`idproducto`)
    REFERENCES `Producto` (`idproducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

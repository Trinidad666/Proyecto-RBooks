-- MySQL Script for rbooks schema

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `rbooks` DEFAULT CHARACTER SET utf8 ;
USE `rbooks` ;

-- Table Cliente
CREATE TABLE IF NOT EXISTS `Cliente` (
  -- Identificador único del cliente
  `idcliente` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador único para cada cliente',
  
  -- Información básica del cliente
  `usuario` VARCHAR(45) NOT NULL COMMENT 'Nombre de usuario único del cliente',
  `contraseña` VARCHAR(255) NOT NULL COMMENT 'Contraseña del cliente (encriptada)',
  `email` VARCHAR(100) NOT NULL COMMENT 'Correo electrónico del cliente',
  
  -- Información adicional
  `nombre` VARCHAR(100) NOT NULL COMMENT 'Nombre completo del cliente',
  `telefono` VARCHAR(15) DEFAULT NULL COMMENT 'Número de teléfono del cliente',
  `direccion` VARCHAR(255) DEFAULT NULL COMMENT 'Dirección del cliente',
  `fecha_nacimiento` DATE DEFAULT NULL COMMENT 'Fecha de nacimiento del cliente',
  `genero` ENUM('Masculino', 'Femenino') DEFAULT NULL COMMENT 'Género del cliente',
  
  -- Estado y registro
  `estado` ENUM('Activo', 'Inactivo') DEFAULT 'Activo' COMMENT 'Estado de la cuenta del cliente',
  `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación del registro',
  `ultima_actualizacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última fecha de modificación del registro',
  
  PRIMARY KEY (`idcliente`),
  
  -- Restricciones únicas
  UNIQUE INDEX `idx_usuario` (`usuario`),
  UNIQUE INDEX `idx_email` (`email`)
)
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='Tabla para almacenar información de los clientes';


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
  `dato` DECIMAL(10,2) NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `precio_sin_IVA` DECIMAL(10,2) NOT NULL,
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
  `coste_total` DECIMAL(10,2) NOT NULL,
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


-- Inserts para la tabla Cliente
INSERT INTO Cliente (usuario, contraseña, email, nombre, telefono, direccion, fecha_nacimiento, genero, estado)
VALUES
('jdoe', 'hashedpassword123', 'jdoe@example.com', 'John Doe', '1234567890', '123 Elm Street', '1980-05-15', 'Masculino', 'Activo'),
('asmith', 'securepassword', 'asmith@example.com', 'Anna Smith', '0987654321', '456 Oak Avenue', '1990-07-20', 'Femenino', 'Activo'),
('mjones', 'passw0rd!', 'mjones@example.com', 'Mark Jones', '1122334455', '789 Pine Road', '1985-10-10', 'Masculino', 'Inactivo');

-- Inserts para la tabla Producto
INSERT INTO Producto (titulo, generos, precio, portada, sinopsis, fecha_publicacion, idautor)
VALUES
('Cien años de soledad', 'Realismo Mágico', 19.99, 'cien_anos.jpg', 'La historia de la familia Buendía en Macondo...', '1967-05-30 00:00:00', 1),
('Orgullo y Prejuicio', 'Romance', 14.50, 'orgullo_prejuicio.jpg', 'La relación entre Elizabeth Bennet y Mr. Darcy...', '1813-01-28 00:00:00', 2),
('Harry Potter y la Piedra Filosofal', 'Fantasía', 25.00, 'hp_piedra_filosofal.jpg', 'Un joven descubre que es un mago...', '1997-06-26 00:00:00', 3);

-- Inserts para la tabla Autor
INSERT INTO Autor (nombre, correo_electronico, genero_literario)
VALUES
('Gabriel García Márquez', 'gabo@literatura.com', 'Realismo Mágico'),
('Jane Austen', 'jane.austen@fiction.com', 'Romance'),
('J.K. Rowling', 'jk.rowling@magicworld.com', 'Fantasía');

-- Inserts para la tabla Editorial
INSERT INTO Editorial (nombre, direccion, correo_electronico)
VALUES
('Editorial Planeta', 'Calle Literatura 123, Ciudad de México', 'contacto@planeta.com'),
('Penguin Random House', '123 Main Street, New York', 'info@penguinrandomhouse.com'),
('Bloomsbury Publishing', '50 Bedford Square, London', 'info@bloomsbury.com');

-- Inserts para la tabla Editorial_Producto
INSERT INTO Editorial_Producto (ideditorial, idproducto)
VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserts para la tabla Ventas
INSERT INTO Ventas (fecha_hora, dato, precio, precio_sin_IVA, idcliente)
VALUES
('2024-11-20 15:30:00', 19.99, 19.99, 16.52, 1),
('2024-11-20 16:00:00', 14.50, 14.50, 12.02, 2),
('2024-11-20 16:30:00', 25.00, 25.00, 20.66, 3);

-- Inserts para la tabla Ventas_Producto
INSERT INTO Ventas_Producto (idventas, idproducto)
VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserts para la tabla Pago
INSERT INTO Pago (coste_total, metodo_pago, idventa)
VALUES
(19.99, 'Tarjeta de Crédito', 1),
(14.50, 'Paypal', 2),
(25.00, 'Transferencia Bancaria', 3);

-- Inserts para la tabla Garantia
INSERT INTO Garantia (duracion, cobertura)
VALUES
(12, 'Cubre daños físicos y defectos de fábrica'),
(24, 'Cubre reparaciones y reemplazo'),
(36, 'Garantía extendida sin preguntas');

-- Inserts para la tabla Producto_Garantia
INSERT INTO Producto_Garantia (idproducto, idgarantia)
VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserts para la tabla Mi_Biblioteca
INSERT INTO Mi_Biblioteca (idcliente, idproducto)
VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserts para la tabla Producto_Cliente
INSERT INTO Producto_Cliente (idproducto, idcliente)
VALUES
(1, 1),
(2, 2),
(3, 3);







SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

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
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE = InnoDB;


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
  `tipo` INT NOT NULL,
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
INSERT INTO `Cliente` (`usuario`, `password`, `email`) VALUES
('jdoe', '123', 'jdoe@example.com'),
('asmith', 'my', 'asmith@example.com'),
('mjones', 'securepass', 'mjones@example.com');

-- Inserts para la tabla Autor
INSERT INTO `Autor` (`nombre`, `correo_electronico`, `genero_literario`) VALUES
('Gabriel García Márquez', 'gabo@literatura.com', 'Realismo Mágico'),
('Jane Austen', 'jane.austen@fiction.com', 'Romance'),
('J.K. Rowling', 'jk.rowling@magicworld.com', 'Fantasía');

-- Inserts para la tabla Producto
-- Libros 0
-- Comics 1
-- Audio Libros 2
INSERT INTO `Producto` (`titulo`, `generos`, `precio`, `portada`, `sinopsis`, `fecha_publicacion`, `idautor`, `tipo`) VALUES
-- Libris
('Canción Hielo Fuego', 'Fantasia', 25.00, 'rsc/libros/Canción-Hielo-Fuego.jpg', 'En un mundo medieval lleno de traición, guerras y magia, nobles familias luchan por el control del Trono de Hierro mientras fuerzas sobrenaturales amenazan desde el norte.', '06/08/1996', 1, 0),
('Don Quijote y Sancho', 'Novela clasica', 15.00, 'rsc/libros/don_quijote.jpg', 'Don Quijote y Sancho Panza son los icónicos protagonistas de Don Quijote de la Mancha de Cervantes: un idealista caballero que busca revivir la caballería y su pragmático escudero, formando un dúo que combina locura, humor y profundas reflexiones sobre la vida.', '16/01/1605', 2),
('El Resplandor', 'Terror', 20.00, 'rsc/libros/El-Resplandor.jpg', 'Un escritor en crisis acepta ser el cuidador de un hotel aislado en invierno, pero fuerzas sobrenaturales comienzan a afectarlo, poniendo a su familia en peligro.', '28/01/1977', 3, 0),
('El Retorno del Rey', 'Fantasia', 20.00, 'rsc/libros/El-Retorno-Del-Rey.jpg', 'La batalla final por la Tierra Media se desata mientras Frodo lucha por destruir el Anillo Único, y Aragorn reclama su lugar como rey en un acto decisivo de valentía.', '20/10/1955', 4, 0),
('Holly', 'Novela', 25.00, 'rsc/libros/Holly.jpg', 'La detective Holly Gibney investiga la desaparición de una joven, descubriendo un oscuro secreto oculto por un matrimonio aparentemente respetable.', '05/09/2023', 5, 0),
('La reina del sur', 'Novela', 15.00, 'rsc/libros/La-reina-del-sur.jpg', 'Teresa Mendoza, una joven mexicana, se convierte en la reina de un imperio de drogas tras la muerte de su novio. En su ascenso al poder, enfrenta traiciones y luchas de poder.', '07/11/2002', 6, 0),
('La Cúpula', 'Ciencia ficcion', 25.00, 'rsc/libros/La-Cúpula.jpg', 'En un pequeño pueblo de Maine, una misteriosa cúpula invisible desciende repentinamente, aislando a sus habitantes del mundo exterior. Mientras la ciudad cae en el caos, surgen luchas de poder y secretos oscuros.', '10/11/2009', 7, 0),
('La Nievla', 'Terror', 9.00, 'rsc/libros/La-Nievla.jpg', 'Tras una tormenta en Bridgton, Maine, una densa niebla envuelve el pueblo, trayendo consigo criaturas mortales. Un grupo de personas se refugia en un supermercado, mientras enfrentan el pánico y luchan por sobrevivir.', '01/06/1980', 8, 0),
('La Torre Oscura', 'Terror', 45.00, 'rsc/libros/La-Torre_Oscura.jpg', 'Roland Deschain, el último de los pistoleros, emprende un viaje peligroso a través de un mundo moribundo para alcanzar la mítica Torre Oscura, el centro de todo el universo, mientras enfrenta criaturas, traiciones y su propio destino.', '08/06/1982', 9, 0),
('El señor de los anillos', 'Fantasia', 40.00, 'rsc/libros/lord-of-the-rings.jpg', 'El Señor de los Anillos es una épica historia de fantasía en la que un grupo diverso lucha por destruir un anillo maligno que amenaza con sumir al mundo en oscuridad.', '29/07/1954', 10, 0),
('Los señores de la guerra', 'Historia', 20.00, 'rsc/libros/señores-de-la-guerra.jpg', 'El libro explora la figura de los mercenarios y los "señores de la guerra" a lo largo de la historia, analizando su influencia en conflictos bélicos y la política internacional, centrado en la figura de los combatientes privados y sus operaciones.', '17/03/2014', 11, 0),
('The Thing', 'Terror', 15.00, 'rsc/libros/The-Thing.jpg', 'Un grupo de investigadores en la Antártida se enfrenta a un alienígena que puede imitar perfectamente a cualquier ser vivo, desatando caos, desconfianza y lucha por sobrevivir.', '01/01/1982', 12, 0),

-- Comics
('One Piece', 'Shonen', 8.00, 'rsc/comic/one_piece.jpg', 'Un joven pirata llamado Monkey D. Luffy busca el legendario tesoro "One Piece" para convertirse en el Rey de los Piratas, mientras enfrenta peligros, hace amigos y enfrenta poderosos enemigos.', '22/07/1997', 1, 1),
('Batman: Más Allá del Caballero Blanco', 'Superheroes', 15.00, 'rsc/comic/Batman-Caballero-Blanco.jpg', 'En un futuro distópico, Terry McGinnis asume el manto de Batman bajo la tutela de un envejecido Bruce Wayne, mientras Gotham enfrenta nuevas amenazas y el legado del Caballero Oscuro se pone a prueba.', '29/11/2022', 2, 1),
('Berserk', 'Terror', 12.00, 'rsc/comic/Berserk.jpg', 'La historia sigue a Guts, un guerrero solitario marcado por la tragedia, mientras lucha contra fuerzas demoníacas y humanas en un mundo medieval brutal, buscando venganza y su propósito en la vida.', '25/08/1989', 3, 1),
('Marvel: Civil War', 'Superheroes', 22.00, 'rsc/comic/civil_war.jpg', 'Un conflicto dividido entre los héroes de Marvel, donde el gobierno exige que los superhéroes se registren públicamente, lo que provoca una confrontación entre Iron Man, a favor del registro, y Capitán América, en contra.', '01/03/2006', 4, 1),
('The Darkness', 'Superheroes', 19.00, 'rsc/comic/Darkness.jpg', 'Jackie Estacado, un hombre con la habilidad de controlar una fuerza oscura y maligna heredada, lucha por equilibrar su vida como mafioso con los horrores que su poder desata, mientras se enfrenta a enemigos sobrenaturales.', '01/08/1996', 5, 1),
('Hellboy: Enamorado', 'Fantasia', 14.00, 'rsc/comic/Hellboy.jpeg', 'Hellboy, el demonio que trabaja para la Agencia de Investigación y Defensa Paranormal, se enfrenta a fuerzas sobrenaturales mientras lidia con su propia naturaleza demoníaca y su relación con una mujer que desafía su destino.', '01/01/2004', 6, 1),
('Pestilence', 'Terror', 15.00, 'rsc/comic/Pestilencia.jpg', 'En la Edad Media, un grupo de caballeros luchan contra la peste que arrasa Europa, solo para descubrir que la plaga tiene un origen sobrenatural y debe ser enfrentada con poderosas fuerzas oscuras.', '01/06/2017', 7, 1),
('Batman: El Regreso del Caballero Oscuro', 'Superheroes', 30.00, 'rsc/comic/regreso_caballero_oscuro.jpg', 'En un futuro distópico, un envejecido Bruce Wayne regresa como Batman para salvar Gotham, enfrentándose a nuevas amenazas mientras lucha contra sus propios demonios personales y la decadencia de la ciudad.', '10/02/1986', 8, 1),
('Sin City', 'Noir', 10.00, 'rsc/comic/sin_city.jpg', 'En la corrupta y violenta ciudad de Basin City, varios relatos entrelazados siguen a personajes como Marv, un antihéroe con sed de venganza, mientras enfrentan traiciones, crimen y brutalidad en un mundo de sombras.', '01/04/1991', 9, 1),
('Solo Leveling', 'Accion', 15.00, 'rsc/comic/Solo_Leveling.jpg', 'Jinwoo, un cazador débil en un mundo donde los humanos luchan contra monstruos, obtiene la habilidad de "subir de nivel" solo, lo que le permite convertirse en el cazador más poderoso mientras enfrenta peligros y misterios sobrenaturales.', '04/03/2018', 10, 1),
('Spawn', 'Superheroes', 15.00, 'rsc/comic/Spawn.jpg', 'Al Simmons, un exagente de la CIA que muere y es enviado al infierno, se convierte en Spawn, un anti-héroe con poderes infernales, luchando contra demonios, corrupción y su propio destino mientras busca redención.', '29/05/1992', 11, 1),
('Lobezno: El Viejo Logan', 'Superheroes', 15.00, 'rsc/comic/viejo-logan.jpg', 'En un futuro distópico, un envejecido Lobezno vive retirado, incapaz de usar sus garras debido a un trauma pasado, pero se ve obligado a regresar a la acción cuando la América post-apocalíptica se enfrenta a nuevas amenazas.', '01/06/2008', 12, 1),

-- Audio Librios
('A Mala Sangre', 'Misterio', 12.00, 'rsc/audio/A Mala-Sangre.jpg', 'Un detective y una periodista investigan una serie de crímenes relacionados con una familia poderosa, destapando secretos oscuros y peligrosos que los llevan a enfrentarse con la verdad.', '19/05/2020', 1, 2),
('Al Sur del Mundo', 'Aventura', 20.00, 'rsc/audio/Al-Sur-del-Mundo.jpg', 'Narra la historia de un explorador que se embarca en un viaje hacia las regiones más remotas de la Tierra, enfrentándose a los desafíos del desierto, la soledad y la lucha por la supervivencia en territorios inexplorados.', '07/06/2021', 2, 2),
('Amor Salvaje', 'Romance', 15.00, 'rsc/audio/Amor-Salvaje.jpg', 'Una apasionada historia de amor entre dos personas que, a pesar de las dificultades y diferencias, se enfrentan a sus propios miedos y luchan por un amor auténtico y salvaje.', '08/03/2018', 3, 2),
('Diario de Supervivencia Zombie', 'Apocalíptico', 15.00, 'rsc/audio/Diario-de-Supervivencia-Zombi.jpg', 'Un hombre documenta su lucha por sobrevivir en un mundo post-apocalíptico lleno de zombis, enfrentando peligros tanto de los muertos como de los seres humanos que quedan.', '07/04/2015', 4, 2),
('El Gato Negro', 'Misterio', 15.00, 'rsc/audio/El-Gato-Negro.jpg', 'En este relato, un hombre narra cómo su vida se desmorona tras adoptar un gato negro, desatando una espiral de violencia y locura que lo lleva a cometer actos atroces.', '01/08/1843', 5, 2),
('El Regalo', 'Misterio', 5.00, 'rsc/audio/El-Regalo.jpg', 'La historia sigue a un hombre que recibe un regalo misterioso que cambia su vida, enfrentándolo a situaciones imprevistas que ponen a prueba su moralidad y su visión del mundo.', '12/11/2016', 6, 2),
('El Reloj de Bolsillo', 'Suspenso', 9.00, 'rsc/audio/El-Reloj-de-Bolsillo.jpg', 'Un hombre se ve atrapado en una serie de extraños eventos tras recibir un antiguo reloj de bolsillo, lo que desata una cadena de sucesos que lo llevan a enfrentarse a oscuros secretos del pasado.', '15/04/2012', 7, 2),
('Entre Selva y Hielo', 'Aventura', 20.00, 'rsc/audio/Entre-la-Selva-y-el-Hielo.jpg', 'La obra narra la experiencia de un grupo de exploradores que enfrentan los desafíos extremos de la selva y el hielo, luchando por sobrevivir en condiciones implacables mientras buscan descubrir lo desconocido.', '06/10/2017', 8, 2),
('La Divina Comedia', 'Poesia', 15.00, 'rsc/audio/La-Divina-Comedia.jpg', 'La obra maestra de Dante Alighieri relata el viaje del poeta a través del Infierno, el Purgatorio y el Paraíso, guiado por Virgilio y Beatriz, en una alegoría sobre el alma humana y su destino eterno.', '1320', 9, 2),
('La Visión', 'Suspenso', 15.00, 'rsc/audio/La-Visión.jpg', 'La historia sigue a un protagonista que experimenta una serie de visiones misteriosas que lo llevan a descubrir secretos ocultos, enfrentando dilemas morales mientras busca respuestas.', '15/05/2019', 10, 2),
('Oscuridad', 'Horror', 15.00, 'rsc/audio/Oscuridad.jpg', 'Un hombre se enfrenta a sus peores miedos cuando una serie de extraños eventos lo sumergen en un mundo de oscuridad literal y metafórica, desafiando su comprensión de la realidad y su propia cordura.', '13/08/2018', 11, 2),
('Terror de Terrores', 'Horror', 15.00, 'rsc/audio/Terror-De-Terrores.jpg', 'Una colección de relatos escalofriantes que exploran los miedos más profundos y lo sobrenatural, llevando al lector a enfrentarse a horrores indescriptibles y situaciones extremas de terror psicológico.', '22/10/2015', 12, 2),





-- Inserts para la tabla Editorial
INSERT INTO `Editorial` (`nombre`, `direccion`, `correo_electronico`) VALUES
('Editorial Planeta', 'Calle Literatura 123, Ciudad de México', 'contacto@planeta.com'),
('Penguin Random House', '123 Main Street, New York', 'info@penguinrandomhouse.com'),
('Bloomsbury Publishing', '50 Bedford Square, London', 'info@bloomsbury.com');

-- Inserts para la tabla Editorial_Producto
INSERT INTO `Editorial_Producto` (`ideditorial`, `idproducto`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserts para la tabla Ventas
INSERT INTO `Ventas` (`fecha_hora`, `dato`, `precio`, `precio_sin_IVA`, `idcliente`) VALUES
('2024-11-20 15:30:00', 19.99, 19.99, 16.52, 1),
('2024-11-20 16:00:00', 14.50, 14.50, 12.02, 2),
('2024-11-20 16:30:00', 25.00, 25.00, 20.66, 3);

-- Inserts para la tabla Ventas_Producto
INSERT INTO `Ventas_Producto` (`idventas`, `idproducto`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserts para la tabla Pago
INSERT INTO `Pago` (`coste_total`, `metodo_pago`, `idventa`) VALUES
(19.99, 'Tarjeta de Crédito', 1),
(14.50, 'Paypal', 2),
(25.00, 'Transferencia Bancaria', 3);

-- Inserts para la tabla Garantia
INSERT INTO `Garantia` (`duracion`, `cobertura`) VALUES
(12, 'Cubre daños físicos y defectos de fábrica'),
(24, 'Cubre reparaciones y reemplazo'),
(36, 'Garantía extendida sin preguntas');

-- Inserts para la tabla Producto_Garantia
INSERT INTO `Producto_Garantia` (`idproducto`, `idgarantia`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserts para la tabla Mi_Biblioteca
INSERT INTO `Mi_Biblioteca` (`idcliente`, `idproducto`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserts para la tabla Producto_Cliente
INSERT INTO `Producto_Cliente` (`idproducto`, `idcliente`) VALUES
(1, 1),
(2, 2),
(3, 3);






SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

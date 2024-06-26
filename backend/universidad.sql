-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.1.2-MariaDB-1:11.1.2+maria~ubu2204 - mariadb.org binary distribution
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para universidad
DROP DATABASE IF EXISTS `universidad`;
CREATE DATABASE IF NOT EXISTS `universidad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `universidad`;

-- Volcando estructura para tabla universidad.alumno
DROP TABLE IF EXISTS `alumno`;
CREATE TABLE IF NOT EXISTS `alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nif` varchar(9) DEFAULT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `ciudad` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('H','M') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif` (`nif`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla universidad.alumno: ~12 rows (aproximadamente)
DELETE FROM `alumno`;
INSERT INTO `alumno` (`id`, `nif`, `nombre`, `apellido1`, `apellido2`, `ciudad`, `direccion`, `telefono`, `fecha_nacimiento`, `sexo`) VALUES
	(1, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992-08-08', 'H'),
	(2, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991-03-28', 'H'),
	(4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000-10-05', 'H'),
	(6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998-01-28', 'H'),
	(7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999-05-24', 'H'),
	(9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996-11-21', 'H'),
	(11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997-04-26', 'H'),
	(19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998-09-01', 'M'),
	(21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998-01-01', 'H'),
	(22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999-02-11', 'H'),
	(23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996-03-12', 'M'),
	(24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995-04-13', 'M');

-- Volcando estructura para tabla universidad.alumno_se_matricula_asignatura
DROP TABLE IF EXISTS `alumno_se_matricula_asignatura`;
CREATE TABLE IF NOT EXISTS `alumno_se_matricula_asignatura` (
  `alumno_id` int(10) unsigned NOT NULL,
  `asignatura_id` int(10) unsigned NOT NULL,
  `nota` int(10) unsigned NOT NULL,
  PRIMARY KEY (`alumno_id`,`asignatura_id`) USING BTREE,
  KEY `id_asignatura` (`asignatura_id`) USING BTREE,
  CONSTRAINT `alumno_se_matricula_asignatura_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`),
  CONSTRAINT `alumno_se_matricula_asignatura_ibfk_2` FOREIGN KEY (`asignatura_id`) REFERENCES `asignatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla universidad.alumno_se_matricula_asignatura: ~35 rows (aproximadamente)
DELETE FROM `alumno_se_matricula_asignatura`;
INSERT INTO `alumno_se_matricula_asignatura` (`alumno_id`, `asignatura_id`, `nota`) VALUES
	(1, 1, 6),
	(1, 2, 5),
	(1, 3, 9),
	(1, 4, 1),
	(1, 8, 1),
	(1, 9, 10),
	(1, 10, 1),
	(1, 40, 4),
	(1, 80, 2),
	(2, 5, 3),
	(2, 6, 4),
	(2, 7, 8),
	(4, 2, 8),
	(6, 3, 6),
	(6, 7, 3),
	(6, 8, 7),
	(6, 9, 6),
	(6, 10, 2),
	(7, 2, 3),
	(9, 3, 7),
	(11, 1, 4),
	(11, 2, 9),
	(11, 3, 10),
	(11, 11, 1),
	(19, 5, 10),
	(19, 6, 2),
	(21, 2, 9),
	(21, 3, 2),
	(21, 12, 10),
	(21, 23, 15),
	(24, 1, 2),
	(24, 2, 4),
	(24, 3, 15),
	(24, 4, 8),
	(24, 30, 6);

-- Volcando estructura para tabla universidad.asignatura
DROP TABLE IF EXISTS `asignatura`;
CREATE TABLE IF NOT EXISTS `asignatura` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `creditos` float unsigned NOT NULL,
  `tipo` enum('básica','obligatoria','optativa') NOT NULL,
  `curso` tinyint(3) unsigned NOT NULL,
  `cuatrimestre` tinyint(3) unsigned NOT NULL,
  `id_profesor` int(10) unsigned DEFAULT NULL,
  `id_grado` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_profesor` (`id_profesor`),
  KEY `id_grado` (`id_grado`),
  CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`),
  CONSTRAINT `asignatura_ibfk_2` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla universidad.asignatura: ~83 rows (aproximadamente)
DELETE FROM `asignatura`;
INSERT INTO `asignatura` (`id`, `nombre`, `creditos`, `tipo`, `curso`, `cuatrimestre`, `id_profesor`, `id_grado`) VALUES
	(1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, NULL, 4),
	(2, 'Cálculo', 6, 'básica', 1, 1, NULL, 4),
	(3, 'Física para informática', 6, 'básica', 1, 1, NULL, 4),
	(4, 'Introducción a la programación', 6, 'básica', 1, 1, NULL, 4),
	(5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, NULL, 4),
	(6, 'Estadística', 6, 'básica', 1, 2, NULL, 4),
	(7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, NULL, 4),
	(8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, NULL, 4),
	(9, 'Lógica y algorítmica', 6, 'básica', 1, 2, NULL, 4),
	(10, 'Metodología de la programación', 6, 'básica', 1, 2, NULL, 4),
	(11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4),
	(12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4),
	(13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4),
	(14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4),
	(15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4),
	(16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4),
	(17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4),
	(18, 'Fundamentos de Redes de Computadores', 6, 'obligatoria', 2, 2, 3, 4),
	(19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4),
	(20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4),
	(21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4),
	(22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4),
	(23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
	(24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4),
	(25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4),
	(26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4),
	(27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
	(28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4),
	(29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4),
	(30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4),
	(31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4),
	(32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4),
	(33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4),
	(34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4),
	(35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4),
	(36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4),
	(37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4),
	(38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4),
	(39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4),
	(40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4),
	(41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4),
	(42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4),
	(43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4),
	(44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4),
	(45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4),
	(46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4),
	(47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4),
	(48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4),
	(49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4),
	(50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4),
	(51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4),
	(52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7),
	(53, 'Física', 6, 'básica', 1, 1, NULL, 7),
	(54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7),
	(55, 'Química general', 6, 'básica', 1, 1, NULL, 7),
	(56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7),
	(57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7),
	(58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7),
	(59, 'Genética', 6, 'básica', 1, 2, NULL, 7),
	(60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7),
	(61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7),
	(62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7),
	(63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7),
	(64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7),
	(65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7),
	(66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7),
	(67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7),
	(68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7),
	(69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7),
	(70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7),
	(71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7),
	(72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7),
	(73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7),
	(74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7),
	(75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7),
	(76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7),
	(77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7),
	(78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7),
	(79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7),
	(80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7),
	(81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7),
	(82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7),
	(83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

-- Volcando estructura para tabla universidad.departamento
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla universidad.departamento: ~9 rows (aproximadamente)
DELETE FROM `departamento`;
INSERT INTO `departamento` (`id`, `nombre`) VALUES
	(1, 'Informática'),
	(2, 'Matemáticas'),
	(3, 'Economía y Empresa'),
	(4, 'Educación'),
	(5, 'Agronomía'),
	(6, 'Química y Física'),
	(7, 'Filología'),
	(8, 'Derecho'),
	(9, 'Biología y Geología');

-- Volcando estructura para tabla universidad.grado
DROP TABLE IF EXISTS `grado`;
CREATE TABLE IF NOT EXISTS `grado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla universidad.grado: ~10 rows (aproximadamente)
DELETE FROM `grado`;
INSERT INTO `grado` (`id`, `nombre`) VALUES
	(1, 'Grado en Ingeniería Agrícola (Plan 2015)'),
	(2, 'Grado en Ingeniería Eléctrica (Plan 2014)'),
	(3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)'),
	(4, 'Grado en Ingeniería Informática (Plan 2015)'),
	(5, 'Grado en Ingeniería Mecánica (Plan 2010)'),
	(6, 'Grado en Ingeniería Química Industrial (Plan 2010)'),
	(7, 'Grado en Biotecnología (Plan 2015)'),
	(8, 'Grado en Ciencias Ambientales (Plan 2009)'),
	(9, 'Grado en Matemáticas (Plan 2010)'),
	(10, 'Grado en Química (Plan 2009)');

-- Volcando estructura para tabla universidad.profesor
DROP TABLE IF EXISTS `profesor`;
CREATE TABLE IF NOT EXISTS `profesor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nif` varchar(9) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `ciudad` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('H','M') NOT NULL,
  `id_departamento` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif` (`nif`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla universidad.profesor: ~15 rows (aproximadamente)
DELETE FROM `profesor`;
INSERT INTO `profesor` (`id`, `nif`, `nombre`, `apellido1`, `apellido2`, `ciudad`, `direccion`, `telefono`, `fecha_nacimiento`, `sexo`, `id_departamento`) VALUES
	(3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979-08-19', 'M', 1),
	(5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978-01-19', 'H', 2),
	(8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977-08-21', 'M', 3),
	(10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977-05-19', 'M', 4),
	(12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 4),
	(13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980-02-01', 'H', 6),
	(14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977-01-02', 'H', 1),
	(15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980-03-14', 'H', 2),
	(16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982-03-18', 'H', 3),
	(17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973-05-05', 'H', 4),
	(18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976-02-25', 'H', 5),
	(20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980-10-31', 'H', 6),
	(21, '13175769N', 'Pepe', 'Sánchez', 'Ruiz', 'Almería', 'C/ Quinto pino', NULL, '1980-10-16', 'H', 1),
	(22, '98816696W', 'Juan', 'Guerrero', 'Martínez', 'Almería', 'C/ Quinto pino', NULL, '1980-11-21', 'H', 1),
	(23, '77194445M', 'María', 'Domínguez', 'Hernández', 'Almería', 'C/ Quinto pino', NULL, '1980-12-13', 'M', 2);

-- Volcando estructura para tabla universidad.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_kfsp0s1tflm1cwlj8idhqsad0` (`email`),
  UNIQUE KEY `UK_3m5n1w5trapxlbo2s42ugwdmd` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla universidad.usuarios: ~2 rows (aproximadamente)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`id`, `activo`, `apellidos`, `email`, `nombre`, `password`, `role`, `usuario`) VALUES
	(2, 1, 'admin', 'admin@gmail.com', 'admin', '$2a$15$j3fb0YSndVUjE976hDV/j.oj7itNMxhy.xyD/7RhH4paOcpOOhEkG', 'ROLE_ADMIN', 'admin'),
	(3, 1, 'Durán', 'jgardur081@g.educaand.es', 'Chema', '$2a$15$j3fb0YSndVUjE976hDV/j.oj7itNMxhy.xyD/7RhH4paOcpOOhEkG', 'ROLE_USER', 'chema');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

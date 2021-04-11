-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.22 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para universidadpublic
CREATE DATABASE IF NOT EXISTS `universidadpublic` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universidadpublic`;

-- Volcando estructura para tabla universidadpublic.area
CREATE TABLE IF NOT EXISTS `area` (
  `idarea` char(2) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(28) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idarea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla universidadpublic.area: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` (`idarea`, `descripcion`) VALUES
	('01', 'Datos');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;

-- Volcando estructura para tabla universidadpublic.carga_academica
CREATE TABLE IF NOT EXISTS `carga_academica` (
  `idcarga` char(8) COLLATE utf8_bin NOT NULL,
  `idplan` char(2) COLLATE utf8_bin NOT NULL,
  `idescuela` char(3) COLLATE utf8_bin NOT NULL,
  `idcurso` char(5) COLLATE utf8_bin NOT NULL,
  `iddocente` char(4) COLLATE utf8_bin NOT NULL,
  `idsede` char(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `semestre` char(6) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idcarga`),
  KEY `idPlanFK` (`idplan`),
  KEY `idEscuelaKF` (`idescuela`),
  KEY `idCursoFK` (`idcurso`),
  KEY `idDocenteFK` (`iddocente`),
  KEY `idSedeFK` (`idsede`),
  CONSTRAINT `idCursoFK` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idDocenteFK` FOREIGN KEY (`iddocente`) REFERENCES `docente` (`iddocente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idEscuelaKF` FOREIGN KEY (`idescuela`) REFERENCES `escuela` (`idescuela`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idPlanFK` FOREIGN KEY (`idplan`) REFERENCES `plan_estudios` (`idplan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idSedeFK` FOREIGN KEY (`idsede`) REFERENCES `sede` (`idsede`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla universidadpublic.carga_academica: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `carga_academica` DISABLE KEYS */;
/*!40000 ALTER TABLE `carga_academica` ENABLE KEYS */;

-- Volcando estructura para tabla universidadpublic.curso
CREATE TABLE IF NOT EXISTS `curso` (
  `idcurso` char(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `idarea` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nombre` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idcurso`),
  KEY `idAreaKF` (`idarea`),
  CONSTRAINT `idAreaKF` FOREIGN KEY (`idarea`) REFERENCES `area` (`idarea`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla universidadpublic.curso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` (`idcurso`, `idarea`, `nombre`) VALUES
	('01', '01', 'Base de Datos');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;

-- Volcando estructura para tabla universidadpublic.docente
CREATE TABLE IF NOT EXISTS `docente` (
  `iddocente` char(4) COLLATE utf8_bin NOT NULL,
  `idProfesion` char(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `apellidos` varchar(32) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(32) COLLATE utf8_bin NOT NULL,
  `domicilio` varchar(40) COLLATE utf8_bin NOT NULL,
  `telefonoCelu` char(12) COLLATE utf8_bin DEFAULT NULL,
  `telefonoFijo` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`iddocente`),
  KEY `idProfesionFK` (`idProfesion`),
  CONSTRAINT `idProfesionFK` FOREIGN KEY (`idProfesion`) REFERENCES `profesion` (`idprofesion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla universidadpublic.docente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;

-- Volcando estructura para tabla universidadpublic.escuela
CREATE TABLE IF NOT EXISTS `escuela` (
  `idescuela` char(3) COLLATE utf8_bin NOT NULL,
  `idfacultad` char(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `nombre` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idescuela`),
  KEY `idFacultadFK` (`idfacultad`),
  CONSTRAINT `idFacultadFK` FOREIGN KEY (`idfacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla universidadpublic.escuela: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `escuela` DISABLE KEYS */;
INSERT INTO `escuela` (`idescuela`, `idfacultad`, `nombre`) VALUES
	('01', '01', 'Ingeniería de Sistemas'),
	('02', '01', 'Ingeniería Pesquera'),
	('03', '03', 'Derecho'),
	('05', '01', 'Inegniería Mecatronica'),
	('06', '03', 'Contabilidad'),
	('07', '01', 'Ingeniería Civil');
/*!40000 ALTER TABLE `escuela` ENABLE KEYS */;

-- Volcando estructura para tabla universidadpublic.facultad
CREATE TABLE IF NOT EXISTS `facultad` (
  `idfacultad` char(2) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(24) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idfacultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla universidadpublic.facultad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` (`idfacultad`, `nombre`) VALUES
	('01', 'Ingeniería'),
	('02', 'Medicina'),
	('03', 'Ciencias');
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;

-- Volcando estructura para tabla universidadpublic.plan_estudios
CREATE TABLE IF NOT EXISTS `plan_estudios` (
  `idplan` char(2) COLLATE utf8_bin NOT NULL,
  `idescuela` char(3) COLLATE utf8_bin NOT NULL,
  `idcurso` char(5) COLLATE utf8_bin NOT NULL,
  `ciclo` int NOT NULL,
  `horasteoricas` int DEFAULT NULL,
  `horaspracticas` int DEFAULT NULL,
  `horaslaboratorio` int DEFAULT NULL,
  `nrocreditos` int NOT NULL,
  PRIMARY KEY (`idplan`),
  KEY `idEscuelaFK` (`idescuela`),
  KEY `idCrusoKF` (`idcurso`),
  CONSTRAINT `idCrusoKF` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idEscuelaFK` FOREIGN KEY (`idescuela`) REFERENCES `escuela` (`idescuela`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla universidadpublic.plan_estudios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `plan_estudios` DISABLE KEYS */;
INSERT INTO `plan_estudios` (`idplan`, `idescuela`, `idcurso`, `ciclo`, `horasteoricas`, `horaspracticas`, `horaslaboratorio`, `nrocreditos`) VALUES
	('01', '01', '01', 1, 5, 6, 2, 5),
	('02', '02', '01', 2, 4, 4, 4, 4);
/*!40000 ALTER TABLE `plan_estudios` ENABLE KEYS */;

-- Volcando estructura para tabla universidadpublic.profesion
CREATE TABLE IF NOT EXISTS `profesion` (
  `idprofesion` char(3) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idprofesion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla universidadpublic.profesion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;

-- Volcando estructura para tabla universidadpublic.sede
CREATE TABLE IF NOT EXISTS `sede` (
  `idsede` char(3) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(28) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idsede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla universidadpublic.sede: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;

-- Volcando estructura para procedimiento universidadpublic.spActualizarEscuela
DELIMITER //
CREATE PROCEDURE `spActualizarEscuela`(
	IN `idF` CHAR(5),
	IN `nom` VARCHAR(100),
	IN `idE` CHAR(5)
)
BEGIN
	UPDATE escuela SET idfacultad = idF, nombre = nom
	WHERE idescuela = idE;
END//
DELIMITER ;

-- Volcando estructura para procedimiento universidadpublic.spAgregarEscuela
DELIMITER //
CREATE PROCEDURE `spAgregarEscuela`(
	IN `idE` CHAR(5),
	IN `idF` CHAR(5),
	IN `Nom` VARCHAR(100)
)
BEGIN
	INSERT INTO escuela
	VALUES (idE, idF, Nom);
END//
DELIMITER ;

-- Volcando estructura para procedimiento universidadpublic.spBuscarEscuela
DELIMITER //
CREATE PROCEDURE `spBuscarEscuela`(
	IN `id` CHAR(4)
)
BEGIN
	SELECT e.idescuela, f.nombre, e.nombre
	FROM escuela e
	INNER JOIN facultad f
		ON e.idfacultad = f.idfacultad
	WHERE e.idescuela LIKE CONCAT('%', id, '%');
END//
DELIMITER ;

-- Volcando estructura para procedimiento universidadpublic.spBuscarPorEscuela
DELIMITER //
CREATE PROCEDURE `spBuscarPorEscuela`(
	IN `id` CHAR(5)
)
BEGIN
	SELECT c.idcurso, c.nombre, e.nombre
	FROM plan_estudios p
	INNER JOIN escuela e
		ON p.idescuela = e.idescuela
	INNER JOIN curso c
		ON p.idcurso = c.idcurso
	WHERE e.idescuela LIKE CONCAT('%', id, '%');
END//
DELIMITER ;

-- Volcando estructura para procedimiento universidadpublic.spComboFacultad
DELIMITER //
CREATE PROCEDURE `spComboFacultad`()
BEGIN
	SELECT * FROM facultad;
END//
DELIMITER ;

-- Volcando estructura para procedimiento universidadpublic.spEliminarEscuela
DELIMITER //
CREATE PROCEDURE `spEliminarEscuela`(
	IN `id` CHAR(5)
)
BEGIN
	DELETE FROM escuela
	WHERE idescuela = id;
END//
DELIMITER ;

-- Volcando estructura para procedimiento universidadpublic.spMostrarCurso
DELIMITER //
CREATE PROCEDURE `spMostrarCurso`()
BEGIN
	SELECT c.idcurso, c.nombre, e.nombre
	FROM plan_estudios p
	INNER JOIN escuela e
		ON p.idescuela = e.idescuela
	INNER JOIN curso c
		ON p.idcurso = c.idcurso;
END//
DELIMITER ;

-- Volcando estructura para procedimiento universidadpublic.spMostrarEscuela
DELIMITER //
CREATE PROCEDURE `spMostrarEscuela`()
BEGIN
	SELECT e.idescuela, f.nombre, e.nombre
	FROM escuela e
	INNER JOIN facultad f
		ON e.idfacultad = f.idfacultad;
END//
DELIMITER ;

-- Volcando estructura para procedimiento universidadpublic.spMostrarPlanEstudios
DELIMITER //
CREATE PROCEDURE `spMostrarPlanEstudios`()
BEGIN
	SELECT p.idplan, e.nombre, c.nombre, p.ciclo, p.horasteoricas, p.horaspracticas,
	p.horaslaboratorio, p.nrocreditos
	FROM plan_estudios p
	INNER JOIN escuela e
		ON p.idescuela = e.idescuela
	INNER JOIN facultad f
		ON e.idfacultad = f.idfacultad
	INNER JOIN curso c
		ON p.idcurso = c.idcurso
	INNER JOIN area a
		ON c.idarea = a.idarea;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

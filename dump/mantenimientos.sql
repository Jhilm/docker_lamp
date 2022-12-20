-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 06, 2022 at 09:33 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mantenimientos`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Activo_add` (IN `_NITPROVEEDOR` VARCHAR(30), IN `_CODMODELO` INT, IN `_DESCRIPCION` VARCHAR(150), IN `_ESTADOACTIVO` TINYINT, IN `_CODPROCEDENCIA` INT, IN `_CODACTIVOFIJO` VARCHAR(15), IN `_SERIE` LONGTEXT, IN `_ANIOFABRICACION` INT, IN `_FECHAINGRESO` DATE, IN `_FOTOGRAFIA` LONGBLOB, IN `_USUARIOREGISTRO` INT)  BEGIN
INSERT INTO activo(NITPROVEEDOR,CODMODELO,DESCRIPCION,ESTADOACTIVO,CODPROCEDENCIA,CODACTIVOFIJO,SERIE,ANIOFABRICACION,FECHAINGRESO,FOTOGRAFIA,USUARIOREGISTRO) VALUES (_NITPROVEEDOR,_CODMODELO,_DESCRIPCION,'1',_CODPROCEDENCIA,_CODACTIVOFIJO,_SERIE,_ANIOFABRICACION,_FECHAINGRESO,_FOTOGRAFIA,_USUARIOREGISTRO);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Activo_disable` (IN `_CODACTIVO` INT)  BEGIN
UPDATE activo SET ESTADOACTIVO='0' WHERE CODACTIVO = _CODACTIVO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Activo_enable` (IN `_CODACTIVO` INT)  BEGIN
UPDATE activo SET ESTADOACTIVO='1' WHERE CODACTIVO = _CODACTIVO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Activo_search` (IN `_DESCRIPCION` VARCHAR(250))  BEGIN
	SELECT CODACTIVO,NITPROVEEDOR,CODMODELO,DESCRIPCION,CODPROCEDENCIA,CODACTIVOFIJO,SERIE,ANIOFABRICACION,FECHAINGRESO,FOTOGRAFIA,FHREGSERV,FECHAMODIFICACION,USUARIOREGISTRO,ESTADOACTIVO
    FROM activo
    WHERE DESCRIPCION=_DESCRIPCION;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Activo_update` (IN `_CODACTIVO` INT(11), IN `_NITPROVEEDOR` VARCHAR(30), IN `_CODMODELO` INT(11), IN `_DESCRIPCION` VARCHAR(150), IN `_CODPROCEDENCIA` INT(11), IN `_CODACTIVOFIJO` VARCHAR(15), IN `_SERIE` LONGTEXT, IN `_ANIOFABRICACION` INT(11), IN `_FECHAINGRESO` DATE, IN `_FOTOGRAFIA` LONGBLOB, IN `_FECHAMODIFICACION` DATE, IN `_USUARIOREGISTRO` INT(11), IN `_ESTADOACTIVO` TINYINT)  BEGIN
	UPDATE activo SET
    CODACTIVO=_CODACTIVO,
    NITPROVEEDOR=_NITPROVEEDOR,
    CODMODELO=_CODMODELO,
    DESCRIPCION=_DESCRIPCION,
    CODPROCEDENCIA=_CODPROCEDENCIA,
    CODACTIVOFIJO=_CODACTIVOFIJO,
    SERIE=_SERIE,
    ANIOFABRICACION=_ANIOFABRICACION,
    FECHAINGRESO=_FECHAINGRESO,
    FOTOGRAFIA=_FOTOGRAFIA,
    FECHAMODIFICACION=_FECHAMODIFICACION,
    USUARIOREGISTRO=_USUARIOREGISTRO,
    ESTADOACTIVO=_ESTADOACTIVO
    WHERE CODACTIVO=_CODACTIVO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_AsigCargoPersonal_add` (IN `_CODCARGODEP` INT(11), IN `_CODPERSONAL` INT(11), IN `_FECHAASIGNACION` DATE, IN `_ESTADO` TINYINT, IN `_MEMODESIGNACION` VARCHAR(30))  begin
	INSERT INTO asigcargopersonal(CODCARGODEP, CODPERSONAL,FECHAASIGNACION, ESTADO,MEMODESIGNACION)VALUES(_CODCARGODEP, _CODPERSONAL, _FECHAASIGNACION, _ESTADO, _MEMODESIGNACION);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_AsigCargoPersonal_delete` (IN `_CODASIGCARGOPER` INT(11))  BEGIN
	DELETE FROM asigcargopersonal WHERE CODASIGCARGOPER=_CODASIGCARGOPER;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_AsigCargoPersonal_disable` (IN `_CODASIGCARGOPER` INT(11))  BEGIN
	UPDATE asigcargopersonal SET ESTADO=0 WHERE CODASIGCARGOPER=_CODASIGCARGOPER;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_AsigCargoPersonal_enable` (IN `_CODASIGCARGOPER` INT(11))  BEGIN
	UPDATE asigcargopersonal SET ESTADO=1 WHERE CODASIGCARGOPER=_CODASIGCARGOPER;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_AsigCargoPersonal_seach` (IN `_CRITERIAL` VARCHAR(15))  BEGIN
	SELECT CODASIGCARGOPER, CODCARGODEP, CODPERSONAL, FECHAASIGNACION, FECHACONCLUCION, ESTADO, MEMODESIGNACION
    FROM asigcargopersonal
    WHERE FECHAASIGNACION LIKE CONCAT('%', _CRITERIAL, '%') OR FECHACONCLUCION LIKE CONCAT('%', _CRITERIAL, '%') OR ESTADO LIKE CONCAT('%', _CRITERIAL, '%') OR MEMODESIGNACION LIKE CONCAT('%', _CRITERIAL, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_AsigCargoPersonal_update` (IN `_CODASIGCARGOPER` INT(11), IN `_FECHAASIGNACION` DATE, IN `_FECHACONCLUCION` DATE, IN `_MEMODESIGNACION` VARCHAR(30))  BEGIN
    	UPDATE asigcargopersonal SET FECHAASIGNACION=_FECHAASIGNACION, FECHACONCLUCION=_FECHACONCLUCION, MEMODESIGNACION=_MEMODESIGNACION WHERE CODASIGCARGOPER=_CODASIGCARGOPER;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Cargo_add` (IN `_CODDEPARTAMENTO` INT(11), IN `_CARGO` VARCHAR(50), IN `_ESTADO` TINYINT)  BEGIN
    	INSERT INTO cargo(CODDEPARTAMENTO, CARGO, ESTADO)VALUES(_CODDEPARTAMENTO, _CARGO, _ESTADO);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Cargo_delete` (IN `_CARGO` VARCHAR(50))  BEGIN
    DELETE FROM cargo WHERE CARGO=_CARGO;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Cargo_disable` (IN `_CARGO` VARCHAR(50))  BEGIN
	UPDATE cargo SET ESTADO=0 WHERE CARGO=_CARGO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Cargo_enable` (IN `_CARGO` VARCHAR(50))  BEGIN
	UPDATE cargo SET ESTADO=1 WHERE CARGO=_CARGO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Cargo_search` (IN `_CRITERIAL` VARCHAR(25))  BEGIN
	SELECT CODCARGO, CODDEPARTAMENTO, CARGO, ESTADO
    FROM cargo
    WHERE CARGO LIKE CONCAT('%',_CRITERIAL,'%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Cargo_update` (IN `_CODCARGO` INT(11), IN `_CARGO` VARCHAR(50))  BEGIN
	UPDATE cargo SET CARGO=_CARGO WHERE CODCARGO=_CODCARGO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Departamentos_add` (IN `_NOMBDEPARTAMENTO` VARCHAR(50), IN `_DESCRIPCION` VARCHAR(150), IN `_ESTADO` TINYINT)  BEGIN
	SET @validate = (SELECT COUNT(*) FROM departamentos WHERE NOMBDEPARTAMENTO=_NOMBDEPARTAMENTO);
    	IF @validate > 0 THEN
        	SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Departament name already exists';
        ELSE
        	IF _DESCRIPCION='' THEN
            	INSERT INTO departamentos(NOMBDEPARTAMENTO,ESTADO)VALUES(_NOMBDEPARTAMENTO,_ESTADO);
            ELSE
        		INSERT INTO departamentos(NOMBDEPARTAMENTO,DESCRIPCION,ESTADO)VALUES(_NOMBDEPARTAMENTO,_DESCRIPCION,_ESTADO);
                END IF;
        END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Departamentos_delete` (IN `_CODDEPARTAMENTO` INT(11))  BEGIN
    DELETE FROM departamentos WHERE CODDEPARTAMENTO=_CODDEPARTAMENTO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Departamentos_disable` (IN `_NOMBDEPARTAMENTO` VARCHAR(50))  BEGIN

    	UPDATE departamentos SET ESTADO=0 WHERE NOMBDEPARTAMENTO=_NOMBDEPARTAMENTO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Departamentos_enable` (IN `_NOMBDEPARTAMENTO` VARCHAR(50))  BEGIN
	UPDATE departamentos SET ESTADO=1 WHERE NOMBDEPARTAMENTO=_NOMBDEPARTAMENTO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Departamentos_search` (IN `_CRITERIAL` VARCHAR(25))  BEGIN
	SELECT CODDEPARTAMENTO, NOMBDEPARTAMENTO, DESCRIPCION, ESTADO
    FROM departamentos
    WHERE NOMBDEPARTAMENTO LIKE CONCAT('%',_CRITERIAL,'%') OR DESCRIPCION LIKE CONCAT('%',_CRITERIAL,'%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Departamentos_update` (IN `_CODDEPARTAMENTO` INT(11), IN `_NOMBDEPARTAMENTO` VARCHAR(50), IN `_DESCRIPCION` VARCHAR(150))  BEGIN
	IF _NOMBDEPARTAMENTO='' THEN
    	UPDATE departamentos SET DESCRIPCION=_DESCRIPCION WHERE CODDEPARTAMENTO=_CODDEPARTAMENTO;
    ELSEIF _DESCRIPCION='' THEN
    	UPDATE departamentos SET NOMBDEPARTAMENTO=_NOMBDEPARTAMENTO WHERE CODDEPARTAMENTO=_CODDEPARTAMENTO;
    ELSE
    	UPDATE departamentos SET NOMBDEPARTAMENTO=_NOMBDEPARTAMENTO, DESCRIPCION=_DESCRIPCION WHERE CODDEPARTAMENTO=_CODDEPARTAMENTO;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_MarcaClaseactivo_search_id` (IN `_CODCLASE` INT(11))  BEGIN
	SELECT uno.CODCLASE,uno.CLASE,uno.DESCRIPCIONCLASE,uno.ESTADO,uno.PARTIDA, marca.CODMARCA,marca.MARCA,marca.ESTADO
    FROM(SELECT CODCLASE,CLASE, DESCRIPCIONCLASE,ESTADO,PARTIDA
    	FROM claseactivo
    	WHERE ESTADO='1')uno,marca
    WHERE marca.CODCLASE=uno.CODCLASE AND marca.ESTADO='1' AND marca.CODCLASE=_CODCLASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_MarcaModelo_search_id` (IN `_CODMARCA` INT(11))  BEGIN
	SELECT uno.CODCLASE,uno.CODMARCA,uno.ESTADO,uno.MARCA,modelo.CODMODELO,modelo.MODELO,modelo.DESCRIPCION,modelo.ESTADOMODELO
     FROM(SELECT CODCLASE,CODMARCA,ESTADO,MARCA
        FROM marca
        WHERE ESTADO='1' AND CODMARCA=_CODMARCA)uno, modelo
     WHERE modelo.CODMARCA=uno.CODMARCA AND ESTADOMODELO='1';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Personal_add` (IN `_CODITEM` VARCHAR(20), IN `_CI` VARCHAR(20), IN `_FECHAASIGNACION` DATE, IN `_ESTADO` TINYINT)  BEGIN
	INSERT INTO personal(CODITEM,CI,FECHAASIGNACION,ESTADO) VALUES (_CODITEM,_CI,_FECHAASIGNACION,_ESTADO);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Personal_delete` (IN `_CODPERSONAL` INT(11))  BEGIN
DELETE FROM personal WHERE CODPERSONAL=_CODPERSONAL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Personal_disable` (IN `_CODPERSONAL` INT(11))  BEGIN
	UPDATE personal SET ESTADO=0 WHERE CODPERSONAL=_CODPERSONAL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Personal_enable` (IN `_CODPERSONAL` INT(11))  BEGIN
	UPDATE personal SET ESTADO=1 WHERE CODPERSONAL=_CODPERSONAL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Personal_search` (IN `_CRITERIAL` VARCHAR(25))  BEGIN
	SELECT CODPERSONAL, CODITEM, CI, FECHAASIGNACION, FECHADESASIGNACION
    FROM personal
    WHERE CODITEM LIKE CONCAT('%',_CRITERIAL, '%') OR CI LIKE CONCAT('%',_CRITERIAL, '%') OR FECHAASIGNACION LIKE CONCAT('%',_CRITERIAL, '%') OR FECHADESASIGNACION LIKE CONCAT('%',_CRITERIAL, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Personal_update` (IN `_CODPERSONAL` INT(11), IN `_FECHADESASIGNACION` DATE)  BEGIN
    	UPDATE personal SET FECHADESASIGNACION=_FECHADESASIGNACION WHERE CODPERSONAL=_CODPERSONAL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Persona_add` (IN `_CI` VARCHAR(20), IN `_CODPROFESION` INT(11), IN `_NOMBRES` VARCHAR(50), IN `_APPATERNO` VARCHAR(50), IN `_APMATERNO` VARCHAR(50), IN `_FECHANACIMIENTO` DATE, IN `_DIRECCION` VARCHAR(150), IN `_TELEFONO` VARCHAR(8), IN `_CORREO` VARCHAR(30), IN `_CELULAR` VARCHAR(8), IN `_SEXO` CHAR(1), IN `_EXPEDIDOCI` VARCHAR(5))  BEGIN
        INSERT INTO persona(CI,CODPROFESION,NOMBRES,APPATERNO,APMATERNO,FECHANACIMIENTO,DIRECCION,TELEFONO,CORREO,CELULAR,SEXO,EXPEDIDOCI) VALUES (_CI,_CODPROFESION,_NOMBRES,_APPATERNO,_APMATERNO,_FECHANACIMIENTO,_DIRECCION,_TELEFONO,_CORREO,_CELULAR,_SEXO,_EXPEDIDOCI);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Persona_search` (IN `_NOMBRES` VARCHAR(50), IN `_APPATERNO` VARCHAR(50), IN `_APMATERNO` VARCHAR(50))  BEGIN
	IF _NOMBRES='' AND _APPATERNO='' THEN
    	SELECT CI,CODPROFESION,NOMBRES,APPATERNO,APMATERNO,FECHANACIMIENTO,DIRECCION,TELEFONO,CORREO,CELULAR,SEXO,EXPEDIDOCI
        FROM persona
        WHERE APMATERNO=_APMATERNO;
    ELSEIF _NOMBRES='' AND _APMATERNO='' THEN
    	SELECT CI,CODPROFESION,NOMBRES,APPATERNO,APMATERNO,FECHANACIMIENTO,DIRECCION,TELEFONO,CORREO,CELULAR,SEXO,EXPEDIDOCI
        FROM persona
        WHERE APPATERNO=_APPATERNO;
    ELSEIF _APPATERNO='' AND _APMATERNO='' THEN
    	SELECT CI,CODPROFESION,NOMBRES,APPATERNO,APMATERNO,FECHANACIMIENTO,DIRECCION,TELEFONO,CORREO,CELULAR,SEXO,EXPEDIDOCI
        FROM persona
        WHERE NOMBRES=_NOMBRES;
    ELSEIF _NOMBRES='' THEN
    	SELECT CI,CODPROFESION,NOMBRES,APPATERNO,APMATERNO,FECHANACIMIENTO,DIRECCION,TELEFONO,CORREO,CELULAR,SEXO,EXPEDIDOCI
        FROM persona
        WHERE APPATERNO=_APPATERNO AND APMATERNO=_APMATERNO;
    ELSEIF _APPATERNO='' THEN
    	SELECT CI,CODPROFESION,NOMBRES,APPATERNO,APMATERNO,FECHANACIMIENTO,DIRECCION,TELEFONO,CORREO,CELULAR,SEXO,EXPEDIDOCI
        FROM persona
        WHERE NOMBRES=_NOMBRES AND APMATERNO=_APMATERNO;
    ELSEIF _APMATERNO='' THEN
    	SELECT CI,CODPROFESION,NOMBRES,APPATERNO,APMATERNO,FECHANACIMIENTO,DIRECCION,TELEFONO,CORREO,CELULAR,SEXO,EXPEDIDOCI
        FROM persona
        WHERE NOMBRES=_NOMBRES AND APPATERNO=_APPATERNO;
    ELSE
    	SELECT CI,CODPROFESION,NOMBRES,APPATERNO,APMATERNO,FECHANACIMIENTO,DIRECCION,TELEFONO,CORREO,CELULAR,SEXO,EXPEDIDOCI
        FROM persona
        WHERE NOMBRES=_NOMBRES AND APPATERNO=_APPATERNO AND APMATERNO=_APMATERNO;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DB_SP_Persona_update` (IN `_CI` VARCHAR(20), IN `_CODPROFESION` INT(11), IN `_NOMBRES` VARCHAR(50), IN `_APPATERNO` VARCHAR(50), IN `_APMATERNO` VARCHAR(50), IN `_FECHANACIMIENTO` DATE, IN `_DIRECCION` VARCHAR(150), IN `_TELEFONO` VARCHAR(8), IN `_CORREO` VARCHAR(30), IN `_CELULAR` VARCHAR(8), IN `_SEXO` VARCHAR(1), IN `_EXPEDIDOCI` VARCHAR(5))  BEGIN
	UPDATE persona SET
        CI=_CI,
        CODPROFESION=_CODPROFESION,
        NOMBRES=_NOMBRES,
        APPATERNO=_APPATERNO,
        APMATERNO=_APMATERNO,
        FECHANACIMIENTO=_FECHANACIMIENTO,
        DIRECCION=_DIRECCION,
        TELEFONO=_TELEFONO,
        CORREO=_CORREO,
        CELULAR=_CELULAR,
        SEXO=_SEXO,
        EXPEDIDOCI=_EXPEDIDOCI
    WHERE CI=_CI;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `activo`
--

CREATE TABLE `activo` (
  `CODACTIVO` int(11) NOT NULL,
  `NITPROVEEDOR` varchar(30) NOT NULL,
  `CODMODELO` int(11) NOT NULL,
  `DESCRIPCION` varchar(150) NOT NULL,
  `CODPROCEDENCIA` int(11) NOT NULL,
  `CODACTIVOFIJO` varchar(15) NOT NULL,
  `SERIE` longtext NOT NULL,
  `ANIOFABRICACION` int(11) NOT NULL,
  `FECHAINGRESO` date NOT NULL,
  `FOTOGRAFIA` longblob NOT NULL,
  `FHREGSERV` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FECHAMODIFICACION` date DEFAULT NULL,
  `USUARIOREGISTRO` int(11) NOT NULL,
  `ESTADOACTIVO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `activo`
--

INSERT INTO `activo` (`CODACTIVO`, `NITPROVEEDOR`, `CODMODELO`, `DESCRIPCION`, `CODPROCEDENCIA`, `CODACTIVOFIJO`, `SERIE`, `ANIOFABRICACION`, `FECHAINGRESO`, `FOTOGRAFIA`, `FHREGSERV`, `FECHAMODIFICACION`, `USUARIOREGISTRO`, `ESTADOACTIVO`) VALUES
(4, 'F1F1F1', 1, 'NUEVO', 1, '1', 'CDNSKCSDCKSJCKSJCLDSJ', 2050, '0002-12-09', 0x617474686f72742d73637265656e323032322d31312d32352d30303a32372d35372e6a7067, '2022-11-25 04:28:08', NULL, 1, 1),
(5, '1', 1, 'fg', 1, '1', '123456789', 2022, '2022-02-02', 0x303030303030303030303030303030303030303030303030303030303030303030303030303030302030303030303030303030303030303030303030303030303030303030303030303030303030303030203030303030303030303030303030303030303030303030303030303030303030303030303030303020303030303030303030303030303030303030303030303030303030303030303030303030303030302030303030303030303030303030303030303030303030303030303030303030303030303030303030203030303030303030313130303030303030303030303030303030303030303130303030303030303020313131313131313131313131313131313131313131313131313131313131313131313131313131312031313131313131313131313131313131313131313131313131313131313131313131313131313131203131313131313131313131313131313131313131313131313131313131313131313131313131313120313131313131313131313131313131313131313131313131313131313131313131313131313131312031313131313131313131313131313131313131313131313131313131313131313131313131313131203131313131313131313131313131313131313131313131313131313131313131313131313131313120313131313131313131313131313131313131313131313131313131313131313131313131313131312031313131313131313131313131313131313131313131313131313131313131313131313131313131203131313131313131313131313131313131313131313131313131313131313131313131313131313120313131313131313131313131313131313131313131313131313131313131313131313131313131312031313131313131313131313131313131313131313131313131313131313131313131313131313131203131313131313131313131313131313131313131313131313131313131313131313131313131313120313131313131313131313131313131313131313131313131313131313131313131313131313131312031313131313131313131313131313131313131313131313131313131313131313131313131313131, '2022-12-05 19:06:55', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `asigcargopersonal`
--

CREATE TABLE `asigcargopersonal` (
  `CODASIGCARGOPER` int(11) NOT NULL,
  `CODCARGODEP` int(11) DEFAULT NULL,
  `CODPERSONAL` int(11) DEFAULT NULL,
  `FECHAASIGNACION` date NOT NULL,
  `FECHACONCLUCION` date DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  `MEMODESIGNACION` varchar(30) NOT NULL,
  `FHREGSERV` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `asigcargopersonal`
--

INSERT INTO `asigcargopersonal` (`CODASIGCARGOPER`, `CODCARGODEP`, `CODPERSONAL`, `FECHAASIGNACION`, `FECHACONCLUCION`, `ESTADO`, `MEMODESIGNACION`, `FHREGSERV`) VALUES
(1, 1, 1, '2022-10-01', '2022-10-01', 1, 'DIR/01/2022', '2022-11-30 14:07:00'),
(2, 2, 2, '2022-01-01', '2022-02-02', 1, 'AB-123', '2022-12-01 01:13:31'),
(3, 3, 3, '2022-10-01', '2022-10-01', 1, 'DIR/01/2022', '2022-10-23 10:37:19'),
(4, 4, 4, '2022-10-01', '2022-10-01', 1, 'DIR/01/2022', '2022-10-23 10:37:19'),
(5, 5, 5, '2022-10-01', '2022-10-01', 0, 'DIR/01/2022', '2022-12-05 20:18:05'),
(6, 6, 6, '2022-10-01', '2022-10-01', 1, 'DIR/01/2022', '2022-10-23 10:37:19'),
(7, 7, 7, '2022-10-01', '2022-10-01', 1, 'DIR/01/2022', '2022-10-23 10:37:19'),
(8, 8, 8, '2022-10-01', '2022-10-01', 1, 'DIR/01/2022', '2022-10-24 15:32:58'),
(9, 9, 9, '2022-10-01', '2022-10-01', 1, 'DIR/01/2022', '2022-10-24 15:32:58'),
(10, 10, 10, '2022-10-01', '2022-10-01', 1, 'DIR/01/2022', '2022-10-24 15:32:58'),
(11, 11, 11, '2022-10-01', '2022-10-01', 1, 'DIR/01/2022', '2022-10-24 15:32:58'),
(13, 1, 1, '2022-02-02', NULL, 1, '', '2022-11-28 18:50:25'),
(14, 1, 1, '2022-02-02', NULL, 1, '123', '2022-11-28 18:54:34'),
(15, 1, 1, '2022-03-03', NULL, 1, '23135', '2022-11-28 18:56:05');

-- --------------------------------------------------------

--
-- Table structure for table `asignacionactivo`
--

CREATE TABLE `asignacionactivo` (
  `CODASIGACTIVO` int(11) NOT NULL,
  `CODASIGCARGOPER` int(11) NOT NULL,
  `CODACTIVO` int(11) NOT NULL,
  `OBSERVACION` varchar(100) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `asignacionrepuesto`
--

CREATE TABLE `asignacionrepuesto` (
  `CODASIGBNACION` int(11) NOT NULL,
  `CODDETALLE` int(11) NOT NULL,
  `CODREPUESTO` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `OBSERVACION` varchar(100) DEFAULT NULL,
  `SERIE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

CREATE TABLE `cargo` (
  `CODCARGO` int(11) NOT NULL,
  `CODDEPARTAMENTO` int(11) DEFAULT NULL,
  `CARGO` varchar(50) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cargo`
--

INSERT INTO `cargo` (`CODCARGO`, `CODDEPARTAMENTO`, `CARGO`, `ESTADO`) VALUES
(1, 1, 'DIRECTOR', 1),
(2, 2, 'ADMINISTRADOR', 1),
(3, 3, 'ASESOR LEGAL', 1),
(4, 4, 'AUDITOR', 1),
(5, 5, 'GESTOR DE CALIDAD', 0),
(6, 6, 'JEFE DE LABORATORIO', 1),
(7, 7, 'JEFE DE FARMACIA', 1),
(8, 8, 'JEFE DE SISTEMAS', 1),
(9, 8, 'AUXILIAR DE SISTEMAS', 1),
(10, 9, 'AUXILIAR DE BIOMEDICA', 1),
(11, 9, 'TECNICO BIOMEDICO', 0),
(15, 1, 'ENCARGADO', 0);

--
-- Triggers `cargo`
--
DELIMITER $$
CREATE TRIGGER `cargo_add` BEFORE INSERT ON `cargo` FOR EACH ROW BEGIN
	INSERT INTO History(usuarioCambio, tablaAfectada,accion,datosAnteriores,datosActuales)VALUES('local','cargo','INSERT','no existe', CONCAT('CODCARGO= ',new.CODCARGO, ' CODDEPARTAMENTO= ', new.CODDEPARTAMENTO, ' CARGO= ', new.CARGO, ' ESTADO= ', new.ESTADO));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cargo_delete` AFTER DELETE ON `cargo` FOR EACH ROW BEGIN
	INSERT INTO History(usuarioCambio, tablaAfectada,accion,datosAnteriores,datosActuales)VALUES('local','cargo','DELETE', CONCAT('CODCARGO= ',old.CODCARGO, ' CODDEPARTAMENTO= ', old.CODDEPARTAMENTO, ' CARGO= ', old.CARGO, ' ESTADO= ', old.ESTADO),'no existe');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `catalogo`
--

CREATE TABLE `catalogo` (
  `CODCATALOGO` int(11) NOT NULL,
  `CODCLASE` int(11) DEFAULT NULL,
  `NOMCATALOGO` varchar(100) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `centromantenimiento`
--

CREATE TABLE `centromantenimiento` (
  `CODCENTRO` int(11) NOT NULL,
  `CENTROMANTENIMIENTO` varchar(50) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  `DESCRIPCION` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `claseactivo`
--

CREATE TABLE `claseactivo` (
  `CODCLASE` int(11) NOT NULL,
  `PARTIDA` varchar(20) DEFAULT NULL,
  `CLASE` varchar(50) NOT NULL,
  `DESCRIPCIONCLASE` varchar(200) NOT NULL,
  `ESTADO` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `claseactivo`
--

INSERT INTO `claseactivo` (`CODCLASE`, `PARTIDA`, `CLASE`, `DESCRIPCIONCLASE`, `ESTADO`) VALUES
(1, '428', 'CPU DE COMPUTADORA', 'CPU DE ESCRITORIO', 1),
(2, '428', 'MONITOR DE COMPUTADORA', 'MONITOR DE ESCRITORIO', 1),
(3, '428', 'IMPRESORA DE COMPUTADORA', 'IMPREOSRA DE TINTAS, TONER, CINTAS', 1),
(4, '435', 'FOTOCOPIADORA', 'FOTOCOPIADORA ALTO TRAFICO', 0),
(5, '358', 'CONTADOR HEMATOROLOGICO', 'CONTADOR HEMATOLOGICO ....', 1),
(6, '358', 'SISTEMA DE INFORMACION CLINICO ESTADISTICO', 'CODIGO DE SISTEMA S.I.C.E', 1),
(7, '358', 'BdD SISTEMA DE INFORMACION CLINICO ESTADISTICO', 'BASES DE DATOS DE SISTEMA S.I.C.E.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cronogramapreventivo`
--

CREATE TABLE `cronogramapreventivo` (
  `CODACTIVO` int(11) NOT NULL,
  `FECHAPROGRAMADA` date NOT NULL,
  `FECHASALIDA` date NOT NULL,
  `CODCRONOGRAMA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_ActivoAll_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_ActivoAll_view` (
`CLASE` varchar(50)
,`MARCA` varchar(50)
,`MODELO` varchar(50)
,`PROCEDENCIA` varchar(50)
,`FOTOGRAFIA` longblob
,`ANIOFABRICACION` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_Activo_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_Activo_view` (
`CODACTIVO` int(11)
,`NITPROVEEDOR` varchar(30)
,`CODMODELO` int(11)
,`DESCRIPCION` varchar(150)
,`CODPROCEDENCIA` int(11)
,`CODACTIVOFIJO` varchar(15)
,`SERIE` longtext
,`ANIOFABRICACION` int(11)
,`FECHAINGRESO` date
,`FOTOGRAFIA` longblob
,`FHREGSERV` timestamp
,`FECHAMODIFICACION` date
,`USUARIOREGISTRO` int(11)
,`ESTADOACTIVO` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_AsigCargoPersonalAll_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_AsigCargoPersonalAll_view` (
`CODASIGCARGOPER` int(11)
,`CODCARGODEP` int(11)
,`CODPERSONAL` int(11)
,`FECHAASIGNACION` date
,`FECHACONCLUCION` date
,`ESTADO` tinyint(1)
,`MEMODESIGNACION` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_AsigCargoPersonal_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_AsigCargoPersonal_view` (
`CODASIGCARGOPER` int(11)
,`CODCARGODEP` int(11)
,`CODPERSONAL` int(11)
,`FECHAASIGNACION` date
,`FECHACONCLUCION` date
,`ESTADO` tinyint(1)
,`MEMODESIGNACION` varchar(30)
,`FHREGSERV` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_CargoAlll_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_CargoAlll_view` (
`CODCARGO` int(11)
,`CODDEPARTAMENTO` int(11)
,`CARGO` varchar(50)
,`ESTADO` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_Cargo_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_Cargo_view` (
`CODCARGO` int(11)
,`CODDEPARTAMENTO` int(11)
,`CARGO` varchar(50)
,`ESTADO` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_ClaseactivoMarca_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_ClaseactivoMarca_view` (
`CODCLASE` int(11)
,`PARTIDA` varchar(20)
,`CLASE` varchar(50)
,`DESCRIPCIONCLASE` varchar(200)
,`CODMARCA` int(11)
,`MARCA` varchar(50)
,`ESTADO` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_Claseactivo_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_Claseactivo_view` (
`CODCLASE` int(11)
,`PARTIDA` varchar(20)
,`CLASE` varchar(50)
,`DESCRIPCIONCLASE` varchar(200)
,`ESTADO` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_DepartamentosAll_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_DepartamentosAll_view` (
`CODDEPARTAMENTO` int(11)
,`NOMBDEPARTAMENTO` varchar(50)
,`DESCRIPCION` varchar(150)
,`ESTADO` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_Departamentos_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_Departamentos_view` (
`CODDEPARTAMENTO` int(11)
,`NOMBDEPARTAMENTO` varchar(50)
,`DESCRIPCION` varchar(150)
,`ESTADO` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_Item_Available_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_Item_Available_view` (
`CODITEM` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_Item_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_Item_view` (
`CODITEM` varchar(20)
,`ESTADO` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_PersonalAll_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_PersonalAll_view` (
`CODPERSONAL` int(11)
,`CODITEM` varchar(20)
,`CI` varchar(20)
,`FECHAASIGNACION` date
,`FECHADESASIGNACION` date
,`ESTADO` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_Personal_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_Personal_view` (
`CODPERSONAL` int(11)
,`CODITEM` varchar(20)
,`CI` varchar(20)
,`FECHAASIGNACION` date
,`FECHADESASIGNACION` date
,`ESTADO` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_Persona_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_Persona_view` (
`CI` varchar(20)
,`CODPROFESION` int(11)
,`NOMBRES` varchar(50)
,`APPATERNO` varchar(50)
,`APMATERNO` varchar(50)
,`FECHANACIMIENTO` date
,`DIRECCION` varchar(150)
,`TELEFONO` varchar(8)
,`CORREO` varchar(30)
,`CELULAR` varchar(8)
,`SEXO` char(1)
,`EXPEDIDOCI` varchar(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_Procedencia_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_Procedencia_view` (
`CODPROCEDENCIA` int(11)
,`PROCEDENCIA` varchar(50)
,`ESTADO` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_Profesion_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_Profesion_view` (
`CODPROFESION` int(11)
,`PROFESION` varchar(50)
,`ESTADO` tinyint(1)
,`GRADOACADEMICO` varchar(50)
,`ABREVIACION` char(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `DB_VIEW_Provedor_view`
-- (See below for the actual view)
--
CREATE TABLE `DB_VIEW_Provedor_view` (
`NIT` varchar(30)
,`NOMPROVEEDOR` varchar(50)
,`TELEFONOPROVEEDOR` varchar(8)
,`CONTACTO` varchar(30)
,`CORREOCONTACTO` varchar(30)
,`CELULARCONTACTO` varchar(8)
);

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE `departamentos` (
  `CODDEPARTAMENTO` int(11) NOT NULL,
  `NOMBDEPARTAMENTO` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(150) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`CODDEPARTAMENTO`, `NOMBDEPARTAMENTO`, `DESCRIPCION`, `ESTADO`) VALUES
(1, 'DIRECCION', 'Nuevo departamento', 0),
(2, 'ADMINISTRACION', NULL, 1),
(3, 'ASESORIAL LEGAL', NULL, 1),
(4, 'AUDITORIA', NULL, 1),
(5, 'GESTION CALIDAD', NULL, 1),
(6, 'LABORATORIO CENTRAL', NULL, 1),
(7, 'FARMACIA', NULL, 1),
(8, 'SISTEMAS', NULL, 1),
(9, 'BIOMEDICA', NULL, 1),
(48, 'MANTENIMIENTO', 'DPTO de mantenimiento de software y hardware', 0),
(49, 'MANTENIMIENTO DE EQUIPOS', 'SD', 1),
(50, 'LIMPIEZA', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `detallecronograma`
--

CREATE TABLE `detallecronograma` (
  `CODTAREA` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `CODDETALLE` int(11) NOT NULL,
  `CODCRONOGRAMA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detallemantenimiento`
--

CREATE TABLE `detallemantenimiento` (
  `CODDETALLE` int(11) NOT NULL,
  `CODMANTENIMIENTO` int(11) DEFAULT NULL,
  `CODTAREA` int(11) DEFAULT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `OBSERVACION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `History`
--

CREATE TABLE `History` (
  `idHistory` int(11) NOT NULL,
  `usuarioCambio` varchar(50) DEFAULT NULL,
  `accion` varchar(15) NOT NULL,
  `tablaAfectada` varchar(30) NOT NULL,
  `campoAfectado` varchar(30) DEFAULT NULL,
  `datosAnteriores` varchar(500) DEFAULT NULL,
  `datosActuales` varchar(500) DEFAULT NULL,
  `fechaModificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `History`
--

INSERT INTO `History` (`idHistory`, `usuarioCambio`, `accion`, `tablaAfectada`, `campoAfectado`, `datosAnteriores`, `datosActuales`, `fechaModificacion`) VALUES
(5, 'LOCAL', 'INSERT', 'departamentos', NULL, 'nuevos datos', 'CODDEP= 0 Nombre= MANTENIMIENTODescripcion= DPTO de mantenimiento de software y hardware, Estado= 1', '2022-11-29 13:40:49'),
(6, 'local', 'INSERT', 'cargo', NULL, 'no existe', 'CODCARGO= 0 CODDEPARTAMENTO= 1 CARGO= AUXILIAR CONTABLE ESTADO= 1', '2022-11-30 14:46:28'),
(7, 'local', 'DELETE', 'cargo', NULL, 'CODCARGO= 13 CODDEPARTAMENTO= 1 CARGO= AUXILIAR CONTABLE ESTADO= 1', 'no existe', '2022-11-30 14:52:52'),
(8, 'local', 'INSERT', 'cargo', NULL, 'no existe', 'CODCARGO= 0 CODDEPARTAMENTO= 1 CARGO= Auxiliar ESTADO= 1', '2022-11-30 14:56:35'),
(9, 'local', 'DELETE', 'cargo', NULL, 'CODCARGO= 14 CODDEPARTAMENTO= 1 CARGO= Auxiliar ESTADO= 1', 'no existe', '2022-11-30 14:56:59'),
(10, 'local', 'INSERT', 'cargo', NULL, 'no existe', 'CODCARGO= 0 CODDEPARTAMENTO= 1 CARGO= Encargado ESTADO= 1', '2022-12-01 02:00:02'),
(11, 'local', 'INSERT', 'departamentos', NULL, 'nuevos datos', 'CODDEP= 0 Nombre= MANTENIMIENTO DE EQUIPOS Descripcion= SD Estado= 1', '2022-12-06 20:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `informe`
--

CREATE TABLE `informe` (
  `CODINFORME` int(11) NOT NULL,
  `FECHAIMPRESION` date NOT NULL,
  `USUARIOIMPRESION` int(11) NOT NULL,
  `FHREGISERV` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `CODITEM` varchar(20) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`CODITEM`, `ESTADO`) VALUES
('72551', 1),
('72552', 1),
('72553', 1),
('72554', 1),
('72555', 1),
('72556', 1),
('72557', 1),
('72558', 1),
('72559', 1),
('72560', 1),
('72561', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `CODMANTENIMIENTO` int(11) NOT NULL,
  `FECHAINGRESO` date NOT NULL,
  `FECHASALIDA` date NOT NULL,
  `ESTADOACTUAL` text NOT NULL,
  `FOTOINGRESO` longblob DEFAULT NULL,
  `FOTOSALIDA` longblob DEFAULT NULL,
  `OBSERVACION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `marca`
--

CREATE TABLE `marca` (
  `CODMARCA` int(11) NOT NULL,
  `CODCLASE` int(11) DEFAULT NULL,
  `MARCA` varchar(50) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marca`
--

INSERT INTO `marca` (`CODMARCA`, `CODCLASE`, `MARCA`, `ESTADO`) VALUES
(1, 1, 'DELL', 1),
(2, 2, 'SAMSUNG', 1),
(3, 3, 'EPSON', 1),
(4, 4, 'CANON', 1),
(5, 5, 'DELL', 1),
(6, 6, 'MEDICUS MUNDI', 1),
(7, 7, 'SQL SERVER', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modelo`
--

CREATE TABLE `modelo` (
  `CODMODELO` int(11) NOT NULL,
  `CODMARCA` int(11) DEFAULT NULL,
  `MODELO` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(150) NOT NULL,
  `ESTADOMODELO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `modelo`
--

INSERT INTO `modelo` (`CODMODELO`, `CODMARCA`, `MODELO`, `DESCRIPCION`, `ESTADOMODELO`) VALUES
(1, 1, 'SPECTRUM', 'CHINA', 1),
(2, 1, 'ASPIRE', 'RAM 8, SSD 128GB', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ordentrabajo`
--

CREATE TABLE `ordentrabajo` (
  `CODORDENTRABAJO` int(11) NOT NULL,
  `CODASIGACTIVO` int(11) DEFAULT NULL,
  `FECHAORDEN` datetime NOT NULL,
  `DESCRIPSINTOMAS` varchar(100) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  `FHREGSERV` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `CI` varchar(20) NOT NULL,
  `CODPROFESION` int(11) DEFAULT NULL,
  `NOMBRES` varchar(50) NOT NULL,
  `APPATERNO` varchar(50) NOT NULL,
  `APMATERNO` varchar(50) NOT NULL,
  `FECHANACIMIENTO` date NOT NULL,
  `DIRECCION` varchar(150) DEFAULT NULL,
  `TELEFONO` varchar(8) DEFAULT NULL,
  `CORREO` varchar(30) DEFAULT NULL,
  `CELULAR` varchar(8) DEFAULT NULL,
  `SEXO` char(1) NOT NULL,
  `EXPEDIDOCI` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`CI`, `CODPROFESION`, `NOMBRES`, `APPATERNO`, `APMATERNO`, `FECHANACIMIENTO`, `DIRECCION`, `TELEFONO`, `CORREO`, `CELULAR`, `SEXO`, `EXPEDIDOCI`) VALUES
(',.abcds12345671', 1, 'Limbergth', 'Villcavds', 'Coraitevfsv', '1999-09-08', 'Av. 6 de Agosto', '4226632', 'limbervillcacoraite@gmail', '', 'M', 'BNI'),
('11111', 9, 'NATY', 'POZO', 'QUIROGA', '0000-00-00', 'AV. VILLAZON', '4444444', 'NATY@GMAIL.COM', '76543221', 'F', 'CB'),
('1113', 1, 'JOSE JUAN', 'OVANDO', 'PEREZ', '0000-00-00', 'AV. OQUENDO', '4444444', 'JOSE@GMAIL.COM', '76543221', 'M', 'CB'),
('12345678', 1, 'Juan', 'Perez', 'Perez', '1999-02-01', 'Oquendo-Ladislao Cabrera', '12345678', 'nuevo@gmail.com', '12345678', 'M', 'SC'),
('2222', 2, 'JOSE JOSE', 'RAMOS', 'SANCHEZ', '0000-00-00', 'AV. VENEZUELA', '4444444', 'JOSE@GMAIL.COM', '76543221', 'M', 'SC'),
('22222', 10, 'CARLOS', 'JIMENEZ', 'PELE', '0000-00-00', 'AV. VILLAZON', '4444444', 'CARLOS@GMAIL.COM', '76543221', 'M', 'CB'),
('3333', 3, 'MARY LUZ', 'PEREDO', 'UGARTE', '0000-00-00', 'AV. LIBERTADOR', '4444444', 'MARY@GMAIL.COM', '76543221', 'F', 'OR'),
('4444', 4, 'PEDRO', 'ALVARADO', 'GUERRA', '0000-00-00', 'AV. COSTANERA', '4444444', 'PEDRO@GMAIL.COM', '76543221', 'M', 'CB'),
('5555', 5, 'CARLOS', 'TORRICO', 'MAMANI', '0000-00-00', 'AV. PETROLERA', '4444444', 'CARLOS@GMAIL.COM', '76543221', 'M', 'LP'),
('5784564', 1, 'Kevin', 'Parra', 'Villa', '2012-02-02', 'av', '12345678', '1234@gmail.com', '12345678', 'M', 'sc'),
('6666', 6, 'NATY', 'QUIROGA', 'POZO', '0000-00-00', 'AV. AMERICA', '4444444', 'NATY@GMAIL.COM', '76543221', 'F', 'CB'),
('7777', 7, 'RICARDO', 'MONTANER', 'PELE', '0000-00-00', 'AV. VILLAZON', '4444444', 'RICARDO@GMAIL.COM', '76543221', 'M', 'CB'),
('8888', 8, 'JOSE', 'CONDARCO', 'ARAPA', '0000-00-00', 'AV. VILLAZON', '4444444', 'JOSE@GMAIL.COM', '76543221', 'M', 'CB'),
('9058545', 2, 'Juan', 'Quispe', 'Quispe', '2022-06-16', 'Av. 6 de Agosto', '67762923', 'limbervillcacoraite@gmail.com', '67762923', 'M', 'SCZ'),
('9059654', 8, 'Nuevo', 'Re', 'Coraite', '1999-03-05', 'avenida principal', '12345678', 'nuevo@gmail.com', '12345678', 'M', 'ORU'),
('9999', 8, 'BEYMAR', 'MARCA', 'LLANQUE', '0000-00-00', 'AV. VILLAZON', '4444444', 'BEYMAR@GMAIL.COM', '76543221', 'M', 'CB');

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `CODPERSONAL` int(11) NOT NULL,
  `CODITEM` varchar(20) DEFAULT NULL,
  `CI` varchar(20) DEFAULT NULL,
  `FECHAASIGNACION` date NOT NULL,
  `FECHADESASIGNACION` date DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `personal`
--

INSERT INTO `personal` (`CODPERSONAL`, `CODITEM`, `CI`, `FECHAASIGNACION`, `FECHADESASIGNACION`, `ESTADO`) VALUES
(1, '72551', '1111', '2022-02-02', '2022-04-04', 0),
(2, '72552', '2222', '0000-00-00', '2022-02-02', 1),
(3, '72553', '3333', '0000-00-00', '0000-00-00', 1),
(4, '72554', '4444', '0000-00-00', '0000-00-00', 1),
(5, '72555', '5555', '0000-00-00', '0000-00-00', 1),
(6, '72556', '6666', '0000-00-00', '0000-00-00', 1),
(7, '72557', '7777', '0000-00-00', '0000-00-00', 1),
(8, '72551', '1111', '2022-08-08', NULL, 1),
(10, '1', '333', '2022-02-02', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `procedencia`
--

CREATE TABLE `procedencia` (
  `CODPROCEDENCIA` int(11) NOT NULL,
  `PROCEDENCIA` varchar(50) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `procedencia`
--

INSERT INTO `procedencia` (`CODPROCEDENCIA`, `PROCEDENCIA`, `ESTADO`) VALUES
(1, 'China', 1);

-- --------------------------------------------------------

--
-- Table structure for table `profesion`
--

CREATE TABLE `profesion` (
  `CODPROFESION` int(11) NOT NULL,
  `PROFESION` varchar(50) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  `GRADOACADEMICO` varchar(50) NOT NULL,
  `ABREVIACION` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profesion`
--

INSERT INTO `profesion` (`CODPROFESION`, `PROFESION`, `ESTADO`, `GRADOACADEMICO`, `ABREVIACION`) VALUES
(1, 'MEDICO', 1, 'LICENCIATURA', 'Dr.'),
(2, 'LICENCIATURA EN ADMINISTRACION', 1, 'LICENCIATURA', 'Lic.'),
(3, 'LICENCIATURA EN DERECHO', 1, 'LICENCIATURA', 'Abog.'),
(4, 'LICENCIATURA EN AUDITORIA', 1, 'LICENCIATURA', 'Lic.'),
(5, 'LICENCIATRUA EN ENFERMERIA', 1, 'LICENCIATURA', 'Lic. Enf'),
(6, 'BIOQUIMICO', 1, 'LICENCIATURA', 'Dra. Bioq.'),
(7, 'BIOQUIMICO FARMACEUTICA', 1, 'LICENCIATURA', 'Dra. Bioq.'),
(8, 'INGENIERO DE SISTEMAS', 1, 'LICENCIATURA', 'Ing.'),
(9, 'INGENIERO DE BIOMEDICO', 1, 'LICENCIATURA', 'Ing.'),
(10, 'TECNICO BIOMEDICO', 0, 'TECNICO SUPERIOR', 'Tec.'),
(11, 'INGENIERO INFORMATICO', 1, 'Ingenieria', 'IngInf');

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `NIT` varchar(30) NOT NULL,
  `NOMPROVEEDOR` varchar(50) NOT NULL,
  `DIRECCION` varchar(150) NOT NULL,
  `TELEFONOPROVEEDOR` varchar(8) NOT NULL,
  `CONTACTO` varchar(30) NOT NULL,
  `CORREOCONTACTO` varchar(30) NOT NULL,
  `CELULARCONTACTO` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`NIT`, `NOMPROVEEDOR`, `DIRECCION`, `TELEFONOPROVEEDOR`, `CONTACTO`, `CORREOCONTACTO`, `CELULARCONTACTO`) VALUES
('1', 'Ju', '', '', '', '', ''),
('F1F1F1', 'Juan', 'av oquendo/uruguay', '12345678', 'Juan', 'juan@gmail.com', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `repuestos`
--

CREATE TABLE `repuestos` (
  `CODREPUESTO` int(11) NOT NULL,
  `NOMREPUESTO` varchar(50) NOT NULL,
  `DETALLEREPUESTO` varchar(200) DEFAULT NULL,
  `FECHA` date NOT NULL,
  `MARCA` varchar(50) NOT NULL,
  `MODELO` varchar(50) NOT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  `FHREGSERV` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sesion`
--

CREATE TABLE `sesion` (
  `NOMREUSUARIO` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subtareas`
--

CREATE TABLE `subtareas` (
  `CODSUBTAREA` int(11) NOT NULL,
  `CODTAREA` int(11) DEFAULT NULL,
  `NOMSUBTAREA` varchar(100) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tareas`
--

CREATE TABLE `tareas` (
  `CODTAREA` int(11) NOT NULL,
  `NOMTAREA` varchar(100) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tecnicos`
--

CREATE TABLE `tecnicos` (
  `CODTECNICO` int(11) NOT NULL,
  `CODASIGCARGOPER` int(11) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  `FHREGSERV` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tecnicos`
--

INSERT INTO `tecnicos` (`CODTECNICO`, `CODASIGCARGOPER`, `ESTADO`, `FHREGSERV`) VALUES
(1, 8, 1, '2022-10-24 15:39:14'),
(2, 8, 1, '2022-10-24 15:41:34'),
(3, 9, 1, '2022-10-24 15:41:34'),
(4, 10, 1, '2022-10-24 15:41:34'),
(5, 11, 1, '2022-10-24 15:41:34');

-- --------------------------------------------------------

--
-- Table structure for table `tiporepuesto`
--

CREATE TABLE `tiporepuesto` (
  `CODTIPOREPUESTO` int(11) NOT NULL,
  `NOMTIPOREPUESTO` varchar(50) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  `DESCRIPCION` varchar(150) DEFAULT NULL,
  `FHREGSERV` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `NOMREUSUARIO` varchar(15) NOT NULL,
  `CI` varchar(20) DEFAULT NULL,
  `CODASIGNACION` int(11) DEFAULT NULL,
  `CONTRASENA` varchar(25) NOT NULL,
  `ESTADO` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_ActivoAll_view`
--
DROP TABLE IF EXISTS `DB_VIEW_ActivoAll_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_ActivoAll_view`  AS SELECT `tres`.`CLASE` AS `CLASE`, `tres`.`MARCA` AS `MARCA`, `tres`.`MODELO` AS `MODELO`, `procedencia`.`PROCEDENCIA` AS `PROCEDENCIA`, `activo`.`FOTOGRAFIA` AS `FOTOGRAFIA`, `activo`.`ANIOFABRICACION` AS `ANIOFABRICACION` FROM (((select `modelo`.`CODMODELO` AS `CODMODELO`,`modelo`.`CODMARCA` AS `CODMARCA`,`modelo`.`MODELO` AS `MODELO`,`dos`.`CLASE` AS `CLASE`,`dos`.`MARCA` AS `MARCA` from ((select `marca`.`CODMARCA` AS `CODMARCA`,`marca`.`CODCLASE` AS `CODCLASE`,`marca`.`MARCA` AS `MARCA`,`uno`.`CLASE` AS `CLASE` from ((select `claseactivo`.`CODCLASE` AS `CODCLASE`,`claseactivo`.`PARTIDA` AS `PARTIDA`,`claseactivo`.`CLASE` AS `CLASE`,`claseactivo`.`DESCRIPCIONCLASE` AS `DESCRIPCIONCLASE`,`claseactivo`.`ESTADO` AS `ESTADO` from `claseactivo`) `uno` join `marca`) where `uno`.`CODCLASE` = `marca`.`CODCLASE`) `dos` join `modelo`) where `modelo`.`CODMARCA` = `dos`.`CODMARCA`) `tres` join `activo`) join `procedencia`) WHERE `activo`.`CODMODELO` = `tres`.`CODMODELO` AND `activo`.`CODPROCEDENCIA` = `procedencia`.`CODPROCEDENCIA` ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_Activo_view`
--
DROP TABLE IF EXISTS `DB_VIEW_Activo_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_Activo_view`  AS SELECT `activo`.`CODACTIVO` AS `CODACTIVO`, `activo`.`NITPROVEEDOR` AS `NITPROVEEDOR`, `activo`.`CODMODELO` AS `CODMODELO`, `activo`.`DESCRIPCION` AS `DESCRIPCION`, `activo`.`CODPROCEDENCIA` AS `CODPROCEDENCIA`, `activo`.`CODACTIVOFIJO` AS `CODACTIVOFIJO`, `activo`.`SERIE` AS `SERIE`, `activo`.`ANIOFABRICACION` AS `ANIOFABRICACION`, `activo`.`FECHAINGRESO` AS `FECHAINGRESO`, `activo`.`FOTOGRAFIA` AS `FOTOGRAFIA`, `activo`.`FHREGSERV` AS `FHREGSERV`, `activo`.`FECHAMODIFICACION` AS `FECHAMODIFICACION`, `activo`.`USUARIOREGISTRO` AS `USUARIOREGISTRO`, `activo`.`ESTADOACTIVO` AS `ESTADOACTIVO` FROM `activo` ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_AsigCargoPersonalAll_view`
--
DROP TABLE IF EXISTS `DB_VIEW_AsigCargoPersonalAll_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_AsigCargoPersonalAll_view`  AS SELECT `asigcargopersonal`.`CODASIGCARGOPER` AS `CODASIGCARGOPER`, `asigcargopersonal`.`CODCARGODEP` AS `CODCARGODEP`, `asigcargopersonal`.`CODPERSONAL` AS `CODPERSONAL`, `asigcargopersonal`.`FECHAASIGNACION` AS `FECHAASIGNACION`, `asigcargopersonal`.`FECHACONCLUCION` AS `FECHACONCLUCION`, `asigcargopersonal`.`ESTADO` AS `ESTADO`, `asigcargopersonal`.`MEMODESIGNACION` AS `MEMODESIGNACION` FROM `asigcargopersonal` ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_AsigCargoPersonal_view`
--
DROP TABLE IF EXISTS `DB_VIEW_AsigCargoPersonal_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_AsigCargoPersonal_view`  AS SELECT `asigcargopersonal`.`CODASIGCARGOPER` AS `CODASIGCARGOPER`, `asigcargopersonal`.`CODCARGODEP` AS `CODCARGODEP`, `asigcargopersonal`.`CODPERSONAL` AS `CODPERSONAL`, `asigcargopersonal`.`FECHAASIGNACION` AS `FECHAASIGNACION`, `asigcargopersonal`.`FECHACONCLUCION` AS `FECHACONCLUCION`, `asigcargopersonal`.`ESTADO` AS `ESTADO`, `asigcargopersonal`.`MEMODESIGNACION` AS `MEMODESIGNACION`, `asigcargopersonal`.`FHREGSERV` AS `FHREGSERV` FROM `asigcargopersonal` WHERE `asigcargopersonal`.`ESTADO` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_CargoAlll_view`
--
DROP TABLE IF EXISTS `DB_VIEW_CargoAlll_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_CargoAlll_view`  AS SELECT `cargo`.`CODCARGO` AS `CODCARGO`, `cargo`.`CODDEPARTAMENTO` AS `CODDEPARTAMENTO`, `cargo`.`CARGO` AS `CARGO`, `cargo`.`ESTADO` AS `ESTADO` FROM `cargo` ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_Cargo_view`
--
DROP TABLE IF EXISTS `DB_VIEW_Cargo_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_Cargo_view`  AS SELECT `cargo`.`CODCARGO` AS `CODCARGO`, `cargo`.`CODDEPARTAMENTO` AS `CODDEPARTAMENTO`, `cargo`.`CARGO` AS `CARGO`, `cargo`.`ESTADO` AS `ESTADO` FROM `cargo` WHERE `cargo`.`ESTADO` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_ClaseactivoMarca_view`
--
DROP TABLE IF EXISTS `DB_VIEW_ClaseactivoMarca_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_ClaseactivoMarca_view`  AS SELECT `uno`.`CODCLASE` AS `CODCLASE`, `uno`.`PARTIDA` AS `PARTIDA`, `uno`.`CLASE` AS `CLASE`, `uno`.`DESCRIPCIONCLASE` AS `DESCRIPCIONCLASE`, `marca`.`CODMARCA` AS `CODMARCA`, `marca`.`MARCA` AS `MARCA`, `marca`.`ESTADO` AS `ESTADO` FROM ((select `claseactivo`.`CODCLASE` AS `CODCLASE`,`claseactivo`.`PARTIDA` AS `PARTIDA`,`claseactivo`.`CLASE` AS `CLASE`,`claseactivo`.`DESCRIPCIONCLASE` AS `DESCRIPCIONCLASE` from `claseactivo` where `claseactivo`.`ESTADO` = '1') `uno` join `marca`) WHERE `marca`.`CODCLASE` = `uno`.`CODCLASE` AND `marca`.`ESTADO` = '1' ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_Claseactivo_view`
--
DROP TABLE IF EXISTS `DB_VIEW_Claseactivo_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_Claseactivo_view`  AS SELECT `claseactivo`.`CODCLASE` AS `CODCLASE`, `claseactivo`.`PARTIDA` AS `PARTIDA`, `claseactivo`.`CLASE` AS `CLASE`, `claseactivo`.`DESCRIPCIONCLASE` AS `DESCRIPCIONCLASE`, `claseactivo`.`ESTADO` AS `ESTADO` FROM `claseactivo` WHERE `claseactivo`.`ESTADO` = '1' ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_DepartamentosAll_view`
--
DROP TABLE IF EXISTS `DB_VIEW_DepartamentosAll_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_DepartamentosAll_view`  AS SELECT `departamentos`.`CODDEPARTAMENTO` AS `CODDEPARTAMENTO`, `departamentos`.`NOMBDEPARTAMENTO` AS `NOMBDEPARTAMENTO`, `departamentos`.`DESCRIPCION` AS `DESCRIPCION`, `departamentos`.`ESTADO` AS `ESTADO` FROM `departamentos` ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_Departamentos_view`
--
DROP TABLE IF EXISTS `DB_VIEW_Departamentos_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_Departamentos_view`  AS SELECT `departamentos`.`CODDEPARTAMENTO` AS `CODDEPARTAMENTO`, `departamentos`.`NOMBDEPARTAMENTO` AS `NOMBDEPARTAMENTO`, `departamentos`.`DESCRIPCION` AS `DESCRIPCION`, `departamentos`.`ESTADO` AS `ESTADO` FROM `departamentos` WHERE `departamentos`.`ESTADO` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_Item_Available_view`
--
DROP TABLE IF EXISTS `DB_VIEW_Item_Available_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_Item_Available_view`  AS SELECT `item`.`CODITEM` AS `CODITEM` FROM `item` WHERE !exists(select `p`.`CODPERSONAL`,`p`.`CODITEM`,`p`.`CI`,`p`.`FECHAASIGNACION`,`p`.`FECHADESASIGNACION`,`p`.`ESTADO` from `personal` `p` where `p`.`CODITEM` = `item`.`CODITEM` limit 1) ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_Item_view`
--
DROP TABLE IF EXISTS `DB_VIEW_Item_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_Item_view`  AS SELECT `item`.`CODITEM` AS `CODITEM`, `item`.`ESTADO` AS `ESTADO` FROM `item` WHERE `item`.`ESTADO` = '1' ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_PersonalAll_view`
--
DROP TABLE IF EXISTS `DB_VIEW_PersonalAll_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_PersonalAll_view`  AS SELECT `personal`.`CODPERSONAL` AS `CODPERSONAL`, `personal`.`CODITEM` AS `CODITEM`, `personal`.`CI` AS `CI`, `personal`.`FECHAASIGNACION` AS `FECHAASIGNACION`, `personal`.`FECHADESASIGNACION` AS `FECHADESASIGNACION`, `personal`.`ESTADO` AS `ESTADO` FROM `personal` ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_Personal_view`
--
DROP TABLE IF EXISTS `DB_VIEW_Personal_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_Personal_view`  AS SELECT `personal`.`CODPERSONAL` AS `CODPERSONAL`, `personal`.`CODITEM` AS `CODITEM`, `personal`.`CI` AS `CI`, `personal`.`FECHAASIGNACION` AS `FECHAASIGNACION`, `personal`.`FECHADESASIGNACION` AS `FECHADESASIGNACION`, `personal`.`ESTADO` AS `ESTADO` FROM `personal` WHERE `personal`.`ESTADO` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_Persona_view`
--
DROP TABLE IF EXISTS `DB_VIEW_Persona_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_Persona_view`  AS SELECT `persona`.`CI` AS `CI`, `persona`.`CODPROFESION` AS `CODPROFESION`, `persona`.`NOMBRES` AS `NOMBRES`, `persona`.`APPATERNO` AS `APPATERNO`, `persona`.`APMATERNO` AS `APMATERNO`, `persona`.`FECHANACIMIENTO` AS `FECHANACIMIENTO`, `persona`.`DIRECCION` AS `DIRECCION`, `persona`.`TELEFONO` AS `TELEFONO`, `persona`.`CORREO` AS `CORREO`, `persona`.`CELULAR` AS `CELULAR`, `persona`.`SEXO` AS `SEXO`, `persona`.`EXPEDIDOCI` AS `EXPEDIDOCI` FROM `persona` ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_Procedencia_view`
--
DROP TABLE IF EXISTS `DB_VIEW_Procedencia_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_Procedencia_view`  AS SELECT `procedencia`.`CODPROCEDENCIA` AS `CODPROCEDENCIA`, `procedencia`.`PROCEDENCIA` AS `PROCEDENCIA`, `procedencia`.`ESTADO` AS `ESTADO` FROM `procedencia` WHERE `procedencia`.`ESTADO` = '1' ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_Profesion_view`
--
DROP TABLE IF EXISTS `DB_VIEW_Profesion_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_Profesion_view`  AS SELECT `profesion`.`CODPROFESION` AS `CODPROFESION`, `profesion`.`PROFESION` AS `PROFESION`, `profesion`.`ESTADO` AS `ESTADO`, `profesion`.`GRADOACADEMICO` AS `GRADOACADEMICO`, `profesion`.`ABREVIACION` AS `ABREVIACION` FROM `profesion` WHERE `profesion`.`ESTADO` = '1' ;

-- --------------------------------------------------------

--
-- Structure for view `DB_VIEW_Provedor_view`
--
DROP TABLE IF EXISTS `DB_VIEW_Provedor_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `DB_VIEW_Provedor_view`  AS SELECT `proveedor`.`NIT` AS `NIT`, `proveedor`.`NOMPROVEEDOR` AS `NOMPROVEEDOR`, `proveedor`.`TELEFONOPROVEEDOR` AS `TELEFONOPROVEEDOR`, `proveedor`.`CONTACTO` AS `CONTACTO`, `proveedor`.`CORREOCONTACTO` AS `CORREOCONTACTO`, `proveedor`.`CELULARCONTACTO` AS `CELULARCONTACTO` FROM `proveedor` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activo`
--
ALTER TABLE `activo`
  ADD PRIMARY KEY (`CODACTIVO`);

--
-- Indexes for table `asigcargopersonal`
--
ALTER TABLE `asigcargopersonal`
  ADD PRIMARY KEY (`CODASIGCARGOPER`);

--
-- Indexes for table `asignacionactivo`
--
ALTER TABLE `asignacionactivo`
  ADD PRIMARY KEY (`CODASIGACTIVO`);

--
-- Indexes for table `asignacionrepuesto`
--
ALTER TABLE `asignacionrepuesto`
  ADD PRIMARY KEY (`CODASIGBNACION`);

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`CODCARGO`);

--
-- Indexes for table `catalogo`
--
ALTER TABLE `catalogo`
  ADD PRIMARY KEY (`CODCATALOGO`);

--
-- Indexes for table `centromantenimiento`
--
ALTER TABLE `centromantenimiento`
  ADD PRIMARY KEY (`CODCENTRO`);

--
-- Indexes for table `claseactivo`
--
ALTER TABLE `claseactivo`
  ADD PRIMARY KEY (`CODCLASE`);

--
-- Indexes for table `cronogramapreventivo`
--
ALTER TABLE `cronogramapreventivo`
  ADD PRIMARY KEY (`CODCRONOGRAMA`);

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`CODDEPARTAMENTO`);

--
-- Indexes for table `detallecronograma`
--
ALTER TABLE `detallecronograma`
  ADD PRIMARY KEY (`CODDETALLE`);

--
-- Indexes for table `detallemantenimiento`
--
ALTER TABLE `detallemantenimiento`
  ADD PRIMARY KEY (`CODDETALLE`);

--
-- Indexes for table `History`
--
ALTER TABLE `History`
  ADD PRIMARY KEY (`idHistory`);

--
-- Indexes for table `informe`
--
ALTER TABLE `informe`
  ADD PRIMARY KEY (`CODINFORME`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`CODITEM`);

--
-- Indexes for table `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`CODMANTENIMIENTO`);

--
-- Indexes for table `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`CODMARCA`);

--
-- Indexes for table `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`CODMODELO`);

--
-- Indexes for table `ordentrabajo`
--
ALTER TABLE `ordentrabajo`
  ADD PRIMARY KEY (`CODORDENTRABAJO`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`CI`);

--
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`CODPERSONAL`);

--
-- Indexes for table `procedencia`
--
ALTER TABLE `procedencia`
  ADD PRIMARY KEY (`CODPROCEDENCIA`);

--
-- Indexes for table `profesion`
--
ALTER TABLE `profesion`
  ADD PRIMARY KEY (`CODPROFESION`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`NIT`);

--
-- Indexes for table `repuestos`
--
ALTER TABLE `repuestos`
  ADD PRIMARY KEY (`CODREPUESTO`);

--
-- Indexes for table `subtareas`
--
ALTER TABLE `subtareas`
  ADD PRIMARY KEY (`CODSUBTAREA`);

--
-- Indexes for table `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`CODTAREA`);

--
-- Indexes for table `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`CODTECNICO`);

--
-- Indexes for table `tiporepuesto`
--
ALTER TABLE `tiporepuesto`
  ADD PRIMARY KEY (`CODTIPOREPUESTO`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`NOMREUSUARIO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activo`
--
ALTER TABLE `activo`
  MODIFY `CODACTIVO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `asigcargopersonal`
--
ALTER TABLE `asigcargopersonal`
  MODIFY `CODASIGCARGOPER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `asignacionactivo`
--
ALTER TABLE `asignacionactivo`
  MODIFY `CODASIGACTIVO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asignacionrepuesto`
--
ALTER TABLE `asignacionrepuesto`
  MODIFY `CODASIGBNACION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `CODCARGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `catalogo`
--
ALTER TABLE `catalogo`
  MODIFY `CODCATALOGO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `centromantenimiento`
--
ALTER TABLE `centromantenimiento`
  MODIFY `CODCENTRO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `claseactivo`
--
ALTER TABLE `claseactivo`
  MODIFY `CODCLASE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cronogramapreventivo`
--
ALTER TABLE `cronogramapreventivo`
  MODIFY `CODCRONOGRAMA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `CODDEPARTAMENTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `detallecronograma`
--
ALTER TABLE `detallecronograma`
  MODIFY `CODDETALLE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detallemantenimiento`
--
ALTER TABLE `detallemantenimiento`
  MODIFY `CODDETALLE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `History`
--
ALTER TABLE `History`
  MODIFY `idHistory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `informe`
--
ALTER TABLE `informe`
  MODIFY `CODINFORME` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mantenimiento`
--
ALTER TABLE `mantenimiento`
  MODIFY `CODMANTENIMIENTO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marca`
--
ALTER TABLE `marca`
  MODIFY `CODMARCA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `modelo`
--
ALTER TABLE `modelo`
  MODIFY `CODMODELO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ordentrabajo`
--
ALTER TABLE `ordentrabajo`
  MODIFY `CODORDENTRABAJO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal`
--
ALTER TABLE `personal`
  MODIFY `CODPERSONAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `procedencia`
--
ALTER TABLE `procedencia`
  MODIFY `CODPROCEDENCIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `profesion`
--
ALTER TABLE `profesion`
  MODIFY `CODPROFESION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `repuestos`
--
ALTER TABLE `repuestos`
  MODIFY `CODREPUESTO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subtareas`
--
ALTER TABLE `subtareas`
  MODIFY `CODSUBTAREA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tareas`
--
ALTER TABLE `tareas`
  MODIFY `CODTAREA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `CODTECNICO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tiporepuesto`
--
ALTER TABLE `tiporepuesto`
  MODIFY `CODTIPOREPUESTO` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

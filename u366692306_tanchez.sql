-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-06-2023 a las 04:41:27
-- Versión del servidor: 10.5.19-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u366692306_tanchez`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `idCiudad` int(11) NOT NULL,
  `nombreCiudad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`idCiudad`, `nombreCiudad`) VALUES
(1, 'Tijuana'),
(2, 'Tecate'),
(3, 'Mexicali'),
(4, 'Ensenada'),
(5, 'Rosarito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinicas`
--

CREATE TABLE `clinicas` (
  `idClinica` int(11) NOT NULL,
  `nombreClinica` varchar(100) DEFAULT NULL,
  `direccionClinica` text DEFAULT NULL,
  `donacionClinica` int(11) DEFAULT NULL,
  `idCiudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clinicas`
--

INSERT INTO `clinicas` (`idClinica`, `nombreClinica`, `direccionClinica`, `donacionClinica`, `idCiudad`) VALUES
(1, 'Premier', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d817.0744890902214!2d-117.02057123200284!3d32.524374215687004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80d94845865a96ff%3A0xd105e1d1005f2e1f!2sCentro%20M%C3%A9dico%20Premier!5e0!3m2!1ses!2smx!4v1676312220589!5m2!1ses!2smx\" width=\"250\" height=\"250\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 1, 1),
(2, 'Angeles', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3364.3029110195735!2d-117.01010228445936!3d32.51805590445078!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80d9480141af4fb7%3A0xd4400072dc537040!2sHospital%20Angeles%20Tijuana!5e0!3m2!1ses!2smx!4v1676312389551!5m2!1ses!2smx\" width=\"250\" height=\"250\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinicatienemedicamento`
--

CREATE TABLE `clinicatienemedicamento` (
  `idClinica` int(11) NOT NULL DEFAULT 1,
  `idUsuario` int(11) NOT NULL,
  `idMedicamento` int(11) NOT NULL,
  `cantidadMedicamento` int(11) DEFAULT NULL,
  `loteMedicamento` varchar(100) DEFAULT NULL,
  `marca` varchar(40) DEFAULT NULL,
  `fechadecaducidadMedicamento` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clinicatienemedicamento`
--

INSERT INTO `clinicatienemedicamento` (`idClinica`, `idUsuario`, `idMedicamento`, `cantidadMedicamento`, `loteMedicamento`, `marca`, `fechadecaducidadMedicamento`) VALUES
(1, 11, 6, 290, '92', 'Testla', '2025-07-10'),
(1, 1, 7, 300, '90', 'RAAMFEN', '2040-09-26'),
(1, 1, 8, 54, 'b34', 'Maraca', '2023-07-21'),
(1, 1, 9, 90, 'B69', 'test2', '2026-07-07'),
(1, 1, 10, 4, 'l28', 'Maraca', '2023-11-04'),
(1, 1, 11, 19, '98', 'testse', '2023-11-23'),
(1, 1, 12, 4, '28', 'test', '2030-06-08'),
(1, 1, 13, 17, 're', 'Maracaf', '2025-12-10'),
(1, 1, 14, 27, '3', 'Sini2', '2023-12-31'),
(1, 1, 15, 3, '34', 'prueba', '2026-06-10'),
(1, 1, 16, 5, '45', 'loratadina', '2025-10-12'),
(1, 2, 17, 14, 'fdgdf', 'dasfas', '2024-06-10'),
(1, 2, 18, 10, '90', 'RAAMFEN', '2023-12-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dosis`
--

CREATE TABLE `dosis` (
  `idDosis` int(11) NOT NULL,
  `nombreDosis` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dosis`
--

INSERT INTO `dosis` (`idDosis`, `nombreDosis`) VALUES
(1, 'Oral'),
(2, 'Inyectada'),
(3, 'Intravenosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `txid` int(11) NOT NULL,
  `idMedicamento` int(11) NOT NULL,
  `ingrediente_activo` varchar(60) DEFAULT NULL,
  `marca` varchar(60) DEFAULT NULL,
  `lote` varchar(60) DEFAULT NULL,
  `controlado` varchar(60) DEFAULT NULL,
  `dosis` varchar(60) DEFAULT NULL,
  `presentacion` varchar(60) DEFAULT NULL,
  `unidades` varchar(60) DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `ubicacion` text NOT NULL,
  `notas` text NOT NULL,
  `via_administracion` varchar(60) DEFAULT NULL,
  `usuario` varchar(60) DEFAULT NULL,
  `timepo` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `comentario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`txid`, `idMedicamento`, `ingrediente_activo`, `marca`, `lote`, `controlado`, `dosis`, `presentacion`, `unidades`, `fecha_caducidad`, `ubicacion`, `notas`, `via_administracion`, `usuario`, `timepo`, `comentario`) VALUES
(1, 2, 'Metformina', 'SimilaresXD', '34', '2', '800 mg', '1', '15', '2024-12-24', '', '', '1', '1', '2023-06-03 16:19:53', 'Medicamento Metformina id(2) actualizado por Administrador del sistema (admin@mail.com).'),
(2, 2, 'Metformina', 'Similares2', '34', '2', '800 mg', '1', '15', '2024-12-24', '', '', '1', '1', '2023-06-03 16:30:18', 'Medicamento Metformina id(2) actualizado por Administrador del sistema (admin@mail.com).'),
(3, 2, 'Metformina', 'Similares2', '34', '2', '800 mg', '1', '200', '2024-12-24', '', '', '1', '1', '2023-06-03 16:37:45', 'Medicamento Metformina id(2) actualizado por Administrador del sistema (admin@mail.com).'),
(4, 3, 'paracetamol', 'tempra', '23', '1', '650', '1', '10', '2023-06-16', '', '', '1', '1', '2023-06-03 16:43:52', 'Medicamento paracetamol id(3) dado de alta por Administrador del sistema (admin@mail.com).'),
(5, 3, 'paracetamol', 'tempra', '23', '1', '650 mg', '1', '10', '2023-06-16', '', '', '1', '1', '2023-06-03 16:44:41', 'Medicamento paracetamol id(3) actualizado por Administrador del sistema (admin@mail.com).'),
(6, 3, 'paracetamol', 'tempra', '23', '1', '650 mg', '1', '10', '2023-06-16', '', '', '1', '1', '2023-06-03 17:06:19', 'Medicamento paracetamol id(3) actualizado por Administrador del sistema (admin@mail.com).'),
(7, 3, 'paracetamol', 'tempra', '23', '1', '650 mg', '1', '10', '2023-06-16', '', '', '1', '1', '2023-06-03 17:06:29', 'Medicamento paracetamol id(3) actualizado por Administrador del sistema (admin@mail.com).'),
(8, 3, 'paracetamol', 'tempra', '23', '1', '650 mg', '1', '10', '2023-06-16', '', '', '1', '1', '2023-06-03 17:23:32', 'Medicamento paracetamol id(3) actualizado por Administrador del sistema (admin@mail.com).'),
(9, 3, 'paracetamol', 'tempra', '23', '1', '650 mg', '1', '10', '2023-06-16', '', '', '1', '1', '2023-06-03 17:23:41', 'Medicamento paracetamol id(3) actualizado por Administrador del sistema (admin@mail.com).'),
(10, 2, 'Metformina', 'Similares2', '34', '2', '800 mg', '1', '200', '2024-12-24', '', '', '1', '1', '2023-06-03 17:23:48', 'Medicamento Metformina id(2) actualizado por Administrador del sistema (admin@mail.com).'),
(11, 3, 'paracetamol', 'tempra', '23', '1', '650 mg', '1', '10', '2023-06-16', '', '', '1', '1', '2023-06-03 17:24:01', 'Medicamento paracetamol id(3) actualizado por Administrador del sistema (admin@mail.com).'),
(12, 3, 'paracetamol', 'tempra', '23', '1', '650 mg', '1', '20', '2023-06-16', '', '', '1', '1', '2023-06-03 17:34:38', 'Medicamento paracetamol id(3) actualizado por Administrador del sistema (admin@mail.com).<br>Valores Modificados.<br><strong>Presentacion - </strong> Valor anterior: 1 valor actual: 1,<br>'),
(13, 3, 'paracetamol', 'tempra', '23', '1', '650 mg', '1', '5', '2023-06-16', '', '', '1', '1', '2023-06-03 17:35:10', 'Medicamento paracetamol id(3) actualizado por Administrador del sistema (admin@mail.com).<br>Valores Modificados.<br><strong>Presentacion - </strong> Valor anterior: 1 valor actual: 1,<br>'),
(14, 3, 'paracetamol', 'tempra', '23', '1', '650 mg', '1', '12', '2023-06-16', '', '', '1', '1', '2023-06-03 17:37:11', 'Medicamento paracetamol id(3) actualizado por Administrador del sistema (admin@mail.com).<br>Valores Modificados.<br>'),
(15, 3, 'paracetamol', 'tempra', '23', '1', '650 mg', '2', '12', '2023-06-16', '', '', '2', '1', '2023-06-03 17:37:53', 'Medicamento paracetamol id(3) actualizado por Administrador del sistema (admin@mail.com).<br>Valores Modificados.<br><strong>Presentacion - </strong> Valor anterior: 1 valor actual: 2,<br><strong>Via de Administracion - </strong> Valor anterior: 1 valor actual: 2,<br>'),
(16, 3, 'paracetamol', 'tempra', '23', '1', '650 mg', '3', '12', '2023-06-16', '', '', '2', '1', '2023-06-03 17:50:03', 'Medicamento paracetamol id(3) actualizado por Administrador del sistema (admin@mail.com).<br>Valores Modificados.<br><strong>Presentacion - </strong> Valor anterior: Capsula valor actual: Supositorio,<br>'),
(17, 3, 'paracetamol', 'tempra', '23', '1', '650 mg', '3', '12', '2023-06-16', '', '', '3', '1', '2023-06-03 17:51:02', 'Medicamento paracetamol id(3) actualizado por Administrador del sistema (admin@mail.com).<br>Valores Modificados.<br><strong>Via de Administracion - </strong><br>Valor anterior: Inyectada valor actual: Intravenosa,<br>'),
(18, 3, 'paracetamol', 'tempra', '23', '1', '500 mg', '4', '41', '2023-06-16', '', '', '1', '1', '2023-06-03 17:52:31', 'Medicamento paracetamol id(3) actualizado por Administrador del sistema (admin@mail.com).<br>Valores Modificados.<br><strong>Dosis - </strong><br>Valor anterior: 650 mg<br>valor actual: 500 mg,<br><strong>Presentacion - </strong><br>Valor anterior: Supositorio<br>valor actual: Pomada,<br><strong>Via de Administracion - </strong><br>Valor anterior: Intravenosa<br>valor actual: Oral,<br>'),
(19, 3, 'paracet8amol', 'tempral', '234', '2', '5070 mg', '1', '42', '2023-06-30', '', '', '2', '1', '2023-06-03 18:19:25', 'Medicamento paracet8amol id(3) actualizado por Administrador del sistema (admin@mail.com).<br>Valores Modificados.<br><strong>In. Activo - </strong><br>Valor anterior: paracetamol<br>valor actual: paracet8amol,<br><strong>Controlado - </strong><br>Valor anterior: Si<br>valor actual: No,<br><strong>Dosis - </strong><br>Valor anterior: 500 mg<br>valor actual: 5070 mg,<br><strong>Presentacion - </strong><br>Valor anterior: Pomada<br>valor actual: Tableta,<br><strong>Via de Administracion - </strong'),
(20, 3, 'paracet8amol', 'tempral', '234', '2', '500mg', '3', '42', '2023-06-30', '', '', '2', '1', '2023-06-03 19:36:08', 'Medicamento paracet8amol id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table><tr><td><strong>Dosis - </strong></td><td>Valor anterior: 5070 mg</td><td>valor actual: 500mg</td></tr><tr><td><strong>Presentacion - </strong></td><td>Valor anterior: Tableta</td><td>valor actual: Supositorio</td></tr></table>'),
(21, 3, 'paracet8amol', 'tempral', '234', '2', '650mg', '6', '42', '2023-06-30', '', '', '2', '1', '2023-06-03 19:37:49', 'Medicamento paracet8amol id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Dosis - </strong></td><td>Valor anterior: 500mg</td><td>valor actual: 650mg</td></tr><tr><td><strong>Presentacion - </strong></td><td>Valor anterior: Supositorio</td><td>valor actual: Jarabe</td></tr></table>'),
(22, 3, 'paracet8amol', 'tempral', '234', '2', '300mg', '5', '42', '2023-06-30', '', '', '2', '1', '2023-06-03 19:39:34', 'Medicamento paracet8amol id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Dosis - </strong></td><td>Valor anterior: 650mg</td><td>valor actual: 300mg</td></tr><tr><td><strong>Presentacion - </strong></td><td>Valor anterior: Jarabe</td><td>valor actual: Crema</td></tr></table>'),
(23, 3, 'paracet8amol', 'tempral', '234', '2', '350mg', '2', '42', '2023-06-30', '', '', '2', '1', '2023-06-03 19:40:46', 'Medicamento paracet8amol id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Dosis - </strong></td><td>300mg</td><td>350mg</td></tr><tr><td><strong>Presentacion - </strong></td><td>Crema</td><td>Capsula</td></tr></table>'),
(24, 4, 'loratadinat', 'Erispanf', '566', '2', '35mg', '2', '103', '2023-07-01', '', '', '2', '1', '2023-06-03 20:35:36', ''),
(25, 3, 'paracet8amol', 'tempral', '234', '2', '350mg', '4', '42', '2023-06-30', '', '', '3', '1', '2023-06-03 20:38:28', 'Medicamento paracet8amol id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Presentacion</strong></td><td>Capsula</td><td>Pomada</td></tr><tr><td><strong>Via de Administracion</strong></td><td>Inyectada</td><td>Intravenosa</td></tr>.</table>'),
(26, 3, 'paracet8amol', 'tempral', '34', '1', '350mg', '5', '42', '2023-06-28', '', '', '3', '1', '2023-06-03 20:42:12', ''),
(27, 3, 'paracetamoles', 'tempra forte', '76', '2', '500mg', '2', '42', '2023-06-23', '', '', '1', '1', '2023-06-03 20:44:25', 'Medicamento paracetamoles id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>In. Activo</strong></td><td>paracet8amol</td><td>paracetamoles</td></tr><tr><td><strong>Controlado</strong></td><td>Si</td><td>No</td></tr><tr><td><strong>Dosis</strong></td><td>350mg</td><td>500mg</td></tr><tr><td><strong>Presentacion</strong></td><td>Crema</td><td>Capsula</td></tr><tr><td><strong>Via de Administracion</strong></td><td>Intravenosa</td><td>Oral</td></tr>.<tr><td><strong>Marca</strong></td><td>tempral</td><td>tempra forte</td></tr><tr><td><strong>Lote</strong></td><td>34</td><td>76</td></tr><tr><td><strong>Fecha</strong></td><td>2023-06-28</td><td>2023-06-23</td></tr></table>'),
(28, 3, 'paracetamoless', 'tempra fsorte', '763', '1', '500dmg', '3', '422', '2023-07-08', '', '', '3', '1', '2023-06-03 20:53:05', 'Medicamento paracetamoless id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>In. Activo</strong></td><td>paracetamoles</td><td>paracetamoless</td></tr><tr><td><strong>Controlado</strong></td><td>No</td><td>Si</td></tr><tr><td><strong>Dosis</strong></td><td>500mg</td><td>500dmg</td></tr><tr><td><strong>Ubicacion</strong></td><td></td><td>Tijuana</td></tr><tr><td><strong>Notas</strong></td><td>Prueba uno</td><td>sPrueba uno</td></tr><tr><td><strong>Presentacion</strong></td><td>Capsula</td><td>Supositorio</td></tr><tr><td><strong>Via de Administracion</strong></td><td>Oral</td><td>Intravenosa</td></tr>.<tr><td><strong>Marca</strong></td><td>tempra forte</td><td>tempra fsorte</td></tr><tr><td><strong>Lote</strong></td><td>76</td><td>763</td></tr><tr><td><strong>Unidades</strong></td><td>42</td><td>422</td></tr><tr><td><strong>Fecha</strong></td><td>2023-06-23</td><td>2023-07-08</td></tr></table>'),
(29, 4, 'loratadinat', 'Erispanf', '566', '2', '35mg', '2', '103', '2023-09-02', '', '', '2', '1', '2023-06-03 20:53:36', 'Medicamento loratadinat id(4) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-07-01</td><td>2023-09-02</td></tr></table>'),
(30, 3, 'paracetamoless', 'tempra fsorte', '763', '1', '500dmg', '3', '422', '2023-07-14', '', '', '3', '1', '2023-06-03 21:09:21', 'Medicamento paracetamoless id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td class=\'fechr\'>2023-07-07</td><td class=\'fechr\'>2023-07-14</td></tr></table>'),
(31, 1, 'Ácido acetilsalicilico', 'Pfizer', '1456', '1', '300 mg', '1', '185', '2025-05-02', '', '', '1', '1', '2023-06-03 21:09:47', 'Medicamento Ácido acetilsalicilico id(1) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Controlado</strong></td><td>No</td><td>Si</td></tr><tr><td><strong>Ubicacion</strong></td><td></td><td>Encima de la computadora</td></tr><tr><td><strong>Notas</strong></td><td></td><td>Tomar Con Precaución, tapa dañada </td></tr>.<tr><td><strong>Unidades</strong></td><td>20</td><td>185</td></tr></table>'),
(32, 1, 'Ácido acetilsalicilico', 'Pfizer', '1456', '1', '300 mg', '1', '185', '2025-05-02', '', '', '1', '1', '2023-06-03 21:37:17', 'Medicamento Ácido acetilsalicilico id(1) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Ubicacion</strong></td><td></td><td>Estante b-4\r\n</td></tr>.</table>'),
(33, 3, 'paracetamoless', 'tempra fsorte', '763', '1', '500dmg', '3', '422', '2023-07-14', '', '', '2', '1', '2023-06-03 21:50:18', 'Medicamento paracetamoless id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Ubicacion</strong></td><td></td><td>test</td></tr><tr><td><strong>Via de Administracion</strong></td><td>Intravenosa</td><td>Inyectada</td></tr>.</table>'),
(34, 3, 'paracetamoless', 'tempra fsorte', '763', '1', '500dmg', '3', '422', '2023-07-14', '', '', '2', '1', '2023-06-03 21:50:49', 'Medicamento paracetamoless id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Ubicacion</strong></td><td></td><td>test</td></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion 03-06-2023</td></tr></table>'),
(35, 3, 'paracetamoless', 'tempra fsorte', '763', '1', '500dmg', '3', '422', '2023-07-14', '', '', '2', '1', '2023-06-03 21:51:39', 'Medicamento paracetamoless id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Ubicacion</strong></td><td></td><td>test</td></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion 03-06-2023</td></tr></table>'),
(36, 3, 'paracetamoless', 'tempra fsorte', '34', '2', '300dmg', '3', '422', '2023-07-14', '', '', '2', '1', '2023-06-03 21:55:27', 'Medicamento paracetamoless id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Controlado</strong></td><td>Si</td><td>No</td></tr><tr><td><strong>Dosis</strong></td><td>500dmg</td><td>300dmg</td></tr>.<tr><td><strong>Lote</strong></td><td>763</td><td>34</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 03-06-2023 a las 09:55:27pm</td></tr></table>'),
(37, 3, 'paracetamoless', 'tempra forte', '34', '1', '300dmg', '3', '422', '2023-07-20', '', '', '2', '1', '2023-06-03 21:58:01', 'Medicamento paracetamoless id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Controlado</strong></td><td>No</td><td>Si</td></tr>.<tr><td><strong>Marca</strong></td><td>tempra fsorte</td><td>tempra forte</td></tr><tr><td><strong>Fecha</strong></td><td>2023-07-14</td><td2023-07-20</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 03-06-2023 a las 02:58:01pm</td></tr></table>'),
(38, 3, 'paracetamoless', 'tempra forte', '34', '1', '300dmg', '3', '422', '2023-07-20', '', '', '1', '1', '2023-06-03 22:05:54', 'Medicamento paracetamoless id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Via de Administracion</strong></td><td>Inyectada</td><td>Oral</td></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 03-06-2023 a las 03:05:54pm</td></tr></table>'),
(39, 6, 'Pueba', 'test', '90', '1', '500Mg', '1', '50', '2023-11-24', '', '', '1', '1', '2023-06-03 22:08:15', 'Medicamento Pueba id(6) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>In. Activo</strong></td><td>Tests</td><td>Pueba</td></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 03-06-2023 a las 03:08:15pm</td></tr></table>'),
(40, 5, 'Cafe', 'X', '90', '1', '200ml', '1', '450', '2023-10-20', '', '', '2', '1', '2023-06-03 22:17:38', 'Medicamento Cafe id(5) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>45</td><td>450</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 03-06-2023 a las 03:17:38pm</td></tr></table>'),
(41, 2, 'Metformina', 'Similares2', '34', '2', '800 mg', '1', '20', '2024-12-24', '', '', '1', '1', '2023-06-03 22:17:46', 'Medicamento Metformina id(2) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>200</td><td>20</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 03-06-2023 a las 03:17:46pm</td></tr></table>'),
(42, 6, 'Pueba', 'test', '90', '1', '500Mg', '1', '59', '2023-11-24', '', '', '1', '1', '2023-06-03 22:17:53', 'Medicamento Pueba id(6) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>50</td><td>59</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 03-06-2023 a las 03:17:53pm</td></tr></table>'),
(43, 3, 'paracetamoless', 'tempra forte', '34', '1', '300dmg', '2', '42253', '2023-07-20', '', '', '1', '1', '2023-06-04 08:34:05', 'Medicamento paracetamoless id(3) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Presentacion</strong></td><td>Supositorio</td><td>Capsula</td></tr>.<tr><td><strong>Unidades</strong></td><td>422</td><td>42253</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 04-06-2023 a las 01:34:05am</td></tr></table>'),
(44, 6, 'PuebaF', 'testD', '902', '2', '200Mg', '2', '592', '2023-11-25', '', '', '3', '1', '2023-06-04 08:35:30', 'Medicamento PuebaF id(6) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>In. Activo</strong></td><td>Pueba</td><td>PuebaF</td></tr><tr><td><strong>Controlado</strong></td><td>Si</td><td>No</td></tr><tr><td><strong>Dosis</strong></td><td>500Mg</td><td>200Mg</td></tr><tr><td><strong>Ubicacion</strong></td><td>Casa</td><td>CasaW</td></tr><tr><td><strong>Notas</strong></td><td>esta cerrado</td><td>esta cerradSo</td></tr><tr><td><strong>Presentacion</strong></td><td>Tableta</td><td>Capsula</td></tr><tr><td><strong>Via de Administracion</strong></td><td>Oral</td><td>Intravenosa</td></tr>.<tr><td><strong>Marca</strong></td><td>test</td><td>testD</td></tr><tr><td><strong>Lote</strong></td><td>90</td><td>902</td></tr><tr><td><strong>Unidades</strong></td><td>59</td><td>592</td></tr><tr><td><strong>Fecha</strong></td><td>2023-11-24</td><td2023-11-25</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 04-06-2023 a las 01:35:30am</td></tr></table>'),
(45, 4, 'loratadinat', 'Erispanf', '566', '2', '35mg', '2', '103', '2023-09-30', '', '', '2', '1', '2023-06-04 08:37:16', 'Medicamento loratadinat id(4) actualizado por Administrador del sistema (admin@mail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-09-02</td><td>2023-09-30</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 04-06-2023 a las 01:37:16am</td></tr></table>'),
(46, 3, 'paracetamoless', 'tempra forted', '34s3', '1', '300dmg', '2', '42253', '2023-07-20', '', '', '1', '6', '2023-06-04 09:29:33', 'Medicamento paracetamoless id(3) actualizado por miguel (luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Marca</strong></td><td>tempra forte</td><td>tempra forted</td></tr><tr><td><strong>Lote</strong></td><td>34</td><td>34s3</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 04-06-2023 a las 02:29:33am</td></tr></table>'),
(47, 2, 'Metforminas', 'Similares', '342', '1', '8020 mg', '2', '202', '2024-12-29', '', '', '2', '6', '2023-06-04 09:30:44', 'Medicamento Metforminas id(2) actualizado por miguel (luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>In. Activo</strong></td><td>Metformina</td><td>Metforminas</td></tr><tr><td><strong>Controlado</strong></td><td>No</td><td>Si</td></tr><tr><td><strong>Dosis</strong></td><td>800 mg</td><td>8020 mg</td></tr><tr><td><strong>Ubicacion</strong></td><td></td><td>Tijuana</td></tr><tr><td><strong>Notas</strong></td><td>Hello</td><td>Hellos</td></tr><tr><td><strong>Presentacion</strong></td><td>Tableta</td><td>Capsula</td></tr><tr><td><strong>Via de Administracion</strong></td><td>Oral</td><td>Inyectada</td></tr>.<tr><td><strong>Marca</strong></td><td>Similares2</td><td>Similares</td></tr><tr><td><strong>Lote</strong></td><td>34</td><td>342</td></tr><tr><td><strong>Unidades</strong></td><td>20</td><td>202</td></tr><tr><td><strong>Fecha</strong></td><td>2024-12-24</td><td>2024-12-29</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 04-06-2023 a las 02:30:44am</td></tr></table>'),
(48, 3, 'paracetamoless', 'tempra forte', '34', '1', '300dmg', '2', '42253', '2023-07-20', '', '', '1', '6', '2023-06-04 15:33:27', 'Medicamento paracetamoless id(3) actualizado por miguel (luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Ubicacion</strong></td><td>test</td><td>test TES</td></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 04-06-2023 a las 08:33:27am</td></tr></table>'),
(49, 1, 'Ácido acetilsalicil', 'Pfizerk', '146', '2', '30 mg', '1', '18', '2025-05-29', '', '', '2', '6', '2023-06-04 22:23:42', 'Medicamento Ácido acetilsalicil id(1) actualizado por miguel (luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>In. Activo</strong></td><td>Ácido acetilsalicilico</td><td>Ácido acetilsalicil</td></tr><tr><td><strong>Controlado</strong></td><td>Si</td><td>No</td></tr><tr><td><strong>Dosis</strong></td><td>300 mg</td><td>30 mg</td></tr><tr><td><strong>Ubicacion</strong></td><td></td><td>En mi casa</td></tr><tr><td><strong>Notas</strong></td><td>Tomar Con Precaución, tapa dañada </td><td>Tomar Con Precaución, tapa dañadas</td></tr><tr><td><strong>Via de Administracion</strong></td><td>Oral</td><td>Inyectada</td></tr>.<tr><td><strong>Marca</strong></td><td>Pfizer</td><td>Pfizerk</td></tr><tr><td><strong>Lote</strong></td><td>1456</td><td>146</td></tr><tr><td><strong>Unidades</strong></td><td>185</td><td>18</td></tr><tr><td><strong>Fecha</strong></td><td>2025-05-02</td><td>2025-05-29</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 04-06-2023 a las 03:23:42pm</td></tr></table>'),
(50, 19, 'Paracetamol', 'RAAMFEN', 'RR136', '1', '200ml', '2', '9', '2023-07-06', 'Casa', '', '1', '7', '2023-06-05 04:55:05', 'Medicamento Paracetamol id(19) dado de alta por miguel (luistanchez0298@gmail.com).'),
(51, 20, 'Paracetamol', 'RAAMFEN', 'RR136', '1', '2', '1', '3', '2023-07-08', 'F', '', '1', '7', '2023-06-05 04:58:56', 'Medicamento Paracetamol id(20) dado de alta por miguel (luistanchez0298@gmail.com).'),
(52, 21, 'Metforminaj', 'Astrazenecad', '3', '1', '25 MG', '2', '90', '2029-12-18', 'F', 'DS', '1', '1', '2023-06-05 05:00:06', 'Medicamento Metforminaj id(21) dado de alta por Administrador del sistema (admin@mail.com).'),
(53, 22, 'Fentanilo', 'Ice', '546', '1', 'anal', '3', '7', '2023-07-05', 'A un costado del estante b-54', 'No consumir en exceso puedes quedar como zombie', '1', '1', '2023-06-06 15:35:41', 'Medicamento Fentanilo id(22) dado de alta por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).'),
(54, 23, 'Paracetamol', 'Registrada', '564', '1', 's', '2', '56', '2023-06-06', 'Laboratorio 5', 'Tapa rota, tomar con precaución ', '1', '10', '2023-06-06 15:51:38', 'Medicamento Paracetamol id(23) dado de alta por Max William (max.mendoza201@tectijuana.edu.mx).'),
(55, 24, 'Laritol', 'Simi', 'B672', '2', '2000ML', '6', '900', '2050-12-12', 'En el estatne', 'Selladas', '1', '2', '2023-06-06 15:52:20', 'Medicamento Laritol id(24) dado de alta por Max (luis.tanchez17@tectijuana.edu.mx).'),
(56, 25, 'Laritol D', 'Simi 2', '923', '2', '50G', '1', '87', '2023-10-07', 'Casa', '', '1', '11', '2023-06-06 15:59:56', 'Medicamento Laritol D id(25) dado de alta por Luis (Luisdragon.com@gmail.com).'),
(57, 1, 'Ácido acetilsalicil', 'Pfizer', '1450', '2', '30 mg', 'En mi casa', 'Tomar Con Precaución, tapa dañadas', '0000-00-00', '18', '2023-05-02', '2', '1', '2023-06-07 04:32:41', 'Medicamento Ácido acetilsalicil id(1) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:32:41pm</td></tr></table>'),
(58, 1, 'Ácido acetilsalicil', 'Pfizer', '1452', '2', '30 mg', 'En mi casa', 'Tomar Con Precaución, tapa dañadas', '0000-00-00', '17', '2023-05-02', '2', '1', '2023-06-07 04:32:57', 'Medicamento Ácido acetilsalicil id(1) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Lote</strong></td><td>1450</td><td>1452</td></tr><tr><td><strong>Unidades</strong></td><td>18</td><td>17</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:32:57pm</td></tr></table>'),
(59, 23, 'Paracetamol', 'Registrada', '564', '1', 's', 'Laboratorio 52', 'Tapa rota, tomar con precaución ', '0000-00-00', '561', '2023-06-06', '1', '1', '2023-06-07 04:37:57', 'Medicamento Paracetamol id(23) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Ubicacion</strong></td><td>Laboratorio 5</td><td>Laboratorio 52</td></tr>.<tr><td><strong>Unidades</strong></td><td>56</td><td>561</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:37:57pm</td></tr></table>'),
(60, 23, 'Paracetamol', 'Registrada', '564', '1', 's', 'Laboratorio 52', 'Tapa rota, tomar con precaución ', '0000-00-00', '562', '2023-06-06', '1', '11', '2023-06-07 04:38:58', 'Medicamento Paracetamol id(23) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>56</td><td>562</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:38:58pm</td></tr></table>'),
(61, 6, 'Puebassssssss', 'testD', '902', '1', '200Mg', 'CasaWsssssssss', 'esta cerradSosssssss', '0000-00-00', '5922', '2023-10-25', '3', '11', '2023-06-07 04:39:05', 'Medicamento Puebassssssss id(6) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Ubicacion</strong></td><td>CasaWssssssss</td><td>CasaWsssssssss</td></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:39:05pm</td></tr></table>'),
(62, 6, 'Puebassssssss', 'testD', '902', '1', '200Mg', 'ds', 'esta cerradSosssssss', '0000-00-00', '5922', '2023-10-25', '3', '11', '2023-06-07 04:39:11', 'Medicamento Puebassssssss id(6) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Ubicacion</strong></td><td>CasaWsssssssss</td><td>ds</td></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:39:11pm</td></tr></table>'),
(63, 21, 'Metforminaj', 'Astrazenecadd', '34', '1', '235 MG', 'Ff', 'DS', '0000-00-00', '91', '2029-12-18', '1', '11', '2023-06-07 04:39:16', 'Medicamento Metforminaj id(21) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>90</td><td>91</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:39:16pm</td></tr></table>'),
(64, 23, 'Paracetamol', 'Registrada', '564', '1', 's', 'Laboratorio 52', 'Tapa rota, tomar con precaución ', '0000-00-00', '5', '2023-06-06', '1', '11', '2023-06-07 04:39:48', 'Medicamento Paracetamol id(23) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>56</td><td>5</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:39:48pm</td></tr></table>'),
(65, 23, 'Paracetamol', 'Registrada', '564', '1', 's', 'Laboratorio 52', 'Tapa rota, tomar con precaución ', '0000-00-00', '5', '2023-06-06', '1', '1', '2023-06-07 04:42:14', 'Medicamento Paracetamol id(23) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>56</td><td>5</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:42:14pm</td></tr></table>'),
(66, 1, 'Ácido acetilsalicil', 'Pfizer', '1452', '2', '30 mg', 'En mi casa', 'Tomar Con Precaución, tapa dañadas', '0000-00-00', '18', '2023-05-02', '2', '1', '2023-06-07 04:42:20', 'Medicamento Ácido acetilsalicil id(1) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>17</td><td>18</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:42:20pm</td></tr></table>'),
(67, 23, 'Paracetamol', 'Registrada', '564', '1', 's', 'Laboratorio 52', 'Tapa rota, tomar con precaución ', '0000-00-00', '5', '2023-06-06', '1', '1', '2023-06-07 04:42:27', 'Medicamento Paracetamol id(23) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>56</td><td>5</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:42:27pm</td></tr></table>'),
(68, 26, 'Laritods', 'simi1', 'B62', '2', '900', '2', '4', '2039-10-10', 'Por ahi', '', '2', '11', '2023-06-07 04:42:37', 'Medicamento Laritods id(26) dado de alta por Luis (Luisdragon.com@gmail.com).'),
(69, 26, 'Laritods', 'simi1', 'B62', '2', '90', 'Por ahi', '', '0000-00-00', '4', '2039-10-10', '2', '11', '2023-06-07 04:42:54', 'Medicamento Laritods id(26) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Dosis</strong></td><td>900</td><td>90</td></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:42:54pm</td></tr></table>'),
(70, 26, 'Lari', 'si', 'B6', '2', '90', 'Por ahiiiiiiiiiii', '', '0000-00-00', '4', '2039-10-10', '1', '11', '2023-06-07 04:43:22', 'Medicamento Lari id(26) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>In. Activo</strong></td><td>Laritods</td><td>Lari</td></tr><tr><td><strong>Ubicacion</strong></td><td>Por ahi</td><td>Por ahiiiiiiiiiii</td></tr><tr><td><strong>Presentacion</strong></td><td>Capsula</td><td>Tableta</td></tr><tr><td><strong>Via de Administracion</strong></td><td>Inyectada</td><td>Oral</td></tr>.<tr><td><strong>Marca</strong></td><td>simi1</td><td>si</td></tr><tr><td><strong>Lote</strong></td><td>B62</td><td>B6</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:43:22pm</td></tr></table>'),
(71, 26, 'Lari', 'si', 'B6', '2', '90', 'Por ahiiiiiiiiiii', '', '0000-00-00', '400', '2039-10-10', '1', '11', '2023-06-07 04:44:00', 'Medicamento Lari id(26) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>4</td><td>400</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:44:00pm</td></tr></table>'),
(72, 23, 'Paracetamol', 'Registrada', '564', '1', 's', 'Laboratorio 52', 'Tapa rota, tomar con precaución ', '0000-00-00', '5', '2023-06-06', '1', '1', '2023-06-07 04:47:57', 'Medicamento Paracetamol id(23) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>56</td><td>5</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:47:57pm</td></tr></table>'),
(73, 26, 'Lari', 'si', 'B6', '2', '90', 'Estante 8', '', '0000-00-00', '400', '2039-10-10', '1', '11', '2023-06-07 04:48:16', 'Medicamento Lari id(26) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Ubicacion</strong></td><td>Estante 873</td><td>Estante 8</td></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:48:16pm</td></tr></table>'),
(74, 26, 'Lari', 'si', 'B6', '2', '90', 'Estante 899', '', '0000-00-00', '408', '2039-10-10', '1', '11', '2023-06-07 04:49:47', 'Medicamento Lari id(26) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Ubicacion</strong></td><td>Estante 8</td><td>Estante 899</td></tr>.<tr><td><strong>Unidades</strong></td><td>400</td><td>408</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:49:47pm</td></tr></table>'),
(75, 27, 'Aspirina', 'Simo', '123', '1', 'T', '5', '1244', '2023-07-27', 'Estante 38-L', 'Caja rota ', '2', '10', '2023-06-07 04:50:26', 'Medicamento Aspirina id(27) dado de alta por Max William (max.mendoza201@tectijuana.edu.mx).'),
(76, 26, 'Lariti', 'si', 'B6', '2', '90', 'Estante 899', '', '0000-00-00', '408', '2039-10-10', '1', '2', '2023-06-07 04:50:55', 'Medicamento Lariti id(26) actualizado por Max (luis.tanchez17@tectijuana.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>In. Activo</strong></td><td>Lari</td><td>Lariti</td></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:50:55pm</td></tr></table>'),
(77, 26, 'Lariti', 'si', 'B6', '2', '90', 'Estante 899', '', '0000-00-00', '406', '2039-10-10', '1', '2', '2023-06-07 04:52:03', 'Medicamento Lariti id(26) actualizado por Max (luis.tanchez17@tectijuana.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>408</td><td>406</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 09:52:03pm</td></tr></table>'),
(78, 1, 'Paracetamol', 'x', 'RR136', '2', '900', '1', '2', '2039-10-10', 'Ts', '', '2', '2', '2023-06-07 05:17:59', 'Medicamento Paracetamol id(1) dado de alta por Max (luis.tanchez17@tectijuana.edu.mx).'),
(79, 2, 'Paracetamol', 'RAAMFEN', '23', '1', '1', '2', '3', '2039-02-02', 'a', '', '1', '2', '2023-06-07 05:41:26', 'Medicamento Paracetamol id(2) dado de alta por Max (luis.tanchez17@tectijuana.edu.mx).'),
(80, 2, 'Paracetamol', 'RAAMFEN', '23', '1', '1', 'a', '', '0000-00-00', '3', '2039-02-02', '1', '1', '2023-06-07 05:41:57', 'Medicamento Paracetamol id(2) eliminado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).'),
(81, 3, 'Paracetamol', 'RAAMFEN', '90', '1', '200ml', '1', '3', '2039-02-02', 'H', '', '1', '1', '2023-06-07 05:45:28', 'Medicamento Paracetamol id(3) dado de alta por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).'),
(82, 3, 'Paracetamol', 'RAAMFEN', '90', '1', '200ml', 'H', '', '0000-00-00', '39', '2039-02-02', '1', '1', '2023-06-07 05:46:12', 'Medicamento Paracetamol id(3) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>3</td><td>39</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 10:46:12pm</td></tr></table>'),
(83, 4, 'Morfina ', 'La garganta ', '125', '1', '13', '1', '120', '2023-08-22', 'Casa ', 'Caja rota', '1', '10', '2023-06-07 05:47:14', 'Medicamento Morfina  id(4) dado de alta por Max William (max.mendoza201@tectijuana.edu.mx).'),
(84, 5, 'test', 'test', 'b54', '2', '200ml', '1', '900', '2039-02-02', 'Tj', '', '1', '1', '2023-06-07 05:47:36', 'Medicamento test id(5) dado de alta por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).'),
(85, 3, 'Paracetamol', 'RAAMFEN', '902', '1', '200ml', 'En la caja', '', '0000-00-00', '392', '2039-02-02', '1', '11', '2023-06-07 05:48:55', 'Medicamento Paracetamol id(3) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Ubicacion</strong></td><td>H</td><td>En la caja</td></tr><tr><td><strong>Presentacion</strong></td><td>Tableta</td><td>Capsula</td></tr>.<tr><td><strong>Lote</strong></td><td>90</td><td>902</td></tr><tr><td><strong>Unidades</strong></td><td>39</td><td>392</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 10:48:55pm</td></tr></table>'),
(86, 3, 'Paracetamol', 'RAAMFEN', '902', '1', '200ml', 'En la caja', '', '0000-00-00', '392', '2039-02-02', '1', '11', '2023-06-07 05:49:17', 'Medicamento Paracetamol id(3) eliminado por Luis (Luisdragon.com@gmail.com).'),
(87, 6, 'Test', 'Testla', '92', '2', '200ml', '1', '290', '2023-02-02', '3232', '', '1', '11', '2023-06-07 05:50:10', 'Medicamento Test id(6) dado de alta por Luis (Luisdragon.com@gmail.com).'),
(88, 6, 'Test', 'Testla', '92', '2', '200ml', '3232', '', '0000-00-00', '290', '0005-02-06', '1', '11', '2023-06-07 05:50:24', 'Medicamento Test id(6) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-02-02</td><td>0005-02-06</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 10:50:24pm</td></tr></table>'),
(89, 6, 'Test', 'Testla', '92', '2', '200ml', '3232', '', '0000-00-00', '290', '2023-02-06', '1', '11', '2023-06-07 05:50:33', 'Medicamento Test id(6) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>0005-02-06</td><td>2023-02-06</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 10:50:33pm</td></tr></table>'),
(90, 6, 'Test', 'Testla', '92', '2', '200ml', '3232', '', '0000-00-00', '290', '2023-02-06', '1', '11', '2023-06-07 05:50:40', 'Medicamento Test id(6) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 10:50:40pm</td></tr></table>'),
(91, 6, 'Test', 'Testla', '92', '2', '200ml', '3232', '', '0000-00-00', '290', '2023-02-10', '1', '11', '2023-06-07 05:50:47', 'Medicamento Test id(6) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-02-06</td><td>2023-02-10</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 10:50:47pm</td></tr></table>'),
(92, 6, 'Test', 'Testla', '92', '2', '200ml', '3232', '', '0000-00-00', '290', '2023-10-10', '1', '1', '2023-06-07 05:51:12', 'Medicamento Test id(6) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-02-10</td><td>2023-10-10</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 10:51:12pm</td></tr></table>'),
(93, 5, 'test', 'test', 'b54', '2', '200ml', 'Tj', 'No sirve', '0000-00-00', '900', '2039-02-02', '1', '11', '2023-06-07 05:53:42', 'Medicamento test id(5) actualizado por Luis (Luisdragon.com@gmail.com).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr><tr><td><strong>Notas</strong></td><td></td><td>No sirve</td></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 10:53:42pm</td></tr></table>'),
(94, 4, 'Morfina ', 'La garganta ', '125', '1', '13', 'Casa ', 'Caja rota', '0000-00-00', '120', '2023-08-22', '1', '10', '2023-06-07 05:53:50', 'Medicamento Morfina  id(4) eliminado por Max William (max.mendoza201@tectijuana.edu.mx).'),
(95, 5, 'test', 'test', 'b54', '2', '200ml', 'Tj', 'No sirve', '0000-00-00', '900', '2039-02-02', '1', '10', '2023-06-07 05:54:08', 'Medicamento test id(5) eliminado por Max William (max.mendoza201@tectijuana.edu.mx).'),
(96, 7, 'Paracetamol', 'RAAMFEN', '90', '1', '200ml', '1', '3', '2023-02-07', 'r', '', '1', '1', '2023-06-07 05:56:09', 'Medicamento Paracetamol id(7) dado de alta por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).'),
(97, 7, 'Paracetamol', 'RAAMFEN', '90', '1', '200ml', 'r', '', '0000-00-00', '3', '2023-09-02', '1', '1', '2023-06-07 05:56:29', 'Medicamento Paracetamol id(7) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-02-07</td><td>2023-09-02</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 10:56:29pm</td></tr></table>'),
(98, 6, 'Test', 'Testla', '92', '2', '200ml', '3232', '', '0000-00-00', '290', '2023-07-10', '1', '1', '2023-06-07 05:57:03', 'Medicamento Test id(6) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-10-10</td><td>2023-07-10</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 10:57:03pm</td></tr></table>'),
(99, 7, 'Paracetamol', 'RAAMFEN', '90', '1', '200ml', 'r', '', '0000-00-00', '300', '2023-09-02', '1', '1', '2023-06-07 06:00:11', 'Medicamento Paracetamol id(7) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Unidades</strong></td><td>3</td><td>300</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 11:00:11pm</td></tr></table>'),
(100, 8, 'Loratida', 'Maraca', 'b34', '1', '25 MG', '1', '54', '2023-10-07', 're', '', '1', '1', '2023-06-07 06:04:30', 'Medicamento Loratida id(8) dado de alta por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).'),
(101, 8, 'Loratida', 'Maraca', 'b34', '1', '25 MG', 're', '', '0000-00-00', '54', '2023-10-08', '1', '1', '2023-06-07 06:04:59', 'Medicamento Loratida id(8) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-10-07</td><td>2023-10-08</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 11:04:59pm</td></tr></table>'),
(102, 8, 'Loratida', 'Maraca', 'b34', '1', '25 MG', 're', '', '0000-00-00', '54', '2023-10-07', '1', '1', '2023-06-07 06:12:11', 'Medicamento Loratida id(8) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-10-08</td><td>2023-10-07</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 11:12:11pm</td></tr></table>'),
(103, 9, 'Test', 'test2', 'B69', '1', '2000ML', '1', '90', '2023-02-09', 'jds', '', '1', '1', '2023-06-07 06:20:53', 'Medicamento Test id(9) dado de alta por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).'),
(104, 8, 'Loratida', 'Maraca', 'b34', '1', '25 MG', 're', '', '0000-00-00', '54', '2023-07-07', '1', '1', '2023-06-07 06:21:23', 'Medicamento Loratida id(8) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-10-07</td><td>2023-07-07</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 11:21:23pm</td></tr></table>'),
(105, 9, 'Test', 'test2', 'B69', '1', '2000ML', 'jds', '', '0000-00-00', '90', '2023-02-07', '1', '1', '2023-06-07 06:21:39', 'Medicamento Test id(9) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-02-09</td><td>2023-02-07</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 11:21:39pm</td></tr></table>'),
(106, 9, 'Test', 'test2', 'B69', '1', '2000ML', 'jds', '', '0000-00-00', '90', '2023-07-07', '1', '1', '2023-06-07 06:21:58', 'Medicamento Test id(9) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-02-07</td><td>2023-07-07</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 11:21:58pm</td></tr></table>'),
(107, 10, 'testtt', 'Maraca', 'l28', '1', '200ml', '1', '4', '2023-10-07', 'fs', '', '1', '1', '2023-06-07 06:22:38', 'Medicamento testtt id(10) dado de alta por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).'),
(108, 10, 'testtt', 'Maraca', 'l28', '1', '200ml', 'fs', '', '0000-00-00', '4', '2023-10-07', '1', '1', '2023-06-07 06:23:08', 'Medicamento testtt id(10) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 11:23:08pm</td></tr></table>'),
(109, 11, 'teste', 'testse', '98', '1', '200ml', '4', '19', '2023-11-02', 'ere', '', '1', '1', '2023-06-07 06:25:11', 'Medicamento teste id(11) dado de alta por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).'),
(110, 12, 'prueba 2', 'test', '28', '1', '34mg', '1', '4', '2023-06-08', 'cancun', '', '1', '1', '2023-06-07 06:29:28', 'Medicamento prueba 2 id(12) dado de alta por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).');
INSERT INTO `historial` (`txid`, `idMedicamento`, `ingrediente_activo`, `marca`, `lote`, `controlado`, `dosis`, `presentacion`, `unidades`, `fecha_caducidad`, `ubicacion`, `notas`, `via_administracion`, `usuario`, `timepo`, `comentario`) VALUES
(111, 13, 'Metforminae', 'Maracaf', 're', '2', '200ml', '5', '17', '2025-04-08', '232', '', '1', '1', '2023-06-07 06:30:38', 'Medicamento Metforminae id(13) dado de alta por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).'),
(112, 13, 'Metforminae', 'Maracaf', 're', '2', '200ml', '232', '', '0000-00-00', '17', '2025-12-08', '1', '1', '2023-06-07 06:30:55', 'Medicamento Metforminae id(13) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2025-04-08</td><td>2025-12-08</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 11:30:55pm</td></tr></table>'),
(113, 13, 'Metforminae', 'Maracaf', 're', '2', '200ml', '232', '', '0000-00-00', '17', '2025-12-10', '1', '1', '2023-06-07 06:31:30', 'Medicamento Metforminae id(13) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2025-12-08</td><td>2025-12-10</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 11:31:30pm</td></tr></table>'),
(114, 14, 'Teestst', 'Sini2', '3', '2', '30 mg', '6', '27', '2023-12-31', 'dsf', '', '3', '1', '2023-06-07 06:33:30', 'Medicamento Teestst id(14) dado de alta por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).'),
(115, 15, 'prueba 3', 'prueba', '34', '2', '56mg', '1', '3', '2023-06-10', 'cancun', '', '2', '1', '2023-06-07 06:35:10', 'Medicamento prueba 3 id(15) dado de alta por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).'),
(116, 15, 'prueba 3', 'prueba', '34', '2', '56mg', 'cancun', '', '0000-00-00', '3', '2023-06-09', '2', '1', '2023-06-07 06:36:11', 'Medicamento prueba 3 id(15) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-06-10</td><td>2023-06-09</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 11:36:11pm</td></tr></table>'),
(117, 15, 'prueba 3', 'prueba', '34', '2', '56mg', 'cancun', '', '0000-00-00', '3', '2023-06-10', '2', '1', '2023-06-07 06:36:24', 'Medicamento prueba 3 id(15) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-06-09</td><td>2023-06-10</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 11:36:24pm</td></tr></table>'),
(118, 16, 'prueba4', 'loratadina', '45', '1', '10mg', '1', '5', '2025-10-12', 'test', '', '1', '1', '2023-06-07 06:39:59', 'Medicamento prueba4 id(16) dado de alta por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).'),
(119, 17, 'Tests', 'dasfas', 'fdgdf', '1', '54', '2', '14', '2023-06-10', '32', '', '1', '2', '2023-06-07 06:40:52', 'Medicamento Tests id(17) dado de alta por Max (luis.tanchez17@tectijuana.edu.mx).'),
(120, 18, 'Prueba', 'RAAMFEN', '90', '1', '25 MG', '1', '10', '2023-01-31', 'd', '', '1', '2', '2023-06-07 06:50:34', 'Medicamento Prueba id(18) dado de alta por Max (luis.tanchez17@tectijuana.edu.mx).'),
(121, 18, 'Prueba', 'RAAMFEN', '90', '1', '25 MG', 'd', '', '0000-00-00', '10', '2023-12-31', '1', '2', '2023-06-07 06:50:52', 'Medicamento Prueba id(18) actualizado por Max (luis.tanchez17@tectijuana.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-01-31</td><td>2023-12-31</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 06-06-2023 a las 11:50:52pm</td></tr></table>'),
(122, 18, 'Prueba', 'RAAMFEN', '90', '1', '25 MG', 'd', '', '0000-00-00', '10', '2023-12-14', '1', '1', '2023-06-08 01:59:36', 'Medicamento Prueba id(18) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-12-31</td><td>2023-12-14</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 07-06-2023 a las 06:59:36pm</td></tr></table>'),
(123, 12, 'prueba 2', 'test', '28', '1', '34mg', 'cancun', '', '0000-00-00', '4', '2030-06-08', '1', '1', '2023-06-08 02:00:07', 'Medicamento prueba 2 id(12) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-06-08</td><td>2030-06-08</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 07-06-2023 a las 07:00:07pm</td></tr></table>'),
(124, 15, 'prueba 3', 'prueba', '34', '2', '56mg', 'cancun', '', '0000-00-00', '3', '2026-06-10', '2', '1', '2023-06-08 02:00:14', 'Medicamento prueba 3 id(15) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-06-10</td><td>2026-06-10</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 07-06-2023 a las 07:00:14pm</td></tr></table>'),
(125, 8, 'Loratida', 'Maraca', 'b34', '1', '25 MG', 're', '', '0000-00-00', '54', '2026-07-07', '1', '1', '2023-06-08 02:00:26', 'Medicamento Loratida id(8) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-07-07</td><td>2026-07-07</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 07-06-2023 a las 07:00:26pm</td></tr></table>'),
(126, 9, 'Test', 'test2', 'B69', '1', '2000ML', 'jds', '', '0000-00-00', '90', '2026-07-07', '1', '1', '2023-06-08 02:00:41', 'Medicamento Test id(9) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-07-07</td><td>2026-07-07</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 07-06-2023 a las 07:00:41pm</td></tr></table>'),
(127, 7, 'Paracetamol', 'RAAMFEN', '90', '1', '200ml', 'r', '', '0000-00-00', '300', '2040-09-26', '1', '1', '2023-06-08 02:00:49', 'Medicamento Paracetamol id(7) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-09-02</td><td>2040-09-26</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 07-06-2023 a las 07:00:49pm</td></tr></table>'),
(128, 6, 'Test', 'Testla', '92', '2', '200ml', '3232', '', '0000-00-00', '290', '2025-07-10', '1', '1', '2023-06-08 02:01:03', 'Medicamento Test id(6) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-07-10</td><td>2025-07-10</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 07-06-2023 a las 07:01:03pm</td></tr></table>'),
(129, 17, 'Tests', 'dasfas', 'fdgdf', '1', '54', '32', '', '0000-00-00', '14', '2024-06-10', '1', '1', '2023-06-08 02:01:13', 'Medicamento Tests id(17) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-06-10</td><td>2024-06-10</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 07-06-2023 a las 07:01:13pm</td></tr></table>'),
(130, 8, 'Loratida', 'Maraca', 'b34', '1', '25 MG', 're', '', '0000-00-00', '54', '2023-07-21', '1', '1', '2023-06-08 02:43:42', 'Medicamento Loratida id(8) actualizado por Administrador del sistema (gestion.medicamentos.fmptij@uabc.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2026-07-07</td><td>2023-07-21</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 07-06-2023 a las 07:43:42pm</td></tr></table>'),
(131, 10, 'testtt', 'Maraca', 'l28', '1', '200ml', 'fs', '', '0000-00-00', '4', '2023-11-04', '1', '2', '2023-06-09 02:21:56', 'Medicamento testtt id(10) actualizado por Max (luis.tanchez17@tectijuana.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-10-07</td><td>2023-11-04</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 08-06-2023 a las 07:21:56pm</td></tr></table>'),
(132, 11, 'teste', 'testse', '98', '1', '200ml', 'ere', '', '0000-00-00', '19', '2023-11-23', '1', '2', '2023-06-09 02:22:45', 'Medicamento teste id(11) actualizado por Max (luis.tanchez17@tectijuana.edu.mx).<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>.<tr><td><strong>Fecha</strong></td><td>2023-11-02</td><td>2023-11-23</td></tr><tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: 08-06-2023 a las 07:22:45pm</td></tr></table>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `idMedicamento` int(11) NOT NULL,
  `nombrecomercialMedicamento` varchar(100) DEFAULT NULL,
  `activoprincipalMedicamento` varchar(100) DEFAULT NULL,
  `dosis` varchar(30) DEFAULT NULL,
  `idDosis` int(11) NOT NULL,
  `idPresentacion` int(11) NOT NULL,
  `controlMedicamento` int(11) DEFAULT NULL,
  `ubicacion` text NOT NULL,
  `notas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`idMedicamento`, `nombrecomercialMedicamento`, `activoprincipalMedicamento`, `dosis`, `idDosis`, `idPresentacion`, `controlMedicamento`, `ubicacion`, `notas`) VALUES
(6, NULL, 'Test', '200ml', 1, 1, 2, '3232', ''),
(7, NULL, 'Paracetamol', '200ml', 1, 1, 1, 'r', ''),
(8, NULL, 'Loratida', '25 MG', 1, 1, 1, 're', ''),
(9, NULL, 'Test', '2000ML', 1, 1, 1, 'jds', ''),
(10, NULL, 'testtt', '200ml', 1, 1, 1, 'fs', ''),
(11, NULL, 'teste', '200ml', 1, 4, 1, 'ere', ''),
(12, NULL, 'prueba 2', '34mg', 1, 1, 1, 'cancun', ''),
(13, NULL, 'Metforminae', '200ml', 1, 5, 2, '232', ''),
(14, NULL, 'Teestst', '30 mg', 3, 6, 2, 'dsf', ''),
(15, NULL, 'prueba 3', '56mg', 2, 1, 2, 'cancun', ''),
(16, NULL, 'prueba4', '10mg', 1, 1, 1, 'test', ''),
(17, NULL, 'Tests', '54', 1, 2, 1, '32', ''),
(18, NULL, 'Prueba', '25 MG', 1, 1, 1, 'd', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `idPresentacion` int(11) NOT NULL,
  `nombrePresentacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `presentacion`
--

INSERT INTO `presentacion` (`idPresentacion`, `nombrePresentacion`) VALUES
(1, 'Tableta'),
(2, 'Capsula'),
(3, 'Supositorio'),
(4, 'Pomada'),
(5, 'Crema'),
(6, 'Jarabe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(60) DEFAULT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `claveUsuario` varchar(32) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `recibe_alertas` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombreUsuario`, `cargo`, `correo`, `claveUsuario`, `expiration_date`, `recibe_alertas`) VALUES
(1, 'Administrador del sistema', 'Administrador', 'gestion.medicamentos.fmptij@uabc.edu.mx', '21232f297a57a5a743894a0e4a801fc3', NULL, 1),
(2, 'Max', 'Administrador', 'luis.tanchez17@tectijuana.edu.mx', 'fef810fc8e7a445588fcd9aae3cb9822', '2023-08-06', 1),
(8, 'Josue Israel', 'Administrador', 'israelmerlyn.a@gmail.com', '8f3ba5fd2beac46774ceba7798b4e2c4', '2023-08-06', 1),
(9, 'Obed Gomez', 'Administrador', 'obedgm3@gmail.com', '7c3ee91b6e41d06aee7f5f874584f195', '2023-08-06', 1),
(10, 'Max William', 'Pasante', 'max.mendoza201@tectijuana.edu.mx', 'e3c165008dadcdb04cb3b9279406d609', '2023-08-07', 1),
(11, 'Luis', 'Médico', 'Luisdragon.com@gmail.com', 'fef810fc8e7a445588fcd9aae3cb9822', '2023-08-06', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`idCiudad`);

--
-- Indices de la tabla `clinicas`
--
ALTER TABLE `clinicas`
  ADD PRIMARY KEY (`idClinica`);

--
-- Indices de la tabla `dosis`
--
ALTER TABLE `dosis`
  ADD PRIMARY KEY (`idDosis`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`txid`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`idMedicamento`);

--
-- Indices de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  ADD PRIMARY KEY (`idPresentacion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `idCiudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clinicas`
--
ALTER TABLE `clinicas`
  MODIFY `idClinica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `dosis`
--
ALTER TABLE `dosis`
  MODIFY `idDosis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `txid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `idMedicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  MODIFY `idPresentacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

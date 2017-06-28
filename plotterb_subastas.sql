-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 27, 2017 at 10:58 PM
-- Server version: 5.6.35
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plotterb_subastas`
--

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `id` int(8) NOT NULL,
  `usuarios_id` int(8) NOT NULL,
  `password` varchar(64) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `telefonos` varchar(60) NOT NULL,
  `email` varchar(200) NOT NULL,
  `nivel` int(1) NOT NULL,
  `observaciones` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`id`, `usuarios_id`, `password`, `nombres`, `apellidos`, `direccion`, `telefonos`, `email`, `nivel`, `observaciones`) VALUES
(2, 14, '2270e73a86e507f7a99d98e739a62f96ec812c1a19b37a0db27785e620518566', 'Ivan Dario', 'Calderon Caceres', 'Campo C', '0416-1793965', 'ivandario2010@gmail.com', 1, 'El fundador');

-- --------------------------------------------------------

--
-- Table structure for table `fotos`
--

CREATE TABLE `fotos` (
  `id` int(11) NOT NULL,
  `ruta` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fotos_usuarios`
--

CREATE TABLE `fotos_usuarios` (
  `status` char(1) NOT NULL,
  `fotos_id` int(11) NOT NULL,
  `usuarios_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mensajes_contactos`
--

CREATE TABLE `mensajes_contactos` (
  `id` int(11) NOT NULL,
  `mensaje` varchar(300) NOT NULL,
  `usuarios_id` int(8) NOT NULL,
  `fecha` datetime NOT NULL,
  `leido` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mensajes_contactos`
--

INSERT INTO `mensajes_contactos` (`id`, `mensaje`, `usuarios_id`, `fecha`, `leido`) VALUES
(1, 'Primer recurso', 14, '2016-08-12 04:21:16', 0),
(2, 'Segundo recurso', 14, '2016-08-12 04:49:45', 0),
(3, 'Saludos', 14, '2016-08-14 06:39:25', 0),
(4, '', 14, '2017-06-11 09:58:56', 0),
(5, '', 14, '2017-06-17 14:57:09', 0),
(6, 'Hola', 14, '2017-06-17 15:04:21', 0),
(7, '', 14, '2017-06-17 15:05:15', 0),
(8, '', 14, '2017-06-17 15:31:01', 0),
(9, '', 14, '2017-06-17 15:31:55', 0),
(10, '', 14, '2017-06-17 15:32:14', 0),
(11, '', 14, '2017-06-17 15:32:35', 0),
(12, '', 14, '2017-06-18 02:26:32', 0),
(13, '', 14, '2017-06-18 02:51:00', 0),
(14, '', 14, '2017-06-18 02:57:41', 0),
(15, 'dos', 20, '2017-06-18 03:00:43', 0),
(16, '', 14, '2017-06-18 03:07:08', 0),
(17, '', 21, '2017-06-18 01:33:19', 0),
(18, 'hola', 21, '2017-06-20 15:26:02', 0),
(19, 'Subasta realizada solo por tiempo limitado.', 23, '2017-06-21 02:40:18', 0),
(20, 'sss', 21, '2017-06-21 13:51:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `paises`
--

CREATE TABLE `paises` (
  `id` int(3) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paises`
--

INSERT INTO `paises` (`id`, `nombre`) VALUES
(1, 'Venezuela'),
(2, 'Colombia'),
(3, 'Ecuador'),
(4, 'Per&uacute;'),
(5, 'Bolivia'),
(6, 'Argentina'),
(7, 'Paraguay'),
(8, 'Uruguay'),
(9, 'Chile');

-- --------------------------------------------------------

--
-- Table structure for table `pujas`
--

CREATE TABLE `pujas` (
  `id` int(11) NOT NULL,
  `recurso_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `monto` float NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pujas`
--

INSERT INTO `pujas` (`id`, `recurso_id`, `usuario_id`, `monto`, `fecha`) VALUES
(23, 51, 23, 101000, '2017-06-20 15:26:32'),
(24, 51, 23, 102000, '2017-06-20 15:27:50'),
(25, 51, 23, 104000, '2017-06-20 19:18:43'),
(26, 51, 23, 105000, '2017-06-20 19:23:38'),
(27, 51, 23, 200000, '2017-06-20 19:24:54'),
(28, 52, 23, 252, '2017-06-21 12:43:12'),
(29, 52, 21, 253, '2017-06-21 13:51:30'),
(30, 53, 22, 2223, '2017-06-21 17:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `recursos`
--

CREATE TABLE `recursos` (
  `id` int(8) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precioi` float NOT NULL,
  `preciol` float NOT NULL,
  `precioa` float NOT NULL DEFAULT '0',
  `usuarios_id` int(8) NOT NULL,
  `ruta` varchar(50) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `mensajes_contactos_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recursos`
--

INSERT INTO `recursos` (`id`, `titulo`, `descripcion`, `precioi`, `preciol`, `precioa`, `usuarios_id`, `ruta`, `fecha`, `status`, `mensajes_contactos_id`) VALUES
(51, 'hola', 'hola', 100000, 200000, 200000, 21, 'uploads/21DOS1497972361.png', '2017-06-20 15:26:02', 2, 18),
(52, 'Dell OptiPlex XE2 Intel Core i5-4570S 2.9GHz 32GB ', 'Este computador con poco uso, cuenta con garantia por 3 dias pero con recibo totalmente original', 250, 1000, 253, 23, 'uploads/23DOS1498012817.jpg', '2017-06-21 02:40:18', 1, 19),
(53, 'ssss', 'sss', 2222, 222222, 2223, 21, 'uploads/21DOS1498053118.jpg', '2017-06-21 13:51:59', 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `regiones`
--

CREATE TABLE `regiones` (
  `id` int(5) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `paises_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `regiones`
--

INSERT INTO `regiones` (`id`, `nombre`, `paises_id`) VALUES
(1, 'Amazonas', 1),
(2, 'Anzoátegui', 1),
(3, 'Apure', 1),
(4, 'Aragua', 1),
(5, 'Barinas', 1),
(6, 'Bolívar', 1),
(7, 'Carabobo', 1),
(8, 'Cojedes', 1),
(9, 'Delta Amacuro', 1),
(10, 'Distrito Capital', 1),
(11, 'Falcón', 1),
(12, 'Guárico', 1),
(13, 'Lara', 1),
(14, 'Miranda', 1),
(15, 'Monagas', 1),
(16, 'Mérida', 1),
(17, 'Nueva Esparta', 1),
(18, 'Portuguesa', 1),
(19, 'Sucre', 1),
(20, 'Trujillo', 1),
(21, 'Táchira', 1),
(22, 'Vargas', 1),
(23, 'Yaracuy', 1),
(24, 'Zulia', 1),
(25, 'Amazonas', 2),
(26, 'Antioquía', 2),
(27, 'Arauca', 2),
(28, 'Atlántico', 2),
(29, 'Bolivar', 2),
(30, 'Boyacá', 2),
(31, 'Caldas', 2),
(32, 'Caquetá', 2),
(33, 'Casanare', 2),
(34, 'Cauca', 2),
(35, 'Cesar', 2),
(36, 'Chocó', 2),
(37, 'Córdoba', 2),
(38, 'Cundinamarca', 2),
(39, 'Guainía', 2),
(40, 'Guaviare', 2),
(41, 'Azuay', 3),
(42, 'Bolívar', 3),
(43, 'Cañar', 3),
(44, 'Carchi', 3),
(45, 'Chimborazo', 3),
(46, 'Cotopaxi', 3),
(47, 'El Oro', 3),
(48, 'Esmeraldas', 3),
(49, 'Galápagos', 3),
(50, 'Guayas', 3),
(51, 'Imbabura', 3),
(52, 'Loja', 3),
(53, 'Los Ríos', 3),
(54, 'Manabí', 3),
(55, 'Morona Santiago', 3),
(56, 'Napo', 3),
(57, 'Orellana', 3),
(58, 'Pastaza', 3),
(59, 'Pichincha', 3),
(60, 'Santa Elena', 3),
(61, 'Santo Domingo de los Tsáchilas', 3),
(62, 'Sucumbíos', 3),
(63, 'Tungurahua', 3),
(64, 'Zamora Chinchipe', 3),
(65, 'Amazonas', 4),
(66, 'Áncash', 4),
(67, 'Apurímac', 4),
(68, 'Arequipa', 4),
(69, 'Ayacucho', 4),
(70, 'Beni', 5),
(71, 'Bolivia', 5),
(72, 'Chuquisaca', 5),
(73, 'Cochabamba', 5),
(74, 'La Paz', 5),
(75, 'Oruro', 5),
(76, 'Pando', 5),
(77, 'Potosí', 5),
(78, 'Santa Cruz', 5),
(79, 'Tarija', 5),
(80, 'Buenos Aires ', 6),
(81, 'Catamarca ', 6),
(82, 'Chaco ', 6),
(83, 'Chubut ', 6),
(84, 'Córdoba ', 6),
(85, 'Corrientes ', 6),
(86, 'Entre Ríos ', 6),
(87, 'Formosa ', 6),
(88, 'Jujuy ', 6),
(89, 'La Pampa ', 6),
(90, 'La Rioja ', 6),
(91, 'Mendoza ', 6),
(92, 'Misiones ', 6),
(93, 'Neuquén ', 6),
(94, 'Río Negro ', 6),
(95, 'Salta ', 6),
(96, 'San Juan ', 6),
(97, 'San Luis ', 6),
(98, 'Santa Cruz ', 6),
(99, 'Santa Fe ', 6),
(100, 'Santiago del Estero ', 6),
(101, 'Tierra del Fuego, Antártida e Islas del ', 6),
(102, 'Tucumán ', 6),
(103, 'Alto Paraguay', 7),
(104, 'Alto Paraná', 7),
(105, 'Amambay', 7),
(106, 'Asunción', 7),
(107, 'Boquerón', 7),
(108, 'Caaguazú', 7),
(109, 'Caazapá', 7),
(110, 'Canindeyú', 7),
(111, 'Central', 7),
(112, 'Concepción', 7),
(113, 'Cordillera', 7),
(114, 'Guairá', 7),
(115, 'Itapúa', 7),
(116, 'Misiones', 7),
(117, 'Ñeembucú', 7),
(118, 'Paraguarí', 7),
(119, 'Presidente Hayes', 7),
(120, 'San Pedro', 7),
(121, 'Artigas', 8),
(122, 'Canelones', 8),
(123, 'Cerro Largo', 8),
(124, 'Colonia', 8),
(125, 'Durazno', 8),
(126, 'Flores', 8),
(127, 'Florida', 8),
(128, 'Lavalleja', 8),
(129, 'Maldonado', 8),
(130, 'Montevideo', 8),
(131, 'Paysandú', 8),
(132, 'Río Negro', 8),
(133, 'Rivera', 8),
(134, 'Rocha', 8),
(135, 'Salto', 8),
(136, 'San José', 8),
(137, 'Soriano', 8),
(138, 'Tacuarembó', 8),
(139, 'Treinta y Tres', 8),
(140, 'Antofagasta', 9),
(141, 'Araucanía', 9),
(142, 'Arica y Parinacota', 9),
(143, 'Atacama', 9),
(144, 'Aysén', 9),
(145, 'Bio-bío', 9),
(146, 'Coquimbo', 9),
(147, 'Libertador Bernado O´Higgins', 9),
(148, 'Los Lagos', 9),
(149, 'Los Ríos', 9),
(150, 'Magallanes y Antártica Chilena ', 9),
(151, 'Maule', 9),
(152, 'Metropolitana', 9),
(153, 'Tarapacá', 9),
(154, 'Valparaíso', 9),
(155, 'Huila', 2),
(156, 'La Guajira', 2),
(157, 'Magdalena', 2),
(158, 'Meta', 2),
(159, 'Nariño', 2),
(160, 'Norte de Santander', 2),
(161, 'Putumayo', 2),
(162, 'Quindio', 2),
(163, 'Risaralda', 2),
(164, 'San Andrés y Providencia', 2),
(165, 'Santander', 2),
(166, 'Sucre', 2),
(167, 'Tolima', 2),
(168, 'Valle del Cauca', 2),
(169, 'Vaupés', 2),
(170, 'Vichada', 2);

-- --------------------------------------------------------

--
-- Table structure for table `status_usuarios`
--

CREATE TABLE `status_usuarios` (
  `id` int(11) NOT NULL COMMENT 'identificador',
  `nombre` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status_usuarios`
--

INSERT INTO `status_usuarios` (`id`, `nombre`) VALUES
(1, 'Activo'),
(2, 'Suspendido'),
(3, 'Anulado');

-- --------------------------------------------------------

--
-- Table structure for table `trafico`
--

CREATE TABLE `trafico` (
  `id` int(8) NOT NULL,
  `usuarios_id` int(8) NOT NULL,
  `pagina` int(2) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trafico`
--

INSERT INTO `trafico` (`id`, `usuarios_id`, `pagina`, `fecha`) VALUES
(1784, 23, 1, '2017-06-20 15:24:26'),
(1785, 23, 1, '2017-06-20 15:24:27'),
(1786, -1, 1, '2017-06-20 15:25:25'),
(1787, -1, 1, '2017-06-20 15:25:27'),
(1788, 21, 1, '2017-06-20 15:25:38'),
(1789, 21, 1, '2017-06-20 15:25:40'),
(1790, 21, 1, '2017-06-20 15:26:09'),
(1791, 21, 1, '2017-06-20 15:26:10'),
(1792, -1, 1, '2017-06-20 15:26:16'),
(1793, -1, 1, '2017-06-20 15:26:16'),
(1794, 23, 1, '2017-06-20 15:26:23'),
(1795, 23, 1, '2017-06-20 15:26:25'),
(1796, 23, 1, '2017-06-20 18:57:18'),
(1797, 23, 1, '2017-06-20 18:57:20'),
(1798, 23, 1, '2017-06-20 18:57:29'),
(1799, 23, 1, '2017-06-20 18:57:29'),
(1800, 23, 1, '2017-06-20 19:18:35'),
(1801, 23, 1, '2017-06-20 19:18:35'),
(1802, 23, 1, '2017-06-20 19:23:28'),
(1803, 23, 1, '2017-06-20 19:23:28'),
(1804, 23, 1, '2017-06-20 19:23:29'),
(1805, 23, 1, '2017-06-20 19:23:31'),
(1806, 23, 1, '2017-06-20 20:58:55'),
(1807, 23, 1, '2017-06-20 21:40:36'),
(1808, 23, 1, '2017-06-20 21:40:40'),
(1809, 23, 1, '2017-06-20 21:46:04'),
(1810, 23, 1, '2017-06-20 21:46:05'),
(1811, -1, 1, '2017-06-21 01:30:38'),
(1812, -1, 1, '2017-06-21 01:30:41'),
(1813, 23, 1, '2017-06-21 02:35:36'),
(1814, 23, 1, '2017-06-21 02:35:40'),
(1815, 23, 1, '2017-06-21 02:39:22'),
(1816, 23, 1, '2017-06-21 02:39:23'),
(1817, 23, 1, '2017-06-21 02:40:35'),
(1818, 23, 1, '2017-06-21 02:40:37'),
(1819, -1, 1, '2017-06-21 02:55:00'),
(1820, -1, 1, '2017-06-21 02:55:01'),
(1821, -1, 1, '2017-06-21 02:55:03'),
(1822, -1, 1, '2017-06-21 02:55:06'),
(1823, 21, 1, '2017-06-21 02:55:25'),
(1824, 21, 1, '2017-06-21 02:55:27'),
(1825, 21, 1, '2017-06-21 02:55:56'),
(1826, 21, 1, '2017-06-21 02:56:00'),
(1827, 21, 1, '2017-06-21 02:56:05'),
(1828, 21, 1, '2017-06-21 02:56:06'),
(1829, 22, 1, '2017-06-21 03:35:57'),
(1830, 22, 1, '2017-06-21 03:36:05'),
(1831, 21, 1, '2017-06-21 10:39:13'),
(1832, 21, 1, '2017-06-21 10:39:14'),
(1833, 21, 1, '2017-06-21 10:40:03'),
(1834, 21, 1, '2017-06-21 10:40:03'),
(1835, 21, 1, '2017-06-21 10:41:16'),
(1836, 21, 1, '2017-06-21 10:41:17'),
(1837, 21, 1, '2017-06-21 10:45:30'),
(1838, 21, 1, '2017-06-21 10:46:08'),
(1839, 23, 1, '2017-06-21 12:36:16'),
(1840, 23, 1, '2017-06-21 12:36:19'),
(1841, 23, 1, '2017-06-21 13:50:57'),
(1842, 23, 1, '2017-06-21 13:50:59'),
(1843, -1, 1, '2017-06-21 13:51:05'),
(1844, -1, 1, '2017-06-21 13:51:05'),
(1845, 21, 1, '2017-06-21 13:51:15'),
(1846, 21, 1, '2017-06-21 13:51:16'),
(1847, 21, 1, '2017-06-21 13:51:37'),
(1848, 21, 1, '2017-06-21 13:51:37'),
(1849, 21, 1, '2017-06-21 13:52:02'),
(1850, 21, 1, '2017-06-21 13:52:03'),
(1851, -1, 1, '2017-06-21 13:52:07'),
(1852, -1, 1, '2017-06-21 13:52:08'),
(1853, -1, 1, '2017-06-21 17:48:37'),
(1854, -1, 1, '2017-06-21 17:48:40'),
(1855, -1, 1, '2017-06-21 17:48:41'),
(1856, -1, 1, '2017-06-21 17:49:47'),
(1857, -1, 1, '2017-06-21 17:49:48'),
(1858, 22, 1, '2017-06-21 17:49:52'),
(1859, 22, 1, '2017-06-21 17:49:52'),
(1860, 22, 1, '2017-06-21 17:49:53'),
(1861, 22, 1, '2017-06-21 17:51:34'),
(1862, 22, 1, '2017-06-21 17:51:34'),
(1863, 22, 1, '2017-06-21 17:51:35'),
(1864, 22, 1, '2017-06-21 17:52:00'),
(1865, 22, 1, '2017-06-21 17:52:00'),
(1866, 22, 1, '2017-06-21 17:52:54'),
(1867, 22, 1, '2017-06-21 17:52:54');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(8) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `telefonos` varchar(50) NOT NULL,
  `regiones_id` int(5) NOT NULL,
  `direccion` longtext NOT NULL,
  `genero` char(1) NOT NULL,
  `dia_nac` int(2) NOT NULL,
  `mes_nac` int(2) NOT NULL,
  `agno_nac` int(4) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `twitter` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `telefonos`, `regiones_id`, `direccion`, `genero`, `dia_nac`, `mes_nac`, `agno_nac`, `descripcion`, `website`, `facebook`, `twitter`) VALUES
(21, 'Ivan Dario', 'Calderon Caceres', '04161391929', 21, 'Capacho', 'M', 14, 12, 1979, NULL, NULL, NULL, NULL),
(22, 'Juan', 'Carlos', '3117364378', 38, 'calle 40', 'M', 25, 5, 1973, NULL, NULL, NULL, NULL),
(23, 'dario', 'caceres', '3117364378', 5, 'ioisiosioiso', 'M', 3, 3, 2002, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usuariosxstatus`
--

CREATE TABLE `usuariosxstatus` (
  `fecha` datetime NOT NULL COMMENT 'fecha en que se cambia el status',
  `status_usuarios_id` int(11) NOT NULL COMMENT 'identificador',
  `usuarios_id` int(8) NOT NULL COMMENT 'identificador del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuariosxstatus`
--

INSERT INTO `usuariosxstatus` (`fecha`, `status_usuarios_id`, `usuarios_id`) VALUES
('2017-06-18 01:32:17', 1, 21),
('2017-06-18 14:06:15', 1, 22),
('2017-06-20 01:31:34', 1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_accesos`
--

CREATE TABLE `usuarios_accesos` (
  `usuarios_id` int(8) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(256) NOT NULL,
  `seudonimo` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios_accesos`
--

INSERT INTO `usuarios_accesos` (`usuarios_id`, `password`, `email`, `seudonimo`) VALUES
(21, '2270e73a86e507f7a99d98e739a62f96ec812c1a19b37a0db27785e620518566', 'ivandario2010@gmail.com', 'icalderon'),
(22, '4c4f77aceea658cc382e42e27ff69d46d6f4d17db08e7b3b8100c2356353a369', 'todoennegocio@gmail.com', 'Jnito'),
(23, '2270e73a86e507f7a99d98e739a62f96ec812c1a19b37a0db27785e620518566', 'danielcontreras@keos.co', 'dcaceres');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_amigos`
--

CREATE TABLE `usuarios_amigos` (
  `fecha` date NOT NULL COMMENT 'fecha en que se hacen amigos',
  `usuarios_id` int(8) NOT NULL COMMENT 'identificador del usuario',
  `amigos_id` int(8) NOT NULL COMMENT 'identificador del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_favoritos`
--

CREATE TABLE `usuarios_favoritos` (
  `fecha` date NOT NULL COMMENT 'fecha en que se hacen amigos',
  `usuarios_id` int(8) NOT NULL COMMENT 'identificador del usuario',
  `favoritos_id` int(8) NOT NULL COMMENT 'identificador del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_grupos`
--

CREATE TABLE `usuarios_grupos` (
  `grupos_id` int(6) NOT NULL,
  `usuarios_id` int(8) NOT NULL,
  `roles_id` int(2) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_grupos_admin`
--

CREATE TABLE `usuarios_grupos_admin` (
  `grupos_id` int(6) NOT NULL,
  `usuarios_id` int(8) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_id` (`usuarios_id`);

--
-- Indexes for table `fotos`
--
ALTER TABLE `fotos`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `mensajes_contactos`
--
ALTER TABLE `mensajes_contactos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_id` (`usuarios_id`);

--
-- Indexes for table `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pujas`
--
ALTER TABLE `pujas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recurso_id` (`recurso_id`);

--
-- Indexes for table `recursos`
--
ALTER TABLE `recursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorias_id` (`usuarios_id`),
  ADD KEY `mensajes_contactos_id` (`mensajes_contactos_id`);

--
-- Indexes for table `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estados_id` (`paises_id`);

--
-- Indexes for table `status_usuarios`
--
ALTER TABLE `status_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trafico`
--
ALTER TABLE `trafico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_id` (`usuarios_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `municipio` (`regiones_id`);

--
-- Indexes for table `usuariosxstatus`
--
ALTER TABLE `usuariosxstatus`
  ADD KEY `status_usuarios_id` (`status_usuarios_id`),
  ADD KEY `usuarios_id` (`usuarios_id`);

--
-- Indexes for table `usuarios_accesos`
--
ALTER TABLE `usuarios_accesos`
  ADD KEY `usuarios_id` (`usuarios_id`);

--
-- Indexes for table `usuarios_amigos`
--
ALTER TABLE `usuarios_amigos`
  ADD KEY `usuarios_id` (`usuarios_id`),
  ADD KEY `amigo_id` (`amigos_id`);

--
-- Indexes for table `usuarios_favoritos`
--
ALTER TABLE `usuarios_favoritos`
  ADD KEY `usuarios_id` (`usuarios_id`),
  ADD KEY `favoritos_id` (`favoritos_id`);

--
-- Indexes for table `usuarios_grupos_admin`
--
ALTER TABLE `usuarios_grupos_admin`
  ADD KEY `grupos_id` (`grupos_id`,`usuarios_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fotos`
--
ALTER TABLE `fotos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mensajes_contactos`
--
ALTER TABLE `mensajes_contactos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `pujas`
--
ALTER TABLE `pujas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `recursos`
--
ALTER TABLE `recursos`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `regiones`
--
ALTER TABLE `regiones`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT for table `status_usuarios`
--
ALTER TABLE `status_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `trafico`
--
ALTER TABLE `trafico`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1868;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

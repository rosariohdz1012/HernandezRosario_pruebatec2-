-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-01-2025 a las 17:48:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `turnero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `ID` bigint(20) NOT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `FECHACITA` date DEFAULT NULL,
  `HORACITA` time DEFAULT NULL,
  `CIUDADANO_ID` bigint(20) DEFAULT NULL,
  `TRAMITE_ID` bigint(20) DEFAULT NULL,
  `USUARIO_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`ID`, `ESTADO`, `FECHACITA`, `HORACITA`, `CIUDADANO_ID`, `TRAMITE_ID`, `USUARIO_ID`) VALUES
(1, 1, '2025-01-24', '16:40:00', 1, 1, 3),
(2, 0, '2025-01-30', '20:43:00', 2, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE `ciudadano` (
  `ID` bigint(20) NOT NULL,
  `APELLIDOMAT` varchar(255) DEFAULT NULL,
  `APELLIDOPAT` varchar(255) DEFAULT NULL,
  `GENERO` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ciudadano`
--

INSERT INTO `ciudadano` (`ID`, `APELLIDOMAT`, `APELLIDOPAT`, `GENERO`, `NOMBRE`, `TELEFONO`) VALUES
(1, 'Villegas', 'Hernandez', 'masculino', 'jose jesus', '2821752893'),
(2, 'Flores', 'Villegas', 'femenino', 'Elena Gudalupe', '2821288910');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tramite`
--

CREATE TABLE `tramite` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPCIONTRA` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `tramite`
--

INSERT INTO `tramite` (`ID`, `DESCRIPCIONTRA`, `NOMBRE`) VALUES
(1, 'Pagar Impuestos de años anteriores con descuento', 'predio'),
(2, 'Sacar permiso para construir', 'Permiso de construccion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` bigint(20) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID`, `EMAIL`, `NOMBRE`, `PASSWORD`) VALUES
(3, 'hernandezvillegasm12@gmail.com', 'Maria', '12345');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CITA_USUARIO_ID` (`USUARIO_ID`),
  ADD KEY `FK_CITA_TRAMITE_ID` (`TRAMITE_ID`),
  ADD KEY `FK_CITA_CIUDADANO_ID` (`CIUDADANO_ID`);

--
-- Indices de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tramite`
--
ALTER TABLE `tramite`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tramite`
--
ALTER TABLE `tramite`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `FK_CITA_CIUDADANO_ID` FOREIGN KEY (`CIUDADANO_ID`) REFERENCES `ciudadano` (`ID`),
  ADD CONSTRAINT `FK_CITA_TRAMITE_ID` FOREIGN KEY (`TRAMITE_ID`) REFERENCES `tramite` (`ID`),
  ADD CONSTRAINT `FK_CITA_USUARIO_ID` FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuario` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

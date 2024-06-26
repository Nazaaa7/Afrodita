-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-06-2024 a las 23:24:38
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
-- Base de datos: `afrodita01`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_personal`
--

CREATE TABLE `cargo_personal` (
  `idCargo` int(4) NOT NULL,
  `cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cargo_personal`
--

INSERT INTO `cargo_personal` (`idCargo`, `cargo`) VALUES
(1, 'Administrador'),
(2, 'Recepcionista'),
(3, 'Empleado1'),
(4, 'Cajera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_turno`
--

CREATE TABLE `detalle_turno` (
  `idDetalleTurno` int(4) NOT NULL,
  `idTurno` int(4) DEFAULT NULL,
  `idInsumo` int(4) DEFAULT NULL,
  `cantidad` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `idInsumo` int(4) NOT NULL,
  `nombreInsumo` varchar(100) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  `idTipoInsumo` int(4) DEFAULT NULL,
  `idProveedor` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `idPersonal` int(4) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `fecha_nac` date NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `sexo` enum('Femenino','Masculino') NOT NULL,
  `idCargo` int(4) NOT NULL,
  `beneficios` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`idPersonal`, `nombres`, `apellidos`, `dni`, `fecha_nac`, `telefono`, `sexo`, `idCargo`, `beneficios`) VALUES
(3, 'naza', 'garcia', '46115454', '2005-06-09', '3704774295', 'Femenino', 1, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(4) NOT NULL,
  `nombreProveedor` varchar(100) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_insumos`
--

CREATE TABLE `registro_insumos` (
  `idRegistro` int(4) NOT NULL,
  `idInsumo` int(4) DEFAULT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(4) NOT NULL,
  `tipoMovimiento` enum('Entrada','Salida') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idServicio` int(4) NOT NULL,
  `nombreServicio` varchar(100) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  `idTipoServicio` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idServicio`, `nombreServicio`, `descripcion`, `idTipoServicio`) VALUES
(1, 'manicura', 'manicura', 1),
(2, 'esmaltado', 'esmaltado semipermatente', 1),
(3, 'corte de cabello', 'corte de cabello', 2),
(4, 'pedicura basica', 'no', 3),
(5, 'esmalte', 'llo', 3),
(6, 'maquillaje de eventos', '', 4),
(7, 'maquillaje de noche', '', 4),
(8, 'facial basico', '', 5),
(9, 'tratamiento anticelulitis', '', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_servicios`
--

CREATE TABLE `tipos_servicios` (
  `idTipoServicio` int(4) NOT NULL,
  `tipoServicio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipos_servicios`
--

INSERT INTO `tipos_servicios` (`idTipoServicio`, `tipoServicio`) VALUES
(1, 'manicura'),
(2, 'pedicura'),
(3, 'peluqueria'),
(4, 'maquillaje'),
(5, 'tratatmientos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_usuario`
--

CREATE TABLE `tipos_usuario` (
  `idTipoUsuario` int(4) NOT NULL,
  `tipoUsuario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_insumos`
--

CREATE TABLE `tipo_insumos` (
  `idTipoInsumo` int(4) NOT NULL,
  `tipoInsumo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `idTurno` int(4) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `idUsuario` int(4) DEFAULT NULL,
  `idServicio` int(4) DEFAULT NULL,
  `idPersonal` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`idTurno`, `fecha`, `hora`, `idUsuario`, `idServicio`, `idPersonal`) VALUES
(4, '2024-05-29', '21:57:00', NULL, NULL, 3),
(6, '2024-06-05', '20:08:00', NULL, NULL, 3),
(7, '2024-06-07', '18:25:00', NULL, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(4) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `idTipoUsuario` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo_personal`
--
ALTER TABLE `cargo_personal`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `detalle_turno`
--
ALTER TABLE `detalle_turno`
  ADD PRIMARY KEY (`idDetalleTurno`),
  ADD KEY `idTurno` (`idTurno`),
  ADD KEY `idInsumo` (`idInsumo`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`idInsumo`),
  ADD KEY `idTipoInsumo` (`idTipoInsumo`),
  ADD KEY `idProveedor` (`idProveedor`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`idPersonal`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `idCargo` (`idCargo`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `registro_insumos`
--
ALTER TABLE `registro_insumos`
  ADD PRIMARY KEY (`idRegistro`),
  ADD KEY `idInsumo` (`idInsumo`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idServicio`),
  ADD KEY `idTipoServicio` (`idTipoServicio`);

--
-- Indices de la tabla `tipos_servicios`
--
ALTER TABLE `tipos_servicios`
  ADD PRIMARY KEY (`idTipoServicio`);

--
-- Indices de la tabla `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  ADD PRIMARY KEY (`idTipoUsuario`);

--
-- Indices de la tabla `tipo_insumos`
--
ALTER TABLE `tipo_insumos`
  ADD PRIMARY KEY (`idTipoInsumo`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`idTurno`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idServicio` (`idServicio`),
  ADD KEY `idPersonal` (`idPersonal`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idTipoUsuario` (`idTipoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo_personal`
--
ALTER TABLE `cargo_personal`
  MODIFY `idCargo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_turno`
--
ALTER TABLE `detalle_turno`
  MODIFY `idDetalleTurno` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `idInsumo` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `idPersonal` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_insumos`
--
ALTER TABLE `registro_insumos`
  MODIFY `idRegistro` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `idServicio` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipos_servicios`
--
ALTER TABLE `tipos_servicios`
  MODIFY `idTipoServicio` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  MODIFY `idTipoUsuario` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_insumos`
--
ALTER TABLE `tipo_insumos`
  MODIFY `idTipoInsumo` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `idTurno` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(4) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_turno`
--
ALTER TABLE `detalle_turno`
  ADD CONSTRAINT `detalle_turno_ibfk_1` FOREIGN KEY (`idTurno`) REFERENCES `turnos` (`idTurno`),
  ADD CONSTRAINT `detalle_turno_ibfk_2` FOREIGN KEY (`idInsumo`) REFERENCES `insumos` (`idInsumo`);

--
-- Filtros para la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD CONSTRAINT `insumos_ibfk_1` FOREIGN KEY (`idTipoInsumo`) REFERENCES `tipo_insumos` (`idTipoInsumo`),
  ADD CONSTRAINT `insumos_ibfk_2` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`idCargo`) REFERENCES `cargo_personal` (`idCargo`);

--
-- Filtros para la tabla `registro_insumos`
--
ALTER TABLE `registro_insumos`
  ADD CONSTRAINT `registro_insumos_ibfk_1` FOREIGN KEY (`idInsumo`) REFERENCES `insumos` (`idInsumo`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`idTipoServicio`) REFERENCES `tipos_servicios` (`idTipoServicio`);

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `turnos_ibfk_2` FOREIGN KEY (`idServicio`) REFERENCES `servicios` (`idServicio`),
  ADD CONSTRAINT `turnos_ibfk_3` FOREIGN KEY (`idPersonal`) REFERENCES `personal` (`idPersonal`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipos_usuario` (`idTipoUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

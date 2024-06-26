-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2024 a las 18:32:40
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
-- Base de datos: `tfgdaw`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `nombreNota` varchar(255) DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `evidencia` varchar(255) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT current_timestamp(),
  `estadoNota` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `dniUsuario` varchar(9) DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `tarea_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `nombreNota`, `contenido`, `evidencia`, `fechaCreacion`, `estadoNota`, `activo`, `dniUsuario`, `proyecto_id`, `tarea_id`) VALUES
(1, 'Error botón Cancelar', 'El botón Cancelar no redirige a la página adecuada.', 'Descargas/66647dfc046c5_errorexample.jpg', '2024-06-07 10:23:13', 'Finalizada', 1, '74443616E', 2, 2),
(7, 'Error al exportar a excel las facturas', 'Cuando se exportan las facturas, muestra una tabla vacía.', NULL, '2024-06-08 17:54:10', 'Iniciada', 1, '74443616E', 2, 1),
(8, 'Falta campo proveedor', 'Falta añadir al formulario de alta un campo para indicar quién es el proveedor.', NULL, '2024-06-08 18:11:06', 'Finalizada', 1, '21974763B', 1, 8),
(9, 'Error al actualizar un material', 'Al editar un material el formulario no se envía correctamente.', 'Descargas/666482f3123a6_errorexample.jpg', '2024-06-08 18:12:35', 'Finalizada', 1, '21974763B', 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL,
  `nombreProyecto` varchar(255) DEFAULT NULL,
  `descripcionProyecto` text DEFAULT NULL,
  `repositorio` varchar(255) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT current_timestamp(),
  `fechaFinalizacionPrevista` date DEFAULT NULL,
  `estadoProyecto` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `dniUsuario` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `nombreProyecto`, `descripcionProyecto`, `repositorio`, `fechaCreacion`, `fechaFinalizacionPrevista`, `estadoProyecto`, `activo`, `dniUsuario`) VALUES
(1, 'Taller Mecánico AutoSolution', 'Desarrollo de la aplicación web que el taller utilizará para gestionar la entrada y salida de los materiales, piezas, herramientas, etc. que utilizan.', 'https://github.com/MissTurtle85/DAW_TFG_ElenaGD.git', '2024-06-07 08:42:30', '2024-06-12', 'Finalizado', 1, '21974763B'),
(2, 'Salón de Estética Zen', 'Desarrollo de la web que usarán los clientes para gestionar sus citas y los servicios que requieren.', 'https://github.com/MissTurtle85/DAW_TFG_ElenaGD.git', '2024-06-07 09:47:18', '2024-06-14', 'Iniciado', 1, '74443616E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos_usuarios`
--

CREATE TABLE `proyectos_usuarios` (
  `proyecto_id` int(11) NOT NULL,
  `dniUsuario` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proyectos_usuarios`
--

INSERT INTO `proyectos_usuarios` (`proyecto_id`, `dniUsuario`) VALUES
(1, '07207818D'),
(1, '12345678Z'),
(1, '21974763B'),
(1, '74443616E'),
(1, '95046911D'),
(2, '07207818D'),
(2, '48815056V'),
(2, '67942031P'),
(2, '74443616E'),
(2, '95046911D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `nombreTarea` varchar(255) DEFAULT NULL,
  `descripcionTarea` text DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT current_timestamp(),
  `fechaFinalizacionPrevista` date DEFAULT NULL,
  `estadoTarea` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `dniUsuario` varchar(9) DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `nombreTarea`, `descripcionTarea`, `fechaCreacion`, `fechaFinalizacionPrevista`, `estadoTarea`, `activo`, `dniUsuario`, `proyecto_id`) VALUES
(1, 'CRUD Gestión de Usuarios', 'Crear el CRUD para la gestión de los usuarios, incluido administrador y posibles clientes VIP.', '2024-06-07 09:59:31', '2024-06-13', 'Iniciada', 1, '74443616E', 2),
(2, 'CRUD Gestión de Citas', 'Crear la gestión de las citas. Incluir confirmación por email.', '2024-06-07 10:00:38', '2024-06-13', 'Iniciada', 1, '74443616E', 2),
(7, 'CRUD repuestos para reparación de vehículos', 'Crear el CRUD para la gestión de los diferentes tipos de repuestos de los que disponen en el taller para realizar reparaciones.', '2024-06-08 18:04:33', '2024-06-10', 'Finalizada', 1, '21974763B', 1),
(8, 'CRUD de otros materiales usados para el mantenimiento de los vehículos', 'Crear el CRUD para la gestión de los materiales de los que disponen en el taller para realizar mantenimientos.', '2024-06-08 18:09:31', '2024-06-10', 'Finalizada', 1, '21974763B', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas_usuarios`
--

CREATE TABLE `tareas_usuarios` (
  `tarea_id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `dniUsuario` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tareas_usuarios`
--

INSERT INTO `tareas_usuarios` (`tarea_id`, `proyecto_id`, `dniUsuario`) VALUES
(7, 1, '95046911D'),
(8, 1, '07207818D'),
(1, 2, '67942031P'),
(2, 2, '48815056V');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `localidad` varchar(30) NOT NULL,
  `provincia` varchar(30) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contrasenya` varchar(500) NOT NULL,
  `rol` varchar(30) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`dni`, `nombre`, `direccion`, `localidad`, `provincia`, `telefono`, `email`, `contrasenya`, `rol`, `activo`) VALUES
('07207818D', 'Lea', 'C Novena', 'Elche', 'Alicante', '666555999', 'elenagardidaw@gmail.com', '$2y$10$rvSApDhljHfUMFDlSbF5POqQfdwqIoCi5Xsp9wO4SJ0I39MMGc9.W', 'Empleado', 1),
('12345678Z', 'María', 'C Quinta', 'Elche', 'Alicante', '666555555', 'elenagardidaw@gmail.com', '$2y$10$ta6qp7AA/lL9ZqWVT8GETe7bEm9dDDTyxIddE4Qh0Kmu/qvek2/Sm', 'Empleado', 1),
('21974763B', 'Adrián', 'C Tercera', 'Elche', 'Alicante', '666555333', 'elenagardidaw@gmail.com', '$2y$10$i9COKHi0KXVzADYbgHEefOnSeDCDAJcRrXNQArdTBn0XQ4qa4V9P.', 'Jefe', 1),
('21980592K', 'José', 'C Cuarta', 'Elche', 'Alicante', '666555444', 'elenagardidaw@gmail.com', '$2y$10$zsjsvI3iQiVTAR9QybFKBezbc6HRHqi3IWdzESMdJ7Zo3u8cCNncC', 'Empleado', 0),
('48815056V', 'David', 'C Octava', 'Elche', 'Alicante', '666555888', 'elenagardidaw@gmail.com', '$2y$10$vzUb9tuksk8wEezLy6ohruwhp82oI0tDTMq2.q30jQ6uKaUuNlcnu', 'Empleado', 1),
('67942031P', 'Ana', 'C Sexta', 'Elche', 'Alicante', '666555666', 'elenagardidaw@gmail.com', '$2y$10$ghClthl8MDCQi09RjtzAuO5krGMDSoX9LUCQ5KtT6sZdck7cQ.MzK', 'Empleado', 1),
('74363057D', 'Elena', 'C Primera', 'Elche', 'Alicante', '666555111', 'elenagardidaw@gmail.com', '$2y$10$z/sMGiNaXkROg77ui3Pig.gbAAOVtMOp23sW5tKT9k4fcK/GdlYFi', 'Administrador', 1),
('74443616E', 'Mel', 'C Segunda', 'Elche', 'Alicante', '666555222', 'elenagardidaw@gmail.com', '$2y$10$pAkk0dD3opUD.e83i.RSdOJ8hOALbK2DLGY22ANdwpiP3Q5bH3DQy', 'Jefe', 1),
('95046911D', 'Aarón', 'C Séptima', 'Elche', 'Alicante', '666555777', 'elenagardidaw@gmail.com', '$2y$10$i6ATKtLKKRDWheRtAXVb3.LXixuy0h88bZngvIxBdecFfAWC8HvhC', 'Empleado', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dniUsuario` (`dniUsuario`),
  ADD KEY `proyecto_id` (`proyecto_id`),
  ADD KEY `tarea_id` (`tarea_id`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dniUsuario` (`dniUsuario`);

--
-- Indices de la tabla `proyectos_usuarios`
--
ALTER TABLE `proyectos_usuarios`
  ADD PRIMARY KEY (`proyecto_id`,`dniUsuario`),
  ADD KEY `dniUsuario` (`dniUsuario`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dniUsuario` (`dniUsuario`),
  ADD KEY `proyecto_id` (`proyecto_id`);

--
-- Indices de la tabla `tareas_usuarios`
--
ALTER TABLE `tareas_usuarios`
  ADD PRIMARY KEY (`tarea_id`,`dniUsuario`),
  ADD KEY `dniUsuario` (`dniUsuario`),
  ADD KEY `tareas_usuarios_ibfk_3` (`proyecto_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`dniUsuario`) REFERENCES `usuarios` (`dni`),
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`),
  ADD CONSTRAINT `notas_ibfk_3` FOREIGN KEY (`tarea_id`) REFERENCES `tareas` (`id`);

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`dniUsuario`) REFERENCES `usuarios` (`dni`);

--
-- Filtros para la tabla `proyectos_usuarios`
--
ALTER TABLE `proyectos_usuarios`
  ADD CONSTRAINT `proyectos_usuarios_ibfk_1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`),
  ADD CONSTRAINT `proyectos_usuarios_ibfk_2` FOREIGN KEY (`dniUsuario`) REFERENCES `usuarios` (`dni`);

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`dniUsuario`) REFERENCES `usuarios` (`dni`),
  ADD CONSTRAINT `tareas_ibfk_2` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`);

--
-- Filtros para la tabla `tareas_usuarios`
--
ALTER TABLE `tareas_usuarios`
  ADD CONSTRAINT `tareas_usuarios_ibfk_1` FOREIGN KEY (`tarea_id`) REFERENCES `tareas` (`id`),
  ADD CONSTRAINT `tareas_usuarios_ibfk_2` FOREIGN KEY (`dniUsuario`) REFERENCES `usuarios` (`dni`),
  ADD CONSTRAINT `tareas_usuarios_ibfk_3` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

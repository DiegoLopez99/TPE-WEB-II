-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2020 a las 00:10:38
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dl_gameshop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `texto` varchar(900) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_juego` int(11) NOT NULL,
  `puntuacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `texto`, `id_usuario`, `id_juego`, `puntuacion`) VALUES
(1, 'comentario de prueba', 1, 2, 5),
(2, 'mermeladaaa', 2, 15, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `nombre`) VALUES
(1, 'Deportes'),
(2, 'Accion'),
(3, 'Conduccion'),
(4, 'Aventura'),
(5, 'Estrategia'),
(8, 'Infantiles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` double NOT NULL,
  `formato` varchar(255) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `stock` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`id`, `nombre`, `precio`, `formato`, `id_genero`, `stock`) VALUES
(2, 'FIFA 21', 4500, 'Digital', 1, 0),
(3, 'Mafia Trilogy', 6120, 'Digital', 2, 1),
(10, 'Sims 4', 4500, 'Fisico', 5, 0),
(15, 'Call Of Duty Black Ops Cold War', 3800, 'Digital', 2, 1),
(16, 'Dirt 5', 6100, 'Fisico', 3, 1),
(17, 'F1 2020 Seventy Ediion', 4440, 'Digital', 3, 1),
(22, 'Need for Speed Heat', 5420, 'Fisico', 3, 1),
(23, 'ARK Survival Evolved', 1560, 'Digital', 4, 1),
(24, 'Crash Bandicoot 4 Its About', 6340, 'Fisico', 4, 1),
(25, 'Fall Guys Ultimate Knockout', 1320, 'Digital', 4, 1),
(26, 'Minecraft', 1536, 'Digital', 4, 1),
(27, 'Jurassic World Evolution', 2300, 'Fisico', 4, 0),
(28, 'NBA 2K21', 4300, 'Digital', 1, 1),
(29, 'UFC 4', 6350, 'Fisico', 1, 1),
(30, 'eFootball PES 2021', 2560, 'Digital', 1, 1),
(31, 'GTA V', 1130, 'Digital', 2, 1),
(33, 'Red Dead Redemption 2', 3100, 'Fisico', 2, 1),
(34, 'The Last of Us Part II ', 6400, 'Fisico', 2, 0),
(35, 'HITMAN The Complete First Season', 1320, 'Digital', 5, 1),
(37, 'FEAR', 600, 'Fisico', 2, 1),
(38, 'Sonic', 1200, 'Digital', 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `admin`) VALUES
(1, 'diego@gmail.com', '$2y$10$BcX4HeOuhiUTwPHpNlP6A.GycT/N/HkbO7Rd.AVZKSXxzmNZBjGiW', 1),
(2, 'javi@gmail.com', '$2y$10$IKzG6zJ0CiXLcHlAnSgcD.4Wkwv6zd9MACRzWXjZjn9cJgpXPVMIu', 1),
(3, 'roberto@gmail.com', '$2y$10$GCfjYhBDb0qh/.55LGw7we42HhhZBBdpTb05g3PWzXKlLA/FAqEHa', 0),
(5, 'mermelada@gmail.com', '$2y$10$1fG0Loz/P1xM5rslOoXpJO2aODzcdSkUsJw/S9LniZBKsME4gCuom', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD UNIQUE KEY `id_juego` (`id_juego`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_id_genero` (`id_genero`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id`);

--
-- Filtros para la tabla `juego`
--
ALTER TABLE `juego`
  ADD CONSTRAINT `juego_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

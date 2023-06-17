-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2023 at 10:16 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `happyreads`
--

-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE `autor` (
  `id` int(15) NOT NULL,
  `nombre` text NOT NULL,
  `informacion` text NOT NULL,
  `foto` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`id`, `nombre`, `informacion`, `foto`) VALUES
(1, 'marissa meyer', 'le gusta la ciencia', 'https://wl-genial.cf.tsp.li/resize/728x/jpg/91b/430/964a9c5ac9933cc012d0bd80be.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `lectores`
--

CREATE TABLE `lectores` (
  `id` int(15) NOT NULL,
  `usuario_unico` varchar(15) NOT NULL,
  `contrasena` varchar(15) NOT NULL,
  `informacion` text NOT NULL,
  `frase_libro` text NOT NULL,
  `lista_lectura` int(15) NOT NULL,
  `foto` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lectores`
--

INSERT INTO `lectores` (`id`, `usuario_unico`, `contrasena`, `informacion`, `frase_libro`, `lista_lectura`, `foto`) VALUES
(1, 'lupita', 'lupi22', 'Megusta comer zanahorias', 'todos acaban igual en un boulevard de los sueños rotos', 2, 'https://marketplace.canva.com/EAEj17Y_k_k/2/0/1600w/canva-amarillo-y-negro-gamer-desgastado-imagen-de-perfil-de-twitch-41B81rUGLAg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `libros`
--

CREATE TABLE `libros` (
  `id` int(15) NOT NULL,
  `titulo` text NOT NULL,
  `autor` int(15) NOT NULL,
  `paginas` int(15) NOT NULL,
  `media` varchar(15) NOT NULL,
  `saga` text NOT NULL,
  `genero` text NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `sinopsis` text NOT NULL,
  `portada` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor`, `paginas`, `media`, `saga`, `genero`, `fecha_publicacion`, `sinopsis`, `portada`) VALUES
(1, 'Cinder', 1, 440, '3.5', 'Las Cronicas Lunares', 'Ciencia Ficccion', '2023-06-06', 'hdabnjasnidansdasindasn', 'https://dthezntil550i.cloudfront.net/f4/latest/f41908291942413280009640715/1280_960/1b2d9510-d66d-43a2-971a-cfcbb600e7fe.png');

-- --------------------------------------------------------

--
-- Table structure for table `resenas`
--

CREATE TABLE `resenas` (
  `id` int(15) NOT NULL,
  `lector` int(15) NOT NULL,
  `libro` int(15) NOT NULL,
  `autor_libro` int(15) NOT NULL,
  `fecha_culminacion` date NOT NULL,
  `calificacion` int(15) NOT NULL,
  `resena` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resenas`
--

INSERT INTO `resenas` (`id`, `lector`, `libro`, `autor_libro`, `fecha_culminacion`, `calificacion`, `resena`) VALUES
(1, 1, 1, 1, '2023-06-15', 5, 'knasnansckansklcnanjksdfjsdnjfsndjfnsjfnjsncjsndcdn amo a kai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lectores`
--
ALTER TABLE `lectores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autor` (`autor`);

--
-- Indexes for table `resenas`
--
ALTER TABLE `resenas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lector` (`lector`,`libro`,`autor_libro`),
  ADD KEY `libro` (`libro`),
  ADD KEY `autor_libro` (`autor_libro`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lectores`
--
ALTER TABLE `lectores`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `resenas`
--
ALTER TABLE `resenas`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `autor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resenas`
--
ALTER TABLE `resenas`
  ADD CONSTRAINT `resenas_ibfk_1` FOREIGN KEY (`lector`) REFERENCES `lectores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resenas_ibfk_2` FOREIGN KEY (`libro`) REFERENCES `libros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resenas_ibfk_3` FOREIGN KEY (`autor_libro`) REFERENCES `autor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

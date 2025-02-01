-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: GestionHotel
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Factura`
--

DROP TABLE IF EXISTS `Factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Factura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reservacion_id` int DEFAULT NULL,
  `fecha_factura` date NOT NULL,
  `descripcion` text,
  `iva` decimal(10,2) DEFAULT NULL,
  `metodo_pago` enum('efectivo','tarjeta','transferencia') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reservacion_id` (`reservacion_id`),
  CONSTRAINT `Factura_ibfk_1` FOREIGN KEY (`reservacion_id`) REFERENCES `Reservacion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Factura`
--

LOCK TABLES `Factura` WRITE;
/*!40000 ALTER TABLE `Factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `Factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Habitacion`
--

DROP TABLE IF EXISTS `Habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Habitacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int DEFAULT NULL,
  `numero_habitacion` int NOT NULL,
  `tipo` enum('suite','doble','individuales') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `Habitacion_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `Hotel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Habitacion`
--

LOCK TABLES `Habitacion` WRITE;
/*!40000 ALTER TABLE `Habitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Habitacion_Reservacion`
--

DROP TABLE IF EXISTS `Habitacion_Reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Habitacion_Reservacion` (
  `habitacion_id` int NOT NULL,
  `reservacion_id` int NOT NULL,
  PRIMARY KEY (`habitacion_id`,`reservacion_id`),
  KEY `reservacion_id` (`reservacion_id`),
  CONSTRAINT `Habitacion_Reservacion_ibfk_1` FOREIGN KEY (`habitacion_id`) REFERENCES `Habitacion` (`id`),
  CONSTRAINT `Habitacion_Reservacion_ibfk_2` FOREIGN KEY (`reservacion_id`) REFERENCES `Reservacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Habitacion_Reservacion`
--

LOCK TABLES `Habitacion_Reservacion` WRITE;
/*!40000 ALTER TABLE `Habitacion_Reservacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Habitacion_Reservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Habitacion_Servicio`
--

DROP TABLE IF EXISTS `Habitacion_Servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Habitacion_Servicio` (
  `habitacion_id` int NOT NULL,
  `servicio_id` int NOT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  PRIMARY KEY (`habitacion_id`,`servicio_id`),
  KEY `servicio_id` (`servicio_id`),
  CONSTRAINT `Habitacion_Servicio_ibfk_1` FOREIGN KEY (`habitacion_id`) REFERENCES `Habitacion` (`id`),
  CONSTRAINT `Habitacion_Servicio_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `Servicios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Habitacion_Servicio`
--

LOCK TABLES `Habitacion_Servicio` WRITE;
/*!40000 ALTER TABLE `Habitacion_Servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Habitacion_Servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hotel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `ruc` varchar(20) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `anio_construccion` year DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ruc` (`ruc`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `Hotel_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `Categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotel`
--

LOCK TABLES `Hotel` WRITE;
/*!40000 ALTER TABLE `Hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservacion`
--

DROP TABLE IF EXISTS `Reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_persona` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservacion`
--

LOCK TABLES `Reservacion` WRITE;
/*!40000 ALTER TABLE `Reservacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservacion_Agencia`
--

DROP TABLE IF EXISTS `Reservacion_Agencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservacion_Agencia` (
  `reservacion_id` int NOT NULL,
  `nombre_agencia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`reservacion_id`),
  CONSTRAINT `Reservacion_Agencia_ibfk_1` FOREIGN KEY (`reservacion_id`) REFERENCES `Reservacion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservacion_Agencia`
--

LOCK TABLES `Reservacion_Agencia` WRITE;
/*!40000 ALTER TABLE `Reservacion_Agencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reservacion_Agencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservacion_Particular`
--

DROP TABLE IF EXISTS `Reservacion_Particular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservacion_Particular` (
  `reservacion_id` int NOT NULL,
  PRIMARY KEY (`reservacion_id`),
  CONSTRAINT `Reservacion_Particular_ibfk_1` FOREIGN KEY (`reservacion_id`) REFERENCES `Reservacion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservacion_Particular`
--

LOCK TABLES `Reservacion_Particular` WRITE;
/*!40000 ALTER TABLE `Reservacion_Particular` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reservacion_Particular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Servicios`
--

DROP TABLE IF EXISTS `Servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('spa','comida','transporte','estacionamiento') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servicios`
--

LOCK TABLES `Servicios` WRITE;
/*!40000 ALTER TABLE `Servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Servicios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-31 21:02:09

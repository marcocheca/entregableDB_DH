-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: EntregableDB
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id(PK)` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) NOT NULL,
  PRIMARY KEY (`id(PK)`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Música'),(2,'Deportes'),(3,'Economía'),(4,'Redes Sociales'),(5,'Recetas'),(6,'Tecnología'),(7,'Eventos'),(8,'Recordatorios'),(9,'Ciencia'),(10,'Lista');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
  `id(PK)` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_mod` date DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `puede_eliminarse` tinyint(4) NOT NULL,
  `id_usuario(FK)` int(11) NOT NULL,
  PRIMARY KEY (`id(PK)`),
  KEY `FK_2ad4e185-2a6d-4d13-9b01-a9b034d27d11` (`id_usuario(FK)`),
  CONSTRAINT `FK_2ad4e185-2a6d-4d13-9b01-a9b034d27d11` FOREIGN KEY (`id_usuario(FK)`) REFERENCES `usuarios` (`id(PK)`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,'Nueva Nota','2021-11-28','2021-11-28','Lorem ipsum dolor sit, amet consectetur adipisicing elit.',1,1),(2,'Nueva Nota2','2021-11-28','2021-11-28','Lorem ipsum dolor sit, amet consectetur adipisicing elit.',0,1),(3,'Nueva Nota3','2021-11-28','2021-11-28','Lorem ipsum dolor sit, amet consectetur adipisicing elit.',1,3),(4,'Nueva Nota4','2021-11-28','2021-11-28','Lorem ipsum dolor sit, amet consectetur adipisicing elit.',1,6),(5,'Nueva Nota5','2021-11-28','2021-11-28','Lorem ipsum dolor sit, amet consectetur adipisicing elit.',1,5),(6,'Nueva Nota6','2021-11-28','2021-11-28','Lorem ipsum dolor sit, amet consectetur adipisicing elit.',1,9),(7,'Nueva Nota7','2021-11-28','2021-11-28','Lorem ipsum dolor sit, amet consectetur adipisicing elit.',1,9),(8,'Nueva Nota8','2021-11-28','2021-11-28','Lorem ipsum dolor sit, amet consectetur adipisicing elit.',1,3),(9,'Nueva Nota9','2021-11-28','2021-11-28','Lorem ipsum dolor sit, amet consectetur adipisicing elit.',1,7),(10,'Nueva Nota10','2021-11-28','2021-11-28','Lorem ipsum dolor sit, amet consectetur adipisicing elit.',0,1);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_categ`
--

DROP TABLE IF EXISTS `notas_categ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas_categ` (
  `id` int(11) NOT NULL,
  `id_nota(FK)` int(11) NOT NULL,
  `id_categ(FK)` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_70555ada-b091-420f-9b49-dc68cf1e79e7` (`id_nota(FK)`),
  KEY `FK_d06a3b2a-fc49-433d-a168-b9f50a142687` (`id_categ(FK)`),
  CONSTRAINT `FK_70555ada-b091-420f-9b49-dc68cf1e79e7` FOREIGN KEY (`id_nota(FK)`) REFERENCES `notas` (`id(PK)`),
  CONSTRAINT `FK_d06a3b2a-fc49-433d-a168-b9f50a142687` FOREIGN KEY (`id_categ(FK)`) REFERENCES `categorias` (`id(PK)`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_categ`
--

LOCK TABLES `notas_categ` WRITE;
/*!40000 ALTER TABLE `notas_categ` DISABLE KEYS */;
INSERT INTO `notas_categ` VALUES (1,1,5),(2,2,4),(3,1,6),(4,5,5),(5,6,9),(6,3,8),(7,9,2),(8,10,10),(9,4,3),(10,7,4),(11,9,1),(12,8,7);
/*!40000 ALTER TABLE `notas_categ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id(PK)` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id(PK)`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'marco','marco@gmail.com'),(2,'María','maria@gmail.com'),(3,'Pedro','pedro@gmail.com'),(4,'Juan','juan@gmail.com'),(5,'Paula','paula@gmail.com'),(6,'Diana','diana@gmail.com'),(7,'Ignacio','ignacio@gmail.com'),(8,'Facundo','facundo@gmail.com'),(9,'Laura','laura@gmail.com'),(10,'Tomás','tomas@gmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'EntregableDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-28 18:56:22

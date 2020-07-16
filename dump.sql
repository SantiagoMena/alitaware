CREATE DATABASE  IF NOT EXISTS `alitaware` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `alitaware`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: alitaware
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `costo`
--

DROP TABLE IF EXISTS `costo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarios_desde` int(11) NOT NULL DEFAULT '0',
  `usuarios_hasta` int(11) NOT NULL DEFAULT '0',
  `precio` float NOT NULL DEFAULT '0',
  `servicio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_costo_servicio1_idx` (`servicio_id`),
  CONSTRAINT `fk_costo_servicio1` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costo`
--

LOCK TABLES `costo` WRITE;
/*!40000 ALTER TABLE `costo` DISABLE KEYS */;
INSERT INTO `costo` VALUES (1,0,9,50,1),(2,10,99,45,1),(3,100,999,40,1),(4,1000,0,0,1),(5,0,9,50,2),(6,10,99,45,2),(7,100,999,40,2),(8,1000,0,0,2),(9,0,9,50,3),(10,10,99,45,3),(11,100,999,40,3),(12,1000,0,0,3);
/*!40000 ALTER TABLE `costo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscripcion_id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_equipo_subscripcion1_idx` (`subscripcion_id`),
  CONSTRAINT `fk_equipo_subscripcion1` FOREIGN KEY (`subscripcion_id`) REFERENCES `subscripcion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,1,'Lince'),(2,4,'Gacela'),(3,7,'Aguila Calva');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscripcion_id` int(11) NOT NULL,
  `costo` float DEFAULT NULL,
  `estado` enum('Pagado','Pendiente') DEFAULT 'Pendiente',
  PRIMARY KEY (`id`),
  KEY `fk_pago_subscripcion1_idx` (`subscripcion_id`),
  CONSTRAINT `fk_pago_subscripcion1` FOREIGN KEY (`subscripcion_id`) REFERENCES `subscripcion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,2,50,'Pendiente'),(2,1,50,'Pendiente'),(3,3,45,'Pendiente');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Aplicaci√≥n'),(2,'Publicaci√≥n Digital'),(3,'Juego');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscripcion`
--

DROP TABLE IF EXISTS `subscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscripcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicio_id` int(11) NOT NULL,
  `subscriptor_id` int(11) NOT NULL,
  `estado` enum('Activa','Inactiva') DEFAULT 'Activa',
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_subscripcion_servicio1_idx` (`servicio_id`),
  KEY `fk_subscripcion_subscriptor1_idx` (`subscriptor_id`),
  CONSTRAINT `fk_subscripcion_servicio1` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscripcion_subscriptor1` FOREIGN KEY (`subscriptor_id`) REFERENCES `subscriptor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscripcion`
--

LOCK TABLES `subscripcion` WRITE;
/*!40000 ALTER TABLE `subscripcion` DISABLE KEYS */;
INSERT INTO `subscripcion` VALUES (1,1,2,'Activa','2020-07-15 00:00:00'),(2,2,2,'Activa','2020-07-15 00:00:00'),(3,3,2,'Activa','2020-07-15 00:00:00'),(4,1,1,'Activa','2020-07-15 00:00:00'),(5,2,1,'Activa','2020-07-15 00:00:00'),(6,3,1,'Activa','2020-07-15 00:00:00'),(7,1,3,'Activa','2020-07-15 00:00:00'),(8,2,3,'Activa','2020-07-15 00:00:00'),(9,3,3,'Activa','2020-07-15 00:00:00');
/*!40000 ALTER TABLE `subscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptor`
--

DROP TABLE IF EXISTS `subscriptor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `correo` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `clave` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptor`
--

LOCK TABLES `subscriptor` WRITE;
/*!40000 ALTER TABLE `subscriptor` DISABLE KEYS */;
INSERT INTO `subscriptor` VALUES (1,'Jhon','jhon@doe.com','4c25b32a72699ed712dfa80df77fc582'),(2,'Annie','annie@doe.com','4c25b32a72699ed712dfa80df77fc582'),(3,'Jane','jane@doe.com','4c25b32a72699ed712dfa80df77fc582'),(4,'Joa','joa@doe.com','4c25b32a72699ed712dfa80df77fc582');
/*!40000 ALTER TABLE `subscriptor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipo_id` int(11) NOT NULL,
  `creado` datetime DEFAULT NULL,
  `primer_uso_geo` point DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `clave` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `fk_usuario_equipo_idx` (`equipo_id`),
  CONSTRAINT `fk_usuario_equipo` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'2020-07-15 00:00:00','\0\0\0\0\0\0\0bôπ¿yC¿µm¡Q¿','jhon','4c25b32a72699ed712dfa80df77fc582'),(2,1,'2020-07-15 00:00:00','\0\0\0\0\0\0\0bôπ¿˘A¿µm¡Q¿','usuario1','4c25b32a72699ed712dfa80df77fc582'),(7,3,'2020-07-15 00:00:00','\0\0\0\0\0\0\0bôπ¿˘F¿µm¡Q¿','usuario3','4c25b32a72699ed712dfa80df77fc582'),(8,2,'2020-07-15 00:00:00','\0\0\0\0\0\0\0bôπ¿˘D¿µm¡Q¿','usuario2','4c25b32a72699ed712dfa80df77fc582');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-15 21:32:50

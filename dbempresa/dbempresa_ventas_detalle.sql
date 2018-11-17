-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: dbempresa
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas_detalle` (
  `idventa_detalle` bigint(20) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `precio_unitario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idventa_detalle`),
  KEY `idVenta_idx` (`idVenta`),
  KEY `idProducto_idx` (`idProducto`),
  CONSTRAINT `idProducto` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idVenta` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalle`
--

LOCK TABLES `ventas_detalle` WRITE;
/*!40000 ALTER TABLE `ventas_detalle` DISABLE KEYS */;
INSERT INTO `ventas_detalle` VALUES (4,1,1,'300','200'),(5,1,1,'50000','52000'),(6,19,2,'1','5000'),(7,19,1,'1','2500'),(8,19,1,'1','2000'),(9,20,1,'2','5000'),(10,20,1,'21','5000'),(11,17,1,'5','200'),(12,19,1,'5','200'),(13,19,1,'2','200'),(14,19,1,'2','2000'),(15,20,1,'5','5'),(16,20,1,'5','5'),(17,20,1,'5','200'),(18,20,1,'2','20'),(19,20,1,'5','55'),(20,20,1,'5','55'),(21,20,1,'55','55'),(22,20,1,'55','55'),(23,10,1,'8','8'),(24,10,1,'8','8'),(25,10,1,'8','9'),(26,10,1,'8','9'),(27,10,1,'5','5'),(28,10,1,'5','50'),(29,10,1,'5','5'),(30,10,1,'5','5'),(31,10,1,'5','5'),(32,10,1,'1','1'),(33,10,1,'5','5'),(34,17,1,'1','1'),(35,17,1,'5','5'),(36,17,1,'5','5'),(37,17,1,'5','5'),(38,13,1,'1','5'),(39,13,2,'5','25000'),(40,1,1,'1','500'),(41,1,1,'5','200'),(42,1,1,'5','5'),(43,16,1,'5','200'),(44,21,1,'5','50000'),(45,22,1,'1','500'),(46,23,1,'5','50000'),(47,25,1,'1','50000');
/*!40000 ALTER TABLE `ventas_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-17  0:12:29

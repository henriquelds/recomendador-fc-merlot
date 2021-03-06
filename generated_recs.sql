CREATE DATABASE  IF NOT EXISTS `rosario` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rosario`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: rosario
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `generated_recs`
--

DROP TABLE IF EXISTS `generated_recs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generated_recs` (
  `ID_Rec` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_User` int(11) NOT NULL,
  `ID_LO` int(11) NOT NULL,
  `predicted_value` int(10) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_Rec`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generated_recs`
--

LOCK TABLES `generated_recs` WRITE;
/*!40000 ALTER TABLE `generated_recs` DISABLE KEYS */;
INSERT INTO `generated_recs` VALUES (1,998144,74691,5,'general'),(2,998144,74600,5,'general'),(3,998144,74290,5,'specific'),(4,998144,74600,5,'specific'),(5,32944,76958,5,'general'),(6,32944,78233,4,'specific'),(7,1080580,272454,3,'general'),(8,1080580,76958,5,'specific'),(9,1080766,85752,4,'general'),(10,1081281,75631,5,'general'),(11,1081281,78446,4,'general'),(12,1081380,753743,4,'general'),(13,1081303,77772,5,'general'),(14,1081303,88796,3,'general'),(15,1081303,77850,5,'specific'),(16,1081303,77772,5,'specific'),(17,1039998,82909,5,'general'),(18,1039998,74640,5,'general'),(19,1039998,82909,5,'specific'),(20,1039998,78549,4,'specific'),(21,1078464,789888,5,'general'),(22,1078464,1062064,4,'general'),(23,1078464,78531,3,'specific'),(24,1077791,89324,5,'general'),(25,1077791,75783,4,'general'),(26,1077791,89324,3,'specific'),(27,1082477,90917,5,'general'),(28,1082477,90917,5,'specific'),(29,1082471,714857,4,'specific'),(30,1082471,714362,4,'specific'),(31,1080921,78198,4,'specific'),(32,1080921,78531,3,'specific'),(33,1077620,88983,5,'general'),(34,1077620,88970,5,'general'),(35,1077620,88983,5,'specific'),(36,1077620,88969,4,'specific'),(37,1082899,1062064,5,'general'),(38,1082899,75630,5,'general'),(39,1082899,75630,5,'specific'),(40,1082899,78549,4,'specific'),(41,1082813,80589,5,'general'),(42,1082813,75615,5,'general'),(43,1082813,80589,5,'specific'),(44,1082813,78160,4,'specific'),(45,1082928,789888,5,'general'),(46,1082928,75573,5,'general'),(47,1082928,78531,3,'specific'),(48,1083433,90081,4,'general'),(49,1055803,222757,5,'general'),(50,1086238,88898,4,'general'),(51,1086238,77771,4,'specific'),(52,1086238,87925,4,'specific'),(53,1080298,75573,5,'general'),(54,1080298,83289,5,'general'),(55,1080298,78531,3,'specific');
/*!40000 ALTER TABLE `generated_recs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-16 11:28:19

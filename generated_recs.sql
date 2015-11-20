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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generated_recs`
--

LOCK TABLES `generated_recs` WRITE;
/*!40000 ALTER TABLE `generated_recs` DISABLE KEYS */;
INSERT INTO `generated_recs` VALUES (1,8390,272425,5,'general'),(2,8390,272273,5,'general'),(3,8390,271507,4,'specific'),(4,38783,90081,5,'general'),(5,38783,80086,5,'general'),(6,38783,90081,5,'specific'),(7,10004,85752,4,'general'),(8,10004,80202,4,'general'),(9,10004,334114,4,'specific');
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

-- Dump completed on 2015-11-20 21:01:39

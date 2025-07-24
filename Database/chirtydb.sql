-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (x86_64)
--
-- Host: localhost    Database: charitydb
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaigns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'23456','345t','2025-05-04 20:40:42'),(2,'qwertyui','qwertyuiop','2025-05-04 21:04:50');
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donations`
--

DROP TABLE IF EXISTS `donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `honor_name` varchar(255) DEFAULT NULL,
  `campaign_title` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donations`
--

LOCK TABLES `donations` WRITE;
/*!40000 ALTER TABLE `donations` DISABLE KEYS */;
INSERT INTO `donations` VALUES (1,'ghala','golooz43@gm','0556864870',100.00,NULL,'Clean Water Initiative','2025-05-03 11:20:03'),(2,'ghala','kkk@gmail','066864870',999.00,NULL,'Clean Water Initiative','2025-05-04 11:37:51'),(3,'ghala','k','066',100.00,NULL,'Education Kit Giveaway','2025-05-04 11:39:30'),(4,'ghala','k','066',10.00,NULL,'Clean Water Initiative','2025-05-04 14:03:00'),(5,'Sarah','sarah@email.com','0500000000',50.00,NULL,NULL,'2025-05-04 14:45:19'),(6,'Ali','ali@email.com','0500000001',75.00,NULL,NULL,'2025-05-04 14:45:19'),(7,'Fatima','fatima@email.com','0500000002',30.00,NULL,NULL,'2025-05-04 14:45:19'),(8,'Sarah','sarah@email.com','0500000000',50.00,NULL,NULL,'2025-05-04 14:46:09'),(9,'Ali','ali@email.com','0500000001',75.00,NULL,NULL,'2025-05-04 14:46:09'),(10,'Fatima','fatima@email.com','0500000002',30.00,NULL,NULL,'2025-05-04 14:46:09'),(11,'joud','jjjh@email.com','050000000',50.00,NULL,NULL,'2025-05-04 14:46:09'),(12,'Abduallah','aabdullah@email.com','0500000001',75.00,NULL,NULL,'2025-05-04 14:46:09'),(13,'sulaiman','sulaiman@email.com','0500000004',30.00,NULL,NULL,'2025-05-04 14:46:09'),(14,'sulaiman','sulaiman@gmail.com','0556864870',100.00,NULL,'Emergency Flood Aid','2025-05-04 15:02:11'),(15,'sara fahad','almohsen@gmail.com','0556864870',50.00,NULL,'Clean Water Initiative','2025-05-04 15:11:28'),(16,'ghala','dd','dd',50.00,NULL,'Clean Water Initiative','2025-05-04 16:55:01'),(17,'shahad','shahad@gmail.com','098765432',5000.00,NULL,'Clean Water Initiative','2025-05-04 21:05:41');
/*!40000 ALTER TABLE `donations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteers`
--

DROP TABLE IF EXISTS `volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `interest` text,
  `registered_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteers`
--

LOCK TABLES `volunteers` WRITE;
/*!40000 ALTER TABLE `volunteers` DISABLE KEYS */;
INSERT INTO `volunteers` VALUES (1,'ghala','ghala@gmail.com','0556864870','Campaign 1','2025-05-06 18:05:11'),(2,'sara','sara@gmail.com','09876543345','Campaign 2','2025-05-06 18:10:27'),(3,'yara','yara@gmail.com','123456789','Campaign 3','2025-05-06 18:10:43'),(4,'shahad','shahad@gmail.com','1234567897654','Campaign 4','2025-05-06 18:11:05'),(5,'khaled','khaled@gmail.com','234567890','Campaign 5','2025-05-06 18:11:32');
/*!40000 ALTER TABLE `volunteers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-06 21:24:27

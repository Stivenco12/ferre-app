-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: ferrecampus
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `areaName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `area_unique` (`areaName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arl`
--

DROP TABLE IF EXISTS `arl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arl`
--

LOCK TABLES `arl` WRITE;
/*!40000 ALTER TABLE `arl` DISABLE KEYS */;
LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `n_document` varchar(20) DEFAULT NULL,
  `dateBirthday` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_document_FK` (`n_document`),
  CONSTRAINT `customer_document_FK` FOREIGN KEY (`n_document`) REFERENCES `person` (`n_document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `niu` varchar(20) NOT NULL,
  `registeredName` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `logoBrand` varchar(20) DEFAULT NULL,
  `manager` varchar(100) DEFAULT NULL,
  `company_niu` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`niu`),
  UNIQUE KEY `company_unique` (`registeredName`),
  KEY `city_id` (`city_id`),
  KEY `company_niu` (`company_niu`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`company_niu`) REFERENCES `company` (`niu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
LOCK TABLES `company_address` WRITE;
/*!40000 ALTER TABLE `company_address` DISABLE KEYS */;
LOCK TABLES `company_email` WRITE;
/*!40000 ALTER TABLE `company_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_phone`
--

DROP TABLE IF EXISTS `company_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_phone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) DEFAULT NULL,
  `company_niu` varchar(20) DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_phone_unique` (`phone`),
  KEY `company_phone_company_FK` (`company_niu`),
  KEY `company_phone_location_FK` (`location_id`),
  CONSTRAINT `company_phone_company_FK` FOREIGN KEY (`company_niu`) REFERENCES `company` (`niu`),
  CONSTRAINT `company_phone_location_FK` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_phone`
--

/*!40000 ALTER TABLE `company_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `codeContry` varchar(6) NOT NULL,
  `prefijoTel` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  UNIQUE KEY `country_unique` (`codeContry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
LOCK TABLES `documenttype` WRITE;
/*!40000 ALTER TABLE `documenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `documenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `n_document` varchar(20) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `eps_id` int DEFAULT NULL,
  `arl_id` int DEFAULT NULL,
  `fps_id` int DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  `company_niu` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_area_FK` (`area_id`),
  KEY `employee_company_FK` (`company_niu`),
  KEY `employee_eps_FK` (`eps_id`),
  KEY `employee_arl_FK` (`arl_id`),
  KEY `employee_fps_FK` (`fps_id`),
  KEY `employee_document_FK` (`n_document`),
  CONSTRAINT `employee_area_FK` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`),
  CONSTRAINT `employee_arl_FK` FOREIGN KEY (`arl_id`) REFERENCES `arl` (`id`),
  CONSTRAINT `employee_company_FK` FOREIGN KEY (`company_niu`) REFERENCES `company` (`niu`),
  CONSTRAINT `employee_document_FK` FOREIGN KEY (`n_document`) REFERENCES `person` (`n_document`),
  CONSTRAINT `employee_eps_FK` FOREIGN KEY (`eps_id`) REFERENCES `eps` (`id`),
  CONSTRAINT `employee_fps_FK` FOREIGN KEY (`fps_id`) REFERENCES `fps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eps`
--

DROP TABLE IF EXISTS `eps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eps`
--

LOCK TABLES `eps` WRITE;
/*!40000 ALTER TABLE `eps` DISABLE KEYS */;
INSERT INTO `eps` VALUES (7,'Aliansalud EPS'),(10,'Cafesalud EPS'),(18,'Colmédica EPS'),(15,'Comparta EPS'),(8,'Compensar EPS'),(4,'Coomeva EPS'),(17,'Cruz Blanca EPS'),(14,'Ecoopsos EPS'),(9,'Famisanar EPS'),(13,'Medimás EPS'),(24,'My Eps Colombia'),(1,'Nueva Eps'),(3,'Salud Total EPS'),(16,'Saludcoop EPS'),(11,'Saludvida EPS'),(20,'Saludvida Petroski'),(2,'Sanitas EPS'),(12,'Savia Salud EPS'),(5,'Sura EPS');
/*!40000 ALTER TABLE `eps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fps`
--

DROP TABLE IF EXISTS `fps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fps_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fps`
--

/*!40000 ALTER TABLE `fps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location_unique` (`location_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
LOCK TABLES `person_address` WRITE;
/*!40000 ALTER TABLE `person_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_email`
--

DROP TABLE IF EXISTS `person_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_email` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `person_n_document` varchar(20) DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_email_unique` (`email`),
  KEY `person_email_person_FK` (`person_n_document`),
  KEY `person_email_location_FK` (`location_id`),
  CONSTRAINT `person_email_location_FK` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `person_email_person_FK` FOREIGN KEY (`person_n_document`) REFERENCES `person` (`n_document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_email`
--

/*!40000 ALTER TABLE `person_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_phone`
--

DROP TABLE IF EXISTS `person_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_phone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) DEFAULT NULL,
  `person_n_document` varchar(20) DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_phone_unique` (`phone`),
  KEY `person_phone_person_FK` (`person_n_document`),
  KEY `person_phone_location_FK` (`location_id`),
  CONSTRAINT `person_phone_location_FK` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `person_phone_person_FK` FOREIGN KEY (`person_n_document`) REFERENCES `person` (`n_document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_phone`
--

LOCK TABLES `person_phone` WRITE;
/*!40000 ALTER TABLE `person_phone` DISABLE KEYS */;
LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `n_document` varchar(20) DEFAULT NULL,
  `deadline` decimal(3,0) DEFAULT NULL,
  `overDuePercentage` decimal(3,0) DEFAULT NULL,
  `earlyPaymentPercentage` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_document_FK` (`n_document`),
  CONSTRAINT `supplier_document_FK` FOREIGN KEY (`n_document`) REFERENCES `person` (`n_document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ferrecampus'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-14 14:12:56

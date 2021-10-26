-- MySQL dump 10.13  Distrib 5.7.34, for Win64 (x86_64)
--
-- Host: localhost    Database: projet_final
-- ------------------------------------------------------
-- Server version	5.7.34-log

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
-- Table structure for table `accessible_by`
--

DROP TABLE IF EXISTS `accessible_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessible_by` (
  `means_of_transport_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`means_of_transport_id`,`city_id`),
  KEY `accessible_by_city0_FK` (`city_id`),
  CONSTRAINT `accessible_by_city0_FK` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  CONSTRAINT `accessible_by_means_of_transport_FK` FOREIGN KEY (`means_of_transport_id`) REFERENCES `means_of_transport` (`means_of_transport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessible_by`
--

LOCK TABLES `accessible_by` WRITE;
/*!40000 ALTER TABLE `accessible_by` DISABLE KEYS */;
INSERT INTO `accessible_by` VALUES (1,1),(2,1),(4,1),(5,1),(1,2),(2,2),(4,2),(5,2),(1,3),(2,3),(4,3),(5,3),(1,4),(4,4),(5,4),(2,5),(3,5),(1,6),(4,6),(5,6),(2,7),(3,7),(2,8),(3,8),(2,9);
/*!40000 ALTER TABLE `accessible_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `way_number` decimal(10,0) NOT NULL,
  `street_name` varchar(60) NOT NULL,
  `residence_name` varchar(60) DEFAULT NULL,
  `building_name` varchar(60) DEFAULT NULL,
  `floor` decimal(10,0) NOT NULL,
  `postal_code` decimal(5,0) NOT NULL,
  `additional_information` varchar(120) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `Address_city_FK` (`city_id`),
  CONSTRAINT `Address_city_FK` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (10,10,'rue du moulin','horizon','henriIV',1,33000,'',1),(20,11,'rue du chateau','champagne','napoléon',2,75000,'',2),(30,12,'rue du bateau','osiris','louisXIV',2,31000,'',3),(40,13,'rue du pain','kingscanyon','clovis',1,33350,'',4),(50,14,'rue du vin','numbani','worldsedge',3,33570,'',5),(60,15,'rue du palais','jessica','samuel',5,33500,'',6);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characterized_by`
--

DROP TABLE IF EXISTS `characterized_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characterized_by` (
  `stage_id` int(11) NOT NULL,
  `means_of_transport_id` int(11) NOT NULL,
  PRIMARY KEY (`stage_id`,`means_of_transport_id`),
  KEY `characterized_by_means_of_transport0_FK` (`means_of_transport_id`),
  CONSTRAINT `characterized_by_Stage_FK` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`stage_id`),
  CONSTRAINT `characterized_by_means_of_transport0_FK` FOREIGN KEY (`means_of_transport_id`) REFERENCES `means_of_transport` (`means_of_transport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characterized_by`
--

LOCK TABLES `characterized_by` WRITE;
/*!40000 ALTER TABLE `characterized_by` DISABLE KEYS */;
INSERT INTO `characterized_by` VALUES (6,1),(2,2),(3,2),(4,3),(1,4),(5,5),(7,5);
/*!40000 ALTER TABLE `characterized_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(60) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Bordeaux'),(2,'Paris'),(3,'Toulouse'),(4,'Castillon'),(5,'Petit-palais'),(6,'Libourne'),(7,'Gotham City'),(8,'Olympus'),(9,'Cocorico');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composed_of`
--

DROP TABLE IF EXISTS `composed_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composed_of` (
  `stage_id` int(11) NOT NULL,
  `travel_id` int(11) NOT NULL,
  PRIMARY KEY (`stage_id`,`travel_id`),
  KEY `composed_of_Travel0_FK` (`travel_id`),
  CONSTRAINT `composed_of_Stage_FK` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`stage_id`),
  CONSTRAINT `composed_of_Travel0_FK` FOREIGN KEY (`travel_id`) REFERENCES `travel` (`travel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composed_of`
--

LOCK TABLES `composed_of` WRITE;
/*!40000 ALTER TABLE `composed_of` DISABLE KEYS */;
INSERT INTO `composed_of` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,4),(7,5);
/*!40000 ALTER TABLE `composed_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_last_name` varchar(60) NOT NULL,
  `customer_first_name` varchar(60) NOT NULL,
  `customer_principal_phone_number` varchar(14) NOT NULL,
  `customer_email_address` varchar(60) NOT NULL,
  `customer_gender` varchar(1) NOT NULL,
  `customer_birthdate` date NOT NULL,
  `address_id_factured_to` int(11) NOT NULL,
  `address_id_delivered_to` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `Customer_Address0_FK` (`address_id_delivered_to`),
  KEY `Customer_Staff1_FK` (`staff_id`),
  KEY `Customer_Address_FK` (`address_id_factured_to`),
  CONSTRAINT `Customer_Address0_FK` FOREIGN KEY (`address_id_delivered_to`) REFERENCES `address` (`address_id`),
  CONSTRAINT `Customer_Address_FK` FOREIGN KEY (`address_id_factured_to`) REFERENCES `address` (`address_id`),
  CONSTRAINT `Customer_Staff1_FK` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'LATORSE','Pierre','06.26.04.25.77','pierrelat33@gmail.com','F','2005-07-22',10,10,1),(2,'MARTIN','Pierre','06.26.05.26.75','pierremart33@gmail.com','F','2001-11-16',20,20,2),(3,'LAVENSEAU','Antoine','06.23.12.50.70','antoinelav@gmail.com','M','1960-06-02',30,30,1),(4,'JARJANETTE','Samuel','06.30.50.45.67','samueljar@gmail.com','M','1958-07-02',40,40,2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distance`
--

DROP TABLE IF EXISTS `distance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distance` (
  `city_id_start` int(11) NOT NULL,
  `city_id_arrive` int(11) NOT NULL,
  `mileage` decimal(10,0) NOT NULL,
  PRIMARY KEY (`city_id_start`,`city_id_arrive`),
  KEY `city_arrive_FK_idx` (`city_id_arrive`),
  CONSTRAINT `city_arrive_FK` FOREIGN KEY (`city_id_arrive`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `city_start_FK` FOREIGN KEY (`city_id_start`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distance`
--

LOCK TABLES `distance` WRITE;
/*!40000 ALTER TABLE `distance` DISABLE KEYS */;
INSERT INTO `distance` VALUES (1,2,370),(2,3,420),(3,7,530),(3,8,950),(7,5,7160),(8,4,680),(9,2,950);
/*!40000 ALTER TABLE `distance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `means_of_transport`
--

DROP TABLE IF EXISTS `means_of_transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `means_of_transport` (
  `means_of_transport_id` int(11) NOT NULL AUTO_INCREMENT,
  `means_of_transport_type` varchar(60) NOT NULL,
  PRIMARY KEY (`means_of_transport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `means_of_transport`
--

LOCK TABLES `means_of_transport` WRITE;
/*!40000 ALTER TABLE `means_of_transport` DISABLE KEYS */;
INSERT INTO `means_of_transport` VALUES (1,'Car'),(2,'Plane'),(3,'Boat'),(4,'Train'),(5,'Coach');
/*!40000 ALTER TABLE `means_of_transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL AUTO_INCREMENT,
  `payment_date` date NOT NULL,
  `payment_date_amount` decimal(10,0) NOT NULL,
  `means_of_payment` varchar(60) NOT NULL,
  `payment_type` varchar(7) NOT NULL,
  `id_tariff` int(11) NOT NULL,
  `travel_id` int(11) NOT NULL,
  PRIMARY KEY (`id_payment`),
  KEY `payment_tariff_FK` (`id_tariff`),
  KEY `id_travel_FK_idx` (`travel_id`),
  CONSTRAINT `id_travel_FK` FOREIGN KEY (`travel_id`) REFERENCES `travel` (`travel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `payment_tariff_FK` FOREIGN KEY (`id_tariff`) REFERENCES `tariff` (`id_tariff`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'2020-01-08',1000,'Cash','mileage',1,1),(2,'2020-02-08',1050,'Credit Card','mileage',2,1),(3,'2021-02-09',1050,'Credit Card','mileage',4,2),(4,'2021-03-09',1500,'Check','mileage',6,2),(5,'2021-03-10',1230,'Paypal','mileage',5,3),(6,'2021-04-11',300,'Cash','Bundle',3,4),(7,'2021-05-12',1350,'Check','mileage',7,5);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_last_name` varchar(60) NOT NULL,
  `staff_first_name` varchar(60) NOT NULL,
  `staff_phone_number` varchar(14) NOT NULL,
  `staff_company_email_address` varchar(60) NOT NULL,
  `staff_hire_date` date NOT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `Staff_Address_FK` (`address_id`),
  CONSTRAINT `Staff_Address_FK` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'GARDERE','Celia','06.79.55.62.31','Celia.Gardere@gmail.com','2021-04-01',50),(2,'LENTZ','Jeanne','06.53.64.89.72','Jeanne.Lentz@gmail.com','2021-04-02',60);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage`
--

DROP TABLE IF EXISTS `stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stage` (
  `stage_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id_start` int(11) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_hour` time NOT NULL,
  `city_id_arrive` int(11) NOT NULL,
  `arrival_date` date NOT NULL,
  `arrival_hour` time NOT NULL,
  `id_tariff` int(11) NOT NULL,
  PRIMARY KEY (`stage_id`),
  KEY `Stage_city0_FK` (`city_id_start`),
  KEY `Stage_city1_FK` (`city_id_arrive`),
  KEY `id_tariff_FK` (`id_tariff`),
  CONSTRAINT `Stage_city0_FK` FOREIGN KEY (`city_id_start`) REFERENCES `city` (`city_id`),
  CONSTRAINT `Stage_city1_FK` FOREIGN KEY (`city_id_arrive`) REFERENCES `city` (`city_id`),
  CONSTRAINT `id_tariff_FK` FOREIGN KEY (`id_tariff`) REFERENCES `tariff` (`id_tariff`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage`
--

LOCK TABLES `stage` WRITE;
/*!40000 ALTER TABLE `stage` DISABLE KEYS */;
INSERT INTO `stage` VALUES (1,1,'2020-01-08','07:51:00',2,'2020-01-08','10:15:00',1),(2,2,'2020-01-09','08:30:00',3,'2020-01-09','10:30:00',2),(3,3,'2021-02-09','14:10:00',7,'2021-02-09','23:15:00',4),(4,7,'2021-02-11','06:51:00',5,'2021-03-11','14:15:00',6),(5,9,'2021-03-10','15:51:00',2,'2021-03-12','20:15:00',5),(6,8,'2021-04-11','07:30:00',4,'2021-04-12','10:15:00',3),(7,3,'2021-05-12','11:51:00',8,'2021-05-14','15:15:00',7);
/*!40000 ALTER TABLE `stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tariff`
--

DROP TABLE IF EXISTS `tariff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tariff` (
  `id_tariff` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_tariff`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariff`
--

LOCK TABLES `tariff` WRITE;
/*!40000 ALTER TABLE `tariff` DISABLE KEYS */;
INSERT INTO `tariff` VALUES (1,1000),(2,1050),(3,300),(4,1050),(5,1230),(6,1500),(7,1350);
/*!40000 ALTER TABLE `tariff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel` (
  `travel_id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_reservation_date` date NOT NULL,
  `travel_departure_date` date NOT NULL,
  `travel_type` varchar(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`travel_id`),
  KEY `Travel_Customer_FK` (`customer_id`),
  CONSTRAINT `Travel_Customer_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` VALUES (1,'2020-01-01','2020-01-08','inter-ville',1),(2,'2021-01-02','2021-02-09','inter-ville',2),(3,'2021-03-03','2021-03-10','inter-ville',3),(4,'2021-04-04','2021-04-11','intra-ville',4),(5,'2021-05-05','2021-05-12','inter-ville',1);
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23 21:02:21

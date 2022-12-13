-- MySQL dump 10.13  Distrib 5.7.39, for Win64 (x86_64)
--
-- Host: localhost    Database: dna
-- ------------------------------------------------------
-- Server version	5.7.39-log

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `Bill_No` varchar(20) NOT NULL,
  `Customer_ID` varchar(20) NOT NULL,
  `Cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`Bill_No`,`Customer_ID`),
  KEY `FK_DELETE` (`Customer_ID`),
  CONSTRAINT `FK_DELETE` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE CASCADE,
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES ('BI_001','CU_001',2500),('BI_002','CU_004',750);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_cost`
--

DROP TABLE IF EXISTS `bill_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_cost` (
  `Bill_No` varchar(20) NOT NULL,
  `Discount` int(11) DEFAULT NULL,
  `Cost` int(11) DEFAULT NULL,
  `Total` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Bill_No`),
  CONSTRAINT `bill_cost_ibfk_1` FOREIGN KEY (`Bill_No`) REFERENCES `bill` (`Bill_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_cost`
--

LOCK TABLES `bill_cost` WRITE;
/*!40000 ALTER TABLE `bill_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chef` (
  `Chef_ID` varchar(10) NOT NULL,
  `Manager_ID` varchar(10) NOT NULL,
  `First_Name` varchar(10) DEFAULT NULL,
  `Last_Name` varchar(10) DEFAULT NULL,
  `Head_Chef_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Chef_ID`,`Manager_ID`),
  KEY `Manager_ID` (`Manager_ID`),
  CONSTRAINT `chef_ibfk_1` FOREIGN KEY (`Manager_ID`) REFERENCES `manager` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef`
--

LOCK TABLES `chef` WRITE;
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` VALUES ('CH_001','MA_001','Stephanie','Hall',NULL),('CH_002','MA_002','Heather','Riddle','CH_001'),('CH_003','MA_002','Adrian','Montes','CH_002'),('CH_004','MA_005','Donna','Murray','CH_002'),('CH_005','MA_004','Tony','Juarez','CH_002'),('CH_006','MA_002','Kumal','Pandey','CH_002'),('CH_007','MA_002','FA','KA','CH_001');
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chef_speciality`
--

DROP TABLE IF EXISTS `chef_speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chef_speciality` (
  `Chef_ID` varchar(10) NOT NULL,
  `Speciality` varchar(200) NOT NULL,
  PRIMARY KEY (`Chef_ID`,`Speciality`),
  CONSTRAINT `chef_speciality_ibfk_1` FOREIGN KEY (`Chef_ID`) REFERENCES `chef` (`Chef_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef_speciality`
--

LOCK TABLES `chef_speciality` WRITE;
/*!40000 ALTER TABLE `chef_speciality` DISABLE KEYS */;
INSERT INTO `chef_speciality` VALUES ('CH_001','Hakka Noodles'),('CH_002','Biryani'),('CH_005','Butter Chicken');
/*!40000 ALTER TABLE `chef_speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleaning_staff`
--

DROP TABLE IF EXISTS `cleaning_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cleaning_staff` (
  `Staff_ID` varchar(10) NOT NULL,
  `Manager_ID` varchar(10) NOT NULL,
  `First_Name` varchar(10) DEFAULT NULL,
  `Last_Name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`,`Manager_ID`),
  KEY `Manager_ID` (`Manager_ID`),
  CONSTRAINT `cleaning_staff_ibfk_1` FOREIGN KEY (`Manager_ID`) REFERENCES `manager` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaning_staff`
--

LOCK TABLES `cleaning_staff` WRITE;
/*!40000 ALTER TABLE `cleaning_staff` DISABLE KEYS */;
INSERT INTO `cleaning_staff` VALUES ('CL_001','MA_003','Christ','Lopez'),('CL_002','MA_003','Dean','Wallace'),('CL_003','MA_002','Annette','Morales');
/*!40000 ALTER TABLE `cleaning_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Customer_ID` varchar(10) NOT NULL,
  `Name` varchar(10) DEFAULT NULL,
  `Tab_num` varchar(10) DEFAULT NULL,
  `Order_num` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('CU_001','Douglas','3','OR_005'),('CU_003','Kristina','1','OR_011'),('CU_004','Shawn','2','OR_001');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_contact`
--

DROP TABLE IF EXISTS `customer_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_contact` (
  `Customer_ID` varchar(10) NOT NULL,
  `Contact_Number` int(11) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`),
  CONSTRAINT `FK_DELETE2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE CASCADE,
  CONSTRAINT `customer_contact_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_contact`
--

LOCK TABLES `customer_contact` WRITE;
/*!40000 ALTER TABLE `customer_contact` DISABLE KEYS */;
INSERT INTO `customer_contact` VALUES ('CU_001',61279550),('CU_003',87087781),('CU_004',87067181);
/*!40000 ALTER TABLE `customer_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivered_by`
--

DROP TABLE IF EXISTS `delivered_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivered_by` (
  `Food_ID` varchar(20) NOT NULL,
  `DPerson_ID` varchar(20) NOT NULL,
  `Order_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`Food_ID`,`DPerson_ID`,`Order_ID`),
  KEY `DPerson_ID` (`DPerson_ID`),
  CONSTRAINT `delivered_by_ibfk_1` FOREIGN KEY (`Food_ID`) REFERENCES `food` (`Food_Name`),
  CONSTRAINT `delivered_by_ibfk_2` FOREIGN KEY (`DPerson_ID`) REFERENCES `delivery_person` (`DPerson_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivered_by`
--

LOCK TABLES `delivered_by` WRITE;
/*!40000 ALTER TABLE `delivered_by` DISABLE KEYS */;
INSERT INTO `delivered_by` VALUES ('Biryani','DP_001','OI_001'),('Butter Chicken','DP_002','OI_002');
/*!40000 ALTER TABLE `delivered_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_person`
--

DROP TABLE IF EXISTS `delivery_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_person` (
  `DPerson_ID` varchar(10) NOT NULL,
  `First_Name` varchar(10) DEFAULT NULL,
  `Last_Name` varchar(10) DEFAULT NULL,
  `Vehicle_No` varchar(20) DEFAULT NULL,
  `Order_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`DPerson_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `delivery_person_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `bill` (`Bill_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_person`
--

LOCK TABLES `delivery_person` WRITE;
/*!40000 ALTER TABLE `delivery_person` DISABLE KEYS */;
INSERT INTO `delivery_person` VALUES ('DP_001','Aaron','Gray','MH14KB2034','BI_001'),('DP_002','Ronald','Gonzalez','PJ03VD1134','BI_002');
/*!40000 ALTER TABLE `delivery_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food` (
  `Food_Name` varchar(20) NOT NULL,
  `Price` int(11) DEFAULT NULL,
  `Cuisine` varchar(20) NOT NULL,
  `Staff_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Food_Name`,`Cuisine`,`Staff_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `waiter` (`Waiter_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES ('Biryani',203,'Indian','WA_003'),('Butter Chicken',260,'Indian','WA_006'),('Chicken Lollipop',440,'Indian','WA_005'),('Fried Rice',200,'Chinese','WA_005'),('Hakka Noodles',325,'Chinese','WA_001'),('Lasagna',325,'Italian','WA_002'),('Paneer Chilly',195,'Chinese','WA_006'),('Paneer Tikka Masala',385,'Indian','WA_001'),('Spaghetti',125,'Italian','WA_001'),('Thali',525,'Indian','WA_005');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `Name` varchar(20) NOT NULL,
  `Type_food` varchar(20) DEFAULT NULL,
  `Expiry_date` date DEFAULT NULL,
  `Storing_Temperature` decimal(3,2) DEFAULT NULL,
  `Food_Name` varchar(20) NOT NULL,
  `Chef_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Name`,`Food_Name`,`Chef_ID`),
  KEY `Food_Name` (`Food_Name`),
  KEY `Chef_ID` (`Chef_ID`),
  CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`Food_Name`) REFERENCES `food` (`Food_Name`),
  CONSTRAINT `ingredients_ibfk_2` FOREIGN KEY (`Chef_ID`) REFERENCES `chef` (`Chef_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES ('Cheese','Veg','2023-01-01',2.00,'Lasagna','CH_001'),('Masala','Veg','2023-02-03',9.00,'Biryani','CH_002');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `Employee_ID` varchar(10) NOT NULL,
  `First_Name` varchar(10) DEFAULT NULL,
  `Last_Name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('MA_001','Patricia','Johnson'),('MA_002','Kaitlin','Ortiz'),('MA_003','Danielle','Williamson'),('MA_004','Brandi','Williams'),('MA_005','Nathan','Howard');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `Food_Name` varchar(10) NOT NULL,
  `DPerson_ID` varchar(10) NOT NULL,
  `Order_ID` varchar(10) NOT NULL,
  `Order_Time` time DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Order_Type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Food_Name`,`DPerson_ID`,`Order_ID`),
  KEY `DPerson_ID` (`DPerson_ID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Food_Name`) REFERENCES `food` (`Food_Name`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`DPerson_ID`) REFERENCES `delivery_person` (`DPerson_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('Biryani','DP_001','0I_001','00:00:20',399,'TakeWay'),('Lasagna','DP_002','0I_002','00:00:14',259,'DineIn');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `Owner_ID` varchar(10) NOT NULL,
  `First_Name` varchar(20) DEFAULT NULL,
  `Last_name` varchar(20) DEFAULT NULL,
  `Shares` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Owner_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES ('OW_001','Mary','Gomez',10.00),('OW_002','Erin','Shields',25.00),('OW_003','Beverly','Williams',60.00),('OW_004','Rachel','Garcia',5.00);
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner_phone`
--

DROP TABLE IF EXISTS `owner_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner_phone` (
  `Owner_ID` varchar(10) NOT NULL,
  `Phone_Number` int(11) NOT NULL,
  PRIMARY KEY (`Owner_ID`,`Phone_Number`),
  CONSTRAINT `owner_phone_ibfk_1` FOREIGN KEY (`Owner_ID`) REFERENCES `owner` (`Owner_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner_phone`
--

LOCK TABLES `owner_phone` WRITE;
/*!40000 ALTER TABLE `owner_phone` DISABLE KEYS */;
INSERT INTO `owner_phone` VALUES ('OW_001',61115278),('OW_002',61883294),('OW_003',31397886),('OW_004',84088654);
/*!40000 ALTER TABLE `owner_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays_salary_chef`
--

DROP TABLE IF EXISTS `pays_salary_chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pays_salary_chef` (
  `Owner_ID` varchar(10) NOT NULL,
  `Salary_ID` varchar(10) NOT NULL,
  `Chef_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Owner_ID`,`Salary_ID`,`Chef_ID`),
  KEY `Salary_ID` (`Salary_ID`),
  KEY `Chef_ID` (`Chef_ID`),
  CONSTRAINT `pays_salary_chef_ibfk_1` FOREIGN KEY (`Owner_ID`) REFERENCES `owner` (`Owner_ID`),
  CONSTRAINT `pays_salary_chef_ibfk_2` FOREIGN KEY (`Salary_ID`) REFERENCES `salary` (`ID`),
  CONSTRAINT `pays_salary_chef_ibfk_3` FOREIGN KEY (`Chef_ID`) REFERENCES `chef` (`Chef_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays_salary_chef`
--

LOCK TABLES `pays_salary_chef` WRITE;
/*!40000 ALTER TABLE `pays_salary_chef` DISABLE KEYS */;
INSERT INTO `pays_salary_chef` VALUES ('OW_001','ID_001','CH_001'),('OW_002','ID_002','CH_002');
/*!40000 ALTER TABLE `pays_salary_chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays_salary_manager`
--

DROP TABLE IF EXISTS `pays_salary_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pays_salary_manager` (
  `Owner_ID` varchar(10) NOT NULL,
  `Salary_ID` varchar(10) NOT NULL,
  `Manager_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Owner_ID`,`Salary_ID`,`Manager_ID`),
  KEY `Salary_ID` (`Salary_ID`),
  KEY `Manager_ID` (`Manager_ID`),
  CONSTRAINT `pays_salary_manager_ibfk_1` FOREIGN KEY (`Owner_ID`) REFERENCES `owner` (`Owner_ID`),
  CONSTRAINT `pays_salary_manager_ibfk_2` FOREIGN KEY (`Salary_ID`) REFERENCES `salary` (`ID`),
  CONSTRAINT `pays_salary_manager_ibfk_3` FOREIGN KEY (`Manager_ID`) REFERENCES `manager` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays_salary_manager`
--

LOCK TABLES `pays_salary_manager` WRITE;
/*!40000 ALTER TABLE `pays_salary_manager` DISABLE KEYS */;
INSERT INTO `pays_salary_manager` VALUES ('OW_001','ID_001','MA_001'),('OW_002','ID_002','MA_002');
/*!40000 ALTER TABLE `pays_salary_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays_salary_staff`
--

DROP TABLE IF EXISTS `pays_salary_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pays_salary_staff` (
  `Owner_ID` varchar(10) NOT NULL,
  `Salary_ID` varchar(10) NOT NULL,
  `Staff_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Owner_ID`,`Salary_ID`,`Staff_ID`),
  KEY `Salary_ID` (`Salary_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  CONSTRAINT `pays_salary_staff_ibfk_1` FOREIGN KEY (`Owner_ID`) REFERENCES `owner` (`Owner_ID`),
  CONSTRAINT `pays_salary_staff_ibfk_2` FOREIGN KEY (`Salary_ID`) REFERENCES `salary` (`ID`),
  CONSTRAINT `pays_salary_staff_ibfk_3` FOREIGN KEY (`Staff_ID`) REFERENCES `cleaning_staff` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays_salary_staff`
--

LOCK TABLES `pays_salary_staff` WRITE;
/*!40000 ALTER TABLE `pays_salary_staff` DISABLE KEYS */;
INSERT INTO `pays_salary_staff` VALUES ('OW_001','ID_001','CL_001'),('OW_002','ID_002','CL_002');
/*!40000 ALTER TABLE `pays_salary_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays_salary_waiter`
--

DROP TABLE IF EXISTS `pays_salary_waiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pays_salary_waiter` (
  `Owner_ID` varchar(10) NOT NULL,
  `Salary_ID` varchar(10) NOT NULL,
  `Waiter_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Owner_ID`,`Salary_ID`,`Waiter_ID`),
  KEY `Salary_ID` (`Salary_ID`),
  KEY `Waiter_ID` (`Waiter_ID`),
  CONSTRAINT `pays_salary_waiter_ibfk_1` FOREIGN KEY (`Owner_ID`) REFERENCES `owner` (`Owner_ID`),
  CONSTRAINT `pays_salary_waiter_ibfk_2` FOREIGN KEY (`Salary_ID`) REFERENCES `salary` (`ID`),
  CONSTRAINT `pays_salary_waiter_ibfk_3` FOREIGN KEY (`Waiter_ID`) REFERENCES `waiter` (`Waiter_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays_salary_waiter`
--

LOCK TABLES `pays_salary_waiter` WRITE;
/*!40000 ALTER TABLE `pays_salary_waiter` DISABLE KEYS */;
INSERT INTO `pays_salary_waiter` VALUES ('OW_001','ID_001','WA_001'),('OW_002','ID_002','WA_002');
/*!40000 ALTER TABLE `pays_salary_waiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prepares`
--

DROP TABLE IF EXISTS `prepares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prepares` (
  `Chef_ID` varchar(10) NOT NULL,
  `Food_Name` varchar(10) NOT NULL,
  `Ingredients_Name` varchar(10) NOT NULL,
  PRIMARY KEY (`Chef_ID`,`Food_Name`,`Ingredients_Name`),
  CONSTRAINT `prepares_ibfk_1` FOREIGN KEY (`Chef_ID`) REFERENCES `chef` (`Chef_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prepares`
--

LOCK TABLES `prepares` WRITE;
/*!40000 ALTER TABLE `prepares` DISABLE KEYS */;
INSERT INTO `prepares` VALUES ('CH_001','Biryani','Masala'),('CH_002','Lasagna','Cheese');
/*!40000 ALTER TABLE `prepares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `ID` varchar(10) NOT NULL,
  `Base_Salary` decimal(5,2) DEFAULT NULL,
  `Bonus` decimal(5,2) DEFAULT NULL,
  `Deductions` decimal(5,2) DEFAULT NULL,
  `Total_Salary` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES ('ID_001',900.50,100.00,50.00,950.50),('ID_002',800.50,150.00,30.00,920.50);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serves`
--

DROP TABLE IF EXISTS `serves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serves` (
  `Customer_ID` varchar(10) NOT NULL,
  `Waiter_ID` varchar(10) NOT NULL,
  `Food_Name` varchar(10) NOT NULL,
  `Utensil_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Customer_ID`,`Waiter_ID`,`Food_Name`,`Utensil_ID`),
  KEY `Waiter_ID` (`Waiter_ID`),
  KEY `Food_Name` (`Food_Name`),
  KEY `Utensil_ID` (`Utensil_ID`),
  CONSTRAINT `FK_DELETE3` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE CASCADE,
  CONSTRAINT `serves_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `serves_ibfk_2` FOREIGN KEY (`Waiter_ID`) REFERENCES `waiter` (`Waiter_ID`),
  CONSTRAINT `serves_ibfk_3` FOREIGN KEY (`Food_Name`) REFERENCES `food` (`Food_Name`),
  CONSTRAINT `serves_ibfk_4` FOREIGN KEY (`Utensil_ID`) REFERENCES `utensils` (`Utensil_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serves`
--

LOCK TABLES `serves` WRITE;
/*!40000 ALTER TABLE `serves` DISABLE KEYS */;
INSERT INTO `serves` VALUES ('CU_001','WA_001','Biryani','UT_001');
/*!40000 ALTER TABLE `serves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utensils`
--

DROP TABLE IF EXISTS `utensils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utensils` (
  `Utensil_ID` varchar(10) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  PRIMARY KEY (`Utensil_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utensils`
--

LOCK TABLES `utensils` WRITE;
/*!40000 ALTER TABLE `utensils` DISABLE KEYS */;
INSERT INTO `utensils` VALUES ('UT_001','Blender',250),('UT_002','Cutting board',30),('UT_003','Deep fryer',845),('UT_004','Dish rack',100),('UT_005','Measuring cup',5),('UT_006','Microwave',1280),('UT_007','Toaster',235),('UT_008','Tongs',10),('UT_010','Fork',20);
/*!40000 ALTER TABLE `utensils` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiter`
--

DROP TABLE IF EXISTS `waiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waiter` (
  `Waiter_ID` varchar(10) NOT NULL,
  `Manager_ID` varchar(10) NOT NULL,
  `First_Name` varchar(10) DEFAULT NULL,
  `Last_Name` varchar(10) DEFAULT NULL,
  `Tip` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Waiter_ID`,`Manager_ID`),
  KEY `Manager_ID` (`Manager_ID`),
  CONSTRAINT `waiter_ibfk_1` FOREIGN KEY (`Manager_ID`) REFERENCES `manager` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiter`
--

LOCK TABLES `waiter` WRITE;
/*!40000 ALTER TABLE `waiter` DISABLE KEYS */;
INSERT INTO `waiter` VALUES ('WA_001','MA_003','Jay','Mullins',23.50),('WA_002','MA_002','Kristin','Hensley',3.50),('WA_003','MA_005','Corey','Owens',30.50),('WA_004','MA_002','Brian','Bradshaw',2.50),('WA_005','MA_001','Diana','Anderson',12.50),('WA_006','MA_001','Michelle','Meadows',7.00),('WA_007','MA_003','Nathan','Hall',17.50);
/*!40000 ALTER TABLE `waiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiter_table`
--

DROP TABLE IF EXISTS `waiter_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waiter_table` (
  `Waiter_ID` varchar(10) NOT NULL,
  `Table_no` varchar(10) NOT NULL,
  PRIMARY KEY (`Waiter_ID`,`Table_no`),
  CONSTRAINT `waiter_table_ibfk_1` FOREIGN KEY (`Waiter_ID`) REFERENCES `waiter` (`Waiter_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiter_table`
--

LOCK TABLES `waiter_table` WRITE;
/*!40000 ALTER TABLE `waiter_table` DISABLE KEYS */;
INSERT INTO `waiter_table` VALUES ('WA_001','2'),('WA_002','3'),('WA_003','7'),('WA_005','10'),('WA_006','1');
/*!40000 ALTER TABLE `waiter_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 16:27:57

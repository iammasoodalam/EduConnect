-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: educonnect
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `professorId` varchar(20) NOT NULL,
  PRIMARY KEY (`adminId`),
  KEY `admin_ibfk_1` (`professorId`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`professorId`) REFERENCES `professor` (`professorId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12346 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (12345,'10078076');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `assignmentId` varchar(20) NOT NULL,
  `coursecode` varchar(20) NOT NULL,
  `title` tinytext NOT NULL,
  `data` text DEFAULT NULL,
  `provideddate` date NOT NULL,
  `submissiondate` date DEFAULT NULL,
  `providedBy` varchar(20) NOT NULL,
  PRIMARY KEY (`assignmentId`),
  KEY `coursecode` (`coursecode`),
  KEY `providedBy` (`providedBy`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`coursecode`) REFERENCES `course` (`coursecode`),
  CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`providedBy`) REFERENCES `professor` (`professorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentattachment`
--

DROP TABLE IF EXISTS `assignmentattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignmentattachment` (
  `fileId` varchar(20) NOT NULL,
  `assingmentId` varchar(20) NOT NULL,
  `fileName` varchar(63) NOT NULL,
  PRIMARY KEY (`fileId`),
  KEY `FOREIGN KEY` (`assingmentId`),
  CONSTRAINT `FOREIGN KEY` FOREIGN KEY (`assingmentId`) REFERENCES `assignment` (`assignmentId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentattachment`
--

LOCK TABLES `assignmentattachment` WRITE;
/*!40000 ALTER TABLE `assignmentattachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignmentattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `branchId` int(11) NOT NULL,
  `branchName` varchar(63) NOT NULL,
  `supervisor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`branchId`),
  KEY `supervisor` (`supervisor`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`supervisor`) REFERENCES `professor` (`professorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Architectural Assistantship',NULL),(2,'Interior Design',NULL),(3,'Civil Engineering',NULL),(4,'Advanced Dip. In Food Technology',NULL),(5,'Computer Engineering',NULL),(6,'Electronics Engineering',NULL),(7,'Electrical Engineering',NULL),(8,'Instrumentation & Control',NULL),(9,'Leather & Footwear Technology',NULL),(10,'Mechanical Engineering',NULL);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `coursecode` varchar(20) NOT NULL,
  `coursename` varchar(63) NOT NULL,
  `course_type` varchar(15) NOT NULL,
  `branchid` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  PRIMARY KEY (`coursecode`),
  KEY `branchid` (`branchid`),
  KEY `semester` (`semester`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`branchid`) REFERENCES `branch` (`branchId`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`semester`) REFERENCES `semester` (`semesterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('BCE-607','Environmental Studies','theory',5,6),('BCH-101','Applied Chemistry-I','theory',5,1),('BCH-191','Chemistry Lab-I','lab',5,1),('BCH-201','Applied Chemistry-II','theory',5,2),('BCH-291','Chemistry Lab-II','lab',5,2),('BEN-201','English and Communication Skills','theory',5,2),('BLC-191','Programming Lab-I','lab',5,1),('BLC-201','Basic Computer Organisation','theory',5,2),('BLC-291','Programming Lab-II','lab',5,2),('BLC-301','Programming in C','theory',5,3),('BLC-302','Fundamentals of MicroProcessor','theory',5,3),('BLC-391','Basic MicroProcessor Lab','lab',5,3),('BLC-392','Software Lab-I','lab',5,3),('BLC-393','Programming Lab-III','lab',5,3),('BLC-401','Data Structure and Algorithms','theory',5,4),('BLC-491','Microprocessor and Control Lab','lab',5,4),('BLC-492','Software Lab-II','lab',5,4),('BLC-493','Programming Lab-IV','lab',5,4),('BLC-501','Computer Graphics','theory',5,5),('BLC-502','Compiler Design','theory',5,5),('BLC-503','Computer Communication Network','theory',5,5),('BLC-591','Computer Hardware and Networking Lab','lab',5,5),('BLC-592','Advanced Programming Lab-I','lab',5,5),('BLC-593','Programming Lab-V','lab',5,5),('BLC-594','Minor Project','lab',5,5),('BLC-601','Web Design and Internet Development','theory',5,6),('BLC-602','Software Engineering','theory',5,6),('BLC-603','DataBase Management System','theory',5,6),('BLC-604','Operating System','theory',5,6),('BLC-691','Computer Hardware and Networking Lab','lab',5,6),('BLC-692','Advanced Programming Lab-II','lab',5,6),('BLC-693','Programming Lab-VI','lab',5,6),('BLC-694','Major Project','lab',5,6),('BLE-101','Electronic Devices and Circuits','theory',5,1),('BLE-102','Circuit Theory','theory',5,1),('BLE-191','Basic Electronics Workshop','lab',5,1),('BLE-192','Basic Electronics Lab','lab',5,1),('BLE-291','Electronics Maintainance Practice','lab',5,2),('BLE-292','Electronics Engineering Lab','lab',5,2),('BLE-301','Digital Electronics-I','theory',5,3),('BLE-302','Electrical Engineering','theory',5,3),('BLE-303','Electrical Instrumentation-I','theory',5,3),('BLE-392','Electronics and Communication Lab-I','lab',5,3),('BLE-401','Analog Electronics Circuit','theory',5,4),('BLE-402','Digital System-II','theory',5,4),('BLE-403','Principle of Communication','theory',5,4),('BLE-493','Electronics and Communication Lab-II','lab',5,4),('BMA-101','Applied Math-I','theory',5,1),('BMA-201','Applied Maths-II','theory',5,2),('BMA-401','Applied Math-III','theory',5,4),('BMA-504','Computational Techniques','theory',5,5),('BME-506','Management and Entrepreneurship','theory',5,5),('BPH-101','Applied Physics-I','theory',5,1),('BPH-191','Physics Lab-I','lab',5,1),('BPH-201','Applied Plysics-II','theory',5,2),('BPH-291','Physics Lab-II','lab',5,2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectureattachment`
--

DROP TABLE IF EXISTS `lectureattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lectureattachment` (
  `fileId` varchar(20) NOT NULL,
  `lectureId` varchar(20) NOT NULL,
  `fileName` varchar(63) NOT NULL,
  PRIMARY KEY (`fileId`),
  KEY `lectureId` (`lectureId`),
  CONSTRAINT `lectureattachment_ibfk_1` FOREIGN KEY (`lectureId`) REFERENCES `lecturenotes` (`lectureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectureattachment`
--

LOCK TABLES `lectureattachment` WRITE;
/*!40000 ALTER TABLE `lectureattachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `lectureattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturenotes`
--

DROP TABLE IF EXISTS `lecturenotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecturenotes` (
  `lectureId` varchar(20) NOT NULL,
  `coursecode` varchar(20) NOT NULL,
  `title` tinytext NOT NULL,
  `data` text DEFAULT NULL,
  `provideddate` date NOT NULL,
  `providedBy` varchar(20) NOT NULL,
  PRIMARY KEY (`lectureId`),
  KEY `coursecode` (`coursecode`),
  KEY `providedBy` (`providedBy`),
  CONSTRAINT `lecturenotes_ibfk_1` FOREIGN KEY (`coursecode`) REFERENCES `course` (`coursecode`),
  CONSTRAINT `lecturenotes_ibfk_2` FOREIGN KEY (`providedBy`) REFERENCES `professor` (`professorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturenotes`
--

LOCK TABLES `lecturenotes` WRITE;
/*!40000 ALTER TABLE `lecturenotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecturenotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `professorId` varchar(20) NOT NULL,
  `name` char(31) NOT NULL,
  `qualification` varchar(31) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `joindate` date NOT NULL,
  `emailId` varchar(63) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profilepic` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`professorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('10058420','Tehzeeb Ahmed Abbasi','M.Sc. Engineering (Electronics ','725-A, Street No. 1, Greater Azad Enclave, Dhorra, Aligarh-202002, UP','2014-02-15','tehzeebabbasi@gmail.com','$2y$10$dAfPvFUUuI67DfcphTKcmu93I7JiNDXieYQUDCvp5AVcM.ZT0jyFG',NULL),('10059046','Sayyad Mohd Zakariya','M. Tech','Electrical Engineering Section, University Polytechnic (Boys), AMU, Aligarh-202002','2012-01-14','s.zakariya@gmail.com','$2y$10$FzQ4JIYBTrABFFCDI6htdeKcQQHt4wxpour6TAyrnOH0cRXYTg0kO',NULL),('10059047','Mohammad Naved Qureshi','M.Tech(Software Engineering)','146/278 Maulana Azad Road, Deeg gate, Mathura','2014-07-31','navedmohd786@gmail.com','$2y$10$Xzc6VWgLcDiGcI9XFEH7R.NBH0tojhjhDVRmeCY6Ru1jjuMRZnHU2',NULL),('10059735','Mohd. Tariq Sami','M.Tech (Electrical)','H. No 4/1272, Iqbal Street, Jamal Pur, Aligarh-202001','2012-06-28','mohdtariqsami@gmail.com','$2y$10$f6197tYTsliVovZq8B9TVuRe6OEAQ98Jp.WPA3iCbefuU1L1dcbpi',NULL),('10072493','Mohd. Umar Rehman','M. Tech. (Hons.)','725-A, Street No. 1, Greater Azad Enclave, Dhorra, Aligarh-202002, UP','2016-06-24','umar.ee.amu@gmail.com','$2y$10$.My4TowviMu1a76PhVlr4e11mfdR1EwMigiFXu1eRM1YK.noYx5Ya',NULL),('10074925','Mohd. Zihaib Khan','M. Tech','Electrical Engineering Section, University Polytechnic','2014-05-23','zohaib017@gmail.com','$2y$10$BwSPeqSnOp4lvVnjE69mPOvg2bLuM1Xyi5sQfPTFdeVTNdgSy4ZMK',NULL),('10076702','Uvais Mustafa','M. Tech (Instrumentation and Co','Electrical Engineering Section, University Polytechnic','2020-02-19','mustafa6554@gmail.com','$2y$10$YvQsWme8NaobLLjwe4DZ6eqtyI85W.sNPzLtGjIlORBmiUapZgE52',NULL),('10076801','Syed Abu Rehan','M. Tech','4/113 near shiv mnadir, Bhamola, Aligarh','2016-02-19','syedaburehan@gmail.com','$2y$10$ezFZQGB.5l.XhF6qS8pj0O4ZzvPS2dlBkM71swri0nsdZZYwo2lhq',NULL),('10078076','Zahid Ahmed Ansari','Ph.D. (Computer Science and Eng','Aligarh - India (202002)','2020-11-20','thasan.bp@amu.ac.in','$2y$10$z6PRMF7XbXPfxmwCAWgko.xSng5iAvHKjhNcOevAIxGyCBk9O0sku',NULL),('10402','Tanveer Hasan','M.Tech.','C-11, Duplex (Old) Quarters, Sir Syed Nagar, Aligarh-202002','2015-06-13','thasan.bp@amu.ac.in','$2y$10$ttcuqbzznE157Gcb6/DmpeplRcXTw7GiXhujDU/YV5tD2w9ylLGHu',NULL),('10403','Muhammad Yusuf Khan','M.Tech','140, Iqbal Bagh,Diggi Road,Aligarh, 202002,U. P., India','2016-11-19','yusuf_khan1231@yahoo.com','$2y$10$oWIW8sZJssU.OIesR7UebuE8zbceYQ.1fzjVkJuTy3bzMDBxMR/q2',NULL),('10406','Salim Istyaq','M.Tech. in Communication &amp; ','Q. No. F-1/1094, Chakradhar Colony, Near Grocy Hub, Nagla Patwari, Aligarh-202002,U. P., India','2014-06-20','saleemishtiyak@gmail.com','$2y$10$.oYNrc.WZ3STKYwN5r0UnOdehJwtpQG/iZU0Tj3RbIL/zWKgD8De6',NULL),('10407','Mohd Faisal Khan','Ph.D','H.No:118, Lane No. 1, Ghaffar Manzil Ext. Jamia Nagar New Delhi- 110025','2016-11-03','mfkhan.bp@amu.ac.in','$2y$10$K4Js7cC8dl9NF8QhJY3UCuoFVOPiH1NjaHapRZjJ02u5pyAzzVFC.',NULL);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professorphone`
--

DROP TABLE IF EXISTS `professorphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professorphone` (
  `professorId` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`professorId`,`phone`),
  CONSTRAINT `professorphone_ibfk_1` FOREIGN KEY (`professorId`) REFERENCES `professor` (`professorId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professorphone`
--

LOCK TABLES `professorphone` WRITE;
/*!40000 ALTER TABLE `professorphone` DISABLE KEYS */;
INSERT INTO `professorphone` VALUES ('10058420','9997966040'),('10059046','9897127010'),('10059047','9411854211'),('10059735','9411810396'),('10072493','9897869769'),('10074925','9911175423'),('10076702','9639100173'),('10076801','9808362757'),('10078076','7899267361'),('10402','09756964442'),('10403','9897065455'),('10406','9412563748'),('10407','9897439890');
/*!40000 ALTER TABLE `professorphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professorteaches`
--

DROP TABLE IF EXISTS `professorteaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professorteaches` (
  `coursecode` varchar(20) NOT NULL,
  `professorId` varchar(20) NOT NULL,
  PRIMARY KEY (`coursecode`,`professorId`),
  KEY `professorId` (`professorId`),
  CONSTRAINT `professorteaches_ibfk_1` FOREIGN KEY (`coursecode`) REFERENCES `course` (`coursecode`),
  CONSTRAINT `professorteaches_ibfk_2` FOREIGN KEY (`professorId`) REFERENCES `professor` (`professorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professorteaches`
--

LOCK TABLES `professorteaches` WRITE;
/*!40000 ALTER TABLE `professorteaches` DISABLE KEYS */;
INSERT INTO `professorteaches` VALUES ('BCE-607','10076801'),('BLC-601','10078076'),('BLC-602','10406'),('BLC-603','10059047'),('BLC-604','10406'),('BLC-691','10072493'),('BLC-691','10406'),('BLC-692','10078076'),('BLC-692','10406'),('BLC-693','10059047'),('BLC-693','10078076'),('BLC-694','10059046'),('BLC-694','10059047'),('BLC-694','10078076'),('BLC-694','10406');
/*!40000 ALTER TABLE `professorteaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `branchId` int(11) NOT NULL,
  `semesterId` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `1st` varchar(20) DEFAULT NULL,
  `2nd` varchar(20) DEFAULT NULL,
  `3rd` varchar(20) DEFAULT NULL,
  `4th` varchar(20) DEFAULT NULL,
  `5th` varchar(20) DEFAULT NULL,
  `6th` varchar(20) DEFAULT NULL,
  `7th` varchar(20) DEFAULT NULL,
  `8th` varchar(20) DEFAULT NULL,
  `9th` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`branchId`,`semesterId`,`day`),
  KEY `semesterId` (`semesterId`),
  KEY `1st` (`1st`),
  KEY `2nd` (`2nd`),
  KEY `3rd` (`3rd`),
  KEY `4th` (`4th`),
  KEY `5th` (`5th`),
  KEY `6th` (`6th`),
  KEY `7th` (`7th`),
  KEY `8th` (`8th`),
  KEY `9th` (`9th`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`branchId`) REFERENCES `branch` (`branchId`),
  CONSTRAINT `schedule_ibfk_10` FOREIGN KEY (`8th`) REFERENCES `course` (`coursecode`),
  CONSTRAINT `schedule_ibfk_11` FOREIGN KEY (`9th`) REFERENCES `course` (`coursecode`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`semesterId`) REFERENCES `semester` (`semesterId`),
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`1st`) REFERENCES `course` (`coursecode`),
  CONSTRAINT `schedule_ibfk_4` FOREIGN KEY (`2nd`) REFERENCES `course` (`coursecode`),
  CONSTRAINT `schedule_ibfk_5` FOREIGN KEY (`3rd`) REFERENCES `course` (`coursecode`),
  CONSTRAINT `schedule_ibfk_6` FOREIGN KEY (`4th`) REFERENCES `course` (`coursecode`),
  CONSTRAINT `schedule_ibfk_7` FOREIGN KEY (`5th`) REFERENCES `course` (`coursecode`),
  CONSTRAINT `schedule_ibfk_8` FOREIGN KEY (`6th`) REFERENCES `course` (`coursecode`),
  CONSTRAINT `schedule_ibfk_9` FOREIGN KEY (`7th`) REFERENCES `course` (`coursecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (5,1,1,'BLE-192','BCH-191','BCH-101','BLC-191','BCH-101','BCH-191',NULL,NULL,NULL),(5,1,2,NULL,'BCH-191','BCH-101','BCH-191','BCH-191','BCH-101',NULL,NULL,NULL),(5,1,3,'BCH-191','BLE-101','BMA-101','BLC-191','BCH-191',NULL,'BLC-191','BCH-191','BCH-101'),(5,1,4,'BCH-101','BCH-101','BCH-191','BLC-191','BLC-191','BLE-102',NULL,NULL,NULL),(5,1,5,'BLC-191','BCH-191','BLC-191','BLC-191','BLE-101',NULL,NULL,NULL,NULL),(5,1,6,NULL,NULL,'BLC-191','BLC-191','BCH-191',NULL,'BLC-191','BLC-191','BCH-191'),(5,3,1,'BLC-302','BLC-391','BLC-391','BLC-391','BLC-391',NULL,NULL,NULL,NULL),(5,3,2,NULL,'BLE-303','BLC-392','BLE-302','BLC-392',NULL,NULL,NULL,NULL),(5,3,3,'BLC-301','BLC-393','BLC-392','BLC-391','BLC-392','BLC-301',NULL,'BLC-393','BLC-393'),(5,3,4,'BLC-392','BLC-392','BLC-392','BLC-392','BLC-392',NULL,NULL,NULL,NULL),(5,3,5,'BLC-391','BLC-392','BLC-391','BLC-393','BLE-302',NULL,NULL,NULL,NULL),(5,3,6,'BLC-392','BLC-391','BLC-392','BLC-392','BLC-391',NULL,NULL,NULL,NULL),(5,4,1,'BLC-493','BLC-491','BMA-401','BLC-492','BLC-401',NULL,NULL,NULL,NULL),(5,4,2,NULL,'BLC-491','BLC-493',NULL,'BLC-492','BLC-493',NULL,NULL,NULL),(5,4,3,'BLC-492','BLC-493','BLC-492','BLC-492',NULL,NULL,'BLC-493','BLC-492','BLC-493'),(5,4,4,'BLC-491','BLC-492','BLC-491',NULL,'BLC-492','BLC-491',NULL,NULL,NULL),(5,4,5,'BLC-492','BLC-492','BLC-492','BLC-492','BLC-493',NULL,NULL,NULL,NULL),(5,4,6,'BMA-401','BMA-401','BLE-493','BLE-493','BLE-493',NULL,NULL,NULL,NULL),(5,6,1,NULL,'BLC-601','BLC-602','BLC-693','BLC-693','BLC-693',NULL,NULL,NULL),(5,6,2,NULL,'BLC-601','BLC-602','BCE-607','BLC-604',NULL,NULL,NULL,NULL),(5,6,3,NULL,'BLC-603','BLC-601','BLC-604',NULL,'BLC-602',NULL,NULL,NULL),(5,6,4,'BCE-607','BLC-602','BLC-603','BLC-604','BLC-601',NULL,'BLC-694','BLC-694','BLC-694'),(5,6,5,'BLC-603','BCE-607','BLC-692','BLC-692','BLC-692',NULL,NULL,NULL,NULL),(5,6,6,'BCE-607','BLC-603','BLC-604','BLC-691','BLC-691','BLC-691',NULL,NULL,NULL);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `semesterId` int(11) NOT NULL,
  PRIMARY KEY (`semesterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (1),(2),(3),(4),(5),(6);
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `enrollment` varchar(20) NOT NULL,
  `facultyNo` varchar(20) NOT NULL,
  `name` char(31) NOT NULL,
  `fathersName` char(31) NOT NULL,
  `emailId` varchar(63) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `joinDate` date NOT NULL,
  `branch` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `profilepic` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`enrollment`),
  KEY `branch` (`branch`),
  KEY `semester` (`semester`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`branch`) REFERENCES `branch` (`branchId`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`semester`) REFERENCES `semester` (`semesterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('GH3548','17DPCE188','Tahseen Ansari','Mujibur Rahman','tahseen@example.com','2003-10-02','$2y$10$wPrHdh8G9fd3BnkUc4T7KuRCxYksnPmn/M3vskAtgTov7qMBMsC8a','86/1 2KBM Road, Fitkari Mohalla, Champdani\nIndia','2007-10-29',5,6,NULL),('GJ9697','17DPCE189','Mohd Masood Alam','Mohd Aflatoon Ansari','130masoodalam@gmail.com','2002-02-16','$2y$10$QDB2KE5dHIWIl8pDOY93TOSf4m/1breLO.MV0C4Qh0Ev4WKKmIeFS','D-61 RM Hall','2017-08-22',5,6,'GJ9697.jpg'),('GK4738','18FDKJ845','Dayyan Yaseen','Vaki Yaseem','dayyan@example.com','2005-11-13','$2y$10$WN8LLC6VqRQDNhANCXFwcOGgHfO..fishodm9d6Vuswp11ySXM1Gy','Shahjamal - Aligarh','2018-12-24',5,3,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentassignedcourses`
--

DROP TABLE IF EXISTS `studentassignedcourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentassignedcourses` (
  `enrollment` varchar(20) NOT NULL,
  `coursecode` varchar(20) NOT NULL,
  PRIMARY KEY (`enrollment`,`coursecode`),
  KEY `coursecode` (`coursecode`),
  CONSTRAINT `studentassignedcourses_ibfk_1` FOREIGN KEY (`enrollment`) REFERENCES `student` (`enrollment`),
  CONSTRAINT `studentassignedcourses_ibfk_2` FOREIGN KEY (`coursecode`) REFERENCES `course` (`coursecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentassignedcourses`
--

LOCK TABLES `studentassignedcourses` WRITE;
/*!40000 ALTER TABLE `studentassignedcourses` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentassignedcourses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentphone`
--

DROP TABLE IF EXISTS `studentphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentphone` (
  `enrollment` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`enrollment`,`phone`),
  CONSTRAINT `studentphone_ibfk_1` FOREIGN KEY (`enrollment`) REFERENCES `student` (`enrollment`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentphone`
--

LOCK TABLES `studentphone` WRITE;
/*!40000 ALTER TABLE `studentphone` DISABLE KEYS */;
INSERT INTO `studentphone` VALUES ('GH3548','9330795314'),('GJ9697','08532820931'),('GJ9697','9883445580'),('GK4738','+914324233423');
/*!40000 ALTER TABLE `studentphone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-03 11:44:21

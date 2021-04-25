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
  `assignmentId` int(20) NOT NULL AUTO_INCREMENT,
  `coursecode` varchar(20) NOT NULL,
  `title` tinytext NOT NULL,
  `data` text DEFAULT NULL,
  `provideddate` date NOT NULL,
  `submissiondate` date DEFAULT NULL,
  `providedBy` varchar(20) NOT NULL,
  `attachment` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`assignmentId`),
  KEY `coursecode` (`coursecode`),
  KEY `providedBy` (`providedBy`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`coursecode`) REFERENCES `course` (`coursecode`),
  CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`providedBy`) REFERENCES `professor` (`professorId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (2,'BLC-592','Test Assignment','<div>this only for testing purpose</div><div><b>Fruits.</b></div><div><ul><li>banana</li><li>orange</li><li>apple</li></ul><div><a href=\"https://www.google.com\" target=\"_blank\">google.com</a></div></div>','2021-04-19','2021-04-21','10059047',1),(3,'BLE-302','Assignment I','Writ about <b>Electrical Engineering.</b><div><ul><li>Hello</li><li>There</li><li>Google</li></ul></div>','2021-04-19','2021-04-30','10059047',1),(4,'BLC-603','Assignment 1','<ul><li><span id=\"docs-internal-guid-bc85116d-7fff-4d5c-7e3c-60f2a5d45996\"><span style=\"font-size: 11pt; font-family: Arial; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">Suppose you want to set up a database for a university polytechnic, list the major steps that you would take in setting up a database for this enterprise.</span></span><br></li><li><span><span style=\"font-size: 11pt; font-family: Arial; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><span id=\"docs-internal-guid-a51e51bf-7fff-8c1c-7aea-b65999135116\"><span style=\"font-size: 11pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;\">Suppose you want to build a query site similar to Quora. Consider each of the points of disadvantages of keeping data in a file-processing system. Discuss the relevance of each of these points to the storage of actual queries data, and to metadata about the queries, such as title, the user who uploaded it, tags, and which users answered it.</span></span><br></span></span></li><li><span><span style=\"font-size: 11pt; font-family: Arial; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><span><span style=\"font-size: 11pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;\"><span id=\"docs-internal-guid-11f23de5-7fff-efb5-7177-8917b044f435\"><span style=\"font-size: 11pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;\">Explain the difference between two-tier and three-tier architectures with the help of suitable diagrams. Give examples of each of them.</span></span><br></span></span></span></span></li><li><span><span style=\"font-size: 11pt; font-family: Arial; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><span><span style=\"font-size: 11pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;\"><span><span style=\"font-size: 11pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;\"><span id=\"docs-internal-guid-25dfa9f7-7fff-0fec-5994-d3d0a84da477\"><span style=\"font-size: 11pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;\">Think of different users for the database shown in figure below. What types of applications would each user need? To which user category would each belong, and what type of interface would each need?</span></span><br></span></span></span></span></span></span></li></ul>','2021-04-21','2021-04-23','10059047',NULL),(5,'BLC-603','Assignment 2','<p class=\"MsoNormal\" style=\"margin-bottom:0cm;vertical-align:baseline\"><span style=\"font-family: Arial, sans-serif;\">Explain the difference between </span><span style=\"font-size: 11.5pt; font-family: Arial, sans-serif;\">Hierarchical model, Network model and ER model with help of\r\nsuitable examples.(5)</span><span style=\"font-family: Arial, sans-serif;\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;vertical-align:baseline\"><span style=\"font-size: 11.5pt; font-family: Arial, sans-serif;\">With the help of suitable examples define the\r\nfollowing terms:&nbsp; entity, attribute, attribute value, relationship\r\ninstance, composite attribute, multivalued attribute, derived attribute,\r\ncomplex attribute, key attribute, and value set (domain).(5)<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;vertical-align:baseline\"><span style=\"font-size: 11.5pt; font-family: Arial, sans-serif;\">Draw an ER diagram for IPL database. Assume\r\nsuitable data by yourself.(10)<o:p></o:p></span></p>','2021-04-21','2021-04-24','10059047',NULL),(6,'BLC-603','Assignment 3','<ol style=\"list-style-type: decimal;\">\r\n  <li>Explain Referential key and referencing key integrity constraints with the help of suitable examples.</li>\r\n  <li>Explain Super key, candidate key and foreign key with the help of suitable examples.</li>\r\n  <li>What is Normalization? Explain different types of normal form with suitable examples of each.</li>\r\n  <li>Consider the following relational schema diagram: <br>\r\n    Write down relational expressions for the following queries:\r\n    <ol style=\"list-style-type: lower-alpha;\">\r\n      <li>How many copies of the book titled The Lost Tribe are owned by the library branch whose name is ‘Sharpstown’?</li>\r\n      <li>How many copies of the book titled The Lost Tribe are owned by each library branch?</li>\r\n    </ol>\r\n  </li>\r\n</ol>','2021-04-21','2021-04-28','10059047',1),(7,'BLC-601','Assignment 3','<ol style=\"list-style-type:decimal;\">\r\n  <li>\r\n    Discuss the following 3 types of PHP variable scopes with the help of suitable examples\r\n    <ol style=\"list-style-type: lower-alpha;\">\r\n      <li>local</li>\r\n      <li>global</li>\r\n      <li>static</li>\r\n    </ol>\r\n  </li>\r\n  <li>\r\n    What are different Jump Statements in Java. Discuss the following with examples\r\n    <ol style=\"list-style-type: lower-alpha;\">\r\n      <li>Labelled break</li>\r\n      <li>Labelled Continue</li>\r\n    </ol>\r\n  </li>\r\n</ol>','2021-04-21','2021-04-21','10059047',NULL),(8,'BLC-603','Viva of Unit 3 and 4','Viva of Unit 3 and 4 will be held on April 26. So, be prepared for the viva.','2021-04-22','2021-04-25','10059047',1),(9,'BLC-302','Write notes for Early development of microprocessor','Hello world programming<br>','2021-04-23','2021-04-24','10059047',1);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
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
INSERT INTO `course` VALUES ('BCE-607','Environmental Studies','theory',5,6),('BCH-101','Applied Chemistry-I','theory',5,1),('BCH-191','Chemistry Lab-I','lab',5,1),('BCH-201','Applied Chemistry-II','theory',5,2),('BCH-291','Chemistry Lab-II','lab',5,2),('BEN-201','English and Communication Skills','theory',5,2),('BLC-191','Programming Lab-I','lab',5,1),('BLC-201','Basic Computer Organisation','theory',5,2),('BLC-291','Programming Lab-II','lab',5,2),('BLC-301','Programming in C','theory',5,3),('BLC-302','Fundamentals of MicroProcessor','theory',5,3),('BLC-391','Basic MicroProcessor Lab','lab',5,3),('BLC-392','Software Lab-I','lab',5,3),('BLC-393','Programming Lab-III','lab',5,3),('BLC-401','Data Structure and Algorithms','theory',5,4),('BLC-404','Computer Progrmming','theory',8,4),('BLC-491','Microprocessor and Control Lab','lab',5,4),('BLC-492','Software Lab-II','lab',5,4),('BLC-493','Programming Lab-IV','lab',5,4),('BLC-501','Computer Graphics','theory',5,5),('BLC-502','Compiler Design','theory',5,5),('BLC-503','Computer Communication Network','theory',5,5),('BLC-591','Computer Hardware and Networking Lab','lab',5,5),('BLC-592','Advanced Programming Lab-I','lab',5,5),('BLC-593','Programming Lab-V','lab',5,5),('BLC-594','Minor Project','lab',5,5),('BLC-601','Web Design and Internet Development','theory',5,6),('BLC-602','Software Engineering','theory',5,6),('BLC-603','DataBase Management System','theory',5,6),('BLC-604','Operating System','theory',5,6),('BLC-691','Computer Hardware and Networking Lab','lab',5,6),('BLC-692','Advanced Programming Lab-II','lab',5,6),('BLC-693','Programming Lab-VI','lab',5,6),('BLC-694','Major Project','lab',5,6),('BLE-101','Electronic Devices and Circuits','theory',5,1),('BLE-102','Circuit Theory','theory',5,1),('BLE-191','Basic Electronics Workshop','lab',5,1),('BLE-192','Basic Electronics Lab','lab',5,1),('BLE-291','Electronics Maintainance Practice','lab',5,2),('BLE-292','Electronics Engineering Lab','lab',5,2),('BLE-301','Digital Electronics-I','theory',5,3),('BLE-302','Electrical Engineering','theory',5,3),('BLE-303','Electrical Instrumentation-I','theory',5,3),('BLE-392','Electronics and Communication Lab-I','lab',5,3),('BLE-401','Analog Electronics Circuit','theory',5,4),('BLE-402','Digital System-II','theory',5,4),('BLE-403','Principle of Communication','theory',5,4),('BLE-493','Electronics and Communication Lab-II','lab',5,4),('BMA-101','Applied Math-I','theory',5,1),('BMA-201','Applied Maths-II','theory',5,2),('BMA-401','Applied Math-III','theory',5,4),('BMA-504','Computational Techniques','theory',5,5),('BME-506','Management and Entrepreneurship','theory',5,5),('BPH-101','Applied Physics-I','theory',5,1),('BPH-191','Physics Lab-I','lab',5,1),('BPH-201','Applied Plysics-II','theory',5,2),('BPH-291','Physics Lab-II','lab',5,2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturenotes`
--

DROP TABLE IF EXISTS `lecturenotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecturenotes` (
  `lectureId` int(11) NOT NULL AUTO_INCREMENT,
  `coursecode` varchar(20) NOT NULL,
  `title` tinytext NOT NULL,
  `data` text DEFAULT NULL,
  `provideddate` date NOT NULL,
  `providedBy` varchar(20) NOT NULL,
  `attachment` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`lectureId`),
  KEY `coursecode` (`coursecode`),
  KEY `providedBy` (`providedBy`),
  CONSTRAINT `lecturenotes_ibfk_1` FOREIGN KEY (`coursecode`) REFERENCES `course` (`coursecode`),
  CONSTRAINT `lecturenotes_ibfk_2` FOREIGN KEY (`providedBy`) REFERENCES `professor` (`professorId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturenotes`
--

LOCK TABLES `lecturenotes` WRITE;
/*!40000 ALTER TABLE `lecturenotes` DISABLE KEYS */;
INSERT INTO `lecturenotes` VALUES (1,'BLC-391','Test lecture notes','<div>this only for testing purpose</div><div><b>Fruits.</b></div><div><ul><li>banana</li><li>orange</li><li>apple</li></ul><div><a href=\"https://www.google.com\" target=\"_blank\">google.com</a></div></div>','2021-04-19','10059047',1),(2,'BLC-602','Unit 1 - Introduction to Operating System ','<h3><span class=\"Heading1Char\">OPERATING SYSTEM:</span> <o:p></o:p></h3>\r\n\r\n<p class=\"MsoNormal\" style=\"text-indent:21.3pt\">An operating system (OS) is\r\nsystem software that manages computer hardware and software resources and\r\nprovides common services for computer programs. The operating system is a\r\ncomponent of the system software in a computer system. Application programs\r\nusually require an operating system to function. Time-sharing operating systems\r\nschedule tasks for efficient use of the system and may also include accounting\r\nsoftware for cost allocation of processor time, mass storage, printing, and\r\nother resources. For hardware functions such as input and output and memory\r\nallocation, the operating system acts as an intermediary between programs and\r\nthe computer hardware, although the application code is usually executed\r\ndirectly by the hardware and frequently makes system calls to an OS function or\r\nbe interrupted by it. Operating systems are found on many devices that contain\r\na computer— from cellular phones and video game consoles to web servers and\r\nsupercomputers.<b><o:p></o:p></b></p>\r\n\r\n<h3>EVOLUTION OF OPERATING SYSTEM:<o:p></o:p></h3>\r\n\r\n<p class=\"MsoNormal\" style=\"text-indent:21.3pt\">The first computers used batch\r\noperating systems, in which the computer ran batches of jobs without stop.\r\nPrograms were punched into cards that were usually copied to tape for\r\nprocessing. When the computer finished one job, it would immediately start the next\r\none on the tape. Professional operators, not the users, interacted with the\r\nmachine. Users dropped jobs off, then returned to pick up the results after\r\ntheir jobs had run. This was inconvenient for the users, but the expensive\r\ncomputer was kept busy with a steady stream of jobs.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-indent:21.3pt\">In the 1960s, time-shared\r\noperating systems began replacing batch systems. Users interacted directly with\r\nthe computer via a printing terminal like the Western Electric Teletype shown\r\nhere. Several users shared the computer at the same time, and it spent a\r\nfraction of a second on each one\'s job before moving on to the next. A fast\r\ncomputer could work on many user\'s jobs at the same time, while creating the\r\nillusion that they were receiving its full attention.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-indent:21.3pt\">Printing terminals were later\r\nreplaced by video terminals that could only display fixed size characters. Some\r\ncould be used to create forms on the screen, but many simply scrolled like a\r\n\"glass Teletype.\"<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-indent:21.3pt\">Personal computers became\r\naffordable in the mid-1970s. The Altair 8800, shown here, was the first\r\ncommercially viable personal computer marketed to individuals. Beginning in\r\nJanuary 1975, the Altair was sold to hobbyists in kit form. The Altair did not\r\nhave an operating system, since it had only toggle switches and light-emitting\r\ndiodes for input and output. people soon connected terminals and floppy disk\r\ndrives to Altair. In 1976, Digital Research introduced the CP/M operating\r\nsystem for the Altair and computers like it. CP/M and later DOS had CLIs that\r\nwere similar to those of the time-shared operating systems, but the computer\r\nwas dedicated to a single user, not shared.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-indent:21.3pt\">As hardware prices fell, personal\r\ncomputers with bit-mapped displays that could control individual pixels were\r\ndeveloped. These made personal computer with graphical user interfaces (GUIs)\r\npossible. The first commercial success was the Apple Macintosh which was\r\nintroduced in 1984. The initial Macintosh pushed the state of the hardware art,\r\nand was restricted to a small, monochrome display. As hardware continued to\r\nevolve, larger, color Macs were developed and Microsoft introduced Windows,\r\ntheir GUI operating system.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-indent:21.3pt\">The Macintosh operating system\r\nwas based on decades of research on graphically-oriented personal computer\r\noperating systems and applications. This photo of shows Ivan Sutherland\'s\r\npioneering program Sketchpad in the early 1960s. Sketchpad foreshadowed many of\r\nthe characteristics of a modern GUI, but the hardware cost millions of dollars\r\nand filled a room. After many generations of research projects on large\r\ncomputers and improvement in hardware, the Macintosh became economically\r\nfeasible. Research prototypes like Sketchpad are still being developed at\r\nuniversities and in research labs. They will form the basis of future products.<o:p></o:p></p>','2021-04-21','10059047',NULL);
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
INSERT INTO `schedule` VALUES (5,1,1,'BLE-192','BCH-191','BCH-101','BLC-191','BCH-101','BCH-191',NULL,NULL,NULL),(5,1,2,NULL,'BCH-191','BCH-101','BCH-191','BCH-191','BCH-101',NULL,NULL,NULL),(5,1,3,'BCH-191','BLE-101','BMA-101','BLC-191','BCH-191',NULL,'BLC-191','BCH-191','BCH-101'),(5,1,4,'BCH-101','BCH-101','BCH-191','BLC-191','BLC-191','BLE-102',NULL,NULL,NULL),(5,1,5,'BLC-191','BCH-191','BLC-191','BLC-191','BLE-101',NULL,NULL,NULL,NULL),(5,1,6,NULL,NULL,'BLC-191','BLC-191','BCH-191',NULL,'BLC-191','BLC-191','BCH-191'),(5,2,1,'BCH-291','BLC-201','BCH-291','BCH-291','BLC-291','BEN-201',NULL,NULL,NULL),(5,2,2,NULL,'BCH-291','BCH-291','BEN-201','BPH-291','BPH-291',NULL,NULL,NULL),(5,2,3,'BCH-201','BCH-201','BPH-201','BLE-292',NULL,'BLE-292',NULL,NULL,NULL),(5,2,4,'BLE-291',NULL,'BLE-292','BEN-201','BCH-291','BLE-292',NULL,NULL,NULL),(5,2,5,'BMA-201','BLE-291','BLC-291','BLC-291','BLC-291','BLC-201',NULL,NULL,NULL),(5,2,6,'BLC-201','BEN-201','BCH-291','BCH-201','BCH-201','BLC-201',NULL,NULL,NULL),(5,3,1,'BLC-302','BLC-391','BLC-391','BLC-391','BLC-391',NULL,NULL,NULL,NULL),(5,3,2,NULL,'BLE-303','BLC-392','BLE-302','BLC-392',NULL,NULL,NULL,NULL),(5,3,3,'BLC-301','BLC-393','BLC-392','BLC-391','BLC-392','BLC-301',NULL,'BLC-393','BLC-393'),(5,3,4,'BLC-392','BLC-392','BLC-392','BLC-392','BLC-392',NULL,NULL,NULL,NULL),(5,3,5,'BLC-391','BLC-392','BLC-391','BLC-393','BLE-302',NULL,NULL,NULL,NULL),(5,3,6,'BLC-392','BLC-391','BLC-392','BLC-392','BLC-391',NULL,NULL,NULL,NULL),(5,4,1,'BLC-493','BLC-491','BMA-401','BLC-492','BLC-401',NULL,NULL,NULL,NULL),(5,4,2,NULL,'BLC-491','BLC-493',NULL,'BLC-492','BLC-493',NULL,NULL,NULL),(5,4,3,'BLC-492','BLC-493','BLC-492','BLC-492',NULL,NULL,'BLC-493','BLC-492','BLC-493'),(5,4,4,'BLC-491','BLC-492','BLC-491',NULL,'BLC-492','BLC-491',NULL,NULL,NULL),(5,4,5,'BLC-492','BLC-492','BLC-492','BLC-492','BLC-493',NULL,NULL,NULL,NULL),(5,4,6,'BMA-401','BMA-401','BLE-493','BLE-493','BLE-493',NULL,NULL,NULL,NULL),(5,6,1,NULL,'BLC-601','BLC-602','BLC-693','BLC-693','BLC-693',NULL,NULL,NULL),(5,6,2,NULL,'BLC-601','BLC-602','BCE-607','BLC-604',NULL,NULL,NULL,NULL),(5,6,3,NULL,'BLC-603','BLC-601','BLC-604',NULL,'BLC-602',NULL,NULL,NULL),(5,6,4,'BCE-607','BLC-602','BLC-603','BLC-604','BLC-601',NULL,'BLC-694','BLC-694','BLC-694'),(5,6,5,'BLC-603','BCE-607','BLC-692','BLC-692','BLC-692',NULL,NULL,NULL,NULL),(5,6,6,'BCE-607','BLC-603','BLC-604','BLC-691','BLC-691','BLC-691',NULL,NULL,NULL);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulepro`
--

DROP TABLE IF EXISTS `schedulepro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedulepro` (
  `professorId` varchar(20) NOT NULL,
  `evenOdd` tinyint(4) NOT NULL,
  `day` tinyint(4) NOT NULL,
  `1st` varchar(20) DEFAULT NULL,
  `2nd` varchar(20) DEFAULT NULL,
  `3rd` varchar(20) DEFAULT NULL,
  `4th` varchar(20) DEFAULT NULL,
  `5th` varchar(20) DEFAULT NULL,
  `6th` varchar(20) DEFAULT NULL,
  `7th` varchar(20) DEFAULT NULL,
  `8th` varchar(20) DEFAULT NULL,
  `9th` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`professorId`,`evenOdd`,`day`),
  KEY `1st` (`1st`),
  KEY `2nd` (`2nd`),
  KEY `3rd` (`3rd`),
  KEY `4th` (`4th`),
  KEY `5th` (`5th`),
  KEY `6th` (`6th`),
  KEY `7th` (`7th`),
  KEY `8th` (`8th`),
  KEY `9th` (`9th`),
  CONSTRAINT `schedulepro_ibfk_1` FOREIGN KEY (`professorId`) REFERENCES `professor` (`professorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedulepro_ibfk_2` FOREIGN KEY (`2nd`) REFERENCES `course` (`coursecode`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `schedulepro_ibfk_3` FOREIGN KEY (`3rd`) REFERENCES `course` (`coursecode`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `schedulepro_ibfk_4` FOREIGN KEY (`4th`) REFERENCES `course` (`coursecode`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `schedulepro_ibfk_5` FOREIGN KEY (`5th`) REFERENCES `course` (`coursecode`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `schedulepro_ibfk_6` FOREIGN KEY (`6th`) REFERENCES `course` (`coursecode`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `schedulepro_ibfk_7` FOREIGN KEY (`7th`) REFERENCES `course` (`coursecode`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `schedulepro_ibfk_8` FOREIGN KEY (`8th`) REFERENCES `course` (`coursecode`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `schedulepro_ibfk_9` FOREIGN KEY (`9th`) REFERENCES `course` (`coursecode`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulepro`
--

LOCK TABLES `schedulepro` WRITE;
/*!40000 ALTER TABLE `schedulepro` DISABLE KEYS */;
INSERT INTO `schedulepro` VALUES ('10059047',0,1,NULL,NULL,'BLC-404','BLC-693','BLC-693','BLC-693',NULL,NULL,NULL),('10059047',0,2,NULL,NULL,NULL,NULL,NULL,'BLC-404','BLC-492','BLC-492','BLC-492'),('10059047',0,3,NULL,'BLC-603','BLC-404','BLC-291','BLC-291','BLC-291',NULL,NULL,NULL),('10059047',0,4,NULL,NULL,'BLC-603',NULL,NULL,NULL,'BLC-694','BLC-694','BLC-694'),('10059047',0,5,'BLC-603',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('10059047',0,6,NULL,'BLC-603',NULL,'BLC-404',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `schedulepro` ENABLE KEYS */;
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
INSERT INTO `student` VALUES ('GH3548','17DPCE188','Tahseen Ansari','Mujibur Rahman','tahseen@example.com','2003-10-02','$2y$10$wPrHdh8G9fd3BnkUc4T7KuRCxYksnPmn/M3vskAtgTov7qMBMsC8a','86/1 2KBM Road, Fitkari Mohalla, Champdani\nIndia','2007-10-29',5,6,NULL),('GJ9697','17DPCE189','Mohd Masood Alam','Mohd Aflatoon Ansari','130masoodalam@gmail.com','2002-02-16','$2y$10$QDB2KE5dHIWIl8pDOY93TOSf4m/1breLO.MV0C4Qh0Ev4WKKmIeFS','D-61 RM Hall','2017-08-22',5,6,'GJ9697.jpg'),('GK4738','18FDKJ845','Dayyan Yaseen','Vaki Yaseem','dayyan@example.com','2005-11-13','$2y$10$WN8LLC6VqRQDNhANCXFwcOGgHfO..fishodm9d6Vuswp11ySXM1Gy','Shahjamal - Aligarh','2018-12-24',5,3,NULL),('GL2408','20DPIM249','Mohammad Qamar Alam','Md. Shamshuddin','qamar.freeman@hululu.com','2002-11-13','$2y$10$P4MWRLwBc4Xk6qFEH7hNNep8uMV8Stly/LbK0k6BuBndtETvnjkl.','Madhubani Bihar - India','2020-07-19',10,2,NULL);
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
INSERT INTO `studentphone` VALUES ('GH3548','9330795314'),('GJ9697','08532820931'),('GJ9697','9883445580'),('GK4738','+914324233423'),('GL2408','+918532564558');
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

-- Dump completed on 2021-04-25 19:27:45

CREATE DATABASE  IF NOT EXISTS `hostel_management_system` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hostel_management_system`;
-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: hostel_management_system
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.16.04.1

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
-- Table structure for table `Application`
--

DROP TABLE IF EXISTS `Application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Application` (
  `Application_id` int(100) NOT NULL AUTO_INCREMENT,
  `Student_id` varchar(255) NOT NULL,
  `Hostel_id` int(10) NOT NULL,
  `Application_status` tinyint(1) DEFAULT NULL,
  `Room_No` int(10) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Application_id`),
  KEY `Student_id` (`Student_id`),
  KEY `Hostel_id` (`Hostel_id`),
  CONSTRAINT `Application_ibfk_1` FOREIGN KEY (`Student_id`) REFERENCES `Student` (`Student_id`),
  CONSTRAINT `Application_ibfk_2` FOREIGN KEY (`Hostel_id`) REFERENCES `Hostel` (`Hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Application`
--

-- LOCK TABLES `Application` WRITE;
/*!40000 ALTER TABLE `Application` DISABLE KEYS */;
INSERT INTO `Application` VALUES (1,'21MDSWE177',1, 1, 100,''),
                                  (2,'21MDSWE164', 2, 1 , 200,''),
                                  (3,'21MDSWE147', 3, 1 , 300,'');
/*!40000 ALTER TABLE `Application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Application_mess`
--

DROP TABLE IF EXISTS `Application_mess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Application_mess` (
  `Application_id` int(100) NOT NULL AUTO_INCREMENT,
  `Student_id` varchar(255) NOT NULL,
  `Mess_id` int(10) NOT NULL,
  `Application_status` tinyint(1) DEFAULT NULL,
  `Mess_card_No` int(10) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Application_id`),
  KEY `Student_id` (`Student_id`),
  KEY `Mess_id` (`Mess_id`),
  CONSTRAINT `Application_mess_ibfk_1` FOREIGN KEY (`Student_id`) REFERENCES `Student` (`Student_id`),
  CONSTRAINT `Application_mess_ibfk_2` FOREIGN KEY (`Mess_id`) REFERENCES `Mess` (`Mess_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Application_mess`
--

LOCK TABLES `Application_mess` WRITE;
/*!40000 ALTER TABLE `Application_mess` DISABLE KEYS */;
INSERT INTO `Application_mess` VALUES (1,'21MDSWE177',1,0,1,''),
                                      (2,'21MDSWE164',2,0,2,''),
                                      (3,'21MDSWE147',3,0,3,'');
/*!40000 ALTER TABLE `Application_mess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hostel`
--

-- DROP TABLE IF EXISTS `Hostel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hostel` (
  `Hostel_id` int(10) NOT NULL AUTO_INCREMENT,
  `Hostel_name` varchar(255) NOT NULL,
  `current_no_of_rooms` int(15) DEFAULT '0',
  `No_of_rooms` int(15) DEFAULT '5',
  `No_of_students` int(10) DEFAULT '0',
  PRIMARY KEY (`Hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hostel`
--

-- LOCK TABLES `Hostel` WRITE;
/*!40000 ALTER TABLE `Hostel` DISABLE KEYS */;
INSERT INTO `Hostel` VALUES (1,'A',100,100,0), (2,'B',100,100,0), (3,'C',100,100,0);
/*!40000 ALTER TABLE `Hostel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hostel_Manager`
--

DROP TABLE IF EXISTS `Hostel_Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hostel_Manager` (
  `Hostel_man_id` int(10) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Mob_no` varchar(255) NOT NULL,
  `Hostel_id` int(10) NOT NULL,
  `Mess_id` int(10) NOT NULL,
  `Pwd` longtext NOT NULL,
  `Isadmin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Hostel_man_id`),
  UNIQUE KEY `Username` (`Username`),
  KEY `Hostel_id` (`Hostel_id`),
  KEY `Mess_id` (`Mess_id`),
  CONSTRAINT `Hostel_Manager_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `Hostel` (`Hostel_id`),
  CONSTRAINT `Hostel_Manager_ibfk_2` FOREIGN KEY (`Mess_id`) REFERENCES `Mess` (`Mess_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hostel_Manager`
--

-- LOCK TABLES `Hostel_Manager` WRITE;
/*!40000 ALTER TABLE `Hostel_Manager` DISABLE KEYS */;
INSERT INTO `Hostel_Manager` VALUES (1,'mainadmin','Admin','UETM','987654321',1, 1,'admin',1),
                                    (2,'hostelA','Hostel','A','987654321',1,1,'12345',0),
                                    (3,'hostelB','Hostel','B','987654321',2,2,'12345',0),
                                    (4,'hostelC','Hostel','C','987654321',3,3,'12345',0);
/*!40000 ALTER TABLE `Hostel_Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Hostel_Manager_Profile`
--

-- DROP TABLE IF EXISTS `Hostel_Manager_Profile`;
/*!50001 DROP VIEW IF EXISTS `Hostel_Manager_Profile`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Hostel_Manager_Profile` AS SELECT 
 1 AS `Hostel_man_id`,
 1 AS `Username`,
 1 AS `Fname`,
 1 AS `Lname`,
 1 AS `Mob_no`,
 1 AS `Hostel_name`,
 1 AS `Mess_name`,
 1 AS `Hostel_Occupancy`,
 1 AS `Mess_Occupancy`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Mess`
--

DROP TABLE IF EXISTS `Mess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mess` (
  `Mess_id` int(10) NOT NULL AUTO_INCREMENT,
  `Mess_name` varchar(255) NOT NULL,
  `Mess_type` varchar(255) NOT NULL,
  `Vacancy` int(15) DEFAULT '5',
  `Size` int(15) DEFAULT '5',
  PRIMARY KEY (`Mess_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mess`
--

-- LOCK TABLES `Mess` WRITE;
/*!40000 ALTER TABLE `Mess` DISABLE KEYS */;
INSERT INTO `Mess` VALUES (1,'A','Veg',300,300),
                          (2,'B','Veg',300,300),
                          (3,'C','Veg',300,300);
/*!40000 ALTER TABLE `Mess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mess_Allocation`
--

DROP TABLE IF EXISTS `Mess_Allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mess_Allocation` (
  `Mess_card_id` int(10) NOT NULL AUTO_INCREMENT,
  `Mess_id` int(10) NOT NULL,
  `Mess_card_No` int(10) NOT NULL,
  `Allocated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Mess_card_id`),
  KEY `Mess_id` (`Mess_id`),
  CONSTRAINT `Mess_ibfk_1` FOREIGN KEY (`Mess_id`) REFERENCES `Mess` (`Mess_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mess_Allocation`
--

-- LOCK TABLES `Mess_Allocation` WRITE;
/*!40000 ALTER TABLE `Mess_Allocation` DISABLE KEYS */;
-- INSERT INTO `Mess_Allocation` VALUES (1, 1, 1, 1),
--                                       (2, 2, 2, 1),
--                                       (3, 3, 3, 1);
/*!40000 ALTER TABLE `Mess_Allocation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mess_allocation_update 
    AFTER UPDATE ON Mess_Allocation
    FOR EACH ROW 

	IF NEW.Allocated =1 and OLD.Allocated!=NEW.Allocated THEN 
		update Mess set Vacancy=Vacancy-1 where Mess_id = NEW.Mess_id  ;
	else 
		if NEW.Allocated=0 and OLD.Allocated!=NEW.Allocated THEN
			update Mess set Vacancy = Vacancy +1 where Mess_id= NEW.Mess_id;
		END IF;
	END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `Student_id` varchar(255) NOT NULL,
  `Status` tinyint(1) DEFAULT '0',
  `Amount` int(10) DEFAULT '21200',
  KEY `Student_id` (`Student_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Student_id`) REFERENCES `Student` (`Student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

-- LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES ('21MDSWE177',1,21200),
                              ('21MDSWE164',1,21200),
                              ('21MDSWE147',1,21200);
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room` (
  `Room_id` int(10) NOT NULL AUTO_INCREMENT,
  `Hostel_id` int(10) NOT NULL,
  `Room_No` int(10) NOT NULL,
  `Allocated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Room_id`),
  KEY `Hostel_id` (`Hostel_id`),
  CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `Hostel` (`Hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (100,1,100,1),
                          (200,2,200,1),
                          (300,3,300,1);
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER allocation_update AFTER UPDATE ON Room FOR EACH ROW 
IF NEW.allocated =1 and OLD.allocated!=NEW.allocated THEN 
	update Hostel set current_no_of_rooms=current_no_of_rooms+1, No_of_students = No_of_students+1 where Hostel_id=NEW.Hostel_id;
else 
	if NEW.allocated=0 and OLD.allocated!=NEW.allocated THEN
		update Hostel set current_no_of_rooms = current_no_of_rooms-1, 
        No_of_students = No_of_students-1 where Hostel_id=NEW.Hostel_id;
	END IF;
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `Student_id` varchar(255) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Mob_no` varchar(255) NOT NULL,
  `Dept` varchar(255) NOT NULL,
  `Year_of_study` varchar(255) NOT NULL,
  `Pwd` longtext NOT NULL,
  `Hostel_id` int(10) DEFAULT NULL,
  `Room_id` int(10) DEFAULT NULL,
  `Mess_id` int(10) DEFAULT NULL,
  `Mess_card_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`Student_id`),
  KEY `Hostel_id` (`Hostel_id`),
  KEY `Room_id` (`Room_id`),
  KEY `Mess_id` (`Mess_id`),
  KEY `Mess_card_id` (`Mess_card_id`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `Hostel` (`Hostel_id`),
  CONSTRAINT `Student_ibfk_2` FOREIGN KEY (`Room_id`) REFERENCES `Room` (`Room_id`),
  CONSTRAINT `Student_ibfk_3` FOREIGN KEY (`Mess_id`) REFERENCES `Mess` (`Mess_id`),
  CONSTRAINT `Student_ibfk_4` FOREIGN KEY (`Mess_card_id`) REFERENCES `Mess_Allocation` (`Mess_card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('21MDSWE177','Muhammad','Shah','03193618967','CSE','3','123456',1,100,1,1),
                              ('21MDSWE164','Muhammad','Hashim','0317143067','CS','3','123456',2,200,2,2),
                              ('21MDSWE147','Umama','Habib','03335057439','CSE','3','123456',3,300,3,3);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hostel_management_system'
--
/*!50003 DROP FUNCTION IF EXISTS `GetYearName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetYearName`( yearnumber INT ) RETURNS varchar(30) CHARSET latin1
BEGIN

   DECLARE yearName varchar(30);
   
   if yearnumber=1 then
   set yearName='First';
   end if;
   
   if yearnumber=2 then
   set yearName='Second';
   end if;
   
   if yearnumber=3 then
   set yearName='Third';
   end if;
   
   if yearnumber=4 then
   set yearName='Fourth';
   end if;
   
   
   RETURN yearName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_branch_year` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_branch_year`(IN category nvarchar(30) , IN hos_id int)
BEGIN

if(category='branch') then
	SELECT dept as Department, count(*) as total_student
     from Student where Hostel_id=hos_id
     group by dept
     order by total_student desc;
     
     end if;

if(category='year') then
	SELECT GetYearName(cast(Year_of_study as unsigned)),count(*) as total_student
		 from Student where Hostel_id=hos_id
		 group by Year_of_study
		 order by total_student desc;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `Hostel_Manager_Profile`
--

/*!50001 DROP VIEW IF EXISTS `Hostel_Manager_Profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Hostel_Manager_Profile` AS select `hm`.`Hostel_man_id` AS `Hostel_man_id`,`hm`.`Username` AS `Username`,`hm`.`Fname` AS `Fname`,`hm`.`Lname` AS `Lname`,`hm`.`Mob_no` AS `Mob_no`,`h`.`Hostel_name` AS `Hostel_name`,`m`.`Mess_name` AS `Mess_name`,round(((`h`.`current_no_of_rooms` / `h`.`No_of_rooms`) * 100),1) AS `Hostel_Occupancy`,round((((`m`.`Size` - `m`.`Vacancy`) / `m`.`Size`) * 100),1) AS `Mess_Occupancy` from ((`Hostel_Manager` `hm` join `Hostel` `h` on((`hm`.`Hostel_id` = `h`.`Hostel_id`))) join `Mess` `m` on((`m`.`Mess_id` = `hm`.`Mess_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-20 15:04:56

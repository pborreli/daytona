-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: daytona
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Current Database: `daytona`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `daytona` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `daytona`;

--
-- Table structure for table `ApplicationFrameworkArgs`
--

DROP TABLE IF EXISTS `ApplicationFrameworkArgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApplicationFrameworkArgs` (
  `framework_arg_id` int(11) NOT NULL AUTO_INCREMENT,
  `frameworkid` int(11) DEFAULT NULL,
  `argument_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `widget_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `argument_values` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `argument_default` text COLLATE utf8_unicode_ci,
  `argument_order` int(11) NOT NULL DEFAULT '0',
  `argument_description` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`framework_arg_id`),
  UNIQUE KEY `framework_argument_name` (`argument_name`,`frameworkid`),
  KEY `framework_arg_id` (`framework_arg_id`),
  KEY `argument_name` (`argument_name`),
  KEY `frameworkid` (`frameworkid`),
  CONSTRAINT `ApplicationFrameworkArgs_fk_frameworkid` FOREIGN KEY (`frameworkid`) REFERENCES `ApplicationFrameworkMetadata` (`frameworkid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ApplicationFrameworkArgs`
--

LOCK TABLES `ApplicationFrameworkArgs` WRITE;
/*!40000 ALTER TABLE `ApplicationFrameworkArgs` DISABLE KEYS */;
INSERT INTO `ApplicationFrameworkArgs` VALUES (424,51,'Iterations','text','','3',0,'Number of iterations'),(425,51,'Delay','text','','10',1,'Delay between each iteration');
/*!40000 ALTER TABLE `ApplicationFrameworkArgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ApplicationFrameworkMetadata`
--

DROP TABLE IF EXISTS `ApplicationFrameworkMetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApplicationFrameworkMetadata` (
  `frameworkid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `frameworkname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purpose` text COLLATE utf8_unicode_ci,
  `frameworkowner` text COLLATE utf8_unicode_ci NOT NULL,
  `execution_script_location` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `creation_time` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `show_precommand` tinyint(4) DEFAULT '0',
  `show_postcommand` tinyint(4) DEFAULT '0',
  `show_success_command` tinyint(4) DEFAULT '0',
  `show_failure_command` tinyint(4) DEFAULT '0',
  `show_profiling` tinyint(4) DEFAULT '1',
  `file_root` tinytext COLLATE utf8_unicode_ci,
  `ssh_key` tinytext COLLATE utf8_unicode_ci,
  `shared_exec_host` int(1) DEFAULT NULL,
  `exec_user` tinytext COLLATE utf8_unicode_ci,
  `email_include_results` tinyint(4) DEFAULT NULL,
  `email_results` tinyint(4) DEFAULT '1',
  `default_cc_list` tinytext COLLATE utf8_unicode_ci,
  `multiple_tests` tinyint(4) DEFAULT '0',
  `default_timeout` tinyint(4) DEFAULT '0',
  `argument_passing_format` varchar(128) COLLATE utf8_unicode_ci DEFAULT 'arg_order',
  PRIMARY KEY (`frameworkid`),
  UNIQUE KEY `framework_frameworkname` (`frameworkname`),
  KEY `frameworkid` (`frameworkid`),
  KEY `frameworkname` (`frameworkname`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ApplicationFrameworkMetadata`
--

LOCK TABLES `ApplicationFrameworkMetadata` WRITE;
/*!40000 ALTER TABLE `ApplicationFrameworkMetadata` DISABLE KEYS */;
INSERT INTO `ApplicationFrameworkMetadata` VALUES (51,'Daytona','DaytonaSampleFramework','Sample framework to demonstrate basic features of Daytona','Demonstrate basic features of Daytona','admin','sample_execscript.sh','2017-04-14 23:05:24','2017-04-14 23:06:07',0,0,0,0,0,'/tmp/daytona_root',NULL,NULL,'admin',1,1,NULL,0,0,'arg_order');
/*!40000 ALTER TABLE `ApplicationFrameworkMetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CommonFrameworkAuthentication`
--

DROP TABLE IF EXISTS `CommonFrameworkAuthentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CommonFrameworkAuthentication` (
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `administrator` tinyint(4) NOT NULL DEFAULT '0',
  `frameworkid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`frameworkid`),
  KEY `username` (`username`),
  KEY `frameworkid` (`frameworkid`),
  CONSTRAINT `CommonFrameworkAuthentication_fk_frameworkid` FOREIGN KEY (`frameworkid`) REFERENCES `ApplicationFrameworkMetadata` (`frameworkid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CommonFrameworkAuthentication`
--

LOCK TABLES `CommonFrameworkAuthentication` WRITE;
/*!40000 ALTER TABLE `CommonFrameworkAuthentication` DISABLE KEYS */;
INSERT INTO `CommonFrameworkAuthentication` VALUES ('admin',1,51);
/*!40000 ALTER TABLE `CommonFrameworkAuthentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CommonFrameworkSchedulerQueue`
--

DROP TABLE IF EXISTS `CommonFrameworkSchedulerQueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CommonFrameworkSchedulerQueue` (
  `queueid` int(11) NOT NULL AUTO_INCREMENT,
  `testid` int(11) DEFAULT NULL,
  `state` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `pid` int(11) DEFAULT '0',
  `state_detail` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`queueid`),
  UNIQUE KEY `queue_testid` (`testid`),
  KEY `queueid` (`queueid`),
  KEY `testid` (`testid`),
  CONSTRAINT `CommonFrameworkSchedulerQueue_fk_testid` FOREIGN KEY (`testid`) REFERENCES `TestInputData` (`testid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CommonFrameworkSchedulerQueue`
--

LOCK TABLES `CommonFrameworkSchedulerQueue` WRITE;
/*!40000 ALTER TABLE `CommonFrameworkSchedulerQueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `CommonFrameworkSchedulerQueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CommonHardwareMetadata`
--

DROP TABLE IF EXISTS `CommonHardwareMetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CommonHardwareMetadata` (
  `hostname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'available',
  PRIMARY KEY (`hostname`),
  KEY `hostname` (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CommonHardwareMetadata`
--

LOCK TABLES `CommonHardwareMetadata` WRITE;
/*!40000 ALTER TABLE `CommonHardwareMetadata` DISABLE KEYS */;
INSERT INTO `CommonHardwareMetadata` VALUES ('10.91.35.168','2017-04-14 23:07:24','2017-04-14 23:10:43','available');
/*!40000 ALTER TABLE `CommonHardwareMetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GlassWindow`
--

DROP TABLE IF EXISTS `GlassWindow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GlassWindow` (
  `glasswindowid` int(11) NOT NULL AUTO_INCREMENT,
  `frameworkid` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`glasswindowid`),
  KEY `glasswindowid` (`glasswindowid`),
  KEY `frameworkid` (`frameworkid`),
  CONSTRAINT `GlassWindow_fk_frameworkid` FOREIGN KEY (`frameworkid`) REFERENCES `ApplicationFrameworkMetadata` (`frameworkid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GlassWindow`
--

LOCK TABLES `GlassWindow` WRITE;
/*!40000 ALTER TABLE `GlassWindow` DISABLE KEYS */;
/*!40000 ALTER TABLE `GlassWindow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HostAssociation`
--

DROP TABLE IF EXISTS `HostAssociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HostAssociation` (
  `hostassociationid` int(11) NOT NULL AUTO_INCREMENT,
  `hostassociationtypeid` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `hostname` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hostassociationid`),
  KEY `hostassociationid` (`hostassociationid`),
  KEY `testid` (`testid`),
  KEY `hostassociationtypeid` (`hostassociationtypeid`),
  KEY `hostname` (`hostname`),
  CONSTRAINT `HostAssociation_fk_hostassociationtypeid` FOREIGN KEY (`hostassociationtypeid`) REFERENCES `HostAssociationType` (`hostassociationtypeid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `HostAssociation_fk_hostname` FOREIGN KEY (`hostname`) REFERENCES `CommonHardwareMetadata` (`hostname`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `HostAssociation_fk_testid` FOREIGN KEY (`testid`) REFERENCES `TestInputData` (`testid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3377 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HostAssociation`
--

LOCK TABLES `HostAssociation` WRITE;
/*!40000 ALTER TABLE `HostAssociation` DISABLE KEYS */;
INSERT INTO `HostAssociation` VALUES (3374,149,1000,'10.91.35.168'),(3376,149,1001,'10.91.35.168');
/*!40000 ALTER TABLE `HostAssociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HostAssociationType`
--

DROP TABLE IF EXISTS `HostAssociationType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HostAssociationType` (
  `hostassociationtypeid` int(11) NOT NULL AUTO_INCREMENT,
  `frameworkid` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `shared` tinyint(4) DEFAULT '0',
  `execution` tinyint(4) DEFAULT '1',
  `statistics` tinyint(4) DEFAULT '1',
  `default_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`hostassociationtypeid`),
  UNIQUE KEY `frameworkid_name` (`frameworkid`,`name`),
  KEY `hostassociationtypeid` (`hostassociationtypeid`),
  KEY `frameworkid` (`frameworkid`),
  CONSTRAINT `HostAssociationType_fk_frameworkid` FOREIGN KEY (`frameworkid`) REFERENCES `ApplicationFrameworkMetadata` (`frameworkid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HostAssociationType`
--

LOCK TABLES `HostAssociationType` WRITE;
/*!40000 ALTER TABLE `HostAssociationType` DISABLE KEYS */;
INSERT INTO `HostAssociationType` VALUES (149,51,'execution',0,1,0,'10.91.35.168'),(150,51,'statistics',0,0,1,'');
/*!40000 ALTER TABLE `HostAssociationType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoginAuthentication`
--

DROP TABLE IF EXISTS `LoginAuthentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoginAuthentication` (
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_admin` bit(1) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `user_state` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoginAuthentication`
--

LOCK TABLES `LoginAuthentication` WRITE;
/*!40000 ALTER TABLE `LoginAuthentication` DISABLE KEYS */;
INSERT INTO `LoginAuthentication` VALUES ('admin','',1,'admin@daytona.com','Active');
/*!40000 ALTER TABLE `LoginAuthentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProfilerFramework`
--

DROP TABLE IF EXISTS `ProfilerFramework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProfilerFramework` (
  `profiler_framework_id` int(11) NOT NULL AUTO_INCREMENT,
  `profiler` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `testid` int(11) NOT NULL,
  `processname` varchar(45) COLLATE utf8_unicode_ci,
  `delay` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`profiler_framework_id`),
  KEY `profiler_framework_id` (`profiler_framework_id`),
  KEY `testID_idx` (`testid`),
  CONSTRAINT `testID` FOREIGN KEY (`testid`) REFERENCES `TestInputData` (`testid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProfilerFramework`
--

LOCK TABLES `ProfilerFramework` WRITE;
/*!40000 ALTER TABLE `ProfilerFramework` DISABLE KEYS */;
INSERT INTO `ProfilerFramework` VALUES (1,'STRACE',1001,'httpd',12,15);
/*!40000 ALTER TABLE `ProfilerFramework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TestArgs`
--

DROP TABLE IF EXISTS `TestArgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TestArgs` (
  `testargid` int(11) NOT NULL AUTO_INCREMENT,
  `framework_arg_id` int(11) DEFAULT NULL,
  `testid` int(11) DEFAULT NULL,
  `argument_value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`testargid`),
  UNIQUE KEY `test_framework_arg_id` (`testid`,`framework_arg_id`),
  KEY `testargid` (`testargid`),
  KEY `framework_arg_id` (`framework_arg_id`),
  KEY `testid` (`testid`),
  CONSTRAINT `TestArgs_fk_testid` FOREIGN KEY (`testid`) REFERENCES `TestInputData` (`testid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13625 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TestArgs`
--

LOCK TABLES `TestArgs` WRITE;
/*!40000 ALTER TABLE `TestArgs` DISABLE KEYS */;
INSERT INTO `TestArgs` VALUES (13621,424,1000,'200'),(13622,425,1000,'120'),(13623,424,1001,'200'),(13624,425,1001,'120');
/*!40000 ALTER TABLE `TestArgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TestInputData`
--

DROP TABLE IF EXISTS `TestInputData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TestInputData` (
  `testid` int(11) NOT NULL AUTO_INCREMENT,
  `frameworkid` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `purpose` text COLLATE utf8_unicode_ci,
  `username` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT '1',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creation_time` timestamp NULL DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `end_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precommand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcommand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `success_command` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failure_command` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xml_config` text COLLATE utf8_unicode_ci,
  `exechostname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stathostname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cpu_profiling` tinyint(4) NOT NULL DEFAULT '0',
  `profile_start` int(11) DEFAULT '1',
  `profile_duration` int(11) DEFAULT '60',
  `cc_list` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `availstathosts` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `profiler_framework_id` int(11) DEFAULT NULL,
  `profiler_start_time` datetime DEFAULT NULL,
  `profiler_end_time` datetime DEFAULT NULL,
  `profiler_end_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profilehostname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`testid`),
  KEY `testid` (`testid`),
  KEY `frameworkid` (`frameworkid`),
  KEY `profiler_framework_id` (`profiler_framework_id`),
  CONSTRAINT `TestInputData_fk_frameworkid` FOREIGN KEY (`frameworkid`) REFERENCES `ApplicationFrameworkMetadata` (`frameworkid`) ON DELETE CASCADE,
  CONSTRAINT `TestInputData_fk_profiler_framework_id` FOREIGN KEY (`profiler_framework_id`) REFERENCES `ProfilerFramework` (`profiler_framework_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TestInputData`
--

LOCK TABLES `TestInputData` WRITE;
/*!40000 ALTER TABLE `TestInputData` DISABLE KEYS */;
INSERT INTO `TestInputData` VALUES (1000,51,'Sample Test 1','','admin',1,'2017-04-14 23:08:42','2017-04-14 23:07:24','2017-04-14 23:07:35','2017-04-14 23:08:42','finished clean',NULL,NULL,NULL,NULL,NULL,NULL,'','',0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,NULL,0),(1001,51,'Sample Test 2','','admin',1,'2017-04-14 23:12:17','2017-04-14 23:09:14','2017-04-14 23:11:09','2017-04-14 23:12:17','finished clean',NULL,NULL,NULL,NULL,NULL,NULL,'','',0,NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `TestInputData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TestResultFile`
--

DROP TABLE IF EXISTS `TestResultFile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TestResultFile` (
  `test_result_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `frameworkid` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename_order` int(11) NOT NULL DEFAULT '0',
  `row` int(11) DEFAULT NULL,
  `col` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  PRIMARY KEY (`test_result_file_id`),
  KEY `test_result_file_id` (`test_result_file_id`),
  KEY `filename` (`filename`),
  KEY `frameworkid` (`frameworkid`),
  CONSTRAINT `TestResultFile_fk_frameworkid` FOREIGN KEY (`frameworkid`) REFERENCES `ApplicationFrameworkMetadata` (`frameworkid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2355 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TestResultFile`
--

LOCK TABLES `TestResultFile` WRITE;
/*!40000 ALTER TABLE `TestResultFile` DISABLE KEYS */;
INSERT INTO `TestResultFile` VALUES (2351,51,'results.csv','Application Performance Metrics',0,1,NULL,0,0),(2352,51,'%EXECHOST,0%/sar/cpu.plt:_user','User Mode CPU for Stat Host #0',1,2,NULL,0,0),(2353,51,'%EXECHOST,0%/sar/cpu.plt:_system','System Mode CPU for Stat Host #0',2,3,NULL,0,0),(2354,51,'multicol.csv','CSV File with multiple columns and rows',3,4,NULL,0,0);
/*!40000 ALTER TABLE `TestResultFile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-14 23:14:13

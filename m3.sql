-- MySQL dump 10.16  Distrib 10.1.20-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.20-MariaDB-1~jessie

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `thumbnail_base_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_path` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_author` (`created_by`),
  KEY `fk_article_updater` (`updated_by`),
  KEY `fk_article_category` (`category_id`),
  CONSTRAINT `fk_article_author` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_updater` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_attachment`
--

DROP TABLE IF EXISTS `article_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `base_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_attachment_article` (`article_id`),
  CONSTRAINT `fk_article_attachment_article` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_attachment`
--

LOCK TABLES `article_attachment` WRITE;
/*!40000 ALTER TABLE `article_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_category_section` (`parent_id`),
  CONSTRAINT `fk_article_category_section` FOREIGN KEY (`parent_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--

LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
INSERT INTO `article_category` VALUES (1,'news','News',NULL,NULL,1,1486399429,NULL),(2,'story','Story',NULL,NULL,2,1486399430,1486399430);
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_storage_item`
--

DROP TABLE IF EXISTS `file_storage_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_storage_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL,
  `base_url` varchar(1024) NOT NULL,
  `path` varchar(1024) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upload_ip` varchar(15) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `l` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_storage_item`
--

LOCK TABLES `file_storage_item` WRITE;
/*!40000 ALTER TABLE `file_storage_item` DISABLE KEYS */;
INSERT INTO `file_storage_item` VALUES (1,'story','https://s3.amazonaws.com/m3-server-dev/media/','AWS S3: m3-server-dev/media/','jpg',14789,'176f3b9c-71dc-4394-9221-539ad5eaa9c9','172.19.0.3',1486400766,810,540,640),(2,'story','https://s3.amazonaws.com/m3-server-dev/media/','AWS S3: m3-server-dev/media/','jpg',14789,'854cd96f-b2dc-433b-b408-53f30848d261','172.19.0.3',1486415585,810,540,640);
/*!40000 ALTER TABLE `file_storage_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n_message`
--

DROP TABLE IF EXISTS `i18n_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i18n_message` (
  `id` int(11) NOT NULL,
  `language` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `translation` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`,`language`),
  CONSTRAINT `fk_i18n_message_source_message` FOREIGN KEY (`id`) REFERENCES `i18n_source_message` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i18n_message`
--

LOCK TABLES `i18n_message` WRITE;
/*!40000 ALTER TABLE `i18n_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `i18n_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n_source_message`
--

DROP TABLE IF EXISTS `i18n_source_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i18n_source_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i18n_source_message`
--

LOCK TABLES `i18n_source_message` WRITE;
/*!40000 ALTER TABLE `i18n_source_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `i18n_source_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itinerary`
--

DROP TABLE IF EXISTS `itinerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itinerary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `market_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '4',
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itinerary`
--

LOCK TABLES `itinerary` WRITE;
/*!40000 ALTER TABLE `itinerary` DISABLE KEYS */;
INSERT INTO `itinerary` VALUES (1,'Dnieper 2017 EDIT by Admin','Rhine Getaway',1483375609,1,1486592883,1,NULL),(2,'Bsl-Ams','Rhine Getaway',0,4,NULL,NULL,NULL),(3,'Opo-Opo','Portugal\'s River of Gold',0,4,NULL,NULL,NULL),(4,'Ams-Ams','Tulips & Windmills',0,4,NULL,NULL,NULL),(5,'Ams-Bud','Grand European Tour',0,4,NULL,NULL,NULL),(6,'Asw-Saf','Pathways of the Pharaohs',0,4,NULL,NULL,NULL),(7,'Avn-Lio','Lyon & Provence',0,4,NULL,NULL,NULL),(8,'Bod-Bod','Chateaux, Rivers & Wine',0,4,NULL,NULL,NULL),(9,'Bsl-Tri','Paris to the Swiss Alps',0,4,NULL,NULL,NULL),(10,'Bud-Ams','Grand European Tour',0,4,NULL,NULL,NULL),(11,'Bud-Buh','Passage to Eastern Europe',0,4,NULL,NULL,NULL),(12,'Bud-Nue','Romantic Danube',0,4,NULL,NULL,NULL),(13,'Bud-Pas','Danube Waltz',0,4,NULL,NULL,NULL),(14,'Buh-Bud','Passage to Eastern Europe',0,4,NULL,NULL,NULL),(15,'Iev-Ods','Footsteps of the Cossacks',0,4,NULL,NULL,NULL),(16,'Led-Mow','Waterways of the Tsars',0,4,NULL,NULL,NULL),(17,'Lio-Avn','Lyon & Provence',0,4,NULL,NULL,NULL),(18,'Mag-Mel','Elegant Elbe',0,4,NULL,NULL,NULL),(19,'Mel-Mag','Elegant Elbe',0,4,NULL,NULL,NULL),(20,'Mow-Led','Waterways of the Tsars',0,4,NULL,NULL,NULL),(21,'Nue-Bud','Romantic Danube',0,4,NULL,NULL,NULL),(22,'Nue-Tri','Cities of Light',0,4,NULL,NULL,NULL),(23,'Ods-Iev','Footsteps of the Cossacks',0,4,NULL,NULL,NULL),(24,'Par-Par','Paris & the Heart of Normandy',0,4,NULL,NULL,NULL),(25,'Pas-Bud','Danube Waltz',0,4,NULL,NULL,NULL),(26,'Saf-Asw','Pathways of the Pharaohs',0,4,NULL,NULL,NULL),(27,'Tri-Bsl','Paris to the Swiss Alps',0,4,NULL,NULL,NULL),(28,'Tri-Nue','Cities of Light',0,4,NULL,NULL,NULL),(29,'Wtg-Dcb','Elegant Elbe',0,4,NULL,NULL,NULL),(30,'Dcb-Wtg','Elegant Elbe',0,4,NULL,NULL,NULL);
/*!40000 ALTER TABLE `itinerary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key_storage_item`
--

DROP TABLE IF EXISTS `key_storage_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `key_storage_item` (
  `key` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `idx_key_storage_item_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_storage_item`
--

LOCK TABLES `key_storage_item` WRITE;
/*!40000 ALTER TABLE `key_storage_item` DISABLE KEYS */;
INSERT INTO `key_storage_item` VALUES ('backend.layout-boxed','0',NULL,NULL,NULL),('backend.layout-collapsed-sidebar','0',NULL,NULL,NULL),('backend.layout-fixed','0',NULL,NULL,NULL),('backend.theme-skin','skin-blue','skin-blue, skin-black, skin-purple, skin-green, skin-red, skin-yellow',NULL,NULL),('frontend.maintenance','disabled','Set it to \"true\" to turn on maintenance mode',NULL,NULL);
/*!40000 ALTER TABLE `key_storage_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'about','About','Lorem ipsum dolor sit amet, consectetur adipiscing elit.',NULL,1,1486399429,1486399429);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_auth_assignment`
--

DROP TABLE IF EXISTS `rbac_auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `rbac_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_auth_assignment`
--

LOCK TABLES `rbac_auth_assignment` WRITE;
/*!40000 ALTER TABLE `rbac_auth_assignment` DISABLE KEYS */;
INSERT INTO `rbac_auth_assignment` VALUES ('administrator','1',1486399438),('manager','2',1486399438),('user','3',1486399438);
/*!40000 ALTER TABLE `rbac_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_auth_item`
--

DROP TABLE IF EXISTS `rbac_auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `rbac_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `rbac_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_auth_item`
--

LOCK TABLES `rbac_auth_item` WRITE;
/*!40000 ALTER TABLE `rbac_auth_item` DISABLE KEYS */;
INSERT INTO `rbac_auth_item` VALUES ('administrator',1,NULL,NULL,NULL,1486399438,1486399438),('editOwnModel',2,NULL,'ownModelRule',NULL,1486399438,1486399438),('loginToBackend',2,NULL,NULL,NULL,1486399438,1486399438),('manager',1,NULL,NULL,NULL,1486399438,1486399438),('user',1,NULL,NULL,NULL,1486399438,1486399438);
/*!40000 ALTER TABLE `rbac_auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_auth_item_child`
--

DROP TABLE IF EXISTS `rbac_auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `rbac_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rbac_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_auth_item_child`
--

LOCK TABLES `rbac_auth_item_child` WRITE;
/*!40000 ALTER TABLE `rbac_auth_item_child` DISABLE KEYS */;
INSERT INTO `rbac_auth_item_child` VALUES ('administrator','manager'),('manager','loginToBackend'),('manager','user'),('user','editOwnModel');
/*!40000 ALTER TABLE `rbac_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_auth_rule`
--

DROP TABLE IF EXISTS `rbac_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_auth_rule`
--

LOCK TABLES `rbac_auth_rule` WRITE;
/*!40000 ALTER TABLE `rbac_auth_rule` DISABLE KEYS */;
INSERT INTO `rbac_auth_rule` VALUES ('ownModelRule','O:29:\"common\\rbac\\rule\\OwnModelRule\":3:{s:4:\"name\";s:12:\"ownModelRule\";s:9:\"createdAt\";i:1486399438;s:9:\"updatedAt\";i:1486399438;}',1486399438,1486399438);
/*!40000 ALTER TABLE `rbac_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship`
--

DROP TABLE IF EXISTS `ship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ship` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ship_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `capacity` smallint(4) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '4',
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship`
--

LOCK TABLES `ship` WRITE;
/*!40000 ALTER TABLE `ship` DISABLE KEYS */;
INSERT INTO `ship` VALUES (1,'Fontane','FON',112,0,4,NULL,NULL,NULL),(2,'Freya','FRY',190,0,4,NULL,NULL,NULL),(3,'Aegir','AGR',190,0,4,NULL,NULL,NULL),(4,'Atla','ATL',190,0,4,NULL,NULL,NULL),(5,'Baldur','BLD',190,0,4,NULL,NULL,NULL),(6,'Bestla','BST',190,0,4,NULL,NULL,NULL),(7,'Bragi','BRA',190,0,4,NULL,NULL,NULL),(8,'Delling','DLL',190,0,4,NULL,NULL,NULL),(9,'Eistla','EST',190,0,4,NULL,NULL,NULL),(10,'Embla','EMB',190,0,4,NULL,NULL,NULL),(11,'Idi','IDI',190,0,4,NULL,NULL,NULL),(12,'Idun','IDN',190,0,4,NULL,NULL,NULL),(13,'Jarl','JRL',190,0,4,NULL,NULL,NULL),(14,'Kvasir','KVS',190,0,4,NULL,NULL,NULL),(15,'Legend','LGD',187,0,4,NULL,NULL,NULL),(16,'Lif','LIF',190,0,4,NULL,NULL,NULL),(17,'Magni','MGN',190,0,4,NULL,NULL,NULL),(18,'Njord','NJD',190,0,4,NULL,NULL,NULL),(19,'Odin','ODN',190,0,4,NULL,NULL,NULL),(20,'Prestige','PRS',188,0,4,NULL,NULL,NULL),(21,'Rinda','RND',190,0,4,NULL,NULL,NULL),(22,'Schumann','SCH',112,0,4,NULL,NULL,NULL),(23,'Skadi','SKD',190,0,4,NULL,NULL,NULL),(24,'Akun','AKN',190,0,4,NULL,NULL,NULL),(25,'Alsvin','ALS',190,0,4,NULL,NULL,NULL),(26,'Buri','BRI',190,0,4,NULL,NULL,NULL),(27,'Beyla','BEY',100,0,4,NULL,NULL,NULL),(28,'Astrild','AST',100,0,4,NULL,NULL,NULL),(29,'Forseti','FRS',190,0,4,NULL,NULL,NULL),(30,'Gullveig','GLL',190,0,4,NULL,NULL,NULL),(31,'Heimdal','HMD',190,0,4,NULL,NULL,NULL),(32,'Helgi','HLG',204,0,4,NULL,NULL,NULL),(33,'Helvetia ','HII',194,0,4,NULL,NULL,NULL),(34,'Hemming','HMM',106,0,4,NULL,NULL,NULL),(35,'Hermod','HRM',190,0,4,NULL,NULL,NULL),(36,'Ingvar','ING',204,0,4,NULL,NULL,NULL),(37,'Ingvi','NGV',190,0,4,NULL,NULL,NULL),(38,'Rurik','RRK',196,0,4,NULL,NULL,NULL),(39,'Sineus','SNS',196,0,4,NULL,NULL,NULL),(40,'Sun','SUN',194,0,4,NULL,NULL,NULL),(41,'Tor','TOR',190,0,4,NULL,NULL,NULL),(42,'Torgil','TRG',106,0,4,NULL,NULL,NULL),(43,'Truvor','TRV',204,0,4,NULL,NULL,NULL),(44,'Var ','VAR',190,0,4,NULL,NULL,NULL),(45,'Kara','KAR',190,0,4,NULL,NULL,NULL),(46,'Hlin','HLN',190,0,4,NULL,NULL,NULL),(47,'Mani','MAN',190,0,4,NULL,NULL,NULL),(48,'Eir','EIR',190,0,4,NULL,NULL,NULL),(49,'Lofn','LFN',190,0,4,NULL,NULL,NULL),(50,'Vidar','VDR',190,0,4,NULL,NULL,NULL),(51,'Skirnir','SKR',190,0,4,NULL,NULL,NULL),(52,'Modi','MOD',190,0,4,NULL,NULL,NULL),(53,'Gefjon','GFJ',190,0,4,NULL,NULL,NULL),(54,'Ve','VVE',190,0,4,NULL,NULL,NULL),(55,'Mimir','MMR',190,0,4,NULL,NULL,NULL),(56,'Vili','VIL',190,0,4,NULL,NULL,NULL),(57,'XL41','XL41',190,0,4,NULL,NULL,NULL),(58,'XL42','XL42',190,0,4,NULL,NULL,NULL),(59,'Neptune','NEP',148,0,4,NULL,NULL,NULL),(60,'Pride','PRI',148,0,4,NULL,NULL,NULL),(61,'Spirit','SPI',148,0,4,NULL,NULL,NULL),(62,'Vali','VAL',190,0,4,NULL,NULL,NULL),(63,'Tir','TIR',190,0,4,NULL,NULL,NULL),(64,'Tialfi','TLF',190,0,4,NULL,NULL,NULL),(65,'Sigrun','SGR',190,0,4,NULL,NULL,NULL),(66,'Hild','HID',190,0,4,NULL,NULL,NULL),(67,'Herja','HRJ',190,0,4,NULL,NULL,NULL),(68,'Egil','EGL',190,0,4,NULL,NULL,NULL),(69,'Alruna','ALR',190,0,4,NULL,NULL,NULL),(70,'Vilhjalm','VLH',190,0,4,NULL,NULL,NULL),(71,'Rolf','RLF',190,0,4,NULL,NULL,NULL),(72,'Kadlin','KDN',190,0,4,NULL,NULL,NULL),(73,'Einar','EIN',190,0,4,NULL,NULL,NULL),(74,'Osfrid','OSF',106,0,4,NULL,NULL,NULL),(75,'Emerald','EMR',256,0,4,NULL,NULL,NULL),(76,'Mekong','MEK',56,0,4,NULL,NULL,NULL),(77,'Mayfair','MAY',50,0,4,NULL,NULL,NULL),(78,'Nile','NL',50,0,4,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story`
--

DROP TABLE IF EXISTS `story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `story` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `itinerary_id` int(11) unsigned DEFAULT NULL,
  `image_id` int(11) unsigned DEFAULT NULL,
  `ship_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `access_token` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `captured_at` int(11) DEFAULT NULL,
  `completed` int(1) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `postal_code` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completed_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '4',
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_story_user1` (`user_id`),
  KEY `fk_story_file_storage_item1` (`image_id`),
  KEY `fk_story_ship1` (`ship_id`),
  KEY `fk_story_itinerary1` (`itinerary_id`),
  CONSTRAINT `fk_story_itinerary1` FOREIGN KEY (`itinerary_id`) REFERENCES `itinerary` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_story_ship1` FOREIGN KEY (`ship_id`) REFERENCES `ship` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_story_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story`
--

LOCK TABLES `story` WRITE;
/*!40000 ALTER TABLE `story` DISABLE KEYS */;
INSERT INTO `story` VALUES (1,10,NULL,7,NULL,'hKWKzT7_f0IQacjHBsBFXlY_QEe0rEogdg_MgaDg',1483647478,1,'This is description text. EDIT.','test@m3-server.dev','Paris, FR',48.856614,2.352222,'ABC-123',NULL,1486408295,4,1486594100,2,NULL),(2,NULL,NULL,NULL,NULL,'J-4EOs8uUbZ4-UBFHj_bvpkE90mt4BC-LH4y5jrr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486415590,4,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,'emkiHqDc6Ybc48T782BMnyo792hQN-_U3lpqCK2j',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486417718,4,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,'G7-h9ZgxJyxyASzstB3o03UF61jlZC4Nxd02q9gq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486431213,4,NULL,NULL,NULL),(5,NULL,NULL,NULL,NULL,'7dbFGaEY1ht99Bf9tmIVt_xkCD_6xo0bQH6g2tq-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486431960,4,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL,'QHz3MtVChEY-gfqxVRgl9Qc6ufOujWyNCZrTBL1S',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486478886,4,NULL,NULL,NULL),(7,NULL,NULL,NULL,NULL,'P5w4qnZoDcHQjt9_0F7FR51ygzYfaJpsMPnBhmm0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486484900,4,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,'1Nf1AUIB4P65WKbCk36XfKnwbIbii_5ELky9h0BO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486485296,4,NULL,NULL,NULL),(9,NULL,NULL,NULL,NULL,'hWIkRE99C9pHukSzNnDpN2p2bNiHrAa58xqja1iz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486485439,4,NULL,NULL,NULL),(10,NULL,NULL,NULL,NULL,'08NicobhYl2ukoKpZXE34IByRy2-dCjA_iVDP1D_',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486485487,4,NULL,NULL,NULL),(11,NULL,NULL,NULL,NULL,'ZxOJZNHbGB4BDLfg17X5dzn7nR3XUT5hNvw_j0Oo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486485500,4,NULL,NULL,NULL),(12,NULL,NULL,NULL,NULL,'NAtZeHKWyGuFly8m9Q8-X_483hYZzoIT81hUiHja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486485562,4,NULL,NULL,NULL),(13,NULL,NULL,NULL,NULL,'z3klz0fJDzDH4DkEVvk1zlE1kSRQlzwzMdPbFQRD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486485866,4,NULL,NULL,NULL),(14,NULL,NULL,NULL,NULL,'YDojVazq7GMW2feG689QEJH5-0RmeJwPZP0K1xMn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486486143,4,NULL,NULL,NULL),(15,NULL,NULL,NULL,NULL,'WE8S9oUDe2Bno93wocmc-lPtJoQCIUhYDgVKnOPh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486486245,4,NULL,NULL,NULL),(16,NULL,NULL,NULL,NULL,'HoszJziAy5qfNW2gzm18f3OTMGstyj_ll-EMAk1a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486572169,4,NULL,NULL,NULL),(17,NULL,NULL,NULL,NULL,'QPfX-elkjR_1Y_thCUZ4OC8FZqhc1k5I_gDsy7nX',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486572219,4,NULL,NULL,NULL),(18,NULL,NULL,NULL,NULL,'9FZFUmxv5z1EqBCO6odTm2zF9wdEWfko0lVou8Pd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486572297,4,NULL,NULL,NULL),(19,NULL,NULL,NULL,NULL,'F0-X2r2fwkgogooqtl2k7NPrFhV1x9qFElTdcJLH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486572344,4,NULL,NULL,NULL),(20,NULL,NULL,NULL,NULL,'qePjpz9fanQ-QNV1O5f2igpuPtC0S_Rr7kFDcXvn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486572868,4,NULL,NULL,NULL),(21,NULL,NULL,NULL,NULL,'B0rpGuyZnItU5edPeLjhS9nGtfgpBG8VWfMq3ygF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486572905,4,NULL,NULL,NULL),(22,NULL,NULL,NULL,NULL,'Li8U1M6LxnAenwCbyrLBI9iWQJi10tdWedMmpW34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486573360,4,NULL,NULL,NULL),(23,NULL,NULL,NULL,NULL,'XAF-kpzkwowZTxQM3-DuIKb7COZjo2P2NT6VxPjP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486573611,4,NULL,NULL,NULL),(24,NULL,NULL,NULL,NULL,'YCflyoOlDLY_9Q2TA7uwcV3BtQ9BGvatDNTSb1pw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486573795,4,NULL,NULL,NULL),(25,NULL,NULL,NULL,NULL,'-tKbMhaQs46zA2S9l--vju_gFhGVyA5ysIMZAcO8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486579274,4,NULL,NULL,NULL),(26,NULL,NULL,NULL,NULL,'8qzmbkXidgarIuSg-ZKL7ECmPCeZpGKCx_PzE0zI',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486579737,4,NULL,NULL,NULL),(27,NULL,NULL,NULL,NULL,'BlPI8lH7_S2EPwYbEa65KjQxw2AlqQeTt-7CqYMM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486580318,4,NULL,NULL,NULL),(28,NULL,NULL,NULL,NULL,'2MU_wSFKd_BaF9boUPZHio1Xf1hE9Xi-MY16iXiS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486580391,4,NULL,NULL,NULL),(29,NULL,NULL,NULL,NULL,'bOES_CXPilP-zPztSm8f45D40FN3lHUgJi8ctGhX',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486580503,4,NULL,NULL,NULL),(30,NULL,NULL,NULL,NULL,'9q8uVJaZlhrgp1i0X6qQzcNs6gIbCv9bL3iU6bVQ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486580557,4,NULL,NULL,NULL),(31,NULL,NULL,NULL,NULL,'CAzopwy93y2CKp0s4DzDRAITOc_BBq41Vu77ReeR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486581335,4,NULL,NULL,NULL),(32,NULL,NULL,NULL,NULL,'tYu7BUS5398OcOUeLoy97odcHNlgGHj7Nw7IDdBX',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486581568,4,NULL,NULL,NULL),(33,NULL,NULL,NULL,NULL,'vgIFE276qT--d-hCh3ecJud4fDgkYrSWChScuWF8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486582106,4,NULL,NULL,NULL),(34,NULL,NULL,NULL,NULL,'TsRIyYvs2rtqZMo64e4D6xGtIwzNLeuNbaiHbkZi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486582440,4,NULL,NULL,NULL),(35,NULL,NULL,NULL,NULL,'x79xVclP1an42yxnYlg91cxFQH9EYt5LG5fKYYu6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486582523,4,NULL,NULL,NULL),(36,NULL,NULL,NULL,NULL,'xqv5NhVB_PubqLEQAy7kKP4TadJIho69VIyaTd2s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486584248,4,NULL,NULL,NULL),(37,NULL,NULL,NULL,NULL,'BqLXfDAUzquEyiu0YUGAeycH14cu5_k0widYDJbO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486584454,4,NULL,NULL,NULL),(38,NULL,NULL,NULL,NULL,'2OXwnz_OVJMqqOhvyHs52YsEtGNEZKLXIXKj6_qN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486584530,4,NULL,NULL,NULL),(39,NULL,NULL,NULL,NULL,'APeDwN16VAafhHrZMHI2UbgENAZTys33P_7jxLS5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486584676,4,NULL,NULL,NULL),(40,NULL,NULL,NULL,NULL,'MekVDRHLMenUaMLbB5qKDKl5iWWNRQvwZmtlF9AG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486584772,4,NULL,NULL,NULL),(41,NULL,NULL,NULL,NULL,'_ShDmVN8fm-odMsaUY5JrQGbqvtyRvBjRSzqxFj8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486584791,4,NULL,NULL,NULL),(42,NULL,NULL,NULL,NULL,'mtwmIZlUfQk9wZsQHbNdFxXkQq8EZTt-r5Q072tF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486585075,4,NULL,NULL,NULL),(43,NULL,NULL,NULL,NULL,'8PHyxR7z1KD7gly5Jon8vSaqKpRNWmNBMMutm8y1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486585075,4,NULL,NULL,NULL),(44,NULL,NULL,NULL,NULL,'GYCZ38B7OCSk7MZMaFCnKpPrhAwx_9zCIeJOtJWj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486589677,4,NULL,NULL,NULL),(45,NULL,NULL,NULL,NULL,'x5S6PvB-7HBs3_W6u6Fegtp9S7Gw9tqseoH0I7D1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486589677,4,NULL,NULL,NULL),(46,NULL,NULL,NULL,NULL,'4QYL4deFAGeO_E-c-orxjn7XUr0ISdIZ-iAbiJdy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486590295,4,NULL,NULL,NULL);
/*!40000 ALTER TABLE `story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_db_migration`
--

DROP TABLE IF EXISTS `system_db_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_db_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_db_migration`
--

LOCK TABLES `system_db_migration` WRITE;
/*!40000 ALTER TABLE `system_db_migration` DISABLE KEYS */;
INSERT INTO `system_db_migration` VALUES ('m000000_000000_base',1486399417),('m140703_123000_user',1486399418),('m140703_123055_log',1486399419),('m140703_123104_page',1486399419),('m140703_123803_article',1486399422),('m140703_123813_rbac',1486399423),('m140709_173306_widget_menu',1486399423),('m140709_173333_widget_text',1486399424),('m140712_123329_widget_carousel',1486399424),('m140805_084745_key_storage_item',1486399425),('m141012_101932_i18n_tables',1486399426),('m150318_213934_file_storage_item',1486399426),('m150414_195800_timeline_event',1486399426),('m150725_192740_seed_data',1486399429),('m150929_074021_article_attachment_order',1486399429),('m160203_095604_user_token',1486399429),('M170104150725AddSystemUserAndArticleCategoryForStories',1486399430),('M170106194403AddedItineraryShipStoryTables',1486399433),('m170111211712AddShipAndItineraryData',1486399433),('M170111213211AddBlameableAndTimestampBehavior',1486399436),('m170112_222659_UpdateFileStorageItemWithCroppingFields',1486399437),('m170202_145155_UpdateStoryTableAccessTokenColTo40Chars',1486399438);
/*!40000 ALTER TABLE `system_db_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
INSERT INTO `system_log` VALUES (1,1,'Exception',1486590769.6544,'[frontend][/api/v1/story/update?id=1&XDEBUG_SESSION_START=PHPSTORM]','Exception: Editing of completed stories can only be completed by authenticated users. in /code/common/models/Story.php:203\nStack trace:\n#0 [internal function]: common\\models\\Story::checkAcl(Object(yii\\base\\ModelEvent))\n#1 /code/vendor/yiisoft/yii2/base/Component.php(540): call_user_func(Array, Object(yii\\base\\ModelEvent))\n#2 /code/vendor/yiisoft/yii2/db/BaseActiveRecord.php(927): yii\\base\\Component->trigger(\'beforeUpdate\', Object(yii\\base\\ModelEvent))\n#3 /code/vendor/yiisoft/yii2/db/BaseActiveRecord.php(747): yii\\db\\BaseActiveRecord->beforeSave(false)\n#4 /code/vendor/yiisoft/yii2/db/ActiveRecord.php(533): yii\\db\\BaseActiveRecord->updateInternal(NULL)\n#5 /code/vendor/yiisoft/yii2/db/BaseActiveRecord.php(634): yii\\db\\ActiveRecord->update(true, NULL)\n#6 /code/vendor/yiisoft/yii2/rest/UpdateAction.php(46): yii\\db\\BaseActiveRecord->save()\n#7 [internal function]: yii\\rest\\UpdateAction->run(\'1\')\n#8 /code/vendor/yiisoft/yii2/base/Action.php(92): call_user_func_array(Array, Array)\n#9 /code/vendor/yiisoft/yii2/base/Controller.php(154): yii\\base\\Action->runWithParams(Array)\n#10 /code/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'update\', Array)\n#11 /code/vendor/yiisoft/yii2/web/Application.php(100): yii\\base\\Module->runAction(\'api/v1/story/up...\', Array)\n#12 /code/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#13 /code/frontend/web/index.php(22): yii\\base\\Application->run()\n#14 {main}'),(2,1,'Exception',1486590857.1159,'[frontend][/api/v1/story/update?id=1&XDEBUG_SESSION_START=PHPSTORM]','Exception: Editing of completed stories can only be completed by authenticated users. in /code/common/models/Story.php:203\nStack trace:\n#0 [internal function]: common\\models\\Story::checkAcl(Object(yii\\base\\ModelEvent))\n#1 /code/vendor/yiisoft/yii2/base/Component.php(540): call_user_func(Array, Object(yii\\base\\ModelEvent))\n#2 /code/vendor/yiisoft/yii2/db/BaseActiveRecord.php(927): yii\\base\\Component->trigger(\'beforeUpdate\', Object(yii\\base\\ModelEvent))\n#3 /code/vendor/yiisoft/yii2/db/BaseActiveRecord.php(747): yii\\db\\BaseActiveRecord->beforeSave(false)\n#4 /code/vendor/yiisoft/yii2/db/ActiveRecord.php(533): yii\\db\\BaseActiveRecord->updateInternal(NULL)\n#5 /code/vendor/yiisoft/yii2/db/BaseActiveRecord.php(634): yii\\db\\ActiveRecord->update(true, NULL)\n#6 /code/vendor/yiisoft/yii2/rest/UpdateAction.php(46): yii\\db\\BaseActiveRecord->save()\n#7 [internal function]: yii\\rest\\UpdateAction->run(\'1\')\n#8 /code/vendor/yiisoft/yii2/base/Action.php(92): call_user_func_array(Array, Array)\n#9 /code/vendor/yiisoft/yii2/base/Controller.php(154): yii\\base\\Action->runWithParams(Array)\n#10 /code/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'update\', Array)\n#11 /code/vendor/yiisoft/yii2/web/Application.php(100): yii\\base\\Module->runAction(\'api/v1/story/up...\', Array)\n#12 /code/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#13 /code/frontend/web/index.php(22): yii\\base\\Application->run()\n#14 {main}'),(3,1,'yii\\base\\UnknownMethodException',1486591142.3235,'[frontend][/api/v1/story/update?id=1&XDEBUG_SESSION_START=PHPSTORM]','yii\\base\\UnknownMethodException: Calling unknown method: frontend\\modules\\api\\v1\\resources\\Story::checkAcl() in /code/vendor/yiisoft/yii2/base/Component.php:285\nStack trace:\n#0 [internal function]: yii\\base\\Component->__call(\'checkAcl\', Array)\n#1 /code/vendor/yiisoft/yii2/base/Component.php(540): call_user_func(Array, Object(yii\\base\\ModelEvent))\n#2 /code/vendor/yiisoft/yii2/db/BaseActiveRecord.php(927): yii\\base\\Component->trigger(\'beforeUpdate\', Object(yii\\base\\ModelEvent))\n#3 /code/vendor/yiisoft/yii2/db/BaseActiveRecord.php(747): yii\\db\\BaseActiveRecord->beforeSave(false)\n#4 /code/vendor/yiisoft/yii2/db/ActiveRecord.php(533): yii\\db\\BaseActiveRecord->updateInternal(NULL)\n#5 /code/vendor/yiisoft/yii2/db/BaseActiveRecord.php(634): yii\\db\\ActiveRecord->update(true, NULL)\n#6 /code/vendor/yiisoft/yii2/rest/UpdateAction.php(46): yii\\db\\BaseActiveRecord->save()\n#7 [internal function]: yii\\rest\\UpdateAction->run(\'1\')\n#8 /code/vendor/yiisoft/yii2/base/Action.php(92): call_user_func_array(Array, Array)\n#9 /code/vendor/yiisoft/yii2/base/Controller.php(154): yii\\base\\Action->runWithParams(Array)\n#10 /code/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'update\', Array)\n#11 /code/vendor/yiisoft/yii2/web/Application.php(100): yii\\base\\Module->runAction(\'api/v1/story/up...\', Array)\n#12 /code/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#13 /code/frontend/web/index.php(22): yii\\base\\Application->run()\n#14 {main}'),(4,1,'ParseError',1486591609.0852,'[frontend][/api/v1/story/update?id=1&XDEBUG_SESSION_START=PHPSTORM]','ParseError: syntax error, unexpected \')\', expecting \']\' in /code/common/models/Story.php:201\nStack trace:\n#0 [internal function]: yii\\BaseYii::autoload(\'common\\\\models\\\\S...\')\n#1 /code/frontend/modules/api/v1/resources/Story.php(12): spl_autoload_call(\'common\\\\models\\\\S...\')\n#2 /code/vendor/yiisoft/yii2/BaseYii.php(288): include(\'/code/frontend/...\')\n#3 [internal function]: yii\\BaseYii::autoload(\'frontend\\\\module...\')\n#4 /code/vendor/yiisoft/yii2/rest/Action.php(88): spl_autoload_call(\'frontend\\\\module...\')\n#5 /code/vendor/yiisoft/yii2/rest/UpdateAction.php(38): yii\\rest\\Action->findModel(\'1\')\n#6 [internal function]: yii\\rest\\UpdateAction->run(\'1\')\n#7 /code/vendor/yiisoft/yii2/base/Action.php(92): call_user_func_array(Array, Array)\n#8 /code/vendor/yiisoft/yii2/base/Controller.php(154): yii\\base\\Action->runWithParams(Array)\n#9 /code/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction(\'update\', Array)\n#10 /code/vendor/yiisoft/yii2/web/Application.php(100): yii\\base\\Module->runAction(\'api/v1/story/up...\', Array)\n#11 /code/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#12 /code/frontend/web/index.php(22): yii\\base\\Application->run()\n#13 {main}'),(5,2,'yii\\log\\Dispatcher::dispatch',1486591825.6156,'[frontend][/api/v1/story/update?id=1]','Unable to send log via yii\\debug\\LogTarget: Bad Request: Invalid JSON data in request body: Syntax error.');
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_rbac_migration`
--

DROP TABLE IF EXISTS `system_rbac_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_rbac_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_rbac_migration`
--

LOCK TABLES `system_rbac_migration` WRITE;
/*!40000 ALTER TABLE `system_rbac_migration` DISABLE KEYS */;
INSERT INTO `system_rbac_migration` VALUES ('m000000_000000_base',1486399438),('m150625_214101_roles',1486399438),('m150625_215624_init_permissions',1486399438),('m151223_074604_edit_own_model',1486399438);
/*!40000 ALTER TABLE `system_rbac_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeline_event`
--

DROP TABLE IF EXISTS `timeline_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeline_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeline_event`
--

LOCK TABLES `timeline_event` WRITE;
/*!40000 ALTER TABLE `timeline_event` DISABLE KEYS */;
INSERT INTO `timeline_event` VALUES (1,'frontend','user','signup','{\"public_identity\":\"webmaster\",\"user_id\":1,\"created_at\":1486399426}',1486399426),(2,'frontend','user','signup','{\"public_identity\":\"manager\",\"user_id\":2,\"created_at\":1486399426}',1486399426),(3,'frontend','user','signup','{\"public_identity\":\"user\",\"user_id\":3,\"created_at\":1486399426}',1486399426);
/*!40000 ALTER TABLE `timeline_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `oauth_client` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oauth_client_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '2',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `logged_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'webmaster','jvag-f61uVa_x5Vg4EHRxWTBwoddS-zw','LM94ASuSGNasCTncnS59rF-WmLpRjsfMT5dmXyJn','$2y$13$rND7jtY3DdOsibsUF4r9D.nCXljBSDMpIJ4iaUVqswOXjJGdHfQVy',NULL,NULL,'webmaster@example.com',2,1486399427,1486399427,1486592883),(2,'manager','RgTvmUBPqS4iyhKr72T6yHY4D4LZfpAb','bcxY4dnBiM02jQyBnniOcdjD8Q6Vlem14EZ5AQhV','$2y$13$PTMGdLw3Pqz.SIgnGQlWrui2JtUDq5V8N7H.4L4pKvKVe0h6Lqu9i',NULL,NULL,'manager@example.com',2,1486399428,1486399428,1486594102),(3,'user','FZlXRVOgNIL7kD4W1EJhLFBRiQstEPTa','GBDmH5yhjhF5zrA7asmWcseYIv7DP_7aU2zntv5A','$2y$13$0xzaD3PQDsCWsiBc6fI5rOWD6IR4To3miFP28tH0zutEUzBPPE0OK',NULL,NULL,'user@example.com',2,1486399429,1486399429,NULL),(4,'system','zneACWyAHX0IjNZDPtmoSKV610C4YDf5','abcdefghijklmnopqrstuvwxyz1234567890abcd','$2y$13$39eqT9S3tjoRDzdDKzabP.HZL41p80cd1n/yk.oxnpp4zXyuL/yGa',NULL,NULL,'info@',2,1486399430,1486399430,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_base_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `gender` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,'John',NULL,'Doe',NULL,NULL,'en-US',NULL),(2,NULL,NULL,NULL,NULL,NULL,'en-US',NULL),(3,NULL,NULL,NULL,NULL,NULL,'en-US',NULL);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_token`
--

DROP TABLE IF EXISTS `user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `token` varchar(40) NOT NULL,
  `expire_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_token`
--

LOCK TABLES `user_token` WRITE;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_carousel`
--

DROP TABLE IF EXISTS `widget_carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_carousel`
--

LOCK TABLES `widget_carousel` WRITE;
/*!40000 ALTER TABLE `widget_carousel` DISABLE KEYS */;
INSERT INTO `widget_carousel` VALUES (1,'index',1);
/*!40000 ALTER TABLE `widget_carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_carousel_item`
--

DROP TABLE IF EXISTS `widget_carousel_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_carousel_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carousel_id` int(11) NOT NULL,
  `base_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caption` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_carousel` (`carousel_id`),
  CONSTRAINT `fk_item_carousel` FOREIGN KEY (`carousel_id`) REFERENCES `widget_carousel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_carousel_item`
--

LOCK TABLES `widget_carousel_item` WRITE;
/*!40000 ALTER TABLE `widget_carousel_item` DISABLE KEYS */;
INSERT INTO `widget_carousel_item` VALUES (1,1,'','img/yii2-starter-kit.gif','image/gif','/',NULL,1,0,NULL,NULL);
/*!40000 ALTER TABLE `widget_carousel_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_menu`
--

DROP TABLE IF EXISTS `widget_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `items` text COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_menu`
--

LOCK TABLES `widget_menu` WRITE;
/*!40000 ALTER TABLE `widget_menu` DISABLE KEYS */;
INSERT INTO `widget_menu` VALUES (1,'frontend-index','Frontend index menu','[\n    {\n        \"label\": \"Get started with Yii2\",\n        \"url\": \"http://www.yiiframework.com\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-success\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Yii2 Starter Kit on GitHub\",\n        \"url\": \"https://github.com/trntv/yii2-starter-kit\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-primary\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Find a bug?\",\n        \"url\": \"https://github.com/trntv/yii2-starter-kit/issues\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-danger\\\">{label}</a>\"\n    }\n]',1);
/*!40000 ALTER TABLE `widget_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_text`
--

DROP TABLE IF EXISTS `widget_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_widget_text_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_text`
--

LOCK TABLES `widget_text` WRITE;
/*!40000 ALTER TABLE `widget_text` DISABLE KEYS */;
INSERT INTO `widget_text` VALUES (1,'backend_welcome','Welcome to backend','<p>Welcome to Yii2 Starter Kit Dashboard</p>',1,1486399429,1486399429),(2,'ads-example','Google Ads Example Block','<div class=\"lead\">\n                <script async src=\"//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js\"></script>\n                <ins class=\"adsbygoogle\"\n                     style=\"display:block\"\n                     data-ad-client=\"ca-pub-9505937224921657\"\n                     data-ad-slot=\"2264361777\"\n                     data-ad-format=\"auto\"></ins>\n                <script>\n                (adsbygoogle = window.adsbygoogle || []).push({});\n                </script>\n            </div>',0,1486399429,1486399429);
/*!40000 ALTER TABLE `widget_text` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-09 16:54:24

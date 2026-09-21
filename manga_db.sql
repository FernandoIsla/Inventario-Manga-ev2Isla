-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: manga_db
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add tomo',7,'add_tomo'),(26,'Can change tomo',7,'change_tomo'),(27,'Can delete tomo',7,'delete_tomo'),(28,'Can view tomo',7,'view_tomo'),(29,'Can add autor',8,'add_autor'),(30,'Can change autor',8,'change_autor'),(31,'Can delete autor',8,'delete_autor'),(32,'Can view autor',8,'view_autor'),(33,'Can add serie',9,'add_serie'),(34,'Can change serie',9,'change_serie'),(35,'Can delete serie',9,'delete_serie'),(36,'Can view serie',9,'view_serie'),(37,'Can add demografia',10,'add_demografia'),(38,'Can change demografia',10,'change_demografia'),(39,'Can delete demografia',10,'delete_demografia'),(40,'Can view demografia',10,'view_demografia'),(41,'Can add editorial',11,'add_editorial'),(42,'Can change editorial',11,'change_editorial'),(43,'Can delete editorial',11,'delete_editorial'),(44,'Can view editorial',11,'view_editorial');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$S4f7sl317bcQqUeQtpM9FV$cx0xWSnl/BlHb79Q/Q0oltNHz+24R6PE/0nhxQeq/gU=','2026-09-21 10:30:10.528881',1,'admin','','','',1,1,'2026-09-20 06:13:37.735414'),(2,'pbkdf2_sha256$600000$ceqPjnv9xwP1Kw0XJIHu0z$QRl5Sc73+rXBYHYa3vsGvBPoDnK42y1iULp+U05EcRk=','2026-09-21 03:49:22.643099',0,'operador_demo','Carlos','Rojas','',0,1,'2026-09-21 03:39:36.724100'),(3,'pbkdf2_sha256$600000$Pdf2pacAM6sT5K34U7M4oE$14iOoTPl6l0cZcBOZlR054zGb609GH5sDndyIOGPZZM=','2026-09-21 03:51:05.518897',0,'operador1','Fernando','Isla','fernando123@email.com',0,1,'2026-09-21 03:50:38.166068');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-09-20 06:27:36.665983','1','Seinen',1,'[{\"added\": {}}]',10,1),(2,'2026-09-20 06:28:13.893043','1','Tatsuki Fujimoto',1,'[{\"added\": {}}]',8,1),(3,'2026-09-20 06:28:39.894720','1','Norma Editorial',1,'[{\"added\": {}}]',11,1),(4,'2026-09-20 06:29:46.687960','1','Chainsaw Man',1,'[{\"added\": {}}]',9,1),(5,'2026-09-20 06:32:40.348753','1','Chainsaw Man - Tomo 1',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'mangaApp','autor'),(10,'mangaApp','demografia'),(11,'mangaApp','editorial'),(9,'mangaApp','serie'),(7,'mangaApp','tomo'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-09-19 09:44:12.621781'),(2,'auth','0001_initial','2026-09-19 09:44:13.554893'),(3,'admin','0001_initial','2026-09-19 09:44:13.733192'),(4,'admin','0002_logentry_remove_auto_add','2026-09-19 09:44:13.741121'),(5,'admin','0003_logentry_add_action_flag_choices','2026-09-19 09:44:13.749435'),(6,'contenttypes','0002_remove_content_type_name','2026-09-19 09:44:13.832178'),(7,'auth','0002_alter_permission_name_max_length','2026-09-19 09:44:13.912163'),(8,'auth','0003_alter_user_email_max_length','2026-09-19 09:44:13.927815'),(9,'auth','0004_alter_user_username_opts','2026-09-19 09:44:13.935888'),(10,'auth','0005_alter_user_last_login_null','2026-09-19 09:44:14.005761'),(11,'auth','0006_require_contenttypes_0002','2026-09-19 09:44:14.009469'),(12,'auth','0007_alter_validators_add_error_messages','2026-09-19 09:44:14.017619'),(13,'auth','0008_alter_user_username_max_length','2026-09-19 09:44:14.032762'),(14,'auth','0009_alter_user_last_name_max_length','2026-09-19 09:44:14.052464'),(15,'auth','0010_alter_group_name_max_length','2026-09-19 09:44:14.068505'),(16,'auth','0011_update_proxy_permissions','2026-09-19 09:44:14.076456'),(17,'auth','0012_alter_user_first_name_max_length','2026-09-19 09:44:14.092542'),(18,'sessions','0001_initial','2026-09-19 09:44:14.132207'),(19,'mangaApp','0001_initial','2026-09-20 06:09:09.327544'),(20,'mangaApp','0002_serie_tomo_portada','2026-09-21 09:05:31.587110');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2ot74ecjddxovirquf11uj7jkxtpi9dx','.eJxVjEEOwiAQRe_C2hBoZyC4dO8ZyMCAVA0kpV013t026UK3_733N-FpXYpfe5r9xOIqtLj8boHiK9UD8JPqo8nY6jJPQR6KPGmX98bpfTvdv4NCvew1cASASDCQYocw6JHYYNa4ExvQgnMGXcJkEbPKPAK4qDQaB9qMRny-zsU2wQ:1x8V3v:AuAGpyb5_cHar_0tQKlxSRlgS91hxa5Md8lE9yAIWcM','2026-10-05 03:51:27.877808'),('5u182jm7pz86o47wwilla3gg5exh06hb','.eJxVjEEOwiAQRe_C2hBoZyC4dO8ZyMCAVA0kpV013t026UK3_733N-FpXYpfe5r9xOIqtLj8boHiK9UD8JPqo8nY6jJPQR6KPGmX98bpfTvdv4NCvew1cASASDCQYocw6JHYYNa4ExvQgnMGXcJkEbPKPAK4qDQaB9qMRny-zsU2wQ:1x8Y4t:crEeonyC7C_rXsa3TjlycxqUUabZqzk1aA6CWZjk6wA','2026-10-05 07:04:39.019136'),('7iozs27vmg5uw8rjm8nakq6chuxt26vg','.eJxVjDsOwjAQRO_iGln-x0tJnzNY67WNA8iR4qRC3J1ESgHVSPPezJsF3NYatp6XMCV2ZYpdfruI9MztAOmB7T5zmtu6TJEfCj9p5-Oc8ut2un8HFXvd17EULAaGpEhaqZIsIAefvPTZRqMNOlTgtISsNQlno9vDaxBQiAR49vkC4m83UA:1x8V1u:X68CEkBbAGijkQ5UJ9PfXBDThTu-2PcN9EfI9oF_IxY','2026-10-05 03:49:22.652099'),('9cm64k0nxl3ztk3hky6wawrd7sth33os','.eJxVjEEOwiAQRe_C2hBoZyC4dO8ZyMCAVA0kpV013t026UK3_733N-FpXYpfe5r9xOIqtLj8boHiK9UD8JPqo8nY6jJPQR6KPGmX98bpfTvdv4NCvew1cASASDCQYocw6JHYYNa4ExvQgnMGXcJkEbPKPAK4qDQaB9qMRny-zsU2wQ:1x8V1u:_gmtKORHcsyEwirgwDDiZcyuN1gIapWLaTS7dBVwn5g','2026-10-05 03:49:22.486057'),('afaccbwrzgm1b3ramavsjqoxkforgpge','.eJxVjEEOwiAQRe_C2hBoZyC4dO8ZyMCAVA0kpV013t026UK3_733N-FpXYpfe5r9xOIqtLj8boHiK9UD8JPqo8nY6jJPQR6KPGmX98bpfTvdv4NCvew1cASASDCQYocw6JHYYNa4ExvQgnMGXcJkEbPKPAK4qDQaB9qMRny-zsU2wQ:1x8XJp:WSA02u_c6e5Jdw3kO1BhPQZcmUpEpeJlrWnZqcuh2UA','2026-10-05 06:16:01.749037'),('fzvlprcpip67gkgxf8domqxij1nufmhh','.eJxVjEEOwiAQRe_C2hBoZyC4dO8ZyMCAVA0kpV013t026UK3_733N-FpXYpfe5r9xOIqtLj8boHiK9UD8JPqo8nY6jJPQR6KPGmX98bpfTvdv4NCvew1cASASDCQYocw6JHYYNa4ExvQgnMGXcJkEbPKPAK4qDQaB9qMRny-zsU2wQ:1x8UsT:MGcHGwPE4z9O9Jn6XMdjN2_bKFcar2ivu0nOBhEMlo4','2026-10-05 03:39:37.060355'),('his3eao96msylid3swb2afmhbfe5e155','.eJxVjEEOwiAQRe_C2hBoZyC4dO8ZyMCAVA0kpV013t026UK3_733N-FpXYpfe5r9xOIqtLj8boHiK9UD8JPqo8nY6jJPQR6KPGmX98bpfTvdv4NCvew1cASASDCQYocw6JHYYNa4ExvQgnMGXcJkEbPKPAK4qDQaB9qMRny-zsU2wQ:1x8b6K:GNxxJNgIWtYeG11JiCvF0_NtJ_KFVnylsAOtAqb-YRQ','2026-10-05 10:18:20.892438'),('hxlkwc0arvr3gs77olvdmh04xio06rcd','.eJxVjEEOwiAQRe_C2hBoZyC4dO8ZyMCAVA0kpV013t026UK3_733N-FpXYpfe5r9xOIqtLj8boHiK9UD8JPqo8nY6jJPQR6KPGmX98bpfTvdv4NCvew1cASASDCQYocw6JHYYNa4ExvQgnMGXcJkEbPKPAK4qDQaB9qMRny-zsU2wQ:1x8a0g:q3aCyiJ1ee7rV8cdnjl2hmc97MnYX1RpCrOI-Pj8TBE','2026-10-05 09:08:26.730037'),('mchpt6i4y4x1ayl4tfxkld87u0nguf1g','.eJxVjDsOwjAQRO_iGln-x0tJnzNY67WNA8iR4qRC3J1ESgHVSPPezJsF3NYatp6XMCV2ZYpdfruI9MztAOmB7T5zmtu6TJEfCj9p5-Oc8ut2un8HFXvd17EULAaGpEhaqZIsIAefvPTZRqMNOlTgtISsNQlno9vDaxBQiAR49vkC4m83UA:1x8UsT:xff3AStBJlh317qZiAw98HFZDzd_XC87tK27BcBoF4A','2026-10-05 03:39:37.139074'),('mtftu9l5np5yikkjp9fcgjrkmcb89fug','.eJxVjEEOwiAQRe_C2hBoZyC4dO8ZyMCAVA0kpV013t026UK3_733N-FpXYpfe5r9xOIqtLj8boHiK9UD8JPqo8nY6jJPQR6KPGmX98bpfTvdv4NCvew1cASASDCQYocw6JHYYNa4ExvQgnMGXcJkEbPKPAK4qDQaB9qMRny-zsU2wQ:1x8bHm:R5smlg9Mp7TjPGqMdozm9obkG6JklpFJkVDG1l8ngZs','2026-10-05 10:30:10.533464'),('w7u27tqnswx7kuljz7dsywh0onqum974','.eJxVjEEOwiAQRe_C2hBoZyC4dO8ZyMCAVA0kpV013t026UK3_733N-FpXYpfe5r9xOIqtLj8boHiK9UD8JPqo8nY6jJPQR6KPGmX98bpfTvdv4NCvew1cASASDCQYocw6JHYYNa4ExvQgnMGXcJkEbPKPAK4qDQaB9qMRny-zsU2wQ:1x8bEF:1kN3CgepJbBG9t7A0MtzF5cu4Qv9xVudXcu9MQwBA0g','2026-10-05 10:26:31.741054');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangaapp_autor`
--

DROP TABLE IF EXISTS `mangaapp_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mangaapp_autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangaapp_autor`
--

LOCK TABLES `mangaapp_autor` WRITE;
/*!40000 ALTER TABLE `mangaapp_autor` DISABLE KEYS */;
INSERT INTO `mangaapp_autor` VALUES (1,'Tatsuki Fujimoto','Japon'),(3,'Eiichiro Oda','Japon'),(4,'Sui Ishida','Japon'),(5,'Kocha Agasawa','Japon');
/*!40000 ALTER TABLE `mangaapp_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangaapp_demografia`
--

DROP TABLE IF EXISTS `mangaapp_demografia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mangaapp_demografia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangaapp_demografia`
--

LOCK TABLES `mangaapp_demografia` WRITE;
/*!40000 ALTER TABLE `mangaapp_demografia` DISABLE KEYS */;
INSERT INTO `mangaapp_demografia` VALUES (1,'Seinen','Historias orientadas a publico adulto'),(3,'Shojo','Historias de romance'),(4,'Shonen','Historias orientadas a publico juvenil');
/*!40000 ALTER TABLE `mangaapp_demografia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangaapp_editorial`
--

DROP TABLE IF EXISTS `mangaapp_editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mangaapp_editorial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `pais_origen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangaapp_editorial`
--

LOCK TABLES `mangaapp_editorial` WRITE;
/*!40000 ALTER TABLE `mangaapp_editorial` DISABLE KEYS */;
INSERT INTO `mangaapp_editorial` VALUES (1,'Norma Editorial','España'),(3,'Ivrea Argentina','Argentina'),(4,'Milky Way Ediciones','España');
/*!40000 ALTER TABLE `mangaapp_editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangaapp_serie`
--

DROP TABLE IF EXISTS `mangaapp_serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mangaapp_serie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `sinopsis` longtext DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `autor_id` int(11) NOT NULL,
  `demografia_id` int(11) NOT NULL,
  `tomo_portada_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mangaAPP_serie_autor_id_4e0d934f_fk_mangaAPP_autor_id` (`autor_id`),
  KEY `mangaAPP_serie_demografia_id_97bbb665_fk_mangaAPP_demografia_id` (`demografia_id`),
  KEY `mangaApp_serie_tomo_portada_id_b7d17976_fk_mangaApp_tomo_id` (`tomo_portada_id`),
  CONSTRAINT `mangaAPP_serie_autor_id_4e0d934f_fk_mangaAPP_autor_id` FOREIGN KEY (`autor_id`) REFERENCES `mangaapp_autor` (`id`),
  CONSTRAINT `mangaAPP_serie_demografia_id_97bbb665_fk_mangaAPP_demografia_id` FOREIGN KEY (`demografia_id`) REFERENCES `mangaapp_demografia` (`id`),
  CONSTRAINT `mangaApp_serie_tomo_portada_id_b7d17976_fk_mangaApp_tomo_id` FOREIGN KEY (`tomo_portada_id`) REFERENCES `mangaapp_tomo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangaapp_serie`
--

LOCK TABLES `mangaapp_serie` WRITE;
/*!40000 ALTER TABLE `mangaapp_serie` DISABLE KEYS */;
INSERT INTO `mangaapp_serie` VALUES (1,'Chainsaw Man','El pibe motosierra','FINALIZADO',1,1,46),(3,'Tokyo Ghoul :RE','Tokyo Ghoul:re se sitúa dos años después del asalto al café Anteiku y sigue los pasos de Haise Sasaki, un investigador de grado uno de la [CCG (Comisión de Contra el Ghoul)]() que ha perdido sus recuerdos.','FINALIZADO',4,1,50),(4,'Tu y yo somos polos opuestos','Suzuki es una chica que rebosa energía por los cuatro costados. Sin embargo, tiene un gran defecto: se preocupa demasiado por lo que los demás puedan llegar a pensar de ella. Está profundamente enamorada de Tani, un chico que, a pesar de estar la mayoría del tiempo callado, no tiene ningún reparo en expresar lo que verdaderamente piensa. No obstante, por culpa de su miedo a ser juzgada por las personas que la rodean, no puede relacionarse con él de forma normal. Solo interactúa con Tani mediante conversaciones triviales que parecen buscar más la molestia del joven que un verdadero acercamiento. Hasta que llega el día en que Suzuki se arma de valor... ¡¿e invita a Tani a volver juntos a casa después de clase?!\r\n\r\n¡¡Atención todos, porque aquí comienza esta comedia romántica realista que trae consigo dosis de simpatía para dar y regalar!!','FINALIZADO',5,3,NULL),(5,'Fire Punch','“La bruja del hielo” es la culpable de que el mundo esté completamente cubierto de nieve y de que la población mundial, congelada, suspire por unas llamas. En este mundo, Agni y su hermana pequeña, Luna, son dos muchachos que han sido bendecidos con la capacidad de la regeneración. ¡¿Qué atroz futuro les espera a estos dos hermanos sin familia alguna?!','FINALIZADO',1,4,77);
/*!40000 ALTER TABLE `mangaapp_serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangaapp_tomo`
--

DROP TABLE IF EXISTS `mangaapp_tomo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mangaapp_tomo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_tomo` int(10) unsigned NOT NULL CHECK (`numero_tomo` >= 0),
  `isbn` varchar(20) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(10) unsigned NOT NULL CHECK (`stock` >= 0),
  `archivo_portada` varchar(100) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `editorial_id` int(11) NOT NULL,
  `serie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `mangaAPP_tomo_editorial_id_0fc8b9c7_fk_mangaAPP_editorial_id` (`editorial_id`),
  KEY `mangaAPP_tomo_serie_id_ac2d61b9_fk_mangaAPP_serie_id` (`serie_id`),
  CONSTRAINT `mangaAPP_tomo_editorial_id_0fc8b9c7_fk_mangaAPP_editorial_id` FOREIGN KEY (`editorial_id`) REFERENCES `mangaapp_editorial` (`id`),
  CONSTRAINT `mangaAPP_tomo_serie_id_ac2d61b9_fk_mangaAPP_serie_id` FOREIGN KEY (`serie_id`) REFERENCES `mangaapp_serie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangaapp_tomo`
--

LOCK TABLES `mangaapp_tomo` WRITE;
/*!40000 ALTER TABLE `mangaapp_tomo` DISABLE KEYS */;
INSERT INTO `mangaapp_tomo` VALUES (1,1,'978-84-679-4115-9',12000.00,5,'portadas/thumb_6655_albumes_big.jpeg','2026-09-20',1,1),(39,2,'978-84-679-4262-0',12000.00,3,'portadas/chainsawman2.jpeg','2026-09-21',1,1),(40,3,'978-84-679-4351-1',12000.00,10,'portadas/chainsawman3.jpeg','2026-09-21',1,1),(41,4,'978-84-679-4417-4',12000.00,17,'portadas/chainsawman4.jpeg','2026-09-21',1,1),(42,5,'978-84-679-4509-6',12000.00,1,'portadas/chainsawman5.jpeg','2026-09-21',1,1),(43,6,'978-84-679-4645-1',12000.00,7,'portadas/chainsawman6.jpeg','2026-09-21',1,1),(44,7,'978-84-679-4646-8',12000.00,4,'portadas/chainsawman7.jpeg','2026-09-21',1,1),(45,8,'978-84-679-4647-5',12000.00,8,'portadas/chainsawman8.jpeg','2026-09-21',1,1),(46,9,'978-84-679-4798-4',12000.00,0,'portadas/chainsawman9.jpeg','2026-09-21',1,1),(47,11,'978-84-679-4800-4',12000.00,1,'portadas/chainsawman11.jpeg','2026-09-21',1,1),(48,10,'978-84-679-4799-1',12000.00,12,'portadas/chainsawman10.jpeg','2026-09-21',1,1),(49,1,'978-987-562-921-9',9000.00,5,'portadas/tokyoghoulre01.jpg','2026-09-21',3,3),(50,2,'978-987-562-938-7',9000.00,12,'portadas/tokyoghoulre02.jpg','2026-09-21',3,3),(51,3,'978-987-562-957-8',9000.00,9,'portadas/tokyoghoulre03.jpg','2026-09-21',3,3),(52,4,'978-987-562-988-2',9000.00,18,'portadas/tokyoghoulre04.jpg','2026-09-21',3,3),(53,5,'978-987-792-021-5',9000.00,0,'portadas/tokyoghoulre05.jpg','2026-09-21',3,3),(54,6,'978-987-792-040-6',9000.00,13,'portadas/tokyoghoulre06.jpg','2026-09-21',3,3),(55,7,'978-987-792-057-4',9000.00,2,'portadas/tokyoghoulre07.jpg','2026-09-21',3,3),(56,8,'978-987-792-085-7',9000.00,7,'portadas/tokyoghoulre08.jpg','2026-09-21',3,3),(57,9,'978-987-792-104-5',9000.00,15,'portadas/tokyoghoulre09.jpg','2026-09-21',3,3),(58,10,'978-987-792-127-4',9000.00,0,'portadas/tokyoghoulre10.jpg','2026-09-21',3,3),(59,11,'978-987-792-146-5',9000.00,5,'portadas/tokyoghoulre11.jpg','2026-09-21',3,3),(60,12,'978-987-792-171-7',9000.00,9,'portadas/tokyoghoulre12.jpg','2026-09-21',3,3),(61,13,'978-987-792-188-5',9000.00,8,'portadas/tokyoghoulre13.jpg','2026-09-21',3,3),(62,14,'978-987-792-205-9',9000.00,17,'portadas/tokyoghoulre14.jpg','2026-09-21',3,3),(63,15,'978-987-792-228-8',9000.00,1,'portadas/tokyoghoulre15.jpg','2026-09-21',3,3),(64,16,'978-987-792-243-1',9000.00,0,'portadas/tokyoghoulre16.jpg','2026-09-21',3,3),(65,1,'978-84-19914-63-7',14000.00,16,'portadas/Tu_y_yo_somos_polos_opuestos_01_V.webp','2026-09-21',4,4),(66,2,'978-84-10223-01-1',14000.00,10,'portadas/Tu_y_yo_somos_polos_opuestos_02.webp','2026-09-21',4,4),(67,3,'978-84-10223-40-0',14000.00,5,'portadas/Tu_y_yo_somos_polos_opuestos_03.webp','2026-09-21',4,4),(68,4,'979-13-87506-79-7',14000.00,8,'portadas/Tu_y_yo_somos_polos_opuestos_04.webp','2026-09-21',4,4),(69,5,'979-13-87831-64-6',14000.00,8,'portadas/Tu_y_yo_somos_polos_opuestos_05.webp','2026-09-21',4,4),(70,6,'979-13-88055-70-6',14000.00,3,'portadas/Tu_y_yo_somos_polos_opuestos_06.webp','2026-09-21',4,4),(71,7,'979-13-88055-83-6',14000.00,3,'portadas/Tu_y_yo_somos_polos_opuestos_07.webp','2026-09-21',4,4),(72,1,'978-84-19383-01-3',9000.00,17,'portadas/firepunch1.jpg','2026-09-21',3,5),(73,2,'978-84-19451-37-8',9000.00,14,'portadas/firepunch2.jpg','2026-09-21',3,5),(74,3,'978-84-19600-41-7',9000.00,9,'portadas/firepunch3.jpg','2026-09-21',3,5),(75,4,'978-84-19673-47-3',9000.00,7,'portadas/firepunch4.jpg','2026-09-21',3,5),(76,5,'978-84-19730-30-5',9000.00,6,'portadas/firepunch5.jpg','2026-09-21',3,5),(77,6,'978-84-19816-83-2',9000.00,7,'portadas/firepunch6.jpg','2026-09-21',3,5),(78,7,'978-84-19916-74-7',9000.00,2,'portadas/firepunch7.jpg','2026-09-21',3,5),(79,8,'978-84-10061-44-6',9000.00,1,'portadas/firepunch8.jpg','2026-09-21',3,5),(80,21,'938-44-679-4115-7',9000.00,1,'portadas/chainsawman21.jpg','2026-09-21',3,1);
/*!40000 ALTER TABLE `mangaapp_tomo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-21  7:51:45

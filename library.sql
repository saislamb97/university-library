-- MySQL dump 10.13  Distrib 9.3.0, for macos15.2 (arm64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add site',6,'add_site'),(22,'Can change site',6,'change_site'),(23,'Can delete site',6,'delete_site'),(24,'Can view site',6,'view_site'),(25,'Can add course',7,'add_course'),(26,'Can change course',7,'change_course'),(27,'Can delete course',7,'delete_course'),(28,'Can view course',7,'view_course'),(29,'Can add User',8,'add_user'),(30,'Can change User',8,'change_user'),(31,'Can delete User',8,'delete_user'),(32,'Can view User',8,'view_user'),(33,'Can add book',9,'add_book'),(34,'Can change book',9,'change_book'),(35,'Can delete book',9,'delete_book'),(36,'Can view book',9,'view_book'),(37,'Can add student profile',10,'add_studentprofile'),(38,'Can change student profile',10,'change_studentprofile'),(39,'Can delete student profile',10,'delete_studentprofile'),(40,'Can view student profile',10,'view_studentprofile'),(41,'Can add Borrow Record',11,'add_borrowrecord'),(42,'Can change Borrow Record',11,'change_borrowrecord'),(43,'Can delete Borrow Record',11,'delete_borrowrecord'),(44,'Can view Borrow Record',11,'view_borrowrecord');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_homeapp_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_homeapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `homeapp_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-07-02 14:57:46.007216','1','sa.islamb97@gmail.com',2,'[{\"changed\": {\"fields\": [\"Approved\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(9,'homeapp','book'),(11,'homeapp','borrowrecord'),(7,'homeapp','course'),(10,'homeapp','studentprofile'),(8,'homeapp','user'),(5,'sessions','session'),(6,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-07-02 14:53:57.843338'),(2,'contenttypes','0002_remove_content_type_name','2025-07-02 14:53:57.868224'),(3,'auth','0001_initial','2025-07-02 14:53:57.916725'),(4,'auth','0002_alter_permission_name_max_length','2025-07-02 14:53:57.928120'),(5,'auth','0003_alter_user_email_max_length','2025-07-02 14:53:57.930689'),(6,'auth','0004_alter_user_username_opts','2025-07-02 14:53:57.932735'),(7,'auth','0005_alter_user_last_login_null','2025-07-02 14:53:57.934948'),(8,'auth','0006_require_contenttypes_0002','2025-07-02 14:53:57.935462'),(9,'auth','0007_alter_validators_add_error_messages','2025-07-02 14:53:57.937801'),(10,'auth','0008_alter_user_username_max_length','2025-07-02 14:53:57.940408'),(11,'auth','0009_alter_user_last_name_max_length','2025-07-02 14:53:57.942812'),(12,'auth','0010_alter_group_name_max_length','2025-07-02 14:53:57.948642'),(13,'auth','0011_update_proxy_permissions','2025-07-02 14:53:57.952057'),(14,'auth','0012_alter_user_first_name_max_length','2025-07-02 14:53:57.954682'),(15,'homeapp','0001_initial','2025-07-02 14:53:58.129629'),(16,'admin','0001_initial','2025-07-02 14:53:58.162941'),(17,'admin','0002_logentry_remove_auto_add','2025-07-02 14:53:58.167333'),(18,'admin','0003_logentry_add_action_flag_choices','2025-07-02 14:53:58.171863'),(19,'sessions','0001_initial','2025-07-02 14:53:58.181713'),(20,'sites','0001_initial','2025-07-02 14:53:58.186777'),(21,'sites','0002_alter_domain_unique','2025-07-02 14:53:58.191035');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('pwtjyp6w1wbc7n5j8gwaps0p9s5s0lod','.eJxVjDEOwjAMRe-SGUWOHBPCyM4ZIjd2SAGlUtNOiLtDpQ6w_vfef5nE61LT2nVOo5izcebwuw2cH9o2IHdut8nmqS3zONhNsTvt9jqJPi-7-3dQuddvjeSFkIOHo2ZlAudLVBfYsxNEKg5FARhPCI5CiSGTh8hFSoaCZN4f0EQ3jQ:1uWytd:FQr9JZAF1XRbi2ehSHBxXlxPQAr9wRuxuCqg8z6yvfo','2025-07-16 14:57:13.419070');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeapp_book`
--

DROP TABLE IF EXISTS `homeapp_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homeapp_book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `total_copies` int unsigned NOT NULL,
  `available_copies` int unsigned NOT NULL,
  `course_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `homeapp_book_course_id_f3d59f8b_fk_homeapp_course_id` (`course_id`),
  CONSTRAINT `homeapp_book_course_id_f3d59f8b_fk_homeapp_course_id` FOREIGN KEY (`course_id`) REFERENCES `homeapp_course` (`id`),
  CONSTRAINT `homeapp_book_chk_1` CHECK ((`total_copies` >= 0)),
  CONSTRAINT `homeapp_book_chk_2` CHECK ((`available_copies` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeapp_book`
--

LOCK TABLES `homeapp_book` WRITE;
/*!40000 ALTER TABLE `homeapp_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `homeapp_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeapp_borrowrecord`
--

DROP TABLE IF EXISTS `homeapp_borrowrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homeapp_borrowrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `borrowed_at` datetime(6) NOT NULL,
  `returned_at` datetime(6) DEFAULT NULL,
  `book_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `homeapp_borrowrecord_student_id_book_id_borro_488f30ac_uniq` (`student_id`,`book_id`,`borrowed_at`),
  KEY `homeapp_borrowrecord_book_id_c8ad3eb9_fk_homeapp_book_id` (`book_id`),
  CONSTRAINT `homeapp_borrowrecord_book_id_c8ad3eb9_fk_homeapp_book_id` FOREIGN KEY (`book_id`) REFERENCES `homeapp_book` (`id`),
  CONSTRAINT `homeapp_borrowrecord_student_id_c9c942c7_fk_homeapp_s` FOREIGN KEY (`student_id`) REFERENCES `homeapp_studentprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeapp_borrowrecord`
--

LOCK TABLES `homeapp_borrowrecord` WRITE;
/*!40000 ALTER TABLE `homeapp_borrowrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `homeapp_borrowrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeapp_course`
--

DROP TABLE IF EXISTS `homeapp_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homeapp_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeapp_course`
--

LOCK TABLES `homeapp_course` WRITE;
/*!40000 ALTER TABLE `homeapp_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `homeapp_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeapp_studentprofile`
--

DROP TABLE IF EXISTS `homeapp_studentprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homeapp_studentprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `matric_no` varchar(20) NOT NULL,
  `faculty` varchar(100) NOT NULL,
  `course_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matric_no` (`matric_no`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `homeapp_studentprofile_course_id_64e0c1a1_fk_homeapp_course_id` (`course_id`),
  CONSTRAINT `homeapp_studentprofile_course_id_64e0c1a1_fk_homeapp_course_id` FOREIGN KEY (`course_id`) REFERENCES `homeapp_course` (`id`),
  CONSTRAINT `homeapp_studentprofile_user_id_44fe242e_fk_homeapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `homeapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeapp_studentprofile`
--

LOCK TABLES `homeapp_studentprofile` WRITE;
/*!40000 ALTER TABLE `homeapp_studentprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `homeapp_studentprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeapp_user`
--

DROP TABLE IF EXISTS `homeapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homeapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(150) DEFAULT NULL,
  `profile` varchar(100) DEFAULT NULL,
  `is_student` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `homeapp_use_email_48d85a_idx` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeapp_user`
--

LOCK TABLES `homeapp_user` WRITE;
/*!40000 ALTER TABLE `homeapp_user` DISABLE KEYS */;
INSERT INTO `homeapp_user` VALUES (1,'pbkdf2_sha256$1000000$kG8xKBDito0lPmtjfpTzLW$xN1gVJFP6LWDTOhV4IQjQQcd0EJQ1FdP8oHtyhmXE8Q=','2025-07-02 14:57:13.417838',1,'','',1,1,'2025-07-02 14:54:59.000000','sa.islamb97@gmail.com','sa.islamb97','',0,1);
/*!40000 ALTER TABLE `homeapp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeapp_user_groups`
--

DROP TABLE IF EXISTS `homeapp_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homeapp_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `homeapp_user_groups_user_id_group_id_0325e9d1_uniq` (`user_id`,`group_id`),
  KEY `homeapp_user_groups_group_id_54d08f23_fk_auth_group_id` (`group_id`),
  CONSTRAINT `homeapp_user_groups_group_id_54d08f23_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `homeapp_user_groups_user_id_13271e4c_fk_homeapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `homeapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeapp_user_groups`
--

LOCK TABLES `homeapp_user_groups` WRITE;
/*!40000 ALTER TABLE `homeapp_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `homeapp_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeapp_user_user_permissions`
--

DROP TABLE IF EXISTS `homeapp_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homeapp_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `homeapp_user_user_permis_user_id_permission_id_04a24142_uniq` (`user_id`,`permission_id`),
  KEY `homeapp_user_user_pe_permission_id_96be1e7d_fk_auth_perm` (`permission_id`),
  CONSTRAINT `homeapp_user_user_pe_permission_id_96be1e7d_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `homeapp_user_user_pe_user_id_b87d04a5_fk_homeapp_u` FOREIGN KEY (`user_id`) REFERENCES `homeapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeapp_user_user_permissions`
--

LOCK TABLES `homeapp_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `homeapp_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `homeapp_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'library'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-02 23:05:07

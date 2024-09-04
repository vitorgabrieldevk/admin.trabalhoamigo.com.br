-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: trabalhoamigo.com.br
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` text NOT NULL,
  `ordenacao` int(11) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (2,'Elétrica','Sistema Elétricos',1);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratos` (
  `id_servico_fk` int(11) NOT NULL,
  `id_contrato_fk` int(11) NOT NULL,
  `qtd_servico` int(11) NOT NULL,
  `valor_final` varchar(30) NOT NULL,
  KEY `fk_servico_contrato_servico` (`id_servico_fk`),
  KEY `fk_servico_contrato_contrato` (`id_contrato_fk`),
  CONSTRAINT `fk_servico_contrato_contrato` FOREIGN KEY (`id_contrato_fk`) REFERENCES `proposta` (`id_contrato`) ON DELETE CASCADE,
  CONSTRAINT `fk_servico_contrato_servico` FOREIGN KEY (`id_servico_fk`) REFERENCES `servicos` (`id_servico`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_access`
--

DROP TABLE IF EXISTS `directus_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_access` (
  `id` char(36) NOT NULL,
  `role` char(36) DEFAULT NULL,
  `user` char(36) DEFAULT NULL,
  `policy` char(36) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_access_role_foreign` (`role`),
  KEY `directus_access_user_foreign` (`user`),
  KEY `directus_access_policy_foreign` (`policy`),
  CONSTRAINT `directus_access_policy_foreign` FOREIGN KEY (`policy`) REFERENCES `directus_policies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_access_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_access_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_access`
--

LOCK TABLES `directus_access` WRITE;
/*!40000 ALTER TABLE `directus_access` DISABLE KEYS */;
INSERT INTO `directus_access` VALUES ('0310437f-f160-4657-800e-e0656f80bd3b',NULL,NULL,'abf8a154-5b1c-4a46-ac9c-7300570f4f17',1),('4c9c65a3-22ff-42c3-a5e5-bb69bf7a14cb','a504ed9b-8c34-4911-bfb8-1a035abc1e97',NULL,'147bd3a0-16bc-4a4a-b4d0-186a390debbb',NULL);
/*!40000 ALTER TABLE `directus_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_activity`
--

DROP TABLE IF EXISTS `directus_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(45) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(50) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_activity_collection_foreign` (`collection`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_activity`
--

LOCK TABLES `directus_activity` WRITE;
/*!40000 ALTER TABLE `directus_activity` DISABLE KEYS */;
INSERT INTO `directus_activity` VALUES (1,'login','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 01:43:06','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_users','1096b95c-70ee-4ba6-b808-1531a551464c',NULL,'http://localhost:8055'),(2,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 01:43:37','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_users','1096b95c-70ee-4ba6-b808-1531a551464c',NULL,'http://localhost:8055'),(3,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 02:48:39','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_users','1096b95c-70ee-4ba6-b808-1531a551464c',NULL,'http://localhost:8055'),(4,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 02:53:24','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_settings','1',NULL,'http://localhost:8055'),(5,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 02:54:05','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_users','07b9d3d0-5dfc-43d8-85b1-bd0f39e1b1e4',NULL,'http://localhost:8055'),(6,'delete','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 02:54:34','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_users','07b9d3d0-5dfc-43d8-85b1-bd0f39e1b1e4',NULL,'http://localhost:8055'),(7,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:02:16','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_translations','4fbe1a93-7514-49b6-9b6d-88d51e76d80c',NULL,'http://localhost:8055'),(8,'delete','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:02:27','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_translations','4fbe1a93-7514-49b6-9b6d-88d51e76d80c',NULL,'http://localhost:8055'),(9,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:03:15','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_settings','1',NULL,'http://localhost:8055'),(10,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:04:44','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_settings','1',NULL,'http://localhost:8055'),(11,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:11:40','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','categorias',NULL,'http://localhost:8055'),(12,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:11:44','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','usuarios',NULL,'http://localhost:8055'),(13,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:11:53','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','contratos',NULL,'http://localhost:8055'),(14,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:11:56','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','enderecos',NULL,'http://localhost:8055'),(15,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:12:00','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','proposta',NULL,'http://localhost:8055'),(16,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:12:01','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','servicos',NULL,'http://localhost:8055'),(17,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:12:30','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','categorias','1',NULL,'http://localhost:8055'),(18,'delete','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:12:36','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','categorias','1',NULL,'http://localhost:8055'),(19,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:12:45','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_fields','1',NULL,'http://localhost:8055'),(20,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:13:30','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_fields','1',NULL,'http://localhost:8055'),(21,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:13:48','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','categorias','2',NULL,'http://localhost:8055'),(22,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:14:16','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_fields','1',NULL,'http://localhost:8055'),(23,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:14:49','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_fields','2',NULL,'http://localhost:8055'),(24,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:15:02','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_fields','3',NULL,'http://localhost:8055'),(25,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:25:02','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','usuarios','1',NULL,'http://localhost:8055'),(26,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:25:49','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_fields','4',NULL,'http://localhost:8055'),(27,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:25:57','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_fields','5',NULL,'http://localhost:8055'),(28,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:26:01','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_fields','6',NULL,'http://localhost:8055'),(29,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:26:06','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_fields','6',NULL,'http://localhost:8055'),(30,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:27:18','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','contratos',NULL,'http://localhost:8055'),(31,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:27:18','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','enderecos',NULL,'http://localhost:8055'),(32,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:27:18','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','proposta',NULL,'http://localhost:8055'),(33,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:27:18','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','servicos',NULL,'http://localhost:8055'),(34,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:27:18','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','usuarios',NULL,'http://localhost:8055'),(35,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:27:18','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','categorias',NULL,'http://localhost:8055'),(36,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:27:22','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','contratos',NULL,'http://localhost:8055'),(37,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:27:22','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','proposta',NULL,'http://localhost:8055'),(38,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:27:22','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','servicos',NULL,'http://localhost:8055'),(39,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:27:22','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','usuarios',NULL,'http://localhost:8055'),(40,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:27:22','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','categorias',NULL,'http://localhost:8055'),(41,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:27:22','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','enderecos',NULL,'http://localhost:8055'),(42,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:27:48','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','Consultas',NULL,'http://localhost:8055'),(43,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:28:02','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','proposta',NULL,'http://localhost:8055'),(44,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:28:02','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','contratos',NULL,'http://localhost:8055'),(45,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:28:02','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','servicos',NULL,'http://localhost:8055'),(46,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:28:02','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','usuarios',NULL,'http://localhost:8055'),(47,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:28:02','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','categorias',NULL,'http://localhost:8055'),(48,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:28:02','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','enderecos',NULL,'http://localhost:8055'),(49,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:28:02','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','Consultas',NULL,'http://localhost:8055'),(50,'delete','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:28:22','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','Consultas',NULL,'http://localhost:8055'),(51,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:30:44','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','enderecos','1',NULL,'http://localhost:8055'),(52,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:32:30','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_fields','3',NULL,'http://localhost:8055'),(53,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:33:14','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_fields','3',NULL,'http://localhost:8055'),(54,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:33:37','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','servicos','1',NULL,'http://localhost:8055'),(55,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:34:05','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','proposta','1',NULL,'http://localhost:8055'),(56,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:37:52','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_collections','contratos',NULL,'http://localhost:8055'),(57,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:39:49','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_settings','1',NULL,'http://localhost:8055'),(58,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:41:13','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_roles','2ecd18ea-cdfb-4a5f-8224-d0514b79bb9c',NULL,'http://localhost:8055'),(59,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:42:52','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_roles','2ecd18ea-cdfb-4a5f-8224-d0514b79bb9c',NULL,'http://localhost:8055'),(60,'create','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:43:38','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_policies','901d3b3d-2514-4155-816d-7c20604e8f46',NULL,'http://localhost:8055'),(61,'delete','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:44:06','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_policies','901d3b3d-2514-4155-816d-7c20604e8f46',NULL,'http://localhost:8055'),(62,'delete','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:44:12','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_roles','2ecd18ea-cdfb-4a5f-8224-d0514b79bb9c',NULL,'http://localhost:8055'),(63,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:44:29','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_roles','a504ed9b-8c34-4911-bfb8-1a035abc1e97',NULL,'http://localhost:8055'),(64,'update','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 03:45:53','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','directus_users','1096b95c-70ee-4ba6-b808-1531a551464c',NULL,'http://localhost:8055');
/*!40000 ALTER TABLE `directus_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_collections`
--

DROP TABLE IF EXISTS `directus_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_collections` (
  `collection` varchar(64) NOT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `display_template` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `singleton` tinyint(1) NOT NULL DEFAULT 0,
  `translations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translations`)),
  `archive_field` varchar(64) DEFAULT NULL,
  `archive_app_filter` tinyint(1) NOT NULL DEFAULT 1,
  `archive_value` varchar(255) DEFAULT NULL,
  `unarchive_value` varchar(255) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `color` varchar(255) DEFAULT NULL,
  `item_duplication_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_duplication_fields`)),
  `sort` int(11) DEFAULT NULL,
  `group` varchar(64) DEFAULT NULL,
  `collapse` varchar(255) NOT NULL DEFAULT 'open',
  `preview_url` varchar(255) DEFAULT NULL,
  `versioning` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`collection`),
  KEY `directus_collections_group_foreign` (`group`),
  CONSTRAINT `directus_collections_group_foreign` FOREIGN KEY (`group`) REFERENCES `directus_collections` (`collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_collections`
--

LOCK TABLES `directus_collections` WRITE;
/*!40000 ALTER TABLE `directus_collections` DISABLE KEYS */;
INSERT INTO `directus_collections` VALUES ('categorias',NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,5,NULL,'open',NULL,0),('contratos',NULL,NULL,NULL,1,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,2,NULL,'open',NULL,0),('enderecos',NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,6,NULL,'open',NULL,0),('proposta',NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,1,NULL,'open',NULL,0),('servicos',NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,3,NULL,'open',NULL,0),('usuarios',NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,NULL,NULL,'all',NULL,NULL,4,NULL,'open',NULL,0);
/*!40000 ALTER TABLE `directus_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_dashboards`
--

DROP TABLE IF EXISTS `directus_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_dashboards` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(64) NOT NULL DEFAULT 'dashboard',
  `note` text DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_dashboards_user_created_foreign` (`user_created`),
  CONSTRAINT `directus_dashboards_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_dashboards`
--

LOCK TABLES `directus_dashboards` WRITE;
/*!40000 ALTER TABLE `directus_dashboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_extensions`
--

DROP TABLE IF EXISTS `directus_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_extensions` (
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `id` char(36) NOT NULL,
  `folder` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `bundle` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_extensions`
--

LOCK TABLES `directus_extensions` WRITE;
/*!40000 ALTER TABLE `directus_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_fields`
--

DROP TABLE IF EXISTS `directus_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection` varchar(64) NOT NULL,
  `field` varchar(64) NOT NULL,
  `special` varchar(64) DEFAULT NULL,
  `interface` varchar(64) DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `display` varchar(64) DEFAULT NULL,
  `display_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`display_options`)),
  `readonly` tinyint(1) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `sort` int(10) unsigned DEFAULT NULL,
  `width` varchar(30) DEFAULT 'full',
  `translations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translations`)),
  `note` text DEFAULT NULL,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `required` tinyint(1) DEFAULT 0,
  `group` varchar(64) DEFAULT NULL,
  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation`)),
  `validation_message` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_fields_collection_foreign` (`collection`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_fields`
--

LOCK TABLES `directus_fields` WRITE;
/*!40000 ALTER TABLE `directus_fields` DISABLE KEYS */;
INSERT INTO `directus_fields` VALUES (1,'categorias','id_categoria',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(2,'usuarios','id_usuario',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(3,'servicos','id_usuario_fk',NULL,NULL,NULL,NULL,NULL,0,0,NULL,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(4,'usuarios','cnpj',NULL,NULL,NULL,NULL,NULL,0,1,NULL,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(5,'usuarios','cpf',NULL,NULL,NULL,NULL,NULL,0,1,NULL,'full',NULL,NULL,NULL,0,NULL,NULL,NULL),(6,'usuarios','email',NULL,NULL,NULL,NULL,NULL,0,0,NULL,'full',NULL,NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `directus_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_files`
--

DROP TABLE IF EXISTS `directus_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_files` (
  `id` char(36) NOT NULL,
  `storage` varchar(255) NOT NULL,
  `filename_disk` varchar(255) DEFAULT NULL,
  `filename_download` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `folder` char(36) DEFAULT NULL,
  `uploaded_by` char(36) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(36) DEFAULT NULL,
  `modified_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `charset` varchar(50) DEFAULT NULL,
  `filesize` bigint(20) DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `embed` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `focal_point_x` int(11) DEFAULT NULL,
  `focal_point_y` int(11) DEFAULT NULL,
  `tus_id` varchar(64) DEFAULT NULL,
  `tus_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tus_data`)),
  `uploaded_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `directus_files_uploaded_by_foreign` (`uploaded_by`),
  KEY `directus_files_modified_by_foreign` (`modified_by`),
  KEY `directus_files_folder_foreign` (`folder`),
  CONSTRAINT `directus_files_folder_foreign` FOREIGN KEY (`folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `directus_files_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `directus_users` (`id`),
  CONSTRAINT `directus_files_uploaded_by_foreign` FOREIGN KEY (`uploaded_by`) REFERENCES `directus_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_files`
--

LOCK TABLES `directus_files` WRITE;
/*!40000 ALTER TABLE `directus_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_flows`
--

DROP TABLE IF EXISTS `directus_flows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_flows` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `trigger` varchar(255) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `operation` char(36) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `directus_flows_operation_unique` (`operation`),
  KEY `directus_flows_user_created_foreign` (`user_created`),
  CONSTRAINT `directus_flows_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_flows`
--

LOCK TABLES `directus_flows` WRITE;
/*!40000 ALTER TABLE `directus_flows` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_flows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_folders`
--

DROP TABLE IF EXISTS `directus_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_folders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_folders_parent_foreign` (`parent`),
  CONSTRAINT `directus_folders_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_folders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_folders`
--

LOCK TABLES `directus_folders` WRITE;
/*!40000 ALTER TABLE `directus_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_migrations`
--

DROP TABLE IF EXISTS `directus_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_migrations` (
  `version` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_migrations`
--

LOCK TABLES `directus_migrations` WRITE;
/*!40000 ALTER TABLE `directus_migrations` DISABLE KEYS */;
INSERT INTO `directus_migrations` VALUES ('20201028A','Remove Collection Foreign Keys','2024-09-03 22:38:00'),('20201029A','Remove System Relations','2024-09-03 22:38:00'),('20201029B','Remove System Collections','2024-09-03 22:38:00'),('20201029C','Remove System Fields','2024-09-03 22:38:00'),('20201105A','Add Cascade System Relations','2024-09-03 22:38:01'),('20201105B','Change Webhook URL Type','2024-09-03 22:38:01'),('20210225A','Add Relations Sort Field','2024-09-03 22:38:01'),('20210304A','Remove Locked Fields','2024-09-03 22:38:01'),('20210312A','Webhooks Collections Text','2024-09-03 22:38:01'),('20210331A','Add Refresh Interval','2024-09-03 22:38:01'),('20210415A','Make Filesize Nullable','2024-09-03 22:38:01'),('20210416A','Add Collections Accountability','2024-09-03 22:38:01'),('20210422A','Remove Files Interface','2024-09-03 22:38:01'),('20210506A','Rename Interfaces','2024-09-03 22:38:01'),('20210510A','Restructure Relations','2024-09-03 22:38:01'),('20210518A','Add Foreign Key Constraints','2024-09-03 22:38:01'),('20210519A','Add System Fk Triggers','2024-09-03 22:38:01'),('20210521A','Add Collections Icon Color','2024-09-03 22:38:01'),('20210525A','Add Insights','2024-09-03 22:38:02'),('20210608A','Add Deep Clone Config','2024-09-03 22:38:02'),('20210626A','Change Filesize Bigint','2024-09-03 22:38:02'),('20210716A','Add Conditions to Fields','2024-09-03 22:38:02'),('20210721A','Add Default Folder','2024-09-03 22:38:02'),('20210802A','Replace Groups','2024-09-03 22:38:02'),('20210803A','Add Required to Fields','2024-09-03 22:38:02'),('20210805A','Update Groups','2024-09-03 22:38:02'),('20210805B','Change Image Metadata Structure','2024-09-03 22:38:02'),('20210811A','Add Geometry Config','2024-09-03 22:38:02'),('20210831A','Remove Limit Column','2024-09-03 22:38:02'),('20210903A','Add Auth Provider','2024-09-03 22:38:02'),('20210907A','Webhooks Collections Not Null','2024-09-03 22:38:02'),('20210910A','Move Module Setup','2024-09-03 22:38:02'),('20210920A','Webhooks URL Not Null','2024-09-03 22:38:02'),('20210924A','Add Collection Organization','2024-09-03 22:38:02'),('20210927A','Replace Fields Group','2024-09-03 22:38:02'),('20210927B','Replace M2M Interface','2024-09-03 22:38:02'),('20210929A','Rename Login Action','2024-09-03 22:38:02'),('20211007A','Update Presets','2024-09-03 22:38:02'),('20211009A','Add Auth Data','2024-09-03 22:38:02'),('20211016A','Add Webhook Headers','2024-09-03 22:38:02'),('20211103A','Set Unique to User Token','2024-09-03 22:38:02'),('20211103B','Update Special Geometry','2024-09-03 22:38:02'),('20211104A','Remove Collections Listing','2024-09-03 22:38:02'),('20211118A','Add Notifications','2024-09-03 22:38:02'),('20211211A','Add Shares','2024-09-03 22:38:02'),('20211230A','Add Project Descriptor','2024-09-03 22:38:02'),('20220303A','Remove Default Project Color','2024-09-03 22:38:02'),('20220308A','Add Bookmark Icon and Color','2024-09-03 22:38:02'),('20220314A','Add Translation Strings','2024-09-03 22:38:02'),('20220322A','Rename Field Typecast Flags','2024-09-03 22:38:02'),('20220323A','Add Field Validation','2024-09-03 22:38:02'),('20220325A','Fix Typecast Flags','2024-09-03 22:38:02'),('20220325B','Add Default Language','2024-09-03 22:38:02'),('20220402A','Remove Default Value Panel Icon','2024-09-03 22:38:02'),('20220429A','Add Flows','2024-09-03 22:38:02'),('20220429B','Add Color to Insights Icon','2024-09-03 22:38:02'),('20220429C','Drop Non Null From IP of Activity','2024-09-03 22:38:03'),('20220429D','Drop Non Null From Sender of Notifications','2024-09-03 22:38:03'),('20220614A','Rename Hook Trigger to Event','2024-09-03 22:38:03'),('20220801A','Update Notifications Timestamp Column','2024-09-03 22:38:03'),('20220802A','Add Custom Aspect Ratios','2024-09-03 22:38:03'),('20220826A','Add Origin to Accountability','2024-09-03 22:38:03'),('20230401A','Update Material Icons','2024-09-03 22:38:03'),('20230525A','Add Preview Settings','2024-09-03 22:38:03'),('20230526A','Migrate Translation Strings','2024-09-03 22:38:03'),('20230721A','Require Shares Fields','2024-09-03 22:38:03'),('20230823A','Add Content Versioning','2024-09-03 22:38:03'),('20230927A','Themes','2024-09-03 22:38:03'),('20231009A','Update CSV Fields to Text','2024-09-03 22:38:03'),('20231009B','Update Panel Options','2024-09-03 22:38:03'),('20231010A','Add Extensions','2024-09-03 22:38:03'),('20231215A','Add Focalpoints','2024-09-03 22:38:03'),('20240122A','Add Report URL Fields','2024-09-03 22:38:03'),('20240204A','Marketplace','2024-09-03 22:38:03'),('20240305A','Change Useragent Type','2024-09-03 22:38:03'),('20240311A','Deprecate Webhooks','2024-09-03 22:38:03'),('20240422A','Public Registration','2024-09-03 22:38:03'),('20240515A','Add Session Window','2024-09-03 22:38:03'),('20240701A','Add Tus Data','2024-09-03 22:38:03'),('20240716A','Update Files Date Fields','2024-09-03 22:38:03'),('20240806A','Permissions Policies','2024-09-03 22:38:04'),('20240817A','Update Icon Fields Length','2024-09-03 22:38:04');
/*!40000 ALTER TABLE `directus_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_notifications`
--

DROP TABLE IF EXISTS `directus_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(255) DEFAULT 'inbox',
  `recipient` char(36) NOT NULL,
  `sender` char(36) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_notifications_recipient_foreign` (`recipient`),
  KEY `directus_notifications_sender_foreign` (`sender`),
  CONSTRAINT `directus_notifications_recipient_foreign` FOREIGN KEY (`recipient`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_notifications_sender_foreign` FOREIGN KEY (`sender`) REFERENCES `directus_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_notifications`
--

LOCK TABLES `directus_notifications` WRITE;
/*!40000 ALTER TABLE `directus_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_operations`
--

DROP TABLE IF EXISTS `directus_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_operations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `position_x` int(11) NOT NULL,
  `position_y` int(11) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `resolve` char(36) DEFAULT NULL,
  `reject` char(36) DEFAULT NULL,
  `flow` char(36) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `directus_operations_resolve_unique` (`resolve`),
  UNIQUE KEY `directus_operations_reject_unique` (`reject`),
  KEY `directus_operations_flow_foreign` (`flow`),
  KEY `directus_operations_user_created_foreign` (`user_created`),
  CONSTRAINT `directus_operations_flow_foreign` FOREIGN KEY (`flow`) REFERENCES `directus_flows` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_operations_reject_foreign` FOREIGN KEY (`reject`) REFERENCES `directus_operations` (`id`),
  CONSTRAINT `directus_operations_resolve_foreign` FOREIGN KEY (`resolve`) REFERENCES `directus_operations` (`id`),
  CONSTRAINT `directus_operations_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_operations`
--

LOCK TABLES `directus_operations` WRITE;
/*!40000 ALTER TABLE `directus_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_panels`
--

DROP TABLE IF EXISTS `directus_panels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_panels` (
  `id` char(36) NOT NULL,
  `dashboard` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `show_header` tinyint(1) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `position_x` int(11) NOT NULL,
  `position_y` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_panels_dashboard_foreign` (`dashboard`),
  KEY `directus_panels_user_created_foreign` (`user_created`),
  CONSTRAINT `directus_panels_dashboard_foreign` FOREIGN KEY (`dashboard`) REFERENCES `directus_dashboards` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_panels_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_panels`
--

LOCK TABLES `directus_panels` WRITE;
/*!40000 ALTER TABLE `directus_panels` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_panels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_permissions`
--

DROP TABLE IF EXISTS `directus_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection` varchar(64) NOT NULL,
  `action` varchar(10) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation`)),
  `presets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`presets`)),
  `fields` text DEFAULT NULL,
  `policy` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_permissions_collection_foreign` (`collection`),
  KEY `directus_permissions_policy_foreign` (`policy`),
  CONSTRAINT `directus_permissions_policy_foreign` FOREIGN KEY (`policy`) REFERENCES `directus_policies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_permissions`
--

LOCK TABLES `directus_permissions` WRITE;
/*!40000 ALTER TABLE `directus_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_policies`
--

DROP TABLE IF EXISTS `directus_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_policies` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(64) NOT NULL DEFAULT 'badge',
  `description` text DEFAULT NULL,
  `ip_access` text DEFAULT NULL,
  `enforce_tfa` tinyint(1) NOT NULL DEFAULT 0,
  `admin_access` tinyint(1) NOT NULL DEFAULT 0,
  `app_access` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_policies`
--

LOCK TABLES `directus_policies` WRITE;
/*!40000 ALTER TABLE `directus_policies` DISABLE KEYS */;
INSERT INTO `directus_policies` VALUES ('147bd3a0-16bc-4a4a-b4d0-186a390debbb','Administrator','verified','$t:admin_description',NULL,0,1,1),('abf8a154-5b1c-4a46-ac9c-7300570f4f17','$t:public_label','public','$t:public_description',NULL,0,0,0);
/*!40000 ALTER TABLE `directus_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_presets`
--

DROP TABLE IF EXISTS `directus_presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_presets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookmark` varchar(255) DEFAULT NULL,
  `user` char(36) DEFAULT NULL,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `search` varchar(100) DEFAULT NULL,
  `layout` varchar(100) DEFAULT 'tabular',
  `layout_query` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`layout_query`)),
  `layout_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`layout_options`)),
  `refresh_interval` int(11) DEFAULT NULL,
  `filter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`filter`)),
  `icon` varchar(64) DEFAULT 'bookmark',
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_presets_collection_foreign` (`collection`),
  KEY `directus_presets_user_foreign` (`user`),
  KEY `directus_presets_role_foreign` (`role`),
  CONSTRAINT `directus_presets_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_presets_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_presets`
--

LOCK TABLES `directus_presets` WRITE;
/*!40000 ALTER TABLE `directus_presets` DISABLE KEYS */;
INSERT INTO `directus_presets` VALUES (1,NULL,'1096b95c-70ee-4ba6-b808-1531a551464c',NULL,'directus_users',NULL,'cards','{\"cards\":{\"sort\":[\"email\"],\"page\":1}}','{\"cards\":{\"icon\":\"account_circle\",\"title\":\"{{ first_name }} {{ last_name }}\",\"subtitle\":\"{{ email }}\",\"size\":4}}',NULL,NULL,'bookmark',NULL),(2,NULL,'1096b95c-70ee-4ba6-b808-1531a551464c',NULL,'categorias',NULL,NULL,'{\"tabular\":{\"fields\":[\"id_categoria\",\"descricao\",\"nome\",\"ordenacao\"],\"page\":1}}','{\"tabular\":{\"widths\":{}}}',NULL,NULL,'bookmark',NULL),(3,NULL,'1096b95c-70ee-4ba6-b808-1531a551464c',NULL,'contratos',NULL,'tabular','{\"tabular\":{\"page\":1}}',NULL,NULL,NULL,'bookmark',NULL),(4,NULL,'1096b95c-70ee-4ba6-b808-1531a551464c',NULL,'usuarios',NULL,NULL,'{\"tabular\":{\"page\":1,\"fields\":[\"id_usuario\",\"email\",\"primeiro_nome\",\"ultimo_nome\",\"tipo_usuario\",\"ativo\"]}}','{\"tabular\":{\"widths\":{}}}',NULL,NULL,'bookmark',NULL),(5,NULL,'1096b95c-70ee-4ba6-b808-1531a551464c',NULL,'servicos',NULL,NULL,'{\"tabular\":{\"page\":1}}',NULL,NULL,NULL,'bookmark',NULL),(6,NULL,'1096b95c-70ee-4ba6-b808-1531a551464c',NULL,'proposta',NULL,NULL,'{\"tabular\":{\"page\":1}}',NULL,NULL,NULL,'bookmark',NULL),(7,NULL,'1096b95c-70ee-4ba6-b808-1531a551464c',NULL,'enderecos',NULL,NULL,'{\"tabular\":{\"page\":1}}',NULL,NULL,NULL,'bookmark',NULL),(8,NULL,'1096b95c-70ee-4ba6-b808-1531a551464c',NULL,'directus_files',NULL,'cards','{\"cards\":{\"sort\":[\"-uploaded_on\"],\"page\":1}}','{\"cards\":{\"icon\":\"insert_drive_file\",\"title\":\"{{ title }}\",\"subtitle\":\"{{ type }} • {{ filesize }}\",\"size\":4,\"imageFit\":\"crop\"}}',NULL,NULL,'bookmark',NULL);
/*!40000 ALTER TABLE `directus_presets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_relations`
--

DROP TABLE IF EXISTS `directus_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `many_collection` varchar(64) NOT NULL,
  `many_field` varchar(64) NOT NULL,
  `one_collection` varchar(64) DEFAULT NULL,
  `one_field` varchar(64) DEFAULT NULL,
  `one_collection_field` varchar(64) DEFAULT NULL,
  `one_allowed_collections` text DEFAULT NULL,
  `junction_field` varchar(64) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `one_deselect_action` varchar(255) NOT NULL DEFAULT 'nullify',
  PRIMARY KEY (`id`),
  KEY `directus_relations_many_collection_foreign` (`many_collection`),
  KEY `directus_relations_one_collection_foreign` (`one_collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_relations`
--

LOCK TABLES `directus_relations` WRITE;
/*!40000 ALTER TABLE `directus_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_revisions`
--

DROP TABLE IF EXISTS `directus_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity` int(10) unsigned NOT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `delta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`delta`)),
  `parent` int(10) unsigned DEFAULT NULL,
  `version` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_revisions_collection_foreign` (`collection`),
  KEY `directus_revisions_parent_foreign` (`parent`),
  KEY `directus_revisions_activity_foreign` (`activity`),
  KEY `directus_revisions_version_foreign` (`version`),
  CONSTRAINT `directus_revisions_activity_foreign` FOREIGN KEY (`activity`) REFERENCES `directus_activity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_revisions_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_revisions` (`id`),
  CONSTRAINT `directus_revisions_version_foreign` FOREIGN KEY (`version`) REFERENCES `directus_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_revisions`
--

LOCK TABLES `directus_revisions` WRITE;
/*!40000 ALTER TABLE `directus_revisions` DISABLE KEYS */;
INSERT INTO `directus_revisions` VALUES (1,2,'directus_users','1096b95c-70ee-4ba6-b808-1531a551464c','{\"id\":\"1096b95c-70ee-4ba6-b808-1531a551464c\",\"first_name\":\"Admin\",\"last_name\":\"User\",\"email\":\"admin@trabalhoamigo.com.br\",\"password\":\"**********\",\"location\":null,\"title\":null,\"description\":null,\"tags\":null,\"avatar\":null,\"language\":null,\"tfa_secret\":null,\"status\":\"active\",\"role\":\"a504ed9b-8c34-4911-bfb8-1a035abc1e97\",\"token\":null,\"last_access\":\"2024-09-03T19:43:37.000Z\",\"last_page\":\"/users/1096b95c-70ee-4ba6-b808-1531a551464c\",\"provider\":\"default\",\"external_identifier\":null,\"auth_data\":null,\"email_notifications\":true,\"appearance\":null,\"theme_dark\":null,\"theme_light\":null,\"theme_light_overrides\":null,\"theme_dark_overrides\":null,\"policies\":[]}','{\"email\":\"admin@trabalhoamigo.com.br\"}',NULL,NULL),(2,3,'directus_users','1096b95c-70ee-4ba6-b808-1531a551464c','{\"id\":\"1096b95c-70ee-4ba6-b808-1531a551464c\",\"first_name\":\"Admin\",\"last_name\":\"User\",\"email\":\"admin@trabalhoamigo.com.br\",\"password\":\"**********\",\"location\":null,\"title\":null,\"description\":null,\"tags\":null,\"avatar\":null,\"language\":null,\"tfa_secret\":null,\"status\":\"active\",\"role\":\"a504ed9b-8c34-4911-bfb8-1a035abc1e97\",\"token\":null,\"last_access\":\"2024-09-03T20:48:39.000Z\",\"last_page\":\"/users/1096b95c-70ee-4ba6-b808-1531a551464c\",\"provider\":\"default\",\"external_identifier\":null,\"auth_data\":null,\"email_notifications\":true,\"appearance\":null,\"theme_dark\":\"Directus Default\",\"theme_light\":null,\"theme_light_overrides\":null,\"theme_dark_overrides\":null,\"policies\":[]}','{\"theme_dark\":\"Directus Default\"}',NULL,NULL),(3,4,'directus_settings','1','{\"module_bar\":[{\"type\":\"module\",\"id\":\"content\",\"enabled\":true},{\"type\":\"module\",\"id\":\"users\",\"enabled\":true},{\"type\":\"module\",\"id\":\"files\",\"enabled\":true},{\"type\":\"module\",\"id\":\"insights\",\"enabled\":false},{\"type\":\"module\",\"id\":\"settings\",\"enabled\":true,\"locked\":true}]}','{\"module_bar\":[{\"type\":\"module\",\"id\":\"content\",\"enabled\":true},{\"type\":\"module\",\"id\":\"users\",\"enabled\":true},{\"type\":\"module\",\"id\":\"files\",\"enabled\":true},{\"type\":\"module\",\"id\":\"insights\",\"enabled\":false},{\"type\":\"module\",\"id\":\"settings\",\"enabled\":true,\"locked\":true}]}',NULL,NULL),(4,5,'directus_users','07b9d3d0-5dfc-43d8-85b1-bd0f39e1b1e4','{\"email\":\"vitorgabrieldeoliveiradev@gmail.com\",\"role\":\"a504ed9b-8c34-4911-bfb8-1a035abc1e97\",\"status\":\"invited\"}','{\"email\":\"vitorgabrieldeoliveiradev@gmail.com\",\"role\":\"a504ed9b-8c34-4911-bfb8-1a035abc1e97\",\"status\":\"invited\"}',NULL,NULL),(5,7,'directus_translations','4fbe1a93-7514-49b6-9b6d-88d51e76d80c','{\"language\":\"pt-BR\",\"key\":\"Português Brasil\",\"value\":\"Tradução\"}','{\"language\":\"pt-BR\",\"key\":\"Português Brasil\",\"value\":\"Tradução\"}',NULL,NULL),(6,9,'directus_settings','1','{\"id\":1,\"project_name\":\"Directus\",\"project_url\":null,\"project_color\":\"#6644FF\",\"project_logo\":null,\"public_foreground\":null,\"public_background\":null,\"public_note\":null,\"auth_login_attempts\":25,\"auth_password_policy\":null,\"storage_asset_transform\":\"all\",\"storage_asset_presets\":null,\"custom_css\":null,\"storage_default_folder\":null,\"basemaps\":null,\"mapbox_key\":null,\"module_bar\":[{\"type\":\"module\",\"id\":\"content\",\"enabled\":true},{\"type\":\"module\",\"id\":\"users\",\"enabled\":true},{\"type\":\"module\",\"id\":\"files\",\"enabled\":true},{\"type\":\"module\",\"id\":\"insights\",\"enabled\":false},{\"type\":\"module\",\"id\":\"settings\",\"enabled\":true,\"locked\":true}],\"project_descriptor\":null,\"default_language\":\"en-US\",\"custom_aspect_ratios\":null,\"public_favicon\":null,\"default_appearance\":\"auto\",\"default_theme_light\":null,\"theme_light_overrides\":null,\"default_theme_dark\":null,\"theme_dark_overrides\":null,\"report_error_url\":null,\"report_bug_url\":null,\"report_feature_url\":null,\"public_registration\":false,\"public_registration_verify_email\":false,\"public_registration_role\":null,\"public_registration_email_filter\":null}','{\"public_registration_verify_email\":false}',NULL,NULL),(7,10,'directus_settings','1','{\"id\":1,\"project_name\":\"Trabalho Amigo\",\"project_url\":\"admin.trabalhoamigo.com.br\",\"project_color\":\"#6644FF\",\"project_logo\":null,\"public_foreground\":null,\"public_background\":null,\"public_note\":null,\"auth_login_attempts\":25,\"auth_password_policy\":null,\"storage_asset_transform\":\"all\",\"storage_asset_presets\":null,\"custom_css\":null,\"storage_default_folder\":null,\"basemaps\":null,\"mapbox_key\":null,\"module_bar\":[{\"type\":\"module\",\"id\":\"content\",\"enabled\":true},{\"type\":\"module\",\"id\":\"users\",\"enabled\":true},{\"type\":\"module\",\"id\":\"files\",\"enabled\":true},{\"type\":\"module\",\"id\":\"insights\",\"enabled\":false},{\"type\":\"module\",\"id\":\"settings\",\"enabled\":true,\"locked\":true}],\"project_descriptor\":\"Painel administrador do projeto trabalho amigo.\",\"default_language\":\"pt-BR\",\"custom_aspect_ratios\":null,\"public_favicon\":null,\"default_appearance\":\"auto\",\"default_theme_light\":null,\"theme_light_overrides\":null,\"default_theme_dark\":null,\"theme_dark_overrides\":null,\"report_error_url\":null,\"report_bug_url\":null,\"report_feature_url\":null,\"public_registration\":false,\"public_registration_verify_email\":false,\"public_registration_role\":null,\"public_registration_email_filter\":null}','{\"project_name\":\"Trabalho Amigo\",\"project_url\":\"admin.trabalhoamigo.com.br\",\"project_descriptor\":\"Painel administrador do projeto trabalho amigo.\",\"default_language\":\"pt-BR\"}',NULL,NULL),(8,11,'directus_collections','categorias','{\"collection\":\"categorias\"}','{\"collection\":\"categorias\"}',NULL,NULL),(9,12,'directus_collections','usuarios','{\"collection\":\"usuarios\"}','{\"collection\":\"usuarios\"}',NULL,NULL),(10,13,'directus_collections','contratos','{\"collection\":\"contratos\"}','{\"collection\":\"contratos\"}',NULL,NULL),(11,14,'directus_collections','enderecos','{\"collection\":\"enderecos\"}','{\"collection\":\"enderecos\"}',NULL,NULL),(12,15,'directus_collections','proposta','{\"collection\":\"proposta\"}','{\"collection\":\"proposta\"}',NULL,NULL),(13,16,'directus_collections','servicos','{\"collection\":\"servicos\"}','{\"collection\":\"servicos\"}',NULL,NULL),(14,17,'categorias','1','{\"id_categoria\":1,\"nome\":\"Vitor Gabriel de Oliveira\",\"descricao\":\"Teste de Descrição\",\"ordenacao\":1}','{\"id_categoria\":1,\"nome\":\"Vitor Gabriel de Oliveira\",\"descricao\":\"Teste de Descrição\",\"ordenacao\":1}',NULL,NULL),(15,19,'directus_fields','1','{\"special\":null,\"collection\":\"categorias\",\"field\":\"id_categoria\"}','{\"special\":null,\"collection\":\"categorias\",\"field\":\"id_categoria\"}',NULL,NULL),(16,20,'directus_fields','1','{\"id\":1,\"collection\":\"categorias\",\"field\":\"id_categoria\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":true,\"hidden\":true,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null,\"validation\":null,\"validation_message\":null}','{\"collection\":\"categorias\",\"field\":\"id_categoria\",\"readonly\":true,\"hidden\":true,\"translations\":null}',NULL,NULL),(17,21,'categorias','2','{\"nome\":\"Elétrica\",\"descricao\":\"Sistema Elétricos\",\"ordenacao\":1}','{\"nome\":\"Elétrica\",\"descricao\":\"Sistema Elétricos\",\"ordenacao\":1}',NULL,NULL),(18,22,'directus_fields','1','{\"id\":1,\"collection\":\"categorias\",\"field\":\"id_categoria\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":true,\"hidden\":true,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null,\"validation\":null,\"validation_message\":null}','{\"collection\":\"categorias\",\"field\":\"id_categoria\",\"hidden\":true}',NULL,NULL),(19,23,'directus_fields','2','{\"hidden\":true,\"readonly\":true,\"collection\":\"usuarios\",\"field\":\"id_usuario\"}','{\"hidden\":true,\"readonly\":true,\"collection\":\"usuarios\",\"field\":\"id_usuario\"}',NULL,NULL),(20,24,'directus_fields','3','{\"hidden\":true,\"readonly\":true,\"collection\":\"servicos\",\"field\":\"id_usuario_fk\"}','{\"hidden\":true,\"readonly\":true,\"collection\":\"servicos\",\"field\":\"id_usuario_fk\"}',NULL,NULL),(21,25,'usuarios','1','{\"email\":\"vitorgabrieldeoliveiradev@gmail.com\",\"cpf\":\"13770078985\",\"primeiro_nome\":\"Vitor Gabriel\",\"ultimo_nome\":\"de Oliveira\",\"celular\":\"43984873807\",\"whatsapp\":\"43984843807\",\"telefone\":\"43984843807\",\"senha\":\"123456\",\"data_Criacao\":\"2024-09-03T12:00:00\",\"tipo_usuario\":\"Contratante\"}','{\"email\":\"vitorgabrieldeoliveiradev@gmail.com\",\"cpf\":\"13770078985\",\"primeiro_nome\":\"Vitor Gabriel\",\"ultimo_nome\":\"de Oliveira\",\"celular\":\"43984873807\",\"whatsapp\":\"43984843807\",\"telefone\":\"43984843807\",\"senha\":\"123456\",\"data_Criacao\":\"2024-09-03T12:00:00\",\"tipo_usuario\":\"Contratante\"}',NULL,NULL),(22,26,'directus_fields','4','{\"hidden\":true,\"translations\":null,\"collection\":\"usuarios\",\"field\":\"cnpj\"}','{\"hidden\":true,\"translations\":null,\"collection\":\"usuarios\",\"field\":\"cnpj\"}',NULL,NULL),(23,27,'directus_fields','5','{\"hidden\":true,\"collection\":\"usuarios\",\"field\":\"cpf\"}','{\"hidden\":true,\"collection\":\"usuarios\",\"field\":\"cpf\"}',NULL,NULL),(24,28,'directus_fields','6','{\"hidden\":true,\"collection\":\"usuarios\",\"field\":\"email\"}','{\"hidden\":true,\"collection\":\"usuarios\",\"field\":\"email\"}',NULL,NULL),(25,29,'directus_fields','6','{\"id\":6,\"collection\":\"usuarios\",\"field\":\"email\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null,\"validation\":null,\"validation_message\":null}','{\"collection\":\"usuarios\",\"field\":\"email\",\"hidden\":false}',NULL,NULL),(26,30,'directus_collections','contratos','{\"collection\":\"contratos\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":1,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":1,\"group\":null}',NULL,NULL),(27,31,'directus_collections','enderecos','{\"collection\":\"enderecos\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":2,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":2,\"group\":null}',NULL,NULL),(28,32,'directus_collections','proposta','{\"collection\":\"proposta\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":3,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":3,\"group\":null}',NULL,NULL),(29,33,'directus_collections','servicos','{\"collection\":\"servicos\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":4,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":4,\"group\":null}',NULL,NULL),(30,34,'directus_collections','usuarios','{\"collection\":\"usuarios\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":5,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":5,\"group\":null}',NULL,NULL),(31,35,'directus_collections','categorias','{\"collection\":\"categorias\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":6,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":6,\"group\":null}',NULL,NULL),(32,36,'directus_collections','contratos','{\"collection\":\"contratos\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":1,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":1,\"group\":null}',NULL,NULL),(33,37,'directus_collections','proposta','{\"collection\":\"proposta\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":2,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":2,\"group\":null}',NULL,NULL),(34,38,'directus_collections','servicos','{\"collection\":\"servicos\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":3,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":3,\"group\":null}',NULL,NULL),(35,39,'directus_collections','usuarios','{\"collection\":\"usuarios\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":4,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":4,\"group\":null}',NULL,NULL),(36,40,'directus_collections','categorias','{\"collection\":\"categorias\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":5,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":5,\"group\":null}',NULL,NULL),(37,41,'directus_collections','enderecos','{\"collection\":\"enderecos\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":6,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":6,\"group\":null}',NULL,NULL),(38,42,'directus_collections','Consultas','{\"collection\":\"Consultas\",\"icon\":\"folder\",\"note\":\"Tabelas para consultas\",\"color\":\"#5D3EE9\",\"translations\":null}','{\"collection\":\"Consultas\",\"icon\":\"folder\",\"note\":\"Tabelas para consultas\",\"color\":\"#5D3EE9\",\"translations\":null}',NULL,NULL),(39,43,'directus_collections','proposta','{\"collection\":\"proposta\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":1,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":1,\"group\":null}',NULL,NULL),(40,44,'directus_collections','contratos','{\"collection\":\"contratos\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":2,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":2,\"group\":null}',NULL,NULL),(41,45,'directus_collections','servicos','{\"collection\":\"servicos\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":3,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":3,\"group\":null}',NULL,NULL),(42,46,'directus_collections','usuarios','{\"collection\":\"usuarios\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":4,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":4,\"group\":null}',NULL,NULL),(43,47,'directus_collections','categorias','{\"collection\":\"categorias\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":5,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":5,\"group\":null}',NULL,NULL),(44,48,'directus_collections','enderecos','{\"collection\":\"enderecos\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":6,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":6,\"group\":null}',NULL,NULL),(45,49,'directus_collections','Consultas','{\"collection\":\"Consultas\",\"icon\":\"folder\",\"note\":\"Tabelas para consultas\",\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":\"#5D3EE9\",\"item_duplication_fields\":null,\"sort\":7,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"sort\":7,\"group\":null}',NULL,NULL),(46,51,'enderecos','1','{\"id_usuario\":1,\"id_endereco\":1,\"cep\":\"86086340\",\"rua\":\"Rua Eduardo Aparecida Turetta\",\"bairro\":\"Jardim Itaparica\",\"numero\":225,\"complemento\":\"Portão do meio\"}','{\"id_usuario\":1,\"id_endereco\":1,\"cep\":\"86086340\",\"rua\":\"Rua Eduardo Aparecida Turetta\",\"bairro\":\"Jardim Itaparica\",\"numero\":225,\"complemento\":\"Portão do meio\"}',NULL,NULL),(47,52,'directus_fields','3','{\"id\":3,\"collection\":\"servicos\",\"field\":\"id_usuario_fk\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":true,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null,\"validation\":null,\"validation_message\":null}','{\"collection\":\"servicos\",\"field\":\"id_usuario_fk\",\"hidden\":false}',NULL,NULL),(48,53,'directus_fields','3','{\"id\":3,\"collection\":\"servicos\",\"field\":\"id_usuario_fk\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null,\"validation\":null,\"validation_message\":null}','{\"collection\":\"servicos\",\"field\":\"id_usuario_fk\",\"readonly\":false,\"translations\":null}',NULL,NULL),(49,54,'servicos','1','{\"data_Criacao\":\"2024-09-03T12:00:00\",\"id_usuario_fk\":1,\"preco\":29,\"descricao\":\"Realizo troca de fechaduras em sua casa\",\"titulo\":\"Troca de fechaduras\",\"id_servico\":1,\"id_categoria_fk\":2}','{\"data_Criacao\":\"2024-09-03T12:00:00\",\"id_usuario_fk\":1,\"preco\":29,\"descricao\":\"Realizo troca de fechaduras em sua casa\",\"titulo\":\"Troca de fechaduras\",\"id_servico\":1,\"id_categoria_fk\":2}',NULL,NULL),(50,55,'proposta','1','{\"id_usuario_contrante_fk\":1,\"id_usuario_prestador_fk\":1,\"id_contrato\":1,\"id_servico_fk\":1,\"data_contrato\":\"2024-09-03T12:00:00\",\"prazo_estimado\":\"2024-09-27T12:00:00\",\"valor_total\":38.7}','{\"id_usuario_contrante_fk\":1,\"id_usuario_prestador_fk\":1,\"id_contrato\":1,\"id_servico_fk\":1,\"data_contrato\":\"2024-09-03T12:00:00\",\"prazo_estimado\":\"2024-09-27T12:00:00\",\"valor_total\":38.7}',NULL,NULL),(51,56,'directus_collections','contratos','{\"collection\":\"contratos\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":true,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":2,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}','{\"hidden\":true}',NULL,NULL),(52,57,'directus_settings','1','{\"id\":1,\"project_name\":\"Trabalho Amigo\",\"project_url\":\"admin.trabalhoamigo.com.br\",\"project_color\":\"#6644FF\",\"project_logo\":null,\"public_foreground\":null,\"public_background\":null,\"public_note\":null,\"auth_login_attempts\":25,\"auth_password_policy\":null,\"storage_asset_transform\":\"all\",\"storage_asset_presets\":null,\"custom_css\":null,\"storage_default_folder\":null,\"basemaps\":null,\"mapbox_key\":null,\"module_bar\":[{\"type\":\"module\",\"id\":\"content\",\"enabled\":true},{\"type\":\"module\",\"id\":\"users\",\"enabled\":true},{\"type\":\"module\",\"id\":\"files\",\"enabled\":true},{\"type\":\"module\",\"id\":\"insights\",\"enabled\":false},{\"type\":\"module\",\"id\":\"settings\",\"enabled\":true,\"locked\":true}],\"project_descriptor\":\"Painel administrador do projeto trabalho amigo.\",\"default_language\":\"pt-BR\",\"custom_aspect_ratios\":null,\"public_favicon\":null,\"default_appearance\":\"auto\",\"default_theme_light\":null,\"theme_light_overrides\":null,\"default_theme_dark\":null,\"theme_dark_overrides\":null,\"report_error_url\":null,\"report_bug_url\":null,\"report_feature_url\":null,\"public_registration\":false,\"public_registration_verify_email\":false,\"public_registration_role\":null,\"public_registration_email_filter\":{\"_and\":[{\"email\":{\"_contains\":null}}]}}','{\"public_registration_email_filter\":{\"_and\":[{\"email\":{\"_contains\":null}}]}}',NULL,NULL),(53,58,'directus_roles','2ecd18ea-cdfb-4a5f-8224-d0514b79bb9c','{\"name\":\"Usuário\"}','{\"name\":\"Usuário\"}',NULL,NULL),(54,59,'directus_roles','2ecd18ea-cdfb-4a5f-8224-d0514b79bb9c','{\"id\":\"2ecd18ea-cdfb-4a5f-8224-d0514b79bb9c\",\"name\":\"Colaborador\",\"icon\":\"manage_accounts\",\"description\":\"Permissões padrões de colaborador\",\"parent\":null,\"children\":[],\"policies\":[],\"users\":[]}','{\"name\":\"Colaborador\",\"icon\":\"manage_accounts\",\"description\":\"Permissões padrões de colaborador\"}',NULL,NULL),(55,60,'directus_policies','901d3b3d-2514-4155-816d-7c20604e8f46','{\"name\":\"Colaborador\",\"admin_access\":true,\"app_access\":false}','{\"name\":\"Colaborador\",\"admin_access\":true,\"app_access\":false}',NULL,NULL),(56,63,'directus_roles','a504ed9b-8c34-4911-bfb8-1a035abc1e97','{\"id\":\"a504ed9b-8c34-4911-bfb8-1a035abc1e97\",\"name\":\"Administrator\",\"icon\":\"verified\",\"description\":\"Cargo administrativo com acesso irrestrito ao App/API.\",\"parent\":null,\"children\":[],\"policies\":[\"4c9c65a3-22ff-42c3-a5e5-bb69bf7a14cb\"],\"users\":[\"1096b95c-70ee-4ba6-b808-1531a551464c\"]}','{\"description\":\"Cargo administrativo com acesso irrestrito ao App/API.\"}',NULL,NULL),(57,64,'directus_users','1096b95c-70ee-4ba6-b808-1531a551464c','{\"id\":\"1096b95c-70ee-4ba6-b808-1531a551464c\",\"first_name\":\"Admin\",\"last_name\":\"User\",\"email\":\"admin@trabalhoamigo.com.br\",\"password\":\"**********\",\"location\":\"Londrina\",\"title\":null,\"description\":null,\"tags\":null,\"avatar\":null,\"language\":\"pt-BR\",\"tfa_secret\":null,\"status\":\"active\",\"role\":\"a504ed9b-8c34-4911-bfb8-1a035abc1e97\",\"token\":null,\"last_access\":\"2024-09-03T21:45:53.000Z\",\"last_page\":\"/users/1096b95c-70ee-4ba6-b808-1531a551464c\",\"provider\":\"default\",\"external_identifier\":null,\"auth_data\":null,\"email_notifications\":false,\"appearance\":\"dark\",\"theme_dark\":\"Directus Default\",\"theme_light\":\"Directus Default\",\"theme_light_overrides\":null,\"theme_dark_overrides\":null,\"policies\":[]}','{\"location\":\"Londrina\",\"language\":\"pt-BR\",\"email_notifications\":false,\"appearance\":\"dark\",\"theme_light\":\"Directus Default\"}',NULL,NULL);
/*!40000 ALTER TABLE `directus_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_roles`
--

DROP TABLE IF EXISTS `directus_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_roles` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(64) NOT NULL DEFAULT 'supervised_user_circle',
  `description` text DEFAULT NULL,
  `parent` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_roles_parent_foreign` (`parent`),
  CONSTRAINT `directus_roles_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_roles`
--

LOCK TABLES `directus_roles` WRITE;
/*!40000 ALTER TABLE `directus_roles` DISABLE KEYS */;
INSERT INTO `directus_roles` VALUES ('a504ed9b-8c34-4911-bfb8-1a035abc1e97','Administrator','verified','Cargo administrativo com acesso irrestrito ao App/API.',NULL);
/*!40000 ALTER TABLE `directus_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_sessions`
--

DROP TABLE IF EXISTS `directus_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_sessions` (
  `token` varchar(64) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `share` char(36) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `next_token` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `directus_sessions_user_foreign` (`user`),
  KEY `directus_sessions_share_foreign` (`share`),
  CONSTRAINT `directus_sessions_share_foreign` FOREIGN KEY (`share`) REFERENCES `directus_shares` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_sessions_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_sessions`
--

LOCK TABLES `directus_sessions` WRITE;
/*!40000 ALTER TABLE `directus_sessions` DISABLE KEYS */;
INSERT INTO `directus_sessions` VALUES ('Q2XIYpXwdKbSTBrk60qjHD__-rTCJgOegat8YxTGHdDOLUSeec9PEOH1srwGeZ3_','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-04 00:39:17','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36',NULL,'http://localhost:8055','TOyq6SOfDNTPit0fcw2-LAt6Trn7_mLtkm45X2W8r4LmIegf_wCAv843xg5tf_NI'),('TOyq6SOfDNTPit0fcw2-LAt6Trn7_mLtkm45X2W8r4LmIegf_wCAv843xg5tf_NI','1096b95c-70ee-4ba6-b808-1531a551464c','2024-09-05 00:39:07','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36',NULL,'http://localhost:8055',NULL);
/*!40000 ALTER TABLE `directus_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_settings`
--

DROP TABLE IF EXISTS `directus_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL DEFAULT 'Directus',
  `project_url` varchar(255) DEFAULT NULL,
  `project_color` varchar(255) NOT NULL DEFAULT '#6644FF',
  `project_logo` char(36) DEFAULT NULL,
  `public_foreground` char(36) DEFAULT NULL,
  `public_background` char(36) DEFAULT NULL,
  `public_note` text DEFAULT NULL,
  `auth_login_attempts` int(10) unsigned DEFAULT 25,
  `auth_password_policy` varchar(100) DEFAULT NULL,
  `storage_asset_transform` varchar(7) DEFAULT 'all',
  `storage_asset_presets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`storage_asset_presets`)),
  `custom_css` text DEFAULT NULL,
  `storage_default_folder` char(36) DEFAULT NULL,
  `basemaps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`basemaps`)),
  `mapbox_key` varchar(255) DEFAULT NULL,
  `module_bar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`module_bar`)),
  `project_descriptor` varchar(100) DEFAULT NULL,
  `default_language` varchar(255) NOT NULL DEFAULT 'en-US',
  `custom_aspect_ratios` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_aspect_ratios`)),
  `public_favicon` char(36) DEFAULT NULL,
  `default_appearance` varchar(255) NOT NULL DEFAULT 'auto',
  `default_theme_light` varchar(255) DEFAULT NULL,
  `theme_light_overrides` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`theme_light_overrides`)),
  `default_theme_dark` varchar(255) DEFAULT NULL,
  `theme_dark_overrides` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`theme_dark_overrides`)),
  `report_error_url` varchar(255) DEFAULT NULL,
  `report_bug_url` varchar(255) DEFAULT NULL,
  `report_feature_url` varchar(255) DEFAULT NULL,
  `public_registration` tinyint(1) NOT NULL DEFAULT 0,
  `public_registration_verify_email` tinyint(1) NOT NULL DEFAULT 1,
  `public_registration_role` char(36) DEFAULT NULL,
  `public_registration_email_filter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`public_registration_email_filter`)),
  PRIMARY KEY (`id`),
  KEY `directus_settings_project_logo_foreign` (`project_logo`),
  KEY `directus_settings_public_foreground_foreign` (`public_foreground`),
  KEY `directus_settings_public_background_foreign` (`public_background`),
  KEY `directus_settings_storage_default_folder_foreign` (`storage_default_folder`),
  KEY `directus_settings_public_favicon_foreign` (`public_favicon`),
  KEY `directus_settings_public_registration_role_foreign` (`public_registration_role`),
  CONSTRAINT `directus_settings_project_logo_foreign` FOREIGN KEY (`project_logo`) REFERENCES `directus_files` (`id`),
  CONSTRAINT `directus_settings_public_background_foreign` FOREIGN KEY (`public_background`) REFERENCES `directus_files` (`id`),
  CONSTRAINT `directus_settings_public_favicon_foreign` FOREIGN KEY (`public_favicon`) REFERENCES `directus_files` (`id`),
  CONSTRAINT `directus_settings_public_foreground_foreign` FOREIGN KEY (`public_foreground`) REFERENCES `directus_files` (`id`),
  CONSTRAINT `directus_settings_public_registration_role_foreign` FOREIGN KEY (`public_registration_role`) REFERENCES `directus_roles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `directus_settings_storage_default_folder_foreign` FOREIGN KEY (`storage_default_folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_settings`
--

LOCK TABLES `directus_settings` WRITE;
/*!40000 ALTER TABLE `directus_settings` DISABLE KEYS */;
INSERT INTO `directus_settings` VALUES (1,'Trabalho Amigo','admin.trabalhoamigo.com.br','#6644FF',NULL,NULL,NULL,NULL,25,NULL,'all',NULL,NULL,NULL,NULL,NULL,'[{\"type\":\"module\",\"id\":\"content\",\"enabled\":true},{\"type\":\"module\",\"id\":\"users\",\"enabled\":true},{\"type\":\"module\",\"id\":\"files\",\"enabled\":true},{\"type\":\"module\",\"id\":\"insights\",\"enabled\":false},{\"type\":\"module\",\"id\":\"settings\",\"enabled\":true,\"locked\":true}]','Painel administrador do projeto trabalho amigo.','pt-BR',NULL,NULL,'auto',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,'{\"_and\":[{\"email\":{\"_contains\":null}}]}');
/*!40000 ALTER TABLE `directus_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_shares`
--

DROP TABLE IF EXISTS `directus_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_shares` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `role` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `times_used` int(11) DEFAULT 0,
  `max_uses` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_shares_role_foreign` (`role`),
  KEY `directus_shares_user_created_foreign` (`user_created`),
  KEY `directus_shares_collection_foreign` (`collection`),
  CONSTRAINT `directus_shares_collection_foreign` FOREIGN KEY (`collection`) REFERENCES `directus_collections` (`collection`) ON DELETE CASCADE,
  CONSTRAINT `directus_shares_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_shares_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_shares`
--

LOCK TABLES `directus_shares` WRITE;
/*!40000 ALTER TABLE `directus_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_translations`
--

DROP TABLE IF EXISTS `directus_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_translations` (
  `id` char(36) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_translations`
--

LOCK TABLES `directus_translations` WRITE;
/*!40000 ALTER TABLE `directus_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_users`
--

DROP TABLE IF EXISTS `directus_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_users` (
  `id` char(36) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `avatar` char(36) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `tfa_secret` varchar(255) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'active',
  `role` char(36) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `last_access` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_page` varchar(255) DEFAULT NULL,
  `provider` varchar(128) NOT NULL DEFAULT 'default',
  `external_identifier` varchar(255) DEFAULT NULL,
  `auth_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`auth_data`)),
  `email_notifications` tinyint(1) DEFAULT 1,
  `appearance` varchar(255) DEFAULT NULL,
  `theme_dark` varchar(255) DEFAULT NULL,
  `theme_light` varchar(255) DEFAULT NULL,
  `theme_light_overrides` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`theme_light_overrides`)),
  `theme_dark_overrides` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`theme_dark_overrides`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `directus_users_external_identifier_unique` (`external_identifier`),
  UNIQUE KEY `directus_users_email_unique` (`email`),
  UNIQUE KEY `directus_users_token_unique` (`token`),
  KEY `directus_users_role_foreign` (`role`),
  CONSTRAINT `directus_users_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_users`
--

LOCK TABLES `directus_users` WRITE;
/*!40000 ALTER TABLE `directus_users` DISABLE KEYS */;
INSERT INTO `directus_users` VALUES ('1096b95c-70ee-4ba6-b808-1531a551464c','Admin','User','admin@trabalhoamigo.com.br','$argon2id$v=19$m=65536,t=3,p=4$tQ63Z9qnodEYO0Y1ODx6ZQ$vSHyyNN/J8QC7ndRjfCMIcc5gj1E+/inidfQOw5z75g','Londrina',NULL,NULL,NULL,NULL,'pt-BR',NULL,'active','a504ed9b-8c34-4911-bfb8-1a035abc1e97',NULL,'2024-09-04 00:46:08','/settings/project','default',NULL,NULL,0,'dark','Directus Default','Directus Default',NULL,NULL);
/*!40000 ALTER TABLE `directus_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_versions`
--

DROP TABLE IF EXISTS `directus_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_versions` (
  `id` char(36) NOT NULL,
  `key` varchar(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_versions_collection_foreign` (`collection`),
  KEY `directus_versions_user_created_foreign` (`user_created`),
  KEY `directus_versions_user_updated_foreign` (`user_updated`),
  CONSTRAINT `directus_versions_collection_foreign` FOREIGN KEY (`collection`) REFERENCES `directus_collections` (`collection`) ON DELETE CASCADE,
  CONSTRAINT `directus_versions_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `directus_versions_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_versions`
--

LOCK TABLES `directus_versions` WRITE;
/*!40000 ALTER TABLE `directus_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_webhooks`
--

DROP TABLE IF EXISTS `directus_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL DEFAULT 'POST',
  `url` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active',
  `data` tinyint(1) NOT NULL DEFAULT 1,
  `actions` varchar(100) NOT NULL,
  `collections` varchar(255) NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`)),
  `was_active_before_deprecation` tinyint(1) NOT NULL DEFAULT 0,
  `migrated_flow` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_webhooks_migrated_flow_foreign` (`migrated_flow`),
  CONSTRAINT `directus_webhooks_migrated_flow_foreign` FOREIGN KEY (`migrated_flow`) REFERENCES `directus_flows` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_webhooks`
--

LOCK TABLES `directus_webhooks` WRITE;
/*!40000 ALTER TABLE `directus_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `rua` varchar(120) DEFAULT NULL,
  `bairro` varchar(70) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
INSERT INTO `enderecos` VALUES (1,1,'86086340','Rua Eduardo Aparecida Turetta','Jardim Itaparica',225,'Portão do meio');
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposta`
--

DROP TABLE IF EXISTS `proposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposta` (
  `id_contrato` int(11) NOT NULL AUTO_INCREMENT,
  `id_servico_fk` int(11) NOT NULL,
  `id_usuario_contrante_fk` int(11) NOT NULL,
  `id_usuario_prestador_fk` int(11) NOT NULL,
  `data_contrato` datetime NOT NULL,
  `prazo_estimado` datetime NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_contrato`),
  KEY `fk_contrato_usuario_contrante` (`id_usuario_contrante_fk`),
  KEY `fk_contrato_usuario_prestador` (`id_usuario_prestador_fk`),
  CONSTRAINT `fk_contrato_usuario_contrante` FOREIGN KEY (`id_usuario_contrante_fk`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `fk_contrato_usuario_prestador` FOREIGN KEY (`id_usuario_prestador_fk`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposta`
--

LOCK TABLES `proposta` WRITE;
/*!40000 ALTER TABLE `proposta` DISABLE KEYS */;
INSERT INTO `proposta` VALUES (1,1,1,1,'2024-09-03 12:00:00','2024-09-27 12:00:00',38.70,1);
/*!40000 ALTER TABLE `proposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicos` (
  `id_servico` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_fk` int(11) NOT NULL,
  `id_categoria_fk` int(11) NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `aceita_oferta` tinyint(1) NOT NULL DEFAULT 1,
  `comunitario` tinyint(1) NOT NULL DEFAULT 1,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `data_Criacao` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_servico`),
  KEY `fk_servico_usuario` (`id_usuario_fk`),
  KEY `fk_servico_categoria` (`id_categoria_fk`),
  CONSTRAINT `fk_servico_categoria` FOREIGN KEY (`id_categoria_fk`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE,
  CONSTRAINT `fk_servico_usuario` FOREIGN KEY (`id_usuario_fk`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
INSERT INTO `servicos` VALUES (1,1,2,'Troca de fechaduras','Realizo troca de fechaduras em sua casa',29.00,1,1,1,'2024-09-03 12:00:00');
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `primeiro_nome` varchar(60) NOT NULL,
  `ultimo_nome` varchar(80) DEFAULT NULL,
  `celular` varchar(25) DEFAULT NULL,
  `whatsapp` varchar(25) DEFAULT NULL,
  `telefone` varchar(25) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(105) NOT NULL,
  `cpf` varchar(18) DEFAULT NULL,
  `cnpj` varchar(26) DEFAULT NULL,
  `data_Criacao` datetime NOT NULL DEFAULT current_timestamp(),
  `tipo_usuario` varchar(20) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `cnpj_UNIQUE` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Vitor Gabriel','de Oliveira','43984873807','43984843807','43984843807','vitorgabrieldeoliveiradev@gmail.com','123456','13770078985',NULL,'2024-09-03 12:00:00','Contratante',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-03 21:52:07

CREATE DATABASE  IF NOT EXISTS `eventos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eventos`;
-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: eventos
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `EVENTO`
--

DROP TABLE IF EXISTS `EVENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENTO` (
  `ID_EVENTO` bigint NOT NULL AUTO_INCREMENT,
  `DATA` longblob,
  `NOME` varchar(50) NOT NULL,
  `SITUACAO` int DEFAULT NULL,
  `TAXAINSCRICAO` double NOT NULL,
  `LOCAL_ID_LOCAL` bigint DEFAULT NULL,
  PRIMARY KEY (`ID_EVENTO`),
  KEY `FK_EVENTO_LOCAL_ID_LOCAL` (`LOCAL_ID_LOCAL`),
  CONSTRAINT `FK_EVENTO_LOCAL_ID_LOCAL` FOREIGN KEY (`LOCAL_ID_LOCAL`) REFERENCES `LOCAL` (`ID_LOCAL`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENTO`
--

LOCK TABLES `EVENTO` WRITE;
/*!40000 ALTER TABLE `EVENTO` DISABLE KEYS */;
INSERT INTO `EVENTO` VALUES (2,_binary '¬\í\0sr\0\rjava.time.Ser•]„º\"H²\0\0xpw\0\0\åÿx','AniversÃ¡rio',0,10,1),(3,_binary '¬\í\0sr\0\rjava.time.Ser•]„º\"H²\0\0xpw	\0\0\æ\áx','Churrasco',0,25,2),(4,_binary '¬\í\0sr\0\rjava.time.Ser•]„º\"H²\0\0xpw	\0\0\æ\áx','RodÃ­zio',1,39.9,4);
/*!40000 ALTER TABLE `EVENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENTO_PARTICIPANTE`
--

DROP TABLE IF EXISTS `EVENTO_PARTICIPANTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENTO_PARTICIPANTE` (
  `Evento_ID_EVENTO` bigint NOT NULL,
  `participantes_ID_PESSOA` bigint NOT NULL,
  PRIMARY KEY (`Evento_ID_EVENTO`,`participantes_ID_PESSOA`),
  KEY `FK_EVENTO_PARTICIPANTE_participantes_ID_PESSOA` (`participantes_ID_PESSOA`),
  CONSTRAINT `FK_EVENTO_PARTICIPANTE_Evento_ID_EVENTO` FOREIGN KEY (`Evento_ID_EVENTO`) REFERENCES `EVENTO` (`ID_EVENTO`),
  CONSTRAINT `FK_EVENTO_PARTICIPANTE_participantes_ID_PESSOA` FOREIGN KEY (`participantes_ID_PESSOA`) REFERENCES `PESSOA` (`ID_PESSOA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENTO_PARTICIPANTE`
--

LOCK TABLES `EVENTO_PARTICIPANTE` WRITE;
/*!40000 ALTER TABLE `EVENTO_PARTICIPANTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENTO_PARTICIPANTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCAL`
--

DROP TABLE IF EXISTS `LOCAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOCAL` (
  `ID_LOCAL` bigint NOT NULL AUTO_INCREMENT,
  `INSTITUICAO` varchar(50) NOT NULL,
  `ORGANIZADOR` varchar(50) NOT NULL,
  `TELEFONE` varchar(14) NOT NULL,
  PRIMARY KEY (`ID_LOCAL`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCAL`
--

LOCK TABLES `LOCAL` WRITE;
/*!40000 ALTER TABLE `LOCAL` DISABLE KEYS */;
INSERT INTO `LOCAL` VALUES (1,'Sesi','NÃ­colas','51986565234'),(2,'Senai','NÃ­colas','51986565234'),(3,'IFRS','NÃ­colas','51986565234'),(4,'UFRGS','NÃ­colas','51986565234');
/*!40000 ALTER TABLE `LOCAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTICIPANTE`
--

DROP TABLE IF EXISTS `PARTICIPANTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARTICIPANTE` (
  `ID_PARTICIPANTE` bigint NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `ENDERECO` varchar(200) NOT NULL,
  `TELEFONE` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`ID_PARTICIPANTE`),
  CONSTRAINT `FK_PARTICIPANTE_ID_PARTICIPANTE` FOREIGN KEY (`ID_PARTICIPANTE`) REFERENCES `PESSOA` (`ID_PESSOA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTICIPANTE`
--

LOCK TABLES `PARTICIPANTE` WRITE;
/*!40000 ALTER TABLE `PARTICIPANTE` DISABLE KEYS */;
INSERT INTO `PARTICIPANTE` VALUES (14,'04865749856','rua coronel vicente','51986558569'),(18,'04868634798','rua professor alvaro alvim','51986554215'),(19,'04812479853','avenida liberdade','51986599743');
/*!40000 ALTER TABLE `PARTICIPANTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PESSOA`
--

DROP TABLE IF EXISTS `PESSOA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PESSOA` (
  `ID_PESSOA` bigint NOT NULL AUTO_INCREMENT,
  `DTYPE` varchar(31) DEFAULT NULL,
  `NOME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PESSOA`
--

LOCK TABLES `PESSOA` WRITE;
/*!40000 ALTER TABLE `PESSOA` DISABLE KEYS */;
INSERT INTO `PESSOA` VALUES (14,'Participante','Robert'),(18,'Participante','Bona'),(19,'Participante','NÃ­colas De Conto');
/*!40000 ALTER TABLE `PESSOA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Participante_EMAILS`
--

DROP TABLE IF EXISTS `Participante_EMAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Participante_EMAILS` (
  `Participante_ID_PESSOA` bigint DEFAULT NULL,
  `EMAILS` varchar(255) DEFAULT NULL,
  KEY `FK_Participante_EMAILS_Participante_ID_PESSOA` (`Participante_ID_PESSOA`),
  CONSTRAINT `FK_Participante_EMAILS_Participante_ID_PESSOA` FOREIGN KEY (`Participante_ID_PESSOA`) REFERENCES `PESSOA` (`ID_PESSOA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participante_EMAILS`
--

LOCK TABLES `Participante_EMAILS` WRITE;
/*!40000 ALTER TABLE `Participante_EMAILS` DISABLE KEYS */;
INSERT INTO `Participante_EMAILS` VALUES (14,'robert2@hotmail.com'),(18,'nicolasdeconto@gmail.com'),(19,'nicolasdeconto@gmail.com');
/*!40000 ALTER TABLE `Participante_EMAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIO` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(255) DEFAULT NULL,
  `SENHA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` VALUES (1,'teste@hotmail.com','123456');
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'eventos'
--

--
-- Dumping routines for database 'eventos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-01 18:28:35

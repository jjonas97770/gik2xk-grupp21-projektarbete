-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: webbshop
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `cartrows`
--

DROP TABLE IF EXISTS `cartrows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartrows` (
  `amount` double NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`cart_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cartrows_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cartrows_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartrows`
--

LOCK TABLES `cartrows` WRITE;
/*!40000 ALTER TABLE `cartrows` DISABLE KEYS */;
INSERT INTO `cartrows` VALUES (1,'2026-03-16 12:29:31','2026-03-16 12:29:31',8,14),(1,'2026-03-19 13:33:33','2026-03-19 13:33:33',9,11),(2,'2026-03-19 13:33:40','2026-03-19 13:33:44',9,26),(1,'2026-03-19 13:33:51','2026-03-19 13:33:51',9,58);
/*!40000 ALTER TABLE `cartrows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payed` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_10` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_11` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_12` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_13` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_14` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_15` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_16` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_17` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_18` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_19` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_20` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_21` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_22` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_23` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_24` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_25` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_26` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_27` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_28` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_8` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_9` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,1,'2026-03-11 13:15:52','2026-03-12 10:36:35',1),(2,1,'2026-03-12 10:36:47','2026-03-12 10:36:53',1),(3,1,'2026-03-12 10:37:01','2026-03-12 10:37:25',1),(4,1,'2026-03-12 10:39:59','2026-03-12 10:40:08',1),(5,1,'2026-03-12 10:48:51','2026-03-12 10:48:56',1),(6,1,'2026-03-12 10:49:25','2026-03-12 10:49:28',1),(7,1,'2026-03-12 10:50:24','2026-03-12 10:50:27',1),(8,1,'2026-03-16 12:29:31','2026-03-16 12:29:49',1),(9,1,'2026-03-19 13:33:33','2026-03-19 13:34:04',1);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `price` double NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `onSale` tinyint(1) DEFAULT '0',
  `originalPrice` double DEFAULT NULL,
  `featuredSale` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (11,'M18 FUEL™ 45 mm SDS-Max Kombihammare med ONE-KEY™','Batteridrivet SDS-Max kombihammare med 45 mm kapacitet och ONE-KEY™ uppkoppling. Levererar samma prestanda som nätdrivna maskiner med flexibiliteten från M18-plattformen.',9999,'2026-03-12 12:21:27','2026-03-17 11:19:44','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FHACO745-122C--Hero_1.jpg','Borrhammare',1,8999,1),(12,'M18 FUEL™ SURGE™ ¼″ Hex Hydraulisk Slagskruvdragare','Hydraulisk slagmekanism ger tystare drift än traditionella slagskruvdragare. Kompakt och lätt med 210 Nm skruvdragningsmoment, perfekt för installatörer och hantverkare.',2999,'2026-03-12 12:22:53','2026-03-12 12:22:53','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FIDRQ-0--Hero_1.jpg','Slagskruvdragare',0,NULL,0),(13,'M18 FUEL™ Borrhammare 40 mm SDS-Max med ONE-KEY™','Batteridrivet SDS-Max borrhammare med 40 mm kapacitet och ONE-KEY™ uppkoppling. Prestanda i nivå med nätdrivna maskiner.',8999,'2026-03-12 12:39:55','2026-03-12 12:39:55','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FHACO540-0--Hero_1.jpg','Borrhammare',0,NULL,0),(14,'M18 FUEL™ 165 mm Cirkelsåg','Kompakt och kraftfull 165 mm cirkelsåg driven av M18-batteriplattformen. Kapar upp till 57 mm i 90 grader.',3499,'2026-03-12 12:40:03','2026-03-12 12:40:03','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FCSDC165-0--Hero_1.jpg','Cirkelsågar',0,NULL,0),(15,'M18 FUEL™ Powerpack M18-FPP1N-551','Komplett startpaket med borrskruvdragare, slagskruvdragare, 2st 5Ah batterier och laddare. Allt du behöver för att komma igång.',5999,'2026-03-12 12:40:09','2026-03-12 12:40:09','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FPP1N-551--Hero_1.jpg','Paket',0,NULL,0),(16,'MX FUEL™ 25 kg 28 mm Bilningshammare','Extremt kraftfull batteridrivet bilningshammare på 25 kg med 28 mm mejselkapacitet. Ersätter nätdrivna maskiner helt.',24999,'2026-03-12 12:40:17','2026-03-12 12:40:17','https://milwaukee-media-images.s3.amazonaws.com/hi/MXF_DH2528H-0--Hero_1.jpg','Borrhammare',0,NULL,0),(17,'M18 Kolborstfri Blås','Batteridrivet blåsverktyg för effektiv rengöring av arbetsytor och bortblåsning av damm och spån.',1299,'2026-03-12 12:40:25','2026-03-12 12:40:25','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_BLHSB-0--Hero_1.jpg','Övrigt',0,NULL,0),(18,'M18 FUEL™ Nibblare 3,5 mm','Batteridrivet nibblare med 3,5 mm kapacitet i mjukt stål. Snabbaste nibblaren i sin klass, överträffar nätdrivna produkter.',4999,'2026-03-12 12:40:29','2026-03-13 08:26:39','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FNB35-0--Hero_1.jpg','Nibblare och Plåtsaxar',0,NULL,0),(19,'M18 ONE-KEY™ FUEL™ 1″ Mutterdragare med friktionsring','Kraftfull 1-tums mutterdragare med ONE-KEY™ uppkoppling och friktionsring för säker hylsmontering.',12999,'2026-03-12 12:40:34','2026-03-13 08:26:15','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_ONEFHIWF1-0--Hero_1.jpg','Mutterdragare',0,NULL,0),(20,'M18 FUEL™ 230 mm Vinkelslip med paddelbrytare','Kraftfull 230 mm vinkelslip med paddelbrytare. Levererar kraft motsvarande 2400W nätdrivna vinkelslipar.',5999,'2026-03-12 12:40:38','2026-03-12 12:40:38','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FLAG230XPDB-0--Hero_1.jpg','Vinkelslipar',0,NULL,0),(21,'M18 FUEL™ Super Sawzall Tigersåg','Professionell tigersåg med 32 mm slaglängd och variabel varvtal. Kapar trä, metall, plast och mer.',4499,'2026-03-12 12:40:42','2026-03-17 10:57:32','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FSX-0--Hero_1.jpg','Tigersågar',1,3999,0),(22,'M18 ONE-KEY™ FUEL™ Bordssåg','Portabel batteridrivet bordssåg med ONE-KEY™ uppkoppling. Kapar upp till 82 mm i 90 grader.',14999,'2026-03-12 12:40:48','2026-03-13 08:27:34','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FTS210-0--Hero_1.jpg','Övrigt',0,NULL,0),(23,'M18 FUEL™ 230 mm Kapmaskin','Batteridrivet kapmaskin med 230 mm kapskiva för metall och rostfritt stål. Ersätter nätdrivna kapmaskiner.',6999,'2026-03-12 12:40:52','2026-03-13 08:28:08','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FCOS230-0--Hero_1.jpg','Övrigt',0,NULL,0),(24,'M18 FUEL™ 125 mm Excenterslip','Batteridrivet excenterslip med 125 mm slipplatta och variabel varvtal. Ger professionell finish på trä och lack.',2999,'2026-03-12 12:40:57','2026-03-13 09:21:01','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FROS125-0--Hero_1.jpg','Slipmaskiner',0,NULL,0),(25,'M12™ Högtalare','Kompakt och kraftfull byggplatshögtalare driven av M12-batteriet. Bluetooth-anslutning och robust konstruktion för tuffa miljöer.',1999,'2026-03-12 12:41:01','2026-03-12 12:41:01','https://milwaukee-media-images.s3.amazonaws.com/hi/M12_SPEJSG2-0--Hero_1.jpg','Övrigt',0,NULL,0),(26,'M18™ FORGE™ 12.0 Ah-batteri','M18 FORGE 12.0 Ah-batteri med avancerad cellteknik för maximal prestanda och längre drifttid.',2499,'2026-03-13 07:41:49','2026-03-17 11:19:29','/images/forge-12ah.webp','Batterier & Laddare',1,1999,1),(27,'M18™ FORGE™ 6.0 Ah-batteri','M18 FORGE 6.0 Ah-batteri med snabb laddning och hög energitäthet för krävande applikationer.',1499,'2026-03-13 07:41:56','2026-03-13 07:50:03','https://lucacastelli.com/wp-content/uploads/2024/02/23938.jpg','Batterier & Laddare',0,NULL,0),(28,'M18™ FORGE™ 8.0 Ah-batteri','M18 FORGE 8.0 Ah-batteri med optimal balans mellan vikt och kapacitet för professionellt bruk.',1899,'2026-03-13 07:42:02','2026-03-13 08:03:16','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_FB8--Hero_1.jpg?v=8974C70A3EF42247B755642B5B69EFA8','Batterier & Laddare',0,NULL,0),(29,'M18™ Dubbel Superladdare','Laddar två M18-batterier samtidigt med upp till 2x snabbare laddning än standardladdare.',1999,'2026-03-13 07:42:08','2026-03-13 07:56:49','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_DBSC--Hero_1.jpg?v=BC867C1D729818EE0D13727F189EF21E&width=500&heightratio=1&mode=crop','Batterier & Laddare',0,NULL,0),(30,'M18™ Kemikaliskt Resistent Startkit','Startkit med kemikalieresistenta batterier och laddare, speciellt framtaget för industri- och laboratoriebruk.',3499,'2026-03-13 07:42:12','2026-03-13 07:42:12','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_NRGCR-502--Hero_1.jpg','Batterier & Laddare',0,NULL,0),(31,'M18™ Resistent 5.0 Ah-batteri','Kemikalieresistent 5.0 Ah-batteri för användning i krävande miljöer med kemisk exponering.',1299,'2026-03-13 07:42:16','2026-03-13 08:03:53','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_B5-CR--Hero_1.jpg?v=49DB0A9B2F2F1BDE993087BCAE0DA6A3','Batterier & Laddare',0,NULL,0),(32,'M18™ Dubbel Snabbladdare','Laddar två M18-batterier samtidigt med snabb laddteknik för minimal driftstopp på arbetsplatsen.',1599,'2026-03-13 07:42:21','2026-03-13 08:06:22','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_DFC--Hero_1.jpg?v=1126CBE2F999649063ED0F26024ECE7A','Batterier & Laddare',0,NULL,0),(33,'Milwaukee USB-kabel','USB-kabel kompatibel med Milwaukee M12-batterier för laddning av USB-enheter direkt från batteriet.',299,'2026-03-13 07:42:26','2026-03-13 08:06:44','https://www.svetsochtillbehor.se/thumb/49103/1280x0/4007be01d1b5f9dd6a18e39f4e696f14.jpg','Batterier & Laddare',0,NULL,0),(34,'M18 FUEL™ Betongvibrator för konsolidering av betong','Batteridrivet betongvibrator för professionell konsolidering av betong. Levererar prestanda motsvarande nätdrivna modeller med flexibiliteten från M18-plattformen.',4999,'2026-03-13 08:22:24','2026-03-13 08:23:00','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_FCVN24-551--Hero_1.jpg?v=AA516A78624ADFC31F488BC8D3912895','Betongvibratorer',0,NULL,0),(35,'MX FUEL™ Bärbar Betongvibrator','Bärbar batteridrivet betongvibrator från MX FUEL-plattformen. Ersätter nätdrivna modeller helt utan kompromisser i prestanda.',12999,'2026-03-13 08:22:30','2026-03-13 08:22:30','https://milwaukee-media-images.s3.amazonaws.com/hi/MXF_CVBC-0--Hero_1.jpg','Betongvibratorer',0,NULL,0),(36,'MX FUEL™ Ryggburen Betongvibrator','Ryggburen batteridrivet betongvibrator för maximal rörlighet på arbetsplatsen. Perfekt för svåråtkomliga områden.',15999,'2026-03-13 08:22:36','2026-03-13 08:22:36','https://milwaukee-media-images.s3.amazonaws.com/hi/MXF_CVBP-0--Hero_1.jpg','Betongvibratorer',0,NULL,0),(37,'M18™ Kolborstfri ¼″ Hex Slagskruvdragare','Kompakt och kraftfull kolborstfri slagskruvdragare med 210 Nm skruvdragningsmoment. Passar perfekt för installatörer och hantverkare.',1799,'2026-03-13 08:25:29','2026-03-17 10:58:02','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_BLIDR-0--Hero_1.jpg','Slagskruvdragare',0,1799,0),(38,'M18™ Kompakt Kolborstfri ¼″ Hex Slagskruvdragare','Extra kompakt och lätt slagskruvdragare för arbete i trånga utrymmen. Kolborstfri motor för längre livslängd.',1599,'2026-03-13 08:25:34','2026-03-13 08:25:34','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_BLIDRC-0--Hero_1.jpg','Slagskruvdragare',0,NULL,0),(39,'M18 FUEL™ ONE-KEY™ ¼″ Slagskruvdragare','Avancerad slagskruvdragare med ONE-KEY™ uppkoppling för anpassning av vridmoment och hastighet via app.',2499,'2026-03-13 08:25:42','2026-03-19 10:47:26','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_ONEID3-0--Hero_1.jpg','Slagskruvdragare',1,1999,1),(40,'M18 FUEL™ 55 mm Cirkelsåg för trä och plast','Kompakt 55 mm cirkelsåg optimerad för kapning av trä och plast. Driven av M18-batteriplattformen.',2999,'2026-03-13 08:29:41','2026-03-13 08:29:41','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FCS552-0--Hero_1.jpg','Cirkelsågar',0,NULL,0),(41,'M18 FUEL™ Cirkelsåg med styrskenkompabilitet','Professionell cirkelsåg med styrskenkompabilitet för raka och exakta snitt. Kapar upp till 700 stycken 90x45 mm i ett batteri.',4499,'2026-03-13 08:29:46','2026-03-13 08:29:46','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FCS66GR3-0--Hero_1.jpg','Cirkelsågar',0,NULL,0),(42,'M18 FUEL™ 66 mm Metallcirkelsåg','Kraftfull 66 mm cirkelsåg speciellt konstruerad för kapning av metall. Borstlös motor för maximal prestanda.',5499,'2026-03-13 08:29:52','2026-03-13 08:29:52','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FMCS66-0--Hero_1.jpg','Cirkelsågar',0,NULL,0),(43,'Milwaukee Sågklingor för handhållna cirkelsågar','Högkvalitativa sågklingor för Milwaukee handhållna cirkelsågar. Finns i flera varianter för trä, metall och plast.',399,'2026-03-13 08:29:57','2026-03-13 08:30:22','https://milwaukee-media-images.s3.amazonaws.com/hi/SAWBLADE-CIRC-0--Hero_1.jpg','Övrigt',0,NULL,0),(44,'M18™ 55 mm Cirkelsåg för trä och plast','Pålitlig 55 mm cirkelsåg för kapning av trä och plast. Kompakt design för enkel hantering på arbetsplatsen.',2499,'2026-03-13 08:30:01','2026-03-13 08:30:01','https://milwaukee-media-images.s3.amazonaws.com/hi/HD18_CS-0--Hero_1.jpg','Cirkelsågar',0,NULL,0),(46,'M18 FUEL™ ONE-KEY™ 305 mm Kap/Gersåg','Professionell 305 mm kap/gersåg med ONE-KEY™ uppkoppling. Kapar upp till 100x355 mm i 90 grader.',12999,'2026-03-13 08:33:55','2026-03-17 11:20:18','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FMS305-0--Hero_1.jpg','Kap och Gersågar',1,11999,1),(47,'M18 FUEL™ 190 mm Kap/Gersåg','Kompakt och portabel 190 mm kap/gersåg driven av M18-batteriplattformen. Perfekt för snickare och installatörer.',6999,'2026-03-13 08:34:07','2026-03-13 08:34:07','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FMS190-0--Hero_1.jpg','Kap och Gersågar',0,NULL,0),(48,'M18 FUEL™ 254 mm Kap/Gersåg','Kraftfull 254 mm kap/gersåg med dubbla glidskensystem för maximalt kapdjup och precision.',9999,'2026-03-13 08:34:11','2026-03-13 08:34:11','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FMS254-0--Hero_1.jpg','Kap och Gersågar',0,NULL,0),(49,'Milwaukee Arbetsbord till kap/gersåg förlängningsbart till 2,8 m','Stabilt och förlängningsbart arbetsbord för kap/gersågar. Kan förlängas upp till 2,8 m för hantering av långa arbetsstycken.',3499,'2026-03-13 08:34:15','2026-03-13 08:34:15','https://milwaukee-media-images.s3.amazonaws.com/hi/MITER-SAW-STAND-0--Hero_1.jpg','Kap och Gersågar',0,NULL,0),(50,'M18™ HIGH OUTPUT™ Lampa på stativ med integrerad laddare','Kraftfull arbetslampa på stativ med integrerad batteriladdare. Ger stark belysning på arbetsplatsen utan behov av nätström.',5999,'2026-03-13 08:36:00','2026-03-13 08:36:00','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_HOSALC-0--Hero_1.jpg','Lampor',0,NULL,0),(51,'M18™ ONE-KEY™ LED Lampa på stativ','LED-arbetslampa på stativ med ONE-KEY™ uppkoppling för fjärrstyrning av ljusstyrka och läge via app.',4499,'2026-03-13 08:36:05','2026-03-13 08:36:05','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_ONERSAL-0--Hero_1.jpg','Lampor',0,NULL,0),(52,'M18™ LED Arbetslampa','Kompakt och kraftfull LED-arbetslampa driven av M18-batteriet. Ger 1000 lumen för god belysning på arbetsplatsen.',1299,'2026-03-13 08:36:10','2026-03-13 08:36:10','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_SLED-0--Hero_1.jpg','Lampor',0,NULL,0),(53,'M18™ LED Strålkastare','Riktad LED-strålkastare driven av M18-batteriet. Perfekt för belysning av specifika arbetsområden i mörka miljöer.',1499,'2026-03-13 08:36:15','2026-03-13 08:36:15','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_TLED-0--Hero_1.jpg','Lampor',0,NULL,0),(54,'M18 FUEL™ 57 mm Metallsåg','Kraftfull 57 mm metallsåg driven av M18-batteriplattformen. Kapar stål, aluminium och andra metaller utan nätström.',4999,'2026-03-13 08:37:53','2026-03-13 08:37:53','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FMCS-0--Hero_1.jpg','Metallsågar & Metallbearbetning',0,NULL,0),(55,'Milwaukee Metallslipskivor PRO','Professionella metallslipskivor för Milwaukee vinkelslipar. Ger lång livslängd och effektiv slipning av metall.',299,'2026-03-13 08:38:00','2026-03-13 08:38:12','https://milwaukee-media-images.s3.amazonaws.com/hi/METALGRINDINGDISC-PRO-0--Hero_1.jpg','Övrigt',0,NULL,0),(57,'M18™ Plåtsax 2,0 mm','Batteridrivet plåtsax för kapning av plåt upp till 2,0 mm. Kraftfull och kompakt för professionellt bruk.',3499,'2026-03-13 08:40:32','2026-03-13 08:40:56','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_BMS20-0--Hero_01.jpg?v=91F273D826B3F492450241C0BF92D51A','Nibblare och Plåtsaxar',0,NULL,0),(58,'M18 FUEL™ Oscillerande Polermaskin med 21 mm excenterrörelse','Professionell batteridrivet polermaskin med 21 mm excenterrörelse. Levererar samma prestanda som nätdrivna polermaskiner.',5999,'2026-03-13 08:45:26','2026-03-17 11:20:44','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FROP21-0--Hero_1.jpg','Polermaskiner',1,4999,1),(59,'M18 FUEL™ Oscillerande Polermaskin med 15 mm excenterrörelse','Batteridrivet polermaskin med 15 mm excenterrörelse och åtta hastighetsinställningar för maximal kontroll.',4999,'2026-03-13 08:45:30','2026-03-13 08:45:30','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FROP15-0--Hero_1.jpg','Polermaskiner',0,NULL,0),(60,'M18 FUEL™ Polermaskin','Kraftfull batteridrivet polermaskin för professionell polering av lack och ytor. Driven av M18-batteriplattformen.',4499,'2026-03-13 08:45:35','2026-03-13 08:46:33','https://www.svetsochtillbehor.se/thumb/49364/1024x0/1873c8a442fdead488379cbb15f2b2f1.jpg','Polermaskiner',0,NULL,0),(61,'M18™ ¼″ Planslip','Kompakt batteridrivet planslip för slipning av trä och lack. Driven av M18-batteriplattformen.',1799,'2026-03-13 08:52:21','2026-03-13 08:52:21','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_BQSS-0--Hero_1.jpg','Slipmaskiner',0,NULL,0),(62,'M18 FUEL™ Bandslip 75 mm','Kraftfull 75 mm batteridrivet bandslip för aggressiv materialavverkning på trä och metall.',3999,'2026-03-13 08:52:29','2026-03-13 08:52:29','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FBTS75-0--Hero_1.jpg','Slipmaskiner',0,NULL,0),(63,'M18™ Excenterslip 125 mm','Batteridrivet excenterslip med 125 mm slipplatta för fin ytbehandling av trä och lack.',1999,'2026-03-13 08:52:34','2026-03-17 10:58:24','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_BOS125-0--Hero_1.jpg','Slipmaskiner',1,1699,0),(64,'M18 FUEL™ 125 mm Excenterslip','Professionell 125 mm excenterslip med borstlös motor och variabel varvtal för optimal ytfinish.',2999,'2026-03-13 08:52:39','2026-03-13 08:52:39','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FROS125-0--Hero_1.jpg','Slipmaskiner',0,NULL,0),(65,'M18 FUEL™ Duplex Spikpistol','Batteridrivet duplex spikpistol för stängsel och konstruktionsarbete. Driven av M18-batteriplattformen.',4999,'2026-03-13 08:54:35','2026-03-13 08:54:35','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FDN-0--Hero_1.jpg','Dyckert & Stiftpistoler',0,NULL,0),(66,'M18 FUEL™ 16 GS Dyckertpistol','Batteridrivet 16 gauge dyckertpistol för finish och formarbete. Kompakt design för enkel hantering.',3999,'2026-03-13 08:54:39','2026-03-13 08:54:39','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FN16GS-0--Hero_1.jpg','Dyckert & Stiftpistoler',0,NULL,0),(67,'M18 FUEL™ Klammerpistol för stängselmarlor','Specialdesignad klammerpistol för montering av stängselmarlor. Driven av M18-batteriplattformen.',4499,'2026-03-13 08:54:47','2026-03-13 08:54:47','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FFUS-0--Hero_1.jpg','Dyckert & Stiftpistoler',0,NULL,0),(68,'M18 FUEL™ 15 GA Vinklad Dyckertpistol','Vinklad 15 gauge dyckertpistol för finish och listmontering. Ger professionellt resultat utan luftkompressor.',4299,'2026-03-13 08:54:50','2026-03-13 08:54:50','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FN15GA-0--Hero_1.jpg','Dyckert & Stiftpistoler',0,NULL,0),(69,'M18 FUEL™ Klammerpistol','Batteridrivet klammerpistol för tapetsering och stoppning. Skjuter 18 gauge kramper utan behov av luftkompressor.',3499,'2026-03-13 08:54:54','2026-03-13 08:54:54','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FNCS18GS-0--Hero_1.jpg','Dyckert & Stiftpistoler',0,NULL,0),(70,'M18 FUEL™ Sticksåg','Professionell batteridrivet sticksåg med borstlös motor och variabel slaghastighet. Kapar trä, metall och plast.',3499,'2026-03-13 08:56:30','2026-03-13 08:56:30','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FJS-0--Hero_1.jpg','Sticksågar',0,NULL,0),(71,'M18 FUEL™ Sticksåg Kompakt','Kompakt och lätt batteridrivet sticksåg med borstlös motor. Perfekt för precisionssågning i trånga utrymmen.',2999,'2026-03-13 08:56:35','2026-03-13 08:56:35','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FBJS-0--Hero_1.jpg','Sticksågar',0,NULL,0),(72,'M18™ Sticksåg','Pålitlig batteridrivet sticksåg för kapning av trä, metall och plast. Driven av M18-batteriplattformen.',2499,'2026-03-13 08:56:40','2026-03-13 08:56:40','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_BJS-0--Hero_1.jpg','Sticksågar',0,NULL,0),(74,'Milwaukee Sticksågsblad med U-skaft','Högkvalitativa sticksågsblad med U-skaft för Milwaukee sticksågar. Finns i varianter för trä, metall och plast.',299,'2026-03-13 08:56:48','2026-03-13 08:57:07','https://milwaukee-media-images.s3.amazonaws.com/hi/JIGSAW-BLADE-U-0--Hero_1.jpg','Övrigt',0,NULL,0),(75,'M18 FUEL™ ONE-KEY™ SAWZALL™ Tigersåg','Professionell tigersåg med ONE-KEY anslutning för anpassad prestanda och stöldskydd. Borstlös motor för maximal effekt och lång batteritid.',5499,'2026-03-13 09:02:11','2026-03-13 09:02:11','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_ONEFSZ-0--Hero_1.jpg','Tigersågar',0,NULL,0),(76,'M18 FUEL™ SAWZALL™ Tigersåg','Kraftfull tigersåg med borstlös motor och variabel slaghastighet. Kapar trä, metall och rör – ersätter korgen med driven prestanda.',4499,'2026-03-13 09:02:15','2026-03-13 09:02:15','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FSZ-0--Hero_1.jpg','Tigersågar',0,NULL,0),(77,'TORCH™ Tigersågblad Nitrus Carbide Heavy Duty Metall','Extremt slitstarka tigersågblad med Nitrus Carbide-beläggning för kapning av hårt metall, rostfritt stål och armerad betong.',399,'2026-03-13 09:02:19','2026-03-13 09:02:38','https://milwaukee-media-images.s3.amazonaws.com/hi/TORCH-NITRUS-0--Hero_1.jpg','Övrigt',0,NULL,0),(78,'Milwaukee Tigersågblad för frysta material','Specialdesignade tigersågblad för kapning i frysta rör och material. Ger rena snitt även i extremt kalla miljöer.',349,'2026-03-13 09:02:23','2026-03-13 09:02:47','https://milwaukee-media-images.s3.amazonaws.com/hi/FROZEN-MATERIAL-BLADE-0--Hero_1.jpg','Övrigt',0,NULL,0),(79,'M18™ HACKZALL™ Tigersåg','Kompakt enhandstigersåg för arbete i trånga utrymmen. Perfekt för VVS, el och snickare som behöver en lätt och smidig sågningslösning.',2999,'2026-03-13 09:02:27','2026-03-13 09:02:27','https://milwaukee-media-images.s3.amazonaws.com/hi/C18_HZ-0--Hero_1.jpg','Tigersågar',0,NULL,0),(80,'M18 FUEL™ 150/160mm Vinkelslip Paddelbrytare','Kraftfull batteridriven vinkelslip med paddelbrytare för snabb avstängning. Borstlös motor ger maximal effekt för slipning, kapning och polering.',5999,'2026-03-13 09:23:35','2026-03-13 09:23:35','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FHSAG150XPDB2-0--Hero_1.jpg','Vinkelslipar',0,NULL,0),(81,'M18 FUEL™ 150/160mm Vinkelslip Låsbar Strömbrytare','Batteridriven vinkelslip med låsbar strömbrytare för kontinuerligt arbete. Borstlös motor och elektronisk överlastskydd för lång livslängd.',5799,'2026-03-13 09:23:43','2026-03-13 09:23:43','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FHSAG150XB2-0--Hero_1.jpg','Vinkelslipar',0,NULL,0),(82,'M18 FUEL™ 180mm Vinkelslip Variabel Hastighet ONE-KEY Gen 2','Avancerad batteridriven vinkelslip med variabel hastighet och ONE-KEY anslutning. 180mm kapskiva, anpassningsbar prestanda och stöldskydd via app.',7499,'2026-03-13 09:23:51','2026-03-13 09:23:51','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FHSAGO180VXPDB2-0--Hero_1.jpg','Vinkelslipar',0,NULL,0),(85,'asdsa','sadasd',12321,'2026-03-20 12:54:47','2026-03-20 12:54:47','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_FCS552-0--Hero_1.jpg?v=F76166E6E54E4D6D192227C80E1585F8&width=337','Övrigt',0,NULL,0),(86,'hasfha','dsgsdg',32424,'2026-03-20 12:57:09','2026-03-20 12:57:09','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_ONEDD3-502X--Hero_1.jpg?v=579FE56A5670098C565CA8D9CC2C0FCC&width=337','Övrigt',0,NULL,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rating` double NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_10` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_11` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_12` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_13` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_14` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_15` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_16` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_17` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_18` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_19` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_20` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_21` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_22` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_23` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_24` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_25` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_26` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_27` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_28` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_5` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_7` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_8` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_9` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,4,'2026-03-11 14:21:20','2026-03-11 14:21:20',NULL),(2,3,'2026-03-18 10:40:04','2026-03-18 10:40:04',48),(3,4,'2026-03-19 13:31:55','2026-03-19 13:31:55',11),(4,2,'2026-03-19 13:32:00','2026-03-19 13:32:00',11),(5,5,'2026-03-19 13:32:06','2026-03-19 13:32:06',11),(6,3,'2026-03-19 13:32:22','2026-03-19 13:32:22',11),(7,1,'2026-03-19 13:32:54','2026-03-19 13:32:54',11);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rating` int NOT NULL,
  `message` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (3,'Hampus',5,'bra','2026-03-13 13:30:48','2026-03-13 13:30:48'),(4,'Jonas',3,'medel','2026-03-13 13:31:00','2026-03-13 13:31:00'),(5,'dfgfd',2,'tre','2026-03-16 10:30:52','2026-03-16 10:30:52'),(6,'karin',5,'hej','2026-03-16 10:58:25','2026-03-16 10:58:25');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`),
  UNIQUE KEY `email_3` (`email`),
  UNIQUE KEY `email_4` (`email`),
  UNIQUE KEY `email_5` (`email`),
  UNIQUE KEY `email_6` (`email`),
  UNIQUE KEY `email_7` (`email`),
  UNIQUE KEY `email_8` (`email`),
  UNIQUE KEY `email_9` (`email`),
  UNIQUE KEY `email_10` (`email`),
  UNIQUE KEY `email_11` (`email`),
  UNIQUE KEY `email_12` (`email`),
  UNIQUE KEY `email_13` (`email`),
  UNIQUE KEY `email_14` (`email`),
  UNIQUE KEY `email_15` (`email`),
  UNIQUE KEY `email_16` (`email`),
  UNIQUE KEY `email_17` (`email`),
  UNIQUE KEY `email_18` (`email`),
  UNIQUE KEY `email_19` (`email`),
  UNIQUE KEY `email_20` (`email`),
  UNIQUE KEY `email_21` (`email`),
  UNIQUE KEY `email_22` (`email`),
  UNIQUE KEY `email_23` (`email`),
  UNIQUE KEY `email_24` (`email`),
  UNIQUE KEY `email_25` (`email`),
  UNIQUE KEY `email_26` (`email`),
  UNIQUE KEY `email_27` (`email`),
  UNIQUE KEY `email_28` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Anna','Svensson','anna@test.se','1234','2026-03-11 13:12:31','2026-03-11 13:12:31');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-20 15:39:26
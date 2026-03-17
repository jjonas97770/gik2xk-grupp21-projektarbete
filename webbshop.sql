-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: webbshop
-- ------------------------------------------------------
-- Server version	8.0.45

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
  CONSTRAINT `carts_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_8` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_9` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,1,'2026-03-11 13:15:52','2026-03-12 10:36:35',1),(2,1,'2026-03-12 10:36:47','2026-03-12 10:36:53',1),(3,1,'2026-03-12 10:37:01','2026-03-12 10:37:25',1),(4,1,'2026-03-12 10:39:59','2026-03-12 10:40:08',1),(5,1,'2026-03-12 10:48:51','2026-03-12 10:48:56',1),(6,1,'2026-03-12 10:49:25','2026-03-12 10:49:28',1),(7,1,'2026-03-12 10:50:24','2026-03-12 10:50:27',1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

USE webbshop;
LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(11,'M18 FUEL™ 45 mm SDS-Max kombihammare med ONE-KEY™','Batteridriven SDS-Max kombihammare med 45 mm kapacitet och ONE-KEY™. Levererar prestanda i nivå med nätdrivna maskiner och full flexibilitet inom M18-systemet.',9999,'2026-03-12 12:21:27','2026-03-12 12:21:27','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FHACO745-122C--Hero_1.jpg','Borrhammare',0,NULL),
(12,'M18 FUEL™ SURGE™ ¼″ hex hydraulisk slagskruvdragare','Hydraulisk slagmekanism ger tystare drift än traditionella slagskruvdragare. Kompakt och lätt, med 210 Nm vridmoment för installatörer och hantverkare.',2999,'2026-03-12 12:22:53','2026-03-12 12:22:53','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FIDRQ-0--Hero_1.jpg','Slagskruvdragare',0,NULL),
(13,'M18 FUEL™ 40 mm SDS-Max borrhammare med ONE-KEY™','Batteridriven SDS-Max borrhammare med 40 mm kapacitet och ONE-KEY™. Levererar prestanda i nivå med nätdrivna maskiner.',8999,'2026-03-12 12:39:55','2026-03-12 12:39:55','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FHACO540-0--Hero_1.jpg','Borrhammare',0,NULL),
(14,'M18 FUEL™ 165 mm cirkelsåg','Kompakt och kraftfull 165 mm cirkelsåg på M18-plattformen. Klarar kapdjup upp till 57 mm vid 90°.',3499,'2026-03-12 12:40:03','2026-03-12 12:40:03','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FCSDC165-0--Hero_1.jpg','Cirkelsågar',0,NULL),
(15,'M18 FUEL™ Powerpack M18-FPP1N-551','Komplett startpaket med borrskruvdragare, slagskruvdragare, två 5,0 Ah-batterier och laddare. Ett bra paket för dig som vill komma igång direkt.',5999,'2026-03-12 12:40:09','2026-03-12 12:40:09','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FPP1N-551--Hero_1.jpg','Paket',0,NULL),
(16,'MX FUEL™ 25 kg 28 mm bilningshammare','Extremt kraftfull batteridriven bilningshammare på 25 kg med 28 mm mejselfäste. Utvecklad för att ersätta nätdrivna maskiner i krävande arbeten.',24999,'2026-03-12 12:40:17','2026-03-12 12:40:17','https://milwaukee-media-images.s3.amazonaws.com/hi/MXF_DH2528H-0--Hero_1.jpg','Borrhammare',0,NULL),
(17,'M18 kolborstfri blåsare','Batteridriven blåsare för effektiv rengöring av arbetsytor och bortblåsning av damm och spån.',1299,'2026-03-12 12:40:25','2026-03-12 12:40:25','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_BLHSB-0--Hero_1.jpg','Övrigt',0,NULL),
(18,'M18 FUEL™ nibblare 3,5 mm','Batteridriven nibblare med kapacitet upp till 3,5 mm i mjukt stål. Snabb och smidig, med prestanda som överträffar många nätdrivna alternativ.',4999,'2026-03-12 12:40:29','2026-03-13 08:26:39','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FNB35-0--Hero_1.jpg','Nibblare och plåtsaxar',0,NULL),
(19,'M18 ONE-KEY™ FUEL™ 1″ mutterdragare med friktionsring','Kraftfull 1-tums mutterdragare med ONE-KEY™ och friktionsring för säker hylsmontering.',12999,'2026-03-12 12:40:34','2026-03-13 08:26:15','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_ONEFHIWF1-0--Hero_1.jpg','Mutterdragare',0,NULL),
(20,'M18 FUEL™ 230 mm vinkelslip med paddelbrytare','Kraftfull 230 mm vinkelslip med paddelbrytare. Levererar effekt motsvarande en 2400 W nätdriven vinkelslip.',5999,'2026-03-12 12:40:38','2026-03-12 12:40:38','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FLAG230XPDB-0--Hero_1.jpg','Vinkelslipar',0,NULL),
(21,'M18 FUEL™ Super Sawzall tigersåg','Professionell tigersåg med 32 mm slaglängd och variabel hastighet. Kapar trä, metall, plast och andra material.',3824,'2026-03-12 12:40:42','2026-03-12 12:40:42','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FSX-0--Hero_1.jpg','Tigersågar',1,4499),
(22,'M18 ONE-KEY™ FUEL™ bordssåg','Portabel batteridriven bordssåg med ONE-KEY™. Klarar kapdjup upp till 82 mm vid 90°.',14999,'2026-03-12 12:40:48','2026-03-13 08:27:34','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FTS210-0--Hero_1.jpg','Övrigt',0,NULL),
(23,'M18 FUEL™ 230 mm kapmaskin','Batteridriven kapmaskin med 230 mm kapskiva för metall och rostfritt stål. Utvecklad för att ersätta nätdrivna kapmaskiner.',6999,'2026-03-12 12:40:52','2026-03-13 08:28:08','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FCOS230-0--Hero_1.jpg','Övrigt',0,NULL),
(24,'M18 FUEL™ 125 mm excenterslip','Batteridriven excenterslip med 125 mm slipplatta och variabel hastighet. Ger en jämn och professionell finish på trä och lackerade ytor.',2999,'2026-03-12 12:40:57','2026-03-13 09:21:01','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FROS125-0--Hero_1.jpg','Slipmaskiner',0,NULL),
(25,'M12™ högtalare','Kompakt och robust bygghögtalare för M12-batterier. Har Bluetooth-anslutning och är byggd för tuffa arbetsmiljöer.',1999,'2026-03-12 12:41:01','2026-03-12 12:41:01','https://milwaukee-media-images.s3.amazonaws.com/hi/M12_SPEJSG2-0--Hero_1.jpg','Övrigt',0,NULL),
(26,'M18™ FORGE™ 12,0 Ah-batteri','M18 FORGE 12,0 Ah-batteri med avancerad cellteknik för hög prestanda och lång drifttid.',2499,'2026-03-13 07:41:49','2026-03-13 07:46:19','/images/forge-12ah.webp','Batterier och laddare',0,NULL),
(27,'M18™ FORGE™ 6,0 Ah-batteri','M18 FORGE 6,0 Ah-batteri med snabb laddning och hög energitäthet för krävande arbetsuppgifter.',1499,'2026-03-13 07:41:56','2026-03-13 07:50:03','https://lucacastelli.com/wp-content/uploads/2024/02/23938.jpg','Batterier och laddare',0,NULL),
(28,'M18™ FORGE™ 8,0 Ah-batteri','M18 FORGE 8,0 Ah-batteri med en bra balans mellan vikt, effekt och drifttid.',1899,'2026-03-13 07:42:02','2026-03-13 08:03:16','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_FB8--Hero_1.jpg?v=8974C70A3EF42247B755642B5B69EFA8','Batterier och laddare',0,NULL),
(29,'M18™ dubbel superladdare','Laddar två M18-batterier samtidigt med upp till dubbelt så snabb laddning som en standardladdare.',1999,'2026-03-13 07:42:08','2026-03-13 07:56:49','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_DBSC--Hero_1.jpg?v=BC867C1D729818EE0D13727F189EF21E&width=500&heightratio=1&mode=crop','Batterier och laddare',0,NULL),
(30,'M18™ kemikalieresistent startkit','Startkit med kemikalieresistenta batterier och laddare, framtaget för industriella miljöer och laboratorier.',3499,'2026-03-13 07:42:12','2026-03-13 07:42:12','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_NRGCR-502--Hero_1.jpg','Batterier och laddare',0,NULL),
(31,'M18™ resistent 5,0 Ah-batteri','Kemikalieresistent 5,0 Ah-batteri för användning i krävande miljöer med exponering för kemikalier.',1299,'2026-03-13 07:42:16','2026-03-13 08:03:53','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_B5-CR--Hero_1.jpg?v=49DB0A9B2F2F1BDE993087BCAE0DA6A3','Batterier och laddare',0,NULL),
(32,'M18™ dubbel snabbladdare','Laddar två M18-batterier samtidigt med snabb laddteknik som minimerar stillestånd.',1599,'2026-03-13 07:42:21','2026-03-13 08:06:22','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_DFC--Hero_1.jpg?v=1126CBE2F999649063ED0F26024ECE7A','Batterier och laddare',0,NULL),
(33,'Milwaukee USB-kabel','USB-kabel kompatibel med Milwaukee M12-batterier för laddning av USB-enheter via batteriet.',299,'2026-03-13 07:42:26','2026-03-13 08:06:44','https://www.svetsochtillbehor.se/thumb/49103/1280x0/4007be01d1b5f9dd6a18e39f4e696f14.jpg','Batterier och laddare',0,NULL),
(34,'M18 FUEL™ betongvibrator för konsolidering av betong','Batteridriven betongvibrator för professionell konsolidering av betong. Levererar prestanda i nivå med nätdrivna modeller inom M18-systemet.',4999,'2026-03-13 08:22:24','2026-03-13 08:23:00','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_FCVN24-551--Hero_1.jpg?v=AA516A78624ADFC31F488BC8D3912895','Betongvibratorer',0,NULL),
(35,'MX FUEL™ bärbar betongvibrator','Bärbar batteridriven betongvibrator på MX FUEL-plattformen. Utvecklad för att fullt ut ersätta nätdrivna modeller.',12999,'2026-03-13 08:22:30','2026-03-13 08:22:30','https://milwaukee-media-images.s3.amazonaws.com/hi/MXF_CVBC-0--Hero_1.jpg','Betongvibratorer',0,NULL),
(36,'MX FUEL™ ryggburen betongvibrator','Ryggburen batteridriven betongvibrator för hög rörlighet på arbetsplatsen. Passar bra vid arbete i svåråtkomliga utrymmen.',15999,'2026-03-13 08:22:36','2026-03-13 08:22:36','https://milwaukee-media-images.s3.amazonaws.com/hi/MXF_CVBP-0--Hero_1.jpg','Betongvibratorer',0,NULL),
(37,'M18™ kolborstfri ¼″ hex slagskruvdragare','Kompakt och kraftfull kolborstfri slagskruvdragare med 210 Nm vridmoment. Passar installatörer och hantverkare.',1529,'2026-03-13 08:25:29','2026-03-13 08:25:29','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_BLIDR-0--Hero_1.jpg','Slagskruvdragare',1,1799),
(38,'M18™ kompakt kolborstfri ¼″ hex slagskruvdragare','Extra kompakt och lätt kolborstfri slagskruvdragare för arbete i trånga utrymmen.',1599,'2026-03-13 08:25:34','2026-03-13 08:25:34','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_BLIDRC-0--Hero_1.jpg','Slagskruvdragare',0,NULL),
(39,'M18 FUEL™ ONE-KEY™ ¼″ slagskruvdragare','Avancerad slagskruvdragare med ONE-KEY™ för anpassning av vridmoment och hastighet via app.',2499,'2026-03-13 08:25:42','2026-03-13 08:25:42','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_ONEID3-0--Hero_1.jpg','Slagskruvdragare',0,NULL),
(40,'M18 FUEL™ 55 mm cirkelsåg för trä och plast','Kompakt 55 mm cirkelsåg optimerad för kapning av trä och plast. Drivs av M18-batteriplattformen.',2999,'2026-03-13 08:29:41','2026-03-13 08:29:41','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FCS552-0--Hero_1.jpg','Cirkelsågar',0,NULL),
(41,'M18 FUEL™ cirkelsåg med styrskenekompatibilitet','Professionell cirkelsåg med styrskenekompatibilitet för raka och exakta snitt. Klarar upp till 700 kap i 90 x 45 mm virke på ett batteri.',4499,'2026-03-13 08:29:46','2026-03-13 08:29:46','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FCS66GR3-0--Hero_1.jpg','Cirkelsågar',0,NULL),
(42,'M18 FUEL™ 66 mm metallcirkelsåg','Kraftfull 66 mm metallcirkelsåg särskilt utvecklad för kapning av metall. Borstlös motor ger hög prestanda och lång livslängd.',5499,'2026-03-13 08:29:52','2026-03-13 08:29:52','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FMCS66-0--Hero_1.jpg','Cirkelsågar',0,NULL),
(43,'Milwaukee sågklingor för handhållna cirkelsågar','Högkvalitativa sågklingor för handhållna cirkelsågar från Milwaukee. Finns i flera varianter för trä, metall och plast.',399,'2026-03-13 08:29:57','2026-03-13 08:30:22','https://milwaukee-media-images.s3.amazonaws.com/hi/SAWBLADE-CIRC-0--Hero_1.jpg','Övrigt',0,NULL),
(44,'M18™ 55 mm cirkelsåg för trä och plast','Pålitlig 55 mm cirkelsåg för kapning av trä och plast. Kompakt design som är lätt att hantera på arbetsplatsen.',2499,'2026-03-13 08:30:01','2026-03-13 08:30:01','https://milwaukee-media-images.s3.amazonaws.com/hi/HD18_CS-0--Hero_1.jpg','Cirkelsågar',0,NULL),
(46,'M18 FUEL™ ONE-KEY™ 305 mm kap- och gersåg','Professionell 305 mm kap- och gersåg med ONE-KEY™. Klarar kap upp till 100 x 355 mm vid 90°.',12999,'2026-03-13 08:33:55','2026-03-13 08:33:55','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FMS305-0--Hero_1.jpg','Kap- och gersågar',0,NULL),
(47,'M18 FUEL™ 190 mm kap- och gersåg','Kompakt och portabel 190 mm kap- och gersåg på M18-plattformen. Passar snickare och installatörer.',6999,'2026-03-13 08:34:07','2026-03-13 08:34:07','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FMS190-0--Hero_1.jpg','Kap- och gersågar',0,NULL),
(48,'M18 FUEL™ 254 mm kap- och gersåg','Kraftfull 254 mm kap- och gersåg med dubbla glidskenor för stort kapdjup och hög precision.',9999,'2026-03-13 08:34:11','2026-03-13 08:34:11','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FMS254-0--Hero_1.jpg','Kap- och gersågar',0,NULL),
(49,'Milwaukee arbetsbord till kap- och gersåg, förlängningsbart till 2,8 m','Stabilt och förlängningsbart arbetsbord för kap- och gersågar. Kan dras ut till 2,8 meter för långa arbetsstycken.',3499,'2026-03-13 08:34:15','2026-03-13 08:34:15','https://milwaukee-media-images.s3.amazonaws.com/hi/MITER-SAW-STAND-0--Hero_1.jpg','Kap- och gersågar',0,NULL),
(50,'M18™ HIGH OUTPUT™ lampa på stativ med integrerad laddare','Kraftfull arbetslampa på stativ med integrerad laddare. Ger stark belysning på arbetsplatsen utan behov av nätström.',5999,'2026-03-13 08:36:00','2026-03-13 08:36:00','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_HOSALC-0--Hero_1.jpg','Lampor',0,NULL),
(51,'M18™ ONE-KEY™ LED-lampa på stativ','LED-arbetslampa på stativ med ONE-KEY™ för fjärrstyrning av ljusstyrka och lägen via app.',4499,'2026-03-13 08:36:05','2026-03-13 08:36:05','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_ONERSAL-0--Hero_1.jpg','Lampor',0,NULL),
(52,'M18™ LED-arbetslampa','Kompakt och kraftfull LED-arbetslampa för M18-batterier. Levererar 1000 lumen för god belysning på arbetsplatsen.',1299,'2026-03-13 08:36:10','2026-03-13 08:36:10','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_SLED-0--Hero_1.jpg','Lampor',0,NULL),
(53,'M18™ LED-strålkastare','Riktad LED-strålkastare för M18-batterier. Passar för belysning av specifika arbetsområden i mörka miljöer.',1499,'2026-03-13 08:36:15','2026-03-13 08:36:15','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_TLED-0--Hero_1.jpg','Lampor',0,NULL),
(54,'M18 FUEL™ 57 mm metallsåg','Kraftfull 57 mm metallsåg på M18-plattformen. Kapar stål, aluminium och andra metaller utan nätström.',4999,'2026-03-13 08:37:53','2026-03-13 08:37:53','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FMCS-0--Hero_1.jpg','Metallsågar och metallbearbetning',0,NULL),
(55,'Milwaukee metallslipskivor PRO','Professionella metallslipskivor för Milwaukee vinkelslipar. Ger lång livslängd och effektiv slipning av metall.',299,'2026-03-13 08:38:00','2026-03-13 08:38:12','https://milwaukee-media-images.s3.amazonaws.com/hi/METALGRINDINGDISC-PRO-0--Hero_1.jpg','Övrigt',0,NULL),
(57,'M18™ plåtsax 2,0 mm','Batteridriven plåtsax med kapacitet upp till 2,0 mm i plåt. Kraftfull och kompakt för professionellt bruk.',3499,'2026-03-13 08:40:32','2026-03-13 08:40:56','https://static.milwaukeetool.eu/remote.axd/milwaukee-media-images.s3.amazonaws.com/hi/M18_BMS20-0--Hero_01.jpg?v=91F273D826B3F492450241C0BF92D51A','Nibblare och plåtsaxar',0,NULL),
(58,'M18 FUEL™ oscillerande polermaskin med 21 mm excenterrörelse','Professionell batteridriven polermaskin med 21 mm excenterrörelse. Levererar prestanda i nivå med nätdrivna maskiner.',5999,'2026-03-13 08:45:26','2026-03-13 08:45:26','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FROP21-0--Hero_1.jpg','Polermaskiner',0,NULL),
(59,'M18 FUEL™ oscillerande polermaskin med 15 mm excenterrörelse','Batteridriven polermaskin med 15 mm excenterrörelse och åtta hastighetslägen för hög kontroll.',4999,'2026-03-13 08:45:30','2026-03-13 08:45:30','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FROP15-0--Hero_1.jpg','Polermaskiner',0,NULL),
(60,'M18 FUEL™ polermaskin','Kraftfull batteridriven polermaskin för professionell polering av lack och andra ytor.',4499,'2026-03-13 08:45:35','2026-03-13 08:46:33','https://www.svetsochtillbehor.se/thumb/49364/1024x0/1873c8a442fdead488379cbb15f2b2f1.jpg','Polermaskiner',0,NULL),
(61,'M18™ ¼-arks planslip','Kompakt batteridriven planslip för slipning av trä och lack. Drivs av M18-batteriplattformen.',1799,'2026-03-13 08:52:21','2026-03-13 08:52:21','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_BQSS-0--Hero_1.jpg','Slipmaskiner',0,NULL),
(62,'M18 FUEL™ 75 mm bandslip','Kraftfull 75 mm batteridriven bandslip för snabb materialavverkning på trä och metall.',3999,'2026-03-13 08:52:29','2026-03-13 08:52:29','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FBTS75-0--Hero_1.jpg','Slipmaskiner',0,NULL),
(63,'M18™ 125 mm excenterslip','Batteridriven excenterslip med 125 mm slipplatta för fin ytbehandling av trä och lack.',1699,'2026-03-13 08:52:34','2026-03-13 08:52:34','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_BOS125-0--Hero_1.jpg','Slipmaskiner',1,1999),
(64,'M18 FUEL™ 125 mm excenterslip','Professionell 125 mm excenterslip med borstlös motor och variabel hastighet för bästa möjliga finish.',2999,'2026-03-13 08:52:39','2026-03-13 08:52:39','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FROS125-0--Hero_1.jpg','Slipmaskiner',0,NULL),
(65,'M18 FUEL™ duplexspikpistol','Batteridriven duplexspikpistol för stängsel och konstruktionsarbete. Drivs av M18-batteriplattformen.',4999,'2026-03-13 08:54:35','2026-03-13 08:54:35','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FDN-0--Hero_1.jpg','Dyckert- och stiftpistoler',0,NULL),
(66,'M18 FUEL™ 16 GA dyckertpistol','Batteridriven 16 GA dyckertpistol för finisharbete och listmontage. Kompakt design för smidig hantering.',3999,'2026-03-13 08:54:39','2026-03-13 08:54:39','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FN16GS-0--Hero_1.jpg','Dyckert- och stiftpistoler',0,NULL),
(67,'M18 FUEL™ klammerpistol för stängselmarlor','Specialutvecklad klammerpistol för montering av stängselmarlor. Drivs av M18-batteriplattformen.',4499,'2026-03-13 08:54:47','2026-03-13 08:54:47','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FFUS-0--Hero_1.jpg','Dyckert- och stiftpistoler',0,NULL),
(68,'M18 FUEL™ 15 GA vinklad dyckertpistol','Vinklad 15 GA dyckertpistol för finisharbete och listmontering. Ger professionella resultat utan luftkompressor.',4299,'2026-03-13 08:54:50','2026-03-13 08:54:50','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FN15GA-0--Hero_1.jpg','Dyckert- och stiftpistoler',0,NULL),
(69,'M18 FUEL™ klammerpistol','Batteridriven klammerpistol för tapetsering och stoppning. Skjuter 18 GA-klammer utan behov av luftkompressor.',3499,'2026-03-13 08:54:54','2026-03-13 08:54:54','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FNCS18GS-0--Hero_1.jpg','Dyckert- och stiftpistoler',0,NULL),
(70,'M18 FUEL™ sticksåg','Professionell batteridriven sticksåg med borstlös motor och variabel slaghastighet. Kapar trä, metall och plast.',3499,'2026-03-13 08:56:30','2026-03-13 08:56:30','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FJS-0--Hero_1.jpg','Sticksågar',0,NULL),
(71,'M18 FUEL™ kompakt sticksåg','Kompakt och lätt batteridriven sticksåg med borstlös motor. Passar för precisionssågning i trånga utrymmen.',2999,'2026-03-13 08:56:35','2026-03-13 08:56:35','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FBJS-0--Hero_1.jpg','Sticksågar',0,NULL),
(72,'M18™ sticksåg','Pålitlig batteridriven sticksåg för kapning av trä, metall och plast. Drivs av M18-batteriplattformen.',2499,'2026-03-13 08:56:40','2026-03-13 08:56:40','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_BJS-0--Hero_1.jpg','Sticksågar',0,NULL),
(74,'Milwaukee sticksågsblad med U-skaft','Högkvalitativa sticksågsblad med U-skaft för Milwaukee sticksågar. Finns i varianter för trä, metall och plast.',299,'2026-03-13 08:56:48','2026-03-13 08:57:07','https://milwaukee-media-images.s3.amazonaws.com/hi/JIGSAW-BLADE-U-0--Hero_1.jpg','Övrigt',0,NULL),
(75,'M18 FUEL™ ONE-KEY™ SAWZALL™ tigersåg','Professionell SAWZALL™ tigersåg med ONE-KEY™ för anpassad prestanda och stöldskydd. Borstlös motor ger hög effekt och lång drifttid.',5499,'2026-03-13 09:02:11','2026-03-13 09:02:11','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_ONEFSZ-0--Hero_1.jpg','Tigersågar',0,NULL),
(76,'M18 FUEL™ SAWZALL™ tigersåg','Kraftfull SAWZALL™ tigersåg med borstlös motor och variabel slaghastighet. Kapar trä, metall och rör med nätdriven känsla.',4499,'2026-03-13 09:02:15','2026-03-13 09:02:15','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FSZ-0--Hero_1.jpg','Tigersågar',0,NULL),
(77,'TORCH™ tigersågblad Nitrus Carbide Heavy Duty metall','Extremt slitstarka TORCH™-blad med Nitrus Carbide för kapning av hård metall, rostfritt stål och armerade material.',399,'2026-03-13 09:02:19','2026-03-13 09:02:38','https://milwaukee-media-images.s3.amazonaws.com/hi/TORCH-NITRUS-0--Hero_1.jpg','Övrigt',0,NULL),
(78,'Milwaukee tigersågblad för frysta material','Specialutvecklade tigersågblad för kapning i frysta rör och andra frysta material. Ger rena snitt även i mycket kalla miljöer.',349,'2026-03-13 09:02:23','2026-03-13 09:02:47','https://milwaukee-media-images.s3.amazonaws.com/hi/FROZEN-MATERIAL-BLADE-0--Hero_1.jpg','Övrigt',0,NULL),
(79,'M18™ HACKZALL™ tigersåg','Kompakt enhandstigersåg för arbete i trånga utrymmen. Passar särskilt bra för VVS, el och snickeri.',2999,'2026-03-13 09:02:27','2026-03-13 09:02:27','https://milwaukee-media-images.s3.amazonaws.com/hi/C18_HZ-0--Hero_1.jpg','Tigersågar',0,NULL),
(80,'M18 FUEL™ 150/160 mm vinkelslip med paddelbrytare','Kraftfull batteridriven vinkelslip med paddelbrytare för snabb avstängning. Borstlös motor ger hög effekt vid slipning, kapning och polering.',5999,'2026-03-13 09:23:35','2026-03-13 09:23:35','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FHSAG150XPDB2-0--Hero_1.jpg','Vinkelslipar',0,NULL),
(81,'M18 FUEL™ 150/160 mm vinkelslip med låsbar strömbrytare','Batteridriven vinkelslip med låsbar strömbrytare för längre arbetspass. Borstlös motor och elektroniskt överbelastningsskydd ger lång livslängd.',5799,'2026-03-13 09:23:43','2026-03-13 09:23:43','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FHSAG150XB2-0--Hero_1.jpg','Vinkelslipar',0,NULL),
(82,'M18 FUEL™ 180 mm vinkelslip med variabel hastighet och ONE-KEY™ Gen 2','Avancerad batteridriven vinkelslip med variabel hastighet och ONE-KEY™ Gen 2. 180 mm kapskiva, anpassningsbar prestanda och stöldskydd via app.',7499,'2026-03-13 09:23:51','2026-03-13 09:23:51','https://milwaukee-media-images.s3.amazonaws.com/hi/M18_FHSAGO180VXPDB2-0--Hero_1.jpg','Vinkelslipar',0,NULL);
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
  CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_5` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_7` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_8` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_9` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,4,'2026-03-11 14:21:20','2026-03-11 14:21:20',NULL);
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
  UNIQUE KEY `email_21` (`email`)
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
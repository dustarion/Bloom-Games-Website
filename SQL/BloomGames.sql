CREATE DATABASE  IF NOT EXISTS `db1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `db1`;
-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: db1
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `commenterName` varchar(50) NOT NULL,
  `rating` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`commentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_cart`
--

DROP TABLE IF EXISTS `game_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `game_cart` (
  `cartOwner` int(11) NOT NULL,
  `game` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartOwner`,`game`),
  KEY `gameID_idx` (`game`),
  KEY `user_idx` (`cartOwner`),
  CONSTRAINT `cartOwner` FOREIGN KEY (`cartOwner`) REFERENCES `users` (`userID`),
  CONSTRAINT `game` FOREIGN KEY (`game`) REFERENCES `games` (`gameID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_cart`
--

LOCK TABLES `game_cart` WRITE;
/*!40000 ALTER TABLE `game_cart` DISABLE KEYS */;
INSERT INTO `game_cart` VALUES (1,1,3),(1,4,1),(3,1,1);
/*!40000 ALTER TABLE `game_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_comment`
--

DROP TABLE IF EXISTS `game_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `game_comment` (
  `commentID` int(11) NOT NULL,
  `gameCommentID` int(11) NOT NULL,
  PRIMARY KEY (`commentID`,`gameCommentID`),
  KEY `gamecommentID_idx` (`gameCommentID`),
  CONSTRAINT `commentID` FOREIGN KEY (`commentID`) REFERENCES `comments` (`commentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gamecommentID` FOREIGN KEY (`gameCommentID`) REFERENCES `games` (`gameID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_comment`
--

LOCK TABLES `game_comment` WRITE;
/*!40000 ALTER TABLE `game_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_genre`
--

DROP TABLE IF EXISTS `game_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `game_genre` (
  `genreID` int(11) NOT NULL,
  `gameID` int(11) NOT NULL,
  PRIMARY KEY (`genreID`,`gameID`),
  KEY `gameID_idx` (`gameID`),
  CONSTRAINT `gameID` FOREIGN KEY (`gameID`) REFERENCES `games` (`gameID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `genreID` FOREIGN KEY (`genreID`) REFERENCES `genre` (`genreID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_genre`
--

LOCK TABLES `game_genre` WRITE;
/*!40000 ALTER TABLE `game_genre` DISABLE KEYS */;
INSERT INTO `game_genre` VALUES (1,2),(1,4),(3,4),(2,5),(4,5),(2,7),(3,9),(3,10),(4,11);
/*!40000 ALTER TABLE `game_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_purchase`
--

DROP TABLE IF EXISTS `game_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `game_purchase` (
  `transaction` int(11) NOT NULL,
  `purchasedGame` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`transaction`,`purchasedGame`),
  KEY `purchasedGame_idx` (`purchasedGame`),
  CONSTRAINT `purchasedGame` FOREIGN KEY (`purchasedGame`) REFERENCES `games` (`gameID`) ON UPDATE CASCADE,
  CONSTRAINT `transaction` FOREIGN KEY (`transaction`) REFERENCES `purchase_transaction` (`transactionID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_purchase`
--

LOCK TABLES `game_purchase` WRITE;
/*!40000 ALTER TABLE `game_purchase` DISABLE KEYS */;
INSERT INTO `game_purchase` VALUES (8,3,6,29.00),(8,6,2,34.99),(9,1,6,59.90);
/*!40000 ALTER TABLE `game_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `games` (
  `gameID` int(11) NOT NULL AUTO_INCREMENT,
  `gameTitle` varchar(60) NOT NULL,
  `Company` varchar(100) NOT NULL,
  `releaseDate` date NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `imageLocation` varchar(100) NOT NULL,
  `preOwned` tinyint(4) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`gameID`),
  UNIQUE KEY `gameID_UNIQUE` (`gameID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'No Mans Sky','Hello Games','2016-08-13','Inspired by the adventure and imagination that we love from classic science-fiction, No Mans Sky presents you with a galaxy to explore, filled with unique planets and lifeforms, and constant danger and action. In No Mans Sky, every star is the light of a distant sun, each orbited by planets filled with life, and you can go to any of them you choose. Fly smoothly from deep space to planetary surfaces, with no loading screens, and no limits. In this infinite procedurally generated universe, youll discover places and creatures that no other players have seen before - and perhaps never will again.',59.90,'images/games/nomanssky.jpg',1,20),(2,'Monster Hunter World','CAPCOM','2018-08-10','As a hunter, you will take on quests to hunt monsters in a variety of habitats. Take down these monsters and receive materials that you can use to create stronger weapons and armour in order to hunt even more dangerous monsters. In Monster Hunter: World, the latest instalment in the series, you can enjoy the ultimate hunting experience, using everything at your disposal to hunt monsters in a new world teeming with surprises and excitement.',85.00,'images/games/hunter.jpg',0,3),(3,'Rust','Facepunch Studios','2018-02-09','The only aim in Rust is to survive. To do this you will need to overcome struggles such as hunger, thirst and cold. Build a fire. Build a shelter. Kill animals for meat. Protect yourself from other players, and kill them for meat. Create alliances with other players and form a town. Do whatever it takes to survive.',29.00,'images/games/rust.jpg',1,15),(4,'ARK: Survival Evolved','Studio Wildcard, Instinct Games, Efecto Studios','2017-08-28','As a man or woman stranded naked, freezing and starving on the shores of a mysterious island called ARK, you must hunt, harvest resources, craft items, grow crops, research technologies, and build shelters to withstand the elements. Use your cunning and resources to kill or tame & breed the leviathan dinosaurs and other primeval creatures roaming the land, and team up with or prey on hundreds of other players to survive, dominate... and escape!',42.00,'images/games/ark.jpg',0,32),(5,'Counter-Strike: Global Offensive','Valve, Hidden Path Entertainment','2012-08-22','Counter-Strike: Global Offensive (CS: GO) expands upon the team-based action gameplay that it pioneered when it was launched 19 years ago. CS: GO features new maps, characters, weapons, and game modes, and delivers updated versions of the classic CS content (de_dust2, etc.).',5.00,'images/games/cs.jpg',0,82),(6,'PUBG','PUBG Corporation','2017-12-21','PLAYERUNKNOWN\'S BATTLEGROUNDS is a battle royale shooter that pits 100 players against each other in a struggle for survival. Gather supplies and outwit your opponents to become the last person standing. PLAYERUNKNOWN, aka Brendan Greene, is a pioneer of the battle royale genre and the creator of the battle royale game modes in the ARMA series and H1Z1: King of the Kill.',34.99,'images/games/pubg.jpg',0,0),(7,'Apex Legends','Respawn Entertainment','2019-02-05','Conquer with character in Apex Legends, a free-to-play* Battle Royale shooter where legendary characters with powerful abilities team up to battle for fame & fortune on the fringes of the Frontier. Master an ever-growing roster of diverse Legends, deep tactical squad play and bold new innovations that level up the Battle Royale experience—all within a rugged world where anything goes. Welcome to the next evolution of Battle Royale.',10.00,'images/games/apexLegends.png',1,83),(8,'Battlefield V','DICE','2018-11-19','The Battlefield series goes back to its roots in a never-before-seen portrayal of World War 2. Take on physical, all-out multiplayer with your squad in modes like the vast Grand Operations and the cooperative Combined Arms, or witness human drama set against global combat in the single player War Stories. As you fight in epic, unexpected locations across the globe, enjoy the richest and most immersive Battlefield yet. Now also includes Firestorm – Battle Royale, reimagined for Battlefield.',34.95,'images/games/bf5.jpg',0,100),(9,'DAYZ','Bohemia Interactive','2018-12-14','The post-soviet country of Chernarus is struck by an unknown virus, turning the majority population into frenzied infected. Fighting over resources has bred a hostile mentality among survivors, driving what’s left of humanity to collapse. You are one of the few immune to the virus - how far will you go to survive?',49.99,'images/games/dayz.jpg',0,37),(10,'Subnautica ','Unknown Worlds Entertainment','2018-01-23','Subnautica is an underwater adventure game set on an alien ocean planet. A massive, open world full of wonder and peril awaits you! Descend into the depths of an alien underwater world filled with wonder and peril. Craft equipment, pilot submarines and out-smart wildlife to explore lush coral reefs, volcanoes, cave systems, and more - all while trying to survive.',22.00,'images/games/sub.jpg',1,23),(11,'Dota 2','Valve','2013-07-09','The most-played game on Steam. Every day, millions of players worldwide enter battle as one of over a hundred Dota heroes. And no matter if it\'s their 10th hour of play or 1,000th, there\'s always something new to discover. With regular updates that ensure a constant evolution of gameplay, features, and heroes, Dota 2 has truly taken on a life of its own.',10.00,'images/games/dota2.jpg',0,97),(12,'Stellaris','Paradox Development Studio','2016-05-09','Explore and discover a spectacular and ever-changing universe! Paradox Development Studio, makers of the Europa Universalis and Crusader Kings series, and publishers of the best-selling Cities: Skylines, presents Stellaris, advancing the genre of grand strategy to the very edges of the universe.',39.00,'images/games/stellaris.jpg',1,87);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `genre` (
  `genreID` int(11) NOT NULL AUTO_INCREMENT,
  `genreName` varchar(45) NOT NULL,
  PRIMARY KEY (`genreID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Adventure'),(2,'Shooter'),(3,'Survival'),(4,'Strategy');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_transaction`
--

DROP TABLE IF EXISTS `purchase_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `purchase_transaction` (
  `transactionID` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`transactionID`),
  UNIQUE KEY `transactionID_UNIQUE` (`transactionID`),
  KEY `user_idx` (`owner`),
  CONSTRAINT `owner` FOREIGN KEY (`owner`) REFERENCES `users` (`userID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_transaction`
--

LOCK TABLES `purchase_transaction` WRITE;
/*!40000 ALTER TABLE `purchase_transaction` DISABLE KEYS */;
INSERT INTO `purchase_transaction` VALUES (8,3,'2019-08-04 20:45:53'),(9,3,'2019-08-04 20:49:15');
/*!40000 ALTER TABLE `purchase_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_data`
--

DROP TABLE IF EXISTS `user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_data` (
  `userID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `mailingAddress` varchar(45) NOT NULL,
  `contactNumber` varchar(45) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`),
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_data`
--

LOCK TABLES `user_data` WRITE;
/*!40000 ALTER TABLE `user_data` DISABLE KEYS */;
INSERT INTO `user_data` VALUES (1,'Dalton Ng','Block 115 Edgefield Plains','12345678'),(3,'Dalton','dalton st block 45','12345678');
/*!40000 ALTER TABLE `user_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(150) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dustarion@gmail.com','1000:256:7B2B0914C6DF3599A0CE72217E4925F775988E3EB04CF0A8E951B9CFAF0212D2:C25DAFAC9244F677106B6723AA97B44E9210E1569425F1C0873B21F0CDDB1CF4',1),(3,'dalton@gmail.com','1000:256:F1A494C20CBFB62B55B57C376F8829BBF12F1A48CF554FE1F63CCA26C652F696:C828AEA93EDD54612BFD160971E64E8B783929BF21A8A55EE8A46C670F17AC3E',0);
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

-- Dump completed on 2019-08-05  1:51:11

-- Script to create the BloomGames DB

-- ------------------------------------------------------------------------
-- Start

-- ------------------------------------------------------------------------
-- Users Table
-- ------------------------------------------------------------------------

SET NAMES utf8 ;

DROP TABLE IF EXISTS `users`;

SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
    `userID` int(11) NOT NULL AUTO_INCREMENT,
    `username` varchar(45) NOT NULL DEFAULT 'admin',
    `password` varchar(45) NOT NULL DEFAULT 'secretPassword',
    PRIMARY KEY (`userID`)
)   ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------------------------
-- Games Tables
-- ------------------------------------------------------------------------

DROP TABLE IF EXISTS `games`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `games` (
    `gameID` int(11) NOT NULL AUTO_INCREMENT,
    `gameTitle` varchar(60) NOT NULL,
    `Company` varchar(30) NOT NULL,
    `releaseDate` date NOT NULL,
    `description` varchar(200) NOT NULL,
    `price` decimal(10,0) NOT NULL,
    `imageLocation` varchar(100) NOT NULL,
    `preOwned` tinyint(4) NOT NULL,
    `trailerLocation` varchar(100) NOT NULL,
    `purchaseLocation` varchar(100) NOT NULL,
    `creatorID` int(11) NOT NULL,
    PRIMARY KEY (`gameID`),
    KEY `creatorID_idx` (`creatorID`),
    CONSTRAINT `creatorID` FOREIGN KEY (`creatorID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
)   ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------------------------
-- Genre Table
-- ------------------------------------------------------------------------

DROP TABLE IF EXISTS `genre`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `genre` (
    `genreID` int(11) NOT NULL AUTO_INCREMENT,
    `genreName` varchar(45) NOT NULL,
    PRIMARY KEY (`genreID`)
)   ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------------------------
-- Game_Genre Table
-- ------------------------------------------------------------------------

DROP TABLE IF EXISTS `game_genre`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `game_genre` (
    `genreID` int(11) NOT NULL,
    `gameID` int(11) NOT NULL,
    PRIMARY KEY (`genreID`,`gameID`),
    KEY `gameID_idx` (`gameID`),
    CONSTRAINT `gameID` FOREIGN KEY (`gameID`) REFERENCES `games` (`gameID`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `genreID` FOREIGN KEY (`genreID`) REFERENCES `genre` (`genreID`) ON DELETE CASCADE ON UPDATE CASCADE
)   ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------------------------
-- Comments Table
-- ------------------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
    `commentID` int(11) NOT NULL AUTO_INCREMENT,
    `commenterName` varchar(50) NOT NULL,
    `rating` int(11) NOT NULL,
    `date` datetime NOT NULL,
    `comment` varchar(150) NOT NULL,
    PRIMARY KEY (`commentID`)
)   ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ------------------------------------------------------------------------
-- Game_Comments Table
-- ------------------------------------------------------------------------

DROP TABLE IF EXISTS `game_comment`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `game_comment` (
    `commentID` int(11) NOT NULL,
    `gameCommentID` int(11) NOT NULL,
    PRIMARY KEY (`commentID`,`gameCommentID`),
    KEY `gamecommentID_idx` (`gameCommentID`),
    CONSTRAINT `commentID` FOREIGN KEY (`commentID`) REFERENCES `comments` (`commentID`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `gamecommentID` FOREIGN KEY (`gameCommentID`) REFERENCES `games` (`gameID`) ON DELETE CASCADE ON UPDATE CASCADE
)   ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- End
-- ------------------------------------------------------------------------













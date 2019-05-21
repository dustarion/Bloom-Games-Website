-- This file inserts dummy data into an empty database.
-- Note: Replace db1 with your Database name.



-- Additional Commands Needed!
-- ALTER TABLE db1.games
-- DROP COLUMN description;
-- ALTER TABLE db1.games
-- ADD description text;




-- Insert Initial Admin User
--  username: admin
--  password: secretPassword

INSERT INTO `db1`.`users` (`userID`, `username`, `password`) VALUES ('1', 'admin', 'secretPassword');

-- ---------------------------------------
-- Genre Dummy Data
-- ---------------------------------------

-- Adventure, Shooter, Survival, Strategy

INSERT INTO `db1`.`genre` (`genreName`) VALUES ('Adventure');
INSERT INTO `db1`.`genre` (`genreName`) VALUES ('Shooter');
INSERT INTO `db1`.`genre` (`genreName`) VALUES ('Survival');
INSERT INTO `db1`.`genre` (`genreName`) VALUES ('Strategy');


-- ---------------------------------------
-- Game Dummy Data
-- ---------------------------------------

-- gameID is generated automatically

-- No Man's Sky
INSERT INTO `db1`.`games` (`gameTitle`, `Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `trailerLocation`, `purchaseLocation`, `creatorID`)
VALUES ('No Mans Sky', -- gameTitle
        'Hello Games', -- Company
        '2016/08/13', -- releaseDate
        'Inspired by the adventure and imagination that we love from classic science-fiction, No Mans Sky presents you with a galaxy to explore, filled with unique planets and lifeforms, and constant danger and action. In No Mans Sky, every star is the light of a distant sun, each orbited by planets filled with life, and you can go to any of them you choose. Fly smoothly from deep space to planetary surfaces, with no loading screens, and no limits. In this infinite procedurally generated universe, youll discover places and creatures that no other players have seen before - and perhaps never will again.', -- description
        '59.90', -- price
        'images/games/nomanssky.jpg', -- imageLocation
        '1', -- preOwned
        'https://www.youtube.com/watch?v=nLtmEjqzg7M', -- trailerLocation
        'https://store.steampowered.com/app/275850/No_Mans_Sky/', -- purchaseLocation
        '1');   -- creatorID

-- Insert the genres here !!

-- Monster Hunter World
INSERT INTO `db1`.`games` (`gameTitle`, `Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `trailerLocation`, `purchaseLocation`, `creatorID`)
VALUES ('Monster Hunter World', -- gameTitle
        'CAPCOM', -- Company
        '2018/08/10', -- releaseDate
        'As a hunter, you will take on quests to hunt monsters in a variety of habitats. Take down these monsters and receive materials that you can use to create stronger weapons and armour in order to hunt even more dangerous monsters. In Monster Hunter: World, the latest instalment in the series, you can enjoy the ultimate hunting experience, using everything at your disposal to hunt monsters in a new world teeming with surprises and excitement.', -- description
        '85', -- price
        'images/games/hunter.jpg', -- imageLocation
        '0', -- preOwned
        'https://www.youtube.com/watch?v=Ro6r15wzp2o', -- trailerLocation
        'https://store.steampowered.com/app/582010/MONSTER_HUNTER_WORLD/', -- purchaseLocation
        '1');   -- creatorID

-- Rust
INSERT INTO `db1`.`games` (`gameTitle`, `Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `trailerLocation`, `purchaseLocation`, `creatorID`)
VALUES ('Rust', -- gameTitle
        'Facepunch Studios', -- Company
        '2018/02/09', -- releaseDate
        'The only aim in Rust is to survive. To do this you will need to overcome struggles such as hunger, thirst and cold. Build a fire. Build a shelter. Kill animals for meat. Protect yourself from other players, and kill them for meat. Create alliances with other players and form a town. Do whatever it takes to survive.', -- description
        '29', -- price
        'images/games/rust.jpg', -- imageLocation
        '1', -- preOwned
        'https://www.youtube.com/watch?v=gcvDUxdmntw', -- trailerLocation
        'https://store.steampowered.com/app/252490/Rust/', -- purchaseLocation
        '1');   -- creatorID

-- ARK: Survival Evolved
INSERT INTO `db1`.`games` (`gameTitle`, `Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `trailerLocation`, `purchaseLocation`, `creatorID`)
VALUES ('ARK: Survival Evolved', -- gameTitle
        'Studio Wildcard, Instinct Games, Efecto Studios, Virtual Basement LLC', -- Company
        '2017/08/28', -- releaseDate
        'As a man or woman stranded naked, freezing and starving on the shores of a mysterious island called ARK, you must hunt, harvest resources, craft items, grow crops, research technologies, and build shelters to withstand the elements. Use your cunning and resources to kill or tame & breed the leviathan dinosaurs and other primeval creatures roaming the land, and team up with or prey on hundreds of other players to survive, dominate... and escape!', -- description
        '42', -- price
        'images/games/ark.jpg', -- imageLocation
        '0', -- preOwned
        'https://www.youtube.com/watch?v=5fIAPcVdZO8', -- trailerLocation
        'https://store.steampowered.com/app/346110/ARK_Survival_Evolved/', -- purchaseLocation
        '1');   -- creatorID
        
-- Counter-Strike: Global Offensive
INSERT INTO `db1`.`games` (`gameTitle`, `Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `trailerLocation`, `purchaseLocation`, `creatorID`)
VALUES ('Counter-Strike: Global Offensive', -- gameTitle
        'Valve, Hidden Path Entertainment', -- Company
        '2012/08/22', -- releaseDate
        'Counter-Strike: Global Offensive (CS: GO) expands upon the team-based action gameplay that it pioneered when it was launched 19 years ago. CS: GO features new maps, characters, weapons, and game modes, and delivers updated versions of the classic CS content (de_dust2, etc.).', -- description
        '5', -- price
        'images/games/cs.jpg', -- imageLocation
        '0', -- preOwned
        'https://www.youtube.com/watch?v=edYCtaNueQY', -- trailerLocation
        'https://store.steampowered.com/app/730/CounterStrike_Global_Offensive/', -- purchaseLocation
        '1');   -- creatorID

-- PLAYERUNKNOWN'S BATTLEGROUNDS        
INSERT INTO `db1`.`games` (`gameTitle`, `Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `trailerLocation`, `purchaseLocation`, `creatorID`)
VALUES ("PLAYERUNKNOWN'S BATTLEGROUNDS", -- gameTitle
        'PUBG Corporation', -- Company
        '2017/12/21', -- releaseDate
        "PLAYERUNKNOWN'S BATTLEGROUNDS is a battle royale shooter that pits 100 players against each other in a struggle for survival. Gather supplies and outwit your opponents to become the last person standing. PLAYERUNKNOWN, aka Brendan Greene, is a pioneer of the battle royale genre and the creator of the battle royale game modes in the ARMA series and H1Z1: King of the Kill. At PUBG Corp., Greene is working with a veteran team of developers to make PUBG into the world's premiere battle royale experience.", -- description
        '34.99', -- price
        'images/games/pubg.jpg', -- imageLocation
        '0', -- preOwned
        'https://www.youtube.com/watch?v=hfjazBN0DwA', -- trailerLocation
        'https://store.steampowered.com/app/578080/PLAYERUNKNOWNS_BATTLEGROUNDS/', -- purchaseLocation
        '1');   -- creatorID
        
-- Apex Legends
INSERT INTO `db1`.`games` (`gameTitle`, `Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `trailerLocation`, `purchaseLocation`, `creatorID`)
VALUES ('Apex Legends', -- gameTitle
        'Respawn Entertainment', -- Company
        '2019/02/05', -- releaseDate
        'Conquer with character in Apex Legends, a free-to-play* Battle Royale shooter where legendary characters with powerful abilities team up to battle for fame & fortune on the fringes of the Frontier. Master an ever-growing roster of diverse Legends, deep tactical squad play and bold new innovations that level up the Battle Royale experience—all within a rugged world where anything goes. Welcome to the next evolution of Battle Royale.', -- description
        '10', -- price
        'images/games/apexLegends.png', -- imageLocation
        '1', -- preOwned
        'https://www.youtube.com/watch?v=oQtHENM_GZU', -- trailerLocation
        'https://www.origin.com/sgp/en-us/store/apex/apex', -- purchaseLocation
        '1');   -- creatorID
        
-- Battlefield 5
INSERT INTO `db1`.`games` (`gameTitle`, `Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `trailerLocation`, `purchaseLocation`, `creatorID`)
VALUES ('Battlefield V', -- gameTitle
        'DICE', -- Company
        '2018/11/19', -- releaseDate
        'The Battlefield series goes back to its roots in a never-before-seen portrayal of World War 2. Take on physical, all-out multiplayer with your squad in modes like the vast Grand Operations and the cooperative Combined Arms, or witness human drama set against global combat in the single player War Stories. As you fight in epic, unexpected locations across the globe, enjoy the richest and most immersive Battlefield yet. Now also includes Firestorm – Battle Royale, reimagined for Battlefield.', -- description
        '34.95', -- price
        'images/games/bf5.jpg', -- imageLocation
        '0', -- preOwned
        'https://www.youtube.com/watch?v=fb1MR85XFOc', -- trailerLocation
        'https://www.origin.com/sgp/en-us/store/battlefield/battlefield-v/interstitial', -- purchaseLocation
        '1');   -- creatorID
        
-- DAYZ
INSERT INTO `db1`.`games` (`gameTitle`, `Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `trailerLocation`, `purchaseLocation`, `creatorID`)
VALUES ('DAYZ', -- gameTitle
        'Bohemia Interactive', -- Company
        '2018/12/14', -- releaseDate
        'The post-soviet country of Chernarus is struck by an unknown virus, turning the majority population into frenzied infected. Fighting over resources has bred a hostile mentality among survivors, driving what’s left of humanity to collapse. You are one of the few immune to the virus - how far will you go to survive?', -- description
        '49.99', -- price
        'images/games/dayz.jpg', -- imageLocation
        '0', -- preOwned
        'https://www.youtube.com/watch?v=Z8YxinOKNss', -- trailerLocation
        'https://store.steampowered.com/app/221100/DayZ/', -- purchaseLocation
        '1');   -- creatorID
        
-- Subnautica 
INSERT INTO `db1`.`games` (`gameTitle`, `Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `trailerLocation`, `purchaseLocation`, `creatorID`)
VALUES ('Subnautica ', -- gameTitle
        'Unknown Worlds Entertainment', -- Company
        '2018/01/23', -- releaseDate
        'Subnautica is an underwater adventure game set on an alien ocean planet. A massive, open world full of wonder and peril awaits you! Descend into the depths of an alien underwater world filled with wonder and peril. Craft equipment, pilot submarines and out-smart wildlife to explore lush coral reefs, volcanoes, cave systems, and more - all while trying to survive.', -- description
        '22', -- price
        'images/games/sub.jpg', -- imageLocation
        '1', -- preOwned
        'https://www.youtube.com/watch?v=Rz2SNm8VguE', -- trailerLocation
        'https://store.steampowered.com/app/264710/Subnautica/', -- purchaseLocation
        '1');   -- creatorID
        
-- Dota 2
INSERT INTO `db1`.`games` (`gameTitle`, `Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `trailerLocation`, `purchaseLocation`, `creatorID`)
VALUES ('Dota 2', -- gameTitle
        'Valve', -- Company
        '2013/07/09', -- releaseDate
        "The most-played game on Steam. Every day, millions of players worldwide enter battle as one of over a hundred Dota heroes. And no matter if it's their 10th hour of play or 1,000th, there's always something new to discover. With regular updates that ensure a constant evolution of gameplay, features, and heroes, Dota 2 has truly taken on a life of its own.", -- description
        '10', -- price
        'images/games/dota2.jpg', -- imageLocation
        '0', -- preOwned
        'https://www.youtube.com/watch?v=SmnqsdeHFT0', -- trailerLocation
        'https://store.steampowered.com/app/570/Dota_2/', -- purchaseLocation
        '1');   -- creatorID

-- Stellaris
INSERT INTO `db1`.`games` (`gameTitle`, `Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `trailerLocation`, `purchaseLocation`, `creatorID`)
VALUES ('Stellaris', -- gameTitle
        'Paradox Development Studio', -- Company
        '2016/05/09', -- releaseDate
        'Explore and discover a spectacular and ever-changing universe! Paradox Development Studio, makers of the Europa Universalis and Crusader Kings series, and publishers of the best-selling Cities: Skylines, presents Stellaris, advancing the genre of grand strategy to the very edges of the universe.', -- description
        '39', -- price
        'images/games/stellaris.jpg', -- imageLocation
        '1', -- preOwned
        'https://www.youtube.com/watch?v=zL0kemiI0yc', -- trailerLocation
        'https://store.steampowered.com/app/281990/Stellaris/', -- purchaseLocation
        '1');   -- creatorID
        

        


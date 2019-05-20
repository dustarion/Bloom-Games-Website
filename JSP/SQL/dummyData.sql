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



INSERT INTO `db1`.`games` (`gameTitle`, `Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `trailerLocation`, `purchaseLocation`, `creatorID`)
VALUES ('No Man’s Sky', -- gameTitle
        'Hello Games', -- Company
        '2016/08/13', -- releaseDate
        'test', -- description
        'test', -- price
        'test', -- imageLocation
        'test', -- preOwned
        'test', -- trailerLocation
        'test', -- purchaseLocation
        '1');   -- creatorID

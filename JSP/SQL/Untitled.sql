SELECT * From db1.games;
SELECT * From db1.comments;


SELECT * From db1.game_comment;

SELECT * FROM db1.games WHERE gameID = 20;


SELECT * From db1.users;


INSERT INTO `db1`.`genre` (`genreName`) VALUES ('Adventure');
INSERT INTO `db1`.`genre` (`genreName`) VALUES ('Shooter');
INSERT INTO `db1`.`genre` (`genreName`) VALUES ('Survival');
INSERT INTO `db1`.`genre` (`genreName`) VALUES ('Strategy');
SELECT * From db1.genre;


ALTER TABLE db1.comments
DROP COLUMN comment;
ALTER TABLE db1.comments
ADD comment text;


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
        
        
        
        
-- SearchQuery=test
-- genreID=5
-- PreOwned=PreOwned

SELECT * FROM db1.games; -- 20 21
SELECT * FROM db1.genre; -- 5678
SELECT * FROM db1.game_genre;

-- Substring Search
SELECT * FROM db1.games WHERE (gameTitle LIKE '%No%') AND (preOwned = 1);

SELECT * FROM db1.games WHERE (gameTitle LIKE '%')

-- Select From Genre
SELECT gameID FROM db1.game_genre WHERE (genreID = 5);

-- Compound Searcg
SELECT * FROM db1.games ga
JOIN  db1.game_genre gg ON ga.gameID = gg.gameID
JOIN  db1.genre ge ON gg.genreID = gg.genreID


-- WHERE (
-- 	
-- );



-- SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
-- FROM Ordersgame_genregame_comment
-- INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

SELECT * FROM db1.game_comment
SELECT * FROM db1.comments
        comments
SELECT db1.comments.commenterName, db1.comments.rating, db1.comments.date, db1.comments.comment
FROM db1.comments
JOIN db1.comments ON db1.comments.commentID=db1.game_comment.commentID;
        
        
        
        
        
        
--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
-- @edited by esduh
-- @updated Fall, 2020
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS PlayerProperty;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
ID integer PRIMARY KEY,
time timestamp
);

CREATE TABLE Player (
ID integer PRIMARY KEY,
emailAddress varchar(50) NOT NULL,
name varchar(50)
);

CREATE TABLE PlayerGame (
gameID integer REFERENCES Game(ID),
playerID integer REFERENCES Player(ID),
score integer,
cash integer
);

CREATE TABLE PlayerProperty (
gameID integer REFERENCES Game(ID),
playerID integer REFERENCES Player(ID),
houses integer,
hotels integer
        );

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PlayerProperty TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');
INSERT INTO Game VALUES (4, '2020-10-16 12:30:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');
INSERT INTO Player VALUES (4, 'ehc4@students.calvin.edu', 'esduh');

--Build initial game.
--GAME1
INSERT INTO PlayerGame VALUES (1, 1, 730, 890.00);
INSERT INTO PlayerGame VALUES (1, 2, 500, 1650.00);
INSERT INTO PlayerGame VALUES (1, 3, 600, 2350.00);
INSERT INTO PlayerGame VALUES (1, 4, 500, 2500.00);
--GAME2
INSERT INTO PlayerGame VALUES (2, 1, 500, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 750, 1200.00);
INSERT INTO PlayerGame VALUES (2, 3, 800, 2000.00);
INSERT INTO PlayerGame VALUES (2, 4, 700, 1900.00);
--GAME3
INSERT INTO PlayerGame VALUES (3, 1, 300, 900.00);
INSERT INTO PlayerGame VALUES (3, 2, 650, 1000.00);
INSERT INTO PlayerGame VALUES (3, 3, 1200, 950.00);
INSERT INTO PlayerGame VALUES (3, 4, 800, 2200.00);

--Player Property
--GAME1
INSERT INTO PlayerProperty(gameID, playerID, houses) VALUES (1, 1, 2);
INSERT INTO PlayerProperty(gameID, playerID, houses) VALUES (1, 2, 1);
INSERT INTO PlayerProperty(gameID, playerID, houses) VALUES (1, 3, 2);
INSERT INTO PlayerProperty(gameID, playerID, hotels) VALUES (1, 4, 1);
INSERT INTO PlayerProperty(gameID, playerID, houses) VALUES (2, 1, 4);
INSERT INTO PlayerProperty(gameID, playerID, hotels) VALUES (2, 1, 3);
INSERT INTO PlayerProperty(gameID, playerID, hotels) VALUES (2, 3, 1);  
INSERT INTO PlayerProperty(gameID, playerID, houses) VALUES (2, 2, 2);
INSERT INTO PlayerProperty(gameID, playerID, houses, hotels) VALUES (3, 2, 2, 1);
INSERT INTO PlayerProperty(gameID, playerID, houses) VALUES (3, 4, 4);
INSERT INTO PlayerProperty(gameID, playerID, houses, hotels) VALUES (3, 3, 3, 2);
INSERT INTO PlayerProperty(gameID, playerID, houses) VALUES (3, 1, 4);

--Test Insertions
SELECT COUNT(*) FROM PlayerProperty;
SELECT * FROM PlayerProperty;
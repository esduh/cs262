--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
-- @edited by esduh
-- @updated Fall, 2020
--

----------------------------------------
-- Exercise 8.1: Single-Table Queries --
----------------------------------------

-- Retrieve a list of all the games, ordered by date with the most recent game coming first.
SELECT *
FROM Game
ORDER BY time DESC;

-- Retrieve all the games that occurred in the past week.
SELECT *
FROM Game
WHERE DATE_PART('day', CURRENT_TIMESTAMP - time) < 7
AND DATE_PART('day', CURRENT_TIMESTAMP - time) >= 0;

-- Retrieve a list of players who have (non-NULL) names.
SELECT *
FROM Player
WHERE name IS NOT NULL;

-- Retrieve a list of IDs for players who have some game score larger than 2000.
SELECT PlayerID
FROM PlayerGame
WHERE score > 2000;

-- Retrieve a list of players who have GMail accounts.
SELECT *
FROM Player
WHERE emailAddress LIKE '%gmail%';

------------------------------------------
-- Exercise 8.2: Multiple-Table Queries --
------------------------------------------

-- Retrieve all “The King”’s game scores in decreasing order.
SELECT score
FROM Player, PlayerGame
WHERE Player.ID = PlayerGame.playerID
AND Player.name = 'The King'
ORDER BY score DESC;

-- Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
SELECT name
FROM Player, PlayerGame, Game
WHERE Player.ID = PlayerGame.playerID
AND PlayerGame.gameID = Game.ID
AND time = '2006-06-28 13:20:00';

-- c. So what does that P1.ID < P2.ID clause do in the last example query?

-- The query will return the name of the player that has the higher playerID value.

-- d. The query that joined the Player table to itself seems rather contrived. 
--    Can you think of a realistic situation in which you’d want to join a table to itself?

-- It would be useful for a situation in which a player compares the scores as well as the winning/losing patterns.
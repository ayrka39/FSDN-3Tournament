-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament;


-- a table of players in tournament
CREATE TABLE players(
    id SERIAL  PRIMARY KEY,
    name TEXT
);


-- a table of matches between players in tournament
CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    loser INTEGER REFERENCES players (id),
    winner INTEGER REFERENCES players (id)
);


-- number of matches for each player
CREATE VIEW matchesPlayed AS (
  SELECT players.id, COUNT(matches.id) AS n
    FROM players, matches
    WHERE players.id = matches.loser OR players.id = matches.winner
    GROUP BY players.id
); 


-- number of wins for each player
CREATE VIEW winCount AS (
  SELECT players.id, COUNT(matches.id) AS n
    FROM matches, players
    WHERE players.id = matches.winner
    GROUP BY players.id
);


-- number of wins and matches for each player
CREATE VIEW standings AS (
  SELECT players.id, players.name, 
		 coalesce(winCount.n,0) AS wins, 
		 coalesce(matchesPlayed.n,0) AS matched 
	FROM players 
		LEFT JOIN matchesPlayed 
		ON players.id = matchesPlayed.id
		LEFT JOIN winCount 
		ON winCount.id = players.id
	ORDER BY winCount.n DESC
);

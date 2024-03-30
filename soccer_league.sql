
DROP DATABASE IF EXISTS soccer_db;

CREATE DATABASE soccer_db;

\c soccer_db;

CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(30),
);

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    team_id INT REFERENCES teams (team_id)
);

CREATE TABLE referees (
    referee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30)
);

CREATE TABLE seasons (
    season_id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    winning_team_id INT REFERENCES teams (team_id),
    losing_team_id INT REFERENCES teams (team_id),
    referee_id INT REFERENCES referees (referee_id),
    season_id INT REFERENCES seasons (season_id)
);


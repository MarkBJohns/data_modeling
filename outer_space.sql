-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

--  ==========================================================================================

--  OLD DATABASE

--  ==========================================================================================

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

--  ==========================================================================================

--  NEW DATABASE

--  ==========================================================================================

CREATE TABLE galaxies (
    galaxy_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE stars (
    star_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    galaxy_id INT REFERENCES galaxies (galaxy_id)
);

CREATE TABLE planets (
    planet_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbital_period_in_years FLOAT NOT NULL,
    orbits_around INT REFERENCES stars (star_id),
    galaxy INT REFERENCES galaxies (galaxy_id)
);

CREATE TABLE moons (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbits_around_planet INT REFERENCES planets (planet_id)
);
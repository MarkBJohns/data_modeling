DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE regions (
    region_id SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR (20),
    preferred_region INT REFERENCES regions (region_id)
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    post_text TEXT,
    poster_id INT REFERENCES users (user_id),
    location VARCHAR(50),
    region_id INT REFERENCES regions (region_id),
    category_id INT REFERENCES categories (category_id)
);
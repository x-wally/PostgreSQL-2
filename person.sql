\set QUIET 1
SET client_min_messages = warning;

-- CREATE TABLE
DROP TABLE IF EXISTS person;
CREATE TABLE IF NOT EXISTS person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150), 
    gender VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL
);

\i person_table.sql
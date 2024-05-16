\set QUIET 1
SET client_min_messages = warning;

DROP TABLE IF EXISTS person;
CREATE TABLE IF NOT EXISTS car (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	make VARCHAR(50) NOT NULL,
	model VARCHAR(50) NOT NULL,
	price NUMERIC(19,2) NOT NULL
);

\i car_table.sql
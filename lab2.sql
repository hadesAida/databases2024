CREATE DATABASE lab2;
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255) NOT NULL,
    region_id INTEGER,
    population INTEGER
);
INSERT INTO countries (country_name, region_id, population)
VALUES ('FRANCE', 1, 67000000);

INSERT INTO countries(country_id, country_name)
values (2,'GERMANY');

INSERT INTO countries (country_name, region_id, population)
VALUES ('Italy', NULL, 60000000);

INSERT INTO countries (country_name, region_id, population)
VALUES
    ('Spain', 2, 47000000),
    ('Portugal', 2, 10000000),
    ('Norway', 3, 5400000);

ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (region_id, population)
VALUES (4, 19000000);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new (LIKE countries INCLUDING ALL);
INSERT INTO countries_new
SELECT * FROM countries;

UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;

SELECT country_name, population * 1.10 AS "New Population"
FROM countries;

DELETE FROM countries
WHERE population < 100000;

WITH deleted AS (
    DELETE FROM countries_new
    WHERE country_id IN (SELECT country_id FROM countries)
    RETURNING *
)
SELECT * FROM deleted;

WITH deleted AS (
    DELETE FROM countries
    RETURNING *
)
SELECT * FROM deleted;











CREATE DATABASE lab_1;
--step1
\c lab1;

--step2
-- step6
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

--step3
ALTER TABLE users ADD COLUMN isadmin INT;

--step4
ALTER TABLE users ALTER COLUMN isadmin TYPE BOOLEAN USING isadmin::BOOLEAN;

--step5
ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;
--step7
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    user_id INT
);
SELECT * FROM users;
--step8
DROP TABLE tasks;

\c postgres;
--step9
DROP DATABASE lab_1;
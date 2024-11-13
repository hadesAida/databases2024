CREATE DATABASE lab7;

CREATE INDEX idx_countries_name ON countries (country_name);

CREATE INDEX idx_employees_name_surname ON employees (first_name, last_name);

CREATE UNIQUE INDEX unique_idx_employees_salary ON employees (salary);

CREATE INDEX idx_employees_name_substring ON employees ((substring(first_name from 1 for 4)));

CREATE INDEX idx_departments_budget ON departments (budget);
CREATE INDEX idx_employees_salary_department ON employees (department_id, salary);



CREATE OR REPLACE FUNCTION increase_value(param_value INT)
RETURNS INT AS $$
BEGIN
    RETURN param_value + 10;
END;
$$ LANGUAGE plpgsql;


SELECT increase_value(5);



CREATE OR REPLACE FUNCTION compare_numbers(num1 INT, num2 INT)
RETURNS TEXT AS $$
BEGIN
    IF num1 > num2 THEN
        RETURN 'Greater';
    ELSIF num1 = num2 THEN
        RETURN 'Equal';
    ELSE
        RETURN 'Lesser';
    END IF;
END;
$$ LANGUAGE plpgsql;


SELECT compare_numbers(10, 20);



CREATE OR REPLACE FUNCTION number_series(n INT)
RETURNS TEXT AS $$
DECLARE
    result TEXT := '';
BEGIN
    FOR i IN 1..n LOOP
        result := result || i || CASE WHEN i < n THEN ', ' ELSE '' END;
    END LOOP;
    RETURN result;
END;
$$ LANGUAGE plpgsql;


SELECT number_series(5);



CREATE OR REPLACE FUNCTION find_employee(emp_name TEXT)
RETURNS TABLE(id INT, name TEXT, "position" TEXT, salary NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT id, name, "position", employees.salary::NUMERIC
    FROM employees
    WHERE name = emp_name;
END;
$$ LANGUAGE plpgsql;




SELECT * FROM find_employee('John Doe');




CREATE OR REPLACE FUNCTION list_products(category_name TEXT)
RETURNS TABLE(product_id INT, product_name TEXT, price NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT p.id, p.name, p.price
    FROM products p
    WHERE p.category = category_name;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM list_products('Electronics');



CREATE OR REPLACE FUNCTION calculate_bonus(salary NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
    RETURN salary * 0.10;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION update_salary(emp_id INT)
RETURNS VOID AS $$
DECLARE
    current_salary NUMERIC;
    bonus_amount NUMERIC;
BEGIN

    SELECT salary INTO current_salary
    FROM employees
    WHERE employee_id = emp_id;

    bonus_amount := calculate_bonus(current_salary);


    UPDATE employees
    SET salary = current_salary + bonus_amount
    WHERE employee_id = emp_id;
END;
$$ LANGUAGE plpgsql;


SELECT update_salary(1);



CREATE OR REPLACE FUNCTION complex_calculation(num1 INT, str_input TEXT)
RETURNS TEXT AS $$
DECLARE
    numeric_result INT;
    string_result TEXT;
BEGIN

    numeric_result := num1 * 2;


    string_result := str_input || '_processed';


    RETURN 'Number: ' || numeric_result || ', String: ' || string_result;
END;
$$ LANGUAGE plpgsql;


SELECT complex_calculation(1, 'test');


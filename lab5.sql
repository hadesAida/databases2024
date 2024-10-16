CREATE database lab5;

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS salesmen;
CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT
);

CREATE TABLE orders(
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

);

CREATE TABLE salesmen (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    comission DECIMAL(5,2)
);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);

INSERT INTO salesmen (salesman_id, name, city, comission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'London', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

SELECT SUM(purch_amt) AS total_purchase_amount FROM orders;

SELECT AVG(purch_amt) AS average_purchase_amount FROM orders;

SELECT COUNT(*) AS customer_count FROM customers;

SELECT MIN(purch_amt) AS minimum_purchase_amount FROM orders;

SELECT * FROM customers WHERE cust_name LIKE '%b';

SELECT * FROM orders
WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');

SELECT DISTINCT customers.*FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.purch_amt > 10;

SELECT SUM(grade) AS total_grade FROM customers;

SELECT * FROM customers;

SELECT MAX(grade) AS maximum_grade FROM customers;
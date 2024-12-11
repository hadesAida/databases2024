

DROP TABLE CUSTOMERS,BOOKS,Orders CASCADE;


CREATE DATABASE lab10_online_bookstore;




CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INTEGER NOT NULL
);


CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);


CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    book_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);


INSERT INTO Books (book_id, title, author, price, quantity) VALUES
(1, 'Database 101', 'A. Smith', 40.00, 10),
(2, 'Learn SQL', 'B. Johnson', 35.00, 15),
(3, 'Advanced DB', 'C. Lee', 50.00, 5);


INSERT INTO Customers (customer_id, name, email) VALUES
(101, 'John Doe', 'johndoe@example.com'),
(102, 'Jane Doe', 'janedoe@example.com');


BEGIN;


INSERT INTO Orders (book_id, customer_id, order_date, quantity)
VALUES (1, 101, CURRENT_DATE, 2);


UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;


COMMIT;


BEGIN;

DO $$
BEGIN

    IF (SELECT quantity FROM Books WHERE book_id = 3) < 10 THEN

        RAISE NOTICE 'Insufficient stock for book_id 3. Rolling back transaction.';

        ROLLBACK;
        RETURN;
    END IF;


    INSERT INTO Orders (book_id, customer_id, order_date, quantity)
    VALUES (3, 102, CURRENT_DATE, 10);
END;
$$;



SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN;
UPDATE Books SET price = 45.00 WHERE book_id = 2;


COMMIT;



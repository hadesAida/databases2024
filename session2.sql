SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN;
SELECT price FROM Books WHERE book_id = 2;


SELECT price FROM Books WHERE book_id = 2;


BEGIN;


UPDATE Customers
SET email = 'newemail@example.com'
WHERE customer_id = 101;


COMMIT;

SELECT * FROM Customers WHERE customer_id = 101;
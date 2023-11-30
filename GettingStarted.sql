CREATE DATABASE abc_orders;
USE abc_orders;

SELECT *
FROM orders
LIMIT 5;

/* Change the format of order_date,ship_date columns */
UPDATE orders
SET order_date = STR_TO_DATE(order_date,'%m/%d/%Y'),
     ship_date = STR_TO_DATE(ship_date,'%m/%d/%Y');

/*Change the data type of order_date and ship_date*/
ALTER TABLE orders
MODIFY COLUMN order_date DATE,
MODIFY COLUMN ship_date DATE;

/* check for missing values in orders table.*/
SELECT COUNT(*)
FROM orders
WHERE order_no is NULL;

-- checking for duplicates--
SELECT order_no, COUNT(order_no)
FROM orders
GROUP BY order_no
HAVING COUNT(order_no) > 1;
-- check if its a different products--
SELECT *
FROM orders
WHERE order_no = '5768-2' OR order_no = '6159-2';

SET SQL_SAFE_UPDATES = 1;




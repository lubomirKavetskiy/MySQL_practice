-- select statement
SHOW DATABASES;
USE coffee_store;
SELECT * FROM customers;
SELECT last_name FROM customers;
SELECT last_name, first_name FROM customers;

SELECT * FROM products;
SELECT * FROM products WHERE coffee_origin = 'Columbia';
SELECT * FROM products WHERE price = 3;
SELECT * FROM products WHERE price = 3.5 AND coffee_origin = 'Costa Rica';
SELECT * FROM products WHERE price = 3.2 OR coffee_origin = 'Ethiopia';

SELECT * FROM products WHERE price >= 3.24;
SELECT * FROM products WHERE price > 3.25;
SELECT * FROM products WHERE price <= 3.25;
SELECT * FROM products WHERE price < 3.2;

SELECT * FROM customers;
SELECT * FROM customers WHERE phone_number IS NULL;
SELECT * FROM customers WHERE phone_number IS NOT NULL;

-- Exersise #1
-- 1. From the customers table, select the first name and phone number of all the females
-- who have a last name of Bluth.
SELECT first_name, phone_number FROM customers WHERE gender = 'F' AND last_name = 'Bluth';
-- 2. From the products table, select the name for all products that have a price greater than 3.00
-- or a coffee origin of Sri Lanka.
SELECT name FROM products WHERE price > 3 OR coffee_origin = 'Sri Lanka';
-- 3. How many male customers don’t have a phone number entered into the customers table?
SELECT * FROM customers WHERE gender = 'M' AND phone_number IS NULL;

SELECT * FROM customers;
SELECT * FROM customers WHERE last_name IN ('Bluth', 'sMItH');
SELECT * FROM customers WHERE first_name NOT IN ('Katie', 'John');

SELECT * FROM orders;
SELECT product_id, customer_id, order_time FROM orders WHERE order_time BETWEEN '2017-01-01' AND '2017-01-03';
SELECT product_id, customer_id, order_time FROM orders WHERE customer_id BETWEEN 4 AND 10;
SELECT * FROM customers;
SELECT * FROM customers WHERE last_name BETWEEN 'M' AND 'T';

SELECT * FROM customers;
SELECT * FROM customers WHERE last_name LIKE 'w%';
SELECT * FROM customers WHERE last_name LIKE '%N%';
SELECT * FROM customers WHERE last_name LIKE '_v___';
SELECT * FROM products;
SELECT * FROM products WHERE price LIKE '3.5%';

SELECT * FROM products;
SELECT * FROM products ORDER BY price ASC;
SELECT * FROM products ORDER BY price DESC;
SELECT * FROM customers;
SELECT * FROM customers ORDER BY last_name ASC;
SELECT * FROM customers ORDER BY last_name DESC;
SELECT * FROM orders WHERE customer_id = 1 ORDER BY order_time ASC;
SELECT * FROM orders WHERE customer_id = 2 ORDER BY order_time DESC;

-- Exercise #2
-- 1. From the products table, select the name and price of all products with a coffee origin
-- equal to Colombia or Indonesia. Ordered by name from A-Z.
SELECT name, price FROM products WHERE coffee_origin IN ('Colombia', 'Indonesia') ORDER BY name;
-- 2. From the orders table, select all the orders from February 2017 for customers with
-- id’s of 2, 4, 6 or 8.
SELECT * FROM orders WHERE order_time BETWEEN ('2017-02-01') AND ('2017-02-28') AND customer_id IN (2,4,6,8);
-- 3. From the customers table, select the first name and phone number of all customers
-- who’s last name contains the pattern ‘ar’.
SELECT first_name, phone_number FROM customers WHERE last_name LIKE '%ar%';

SELECT coffee_origin from products;
SELECT DISTINCT coffee_origin from products;
SELECT DISTINCT customer_id from orders WHERE order_time BETWEEN '2017-02-01' AND '2017-02-28';
SELECT DISTINCT customer_id, product_id from orders WHERE order_time BETWEEN '2017-02-01' AND '2017-02-28';

SELECT * FROM customers;
SELECT * FROM customers LIMIT 5 OFFSET 12;
SELECT * FROM customers ORDER BY last_name LIMIT 3;

SELECT name AS coffee from products;

-- Exercise #3
-- 1. From the customers table, select distinct last names and order alphabetically from A-Z.
SELECT DISTINCT last_name FROM customers ORDER BY last_name;
-- 2. From the orders table, select the first 3 orders placed by customer with id 1, in February 2017.
SELECT * FROM orders WHERE customer_id = 1 AND order_time BETWEEN '2017-02-01' AND '2017-02-28' ORDER BY order_time LIMIT 3;
-- 3. From the products table, select the name, price and coffee origin but rename the price to
-- retail_price in the results set.
SELECT name, price AS retail_price, coffee_origin FROM products;

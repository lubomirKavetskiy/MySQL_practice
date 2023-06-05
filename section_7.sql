-- INNER JOIN
USE coffee_store;
SHOW TABLES;
SELECT* FROM products;
SELECT * FROM orders;
SELECT * FROM customers;

SELECT products.name, orders.order_time FROM orders INNER JOIN products ON orders.product_id = products.id;
SELECT p.name, o.order_time FROM orders o JOIN products p ON o.product_id=p.id;

SELECT p.name, p.price, o.order_time FROM orders o JOIN products p ON o.product_id=p.id WHERE o.product_id = 5 ORDER BY o.order_time;

-- diff between INNER and LEFT join:
-- inner
SELECT o.id, c.phone_number, c.last_name, o.order_time FROM orders o
JOIN customers c ON o.customer_id = c.id
LIMIT 5;
-- left
SELECT o.id, c.phone_number, c.last_name, o.order_time FROM orders o
LEFT JOIN customers c ON o.customer_id = c.id
LIMIT 5;

-- LEFT JOIN
UPDATE orders SET customer_id = NULL WHERE id = 1;

SELECT o.id, c.phone_number, c.last_name, o.order_time FROM orders o
LEFT JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_time
LIMIT 10;
-- opposite
SELECT o.id, c.phone_number, c.last_name, o.order_time FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
ORDER BY o.order_time
LIMIT 10;

-- RIGHT JOIN
SELECT o.id, c.phone_number, c.last_name, o.order_time FROM customers c
RIGHT JOIN orders o ON c.id = o.customer_id
ORDER BY o.order_time
LIMIT 10;
-- opposite
SELECT * FROM orders;
SELECT o.id, c.phone_number, c.last_name, o.order_time FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_time
LIMIT 10;

UPDATE orders SET customer_id = 1 WHERE id = 1;

-- JOINING more than 2 tables;
SELECT* FROM products;
SELECT * FROM orders;
SELECT * FROM customers;

SELECT p.name, p.price, c.first_name, c.last_name, o.order_time FROM products p
JOIN orders o ON p.id = o.product_id
JOIN customers c ON c.id = o.customer_id
WHERE c.last_name = 'Martin'
ORDER BY o.order_time
LIMIT 5;

-- Exercise #1
SELECT o.id, c.phone_number FROM orders o
JOIN customers c ON o.customer_id = c.id
WHERE o.product_id = 4;

SELECT p.name, o.order_time FROM products p
JOIN orders o ON p.id = o.product_id
WHERE p.name = 'Filter'
AND o.order_time BETWEEN '2017-01-15' AND '2017-02-14';

SELECT p.name, p.price, o.order_time FROM products p
JOIN orders o ON p.id = o.product_id
JOIN customers c ON o.customer_id = c.id
WHERE c.gender = "F" AND o.order_time BETWEEN '2017-01-01' AND '2017-01-31';

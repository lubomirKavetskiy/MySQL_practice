USE cinema_booking_system;

-- COUNT function
SELECT * FROM customers;

SELECT COUNT(*) FROM customers;

SELECT COUNT(first_name) FROM customers;

SELECT COUNT(last_name) FROM customers;

SELECT COUNT(*) FROM customers
WHERE last_name="Smith";

SELECT COUNT(*) FROM customers
WHERE first_name IS NULL;

-- SUM function
SELECT * FROM rooms;

SELECT SUM(no_seats) FROM rooms;

SELECT SUM(no_seats) FROM rooms
WHERE id > 1;

-- MIN and MAX functions
SELECT * FROM	 films;

SELECT MAX(length_min) FROM films;

SELECT MIN(length_min) FROM films;

-- AVARAGE function
SELECT * FROM	 films;

SELECT AVG(length_min) FROM films;

SELECT AVG(length_min) FROM films
WHERE length_min > 120;

-- EXERCISE #1
-- 1. How many bookings did customer id 10 make in October 2017.
SELECT COUNT(*) FROM screenings s JOIN bookings b ON b.screening_id=s.id WHERE b.customer_id = 10 AND s.start_time BETWEEN '2017-10-01' AND '2017-10-31';

SELECT COUNT(*) FROM bookings
WHERE customer_id = 10;

-- 2. Count the number of screenings for Blade Runner 2049 in October 2017. v
SELECT COUNT(*) FROM screenings s JOIN films f ON s.film_id = f.id WHERE f.name = "Blade Runner 2049" AND s.start_time BETWEEN '2017-10-01' AND '2017-10-31';

-- 3. Count the number of unique customers who made a booking for October 2017.
SELECT COUNT(DISTINCT customer_id) from bookings;

-- Gropping data
SELECT * FROM bookings;

SELECT COUNT(id) FROM bookings;

SELECT customer_id, COUNT(id) FROM bookings
GROUP BY customer_id;

SELECT customer_id, screening_id, COUNT(id) FROM bookings
GROUP BY customer_id, screening_id ORDER BY customer_id;

SELECT f.name, s.start_time, c.first_name, c.last_name, COUNT(b.id) FROM films f
JOIN screenings s ON s.film_id = f.id
JOIN bookings b ON s.id = b.screening_id
JOIN customers c ON b.customer_id = c.id
GROUP BY f.name, s.start_time, c.first_name, c.last_name
ORDER BY s.start_time;

-- Having
SELECT customer_id, screening_id, COUNT(id) FROM bookings
GROUP BY customer_id, screening_id
HAVING customer_id = 10
ORDER BY customer_id;

-- Exercise #2
-- 1. Select the customer id and count the number of reserved seats grouped by customer for October 2017.
SELECT b.customer_id, COUNT(r_s.id) FROM bookings b
JOIN reserved_seats r_s ON r_s.booking_id = b.id
GROUP BY b.customer_id;

-- 2. Select the film name and count the number of screenings for each film that is over 2 hours long.
SELECT f.name, f.length_min, COUNT(s.id) FROM films f
JOIN screenings s ON s.film_id = f.id
GROUP BY f.name, f.length_min
HAVING f.length_min > 120;

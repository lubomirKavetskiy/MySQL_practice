
USE cinema_booking_system;

SELECT * FROM films;
SELECT * FROM customers;
SELECT * FROM rooms;
SELECT * FROM screenings;
SELECT * FROM seats;
SELECT * FROM bookings;
SELECT * FROM reserved_seats;

-- NON-CORRELATED Subqueries
-- Inner query will execute firstly and based on it will apply Auto query

SELECT id, start_time FROM screenings
WHERE film_id IN
	(SELECT id FROM films
  WHERE length_min > 120);

  SELECT first_name, last_name, email FROM customers
  WHERE id IN
		(SELECT customer_id FROM bookings
    WHERE screening_id = 1);

  SELECT AVG(no_seats), MAX(no_seats) FROM
		(SELECT booking_id, COUNT(seat_id) AS no_seats FROM reserved_seats
		GROUP BY booking_id) b;

-- CORRELATED Subqueries
-- Inner query will execute after Auto query and will apply for every row of Auto
-- it runs multiple times (for every row of Auto result having link on it)
SELECT screening_id, customer_id,
	(SELECT COUNT(seat_id)
	FROM reserved_seats WHERE booking_id = b.id)
FROM bookings b
ORDER BY screening_id;

-- Exerccise #1
-- 1. Select the film name and length for all films with a length greater than the average film length.
SELECT name, length_min FROM films
WHERE length_min >
 (SELECT AVG(length_min) FROM films);

-- 2. Select the maximum number and the minimum number of screenings for a particular film.
SELECT MAX(number_screenings), MIN(number_screenings) FROM
	(SELECT film_id, COUNT(id) AS number_screenings FROM screenings
	GROUP BY film_id) b;

-- 3. Select each film name and the number of screenings for that film.
SELECT name,
	(SELECT COUNT(id) FROM screenings
  WHERE film_id = f.id)
FROM films f;

-- Challenge #1
-- Which films are over 2 hours long?
SELECT name FROM films
WHERE length_min > 120;

-- Challenge #2
-- Which film had the most screenings in October 2017
SELECT f.name, COUNT(s.film_id) AS showings FROM screenings s
JOIN films f ON f.id = s.film_id
GROUP BY film_id
ORDER BY showings DESC
LIMIT 1;

-- Challenge #3
-- How many bookings did the film ‘Jigsaw’ have in October 2017
SELECT COUNT(*) FROM bookings
WHERE screening_id IN
	(SELECT id FROM screenings WHERE film_id IN
		(SELECT id FROM films WHERE name = 'Jigsaw')
	);

-- Challenge #4
-- Which 5 customers made the most bookings in October 2017
SELECT c.last_name, COUNT(b.id) AS num_bookings FROM bookings b
JOIN customers c ON c.id = b.customer_id
GROUP BY c.last_name
ORDER BY num_bookings DESC
LIMIT 5;

-- Challenge #5
-- Which film was shown in the Chaplin room most often in October 2017
-- option A
SELECT f.name, COUNT(s.id) AS numb_screenings FROM screenings s
JOIN films f ON f.id = s.film_id
WHERE room_id IN (SELECT id FROM rooms WHERE name = 'Chaplin')
GROUP BY film_id
ORDER BY numb_screenings DESC
LIMIT 1;

-- option B
SELECT f.name, COUNT(r.name) AS numb_screenings FROM films f
JOIN screenings s ON f.id = s.film_id
JOIN rooms r ON r.id = s.room_id
WHERE r.name = 'Chaplin'
GROUP BY f.name
ORDER BY numb_screenings DESC
LIMIT 1;

-- Challenge #6
-- How many of the customers made a booking in October 2017
-- option A
SELECT COUNT(DISTINCT(customer_id)) AS numb_customers FROM bookings;

-- option B
SELECT COUNT(c_id) FROM
	(SELECT customer_id as c_id, COUNT(id) FROM bookings
	GROUP BY customer_id) b;

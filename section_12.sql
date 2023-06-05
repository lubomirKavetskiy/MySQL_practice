-- CONCATENATE
SELECT CONCAT(first_name, " ", last_name) FROM customers;

SELECT CONCAT(id, " ", last_name, " ", email) as full_name FROM customers;

SELECT CONCAT("It's ", last_name, "'s email: ", email) as customers_email FROM customers;

-- SUBSTRINGS
SELECT substring("Example", 3, 3) AS sub;

SELECT substring(name, 1, 3) AS short_name FROM films;

SELECT substring(name, -3, 3) AS short_name FROM films;

-- UPPER LOWER CASE
SELECT upper(name) AS upper_name FROM rooms;

SELECT lower(name) as lower_name FROM rooms;

-- EXERCISE #1
-- Concatenate the film names and length from the films table.
SELECT concat(name, ": ", length_min) as film_info FROM films;

-- Extract the customers email from the 5th character onwards.
SELECT substring(email, 5) as result FROM customers;

-- Select the customers first name in lower case and their last name in upper case for each customer with a last name of ‘Smith’.
SELECT lower(first_name) as lower_f_name, upper(last_name) as upper_l_name FROM customers
WHERE last_name = "Smith";

-- Select the last 3 letters of each film name from the films table.
SELECT substr(name, -3) as result from films;

-- Concatenate the first three letters in the first_name and last_name columns together from the customers table.
SELECT concat(substr(first_name, 1, 3), " ", substr(last_name, 1, 3)) as result from customers;

-- DATE function
SELECT DATE('2018-06-05 07:23:12');

SELECT DATE(start_time) FROM screenings;

SELECT * FROM screenings
WHERE DATE(start_time) = '2017-10-03';

SELECT * FROM screenings
WHERE DATE(start_time) BETWEEN '2017-10-03' AND '2017-10-05';

-- MOUNTH function
SELECT month('2022-01-31 02:12:59');

SELECT month(start_time) FROM screenings;

SELECT * FROM screenings
WHERE month(start_time) = '10';

-- YEAR function
SELECT year('2012-12-31');

SELECT year(start_time) FROM screenings;

SELECT * FROM screenings
WHERE year(start_time) = '2017';

-- EXERCISE #2
-- Select the film id and start time from the screenings table for the date of 20th of October 2017.
SELECT film_id, start_time FROM screenings
WHERE DATE(start_time) = '2017-10-20';

-- Select all the data from the screenings table for the start time between the 6th and 13th of October 2017.
SELECT * FROM screenings
WHERE DATE(start_time) BETWEEN '2017-10-06' AND '2017-10-13';

-- Select all the data from the screenings table for October 2017.
SELECT * FROM screenings
WHERE month(start_time) = '10' AND year(start_time) = '2017';

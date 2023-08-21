1 ---------------
SELECT *
FROM customer
WHERE customer_id = 20;	
2 ---------------
SELECT *
FROM customer
WHERE customer_id BETWEEN 20 and 60;
3 ---------------
SELECT *
FROM customer
WHERE first_name LIKE "L%";
4 ---------------
SELECT *
FROM customer
WHERE first_name LIKE ("%L%");
5 ---------------
SELECT *
FROM customer
WHERE first_name LIKE ("%L");
6 ---------------
SELECT *
FROM customer
WHERE last_name LIKE ("C%")
ORDER BY create_date DESC;
7 ---------------
SELECT *
FROM customer
WHERE last_name LIKE ("%NN%")
ORDER BY create_date
LIMIT 5;
8 ---------------
SELECT customer_id, first_name, last_name, email
FROM customer
WHERE customer_id IN (515, 181, 582, 503, 29, 85);
9 ---------------
SELECT first_name, last_name, email AS email_address, store_id 
FROM customer
WHERE store_id = 2;
10 --------------
SELECT first_name, last_name, email
FROM customer
ORDER BY email DESC;
11 --------------
SELECT customer_id, first_name, last_name, email
FROM customer
ORDER BY create_date;
12 --------------
SELECT email, length(email) AS email_length
FROM customer
ORDER BY email_length DESC;
13 --------------
SELECT email, length(email) AS email_length
FROM customer
ORDER BY email_length
LIMIT 100;
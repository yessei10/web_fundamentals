1 -----------------------
SELECT *
FROM customer;
2 -----------------------
SELECT CONCAT(first_name, " ", last_name) AS customer_name, address.address
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id;
3 -----------------------
SELECT CONCAT(first_name, " ", last_name) AS customer_name, address.address, city.city
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id;
4 -----------------------
SELECT CONCAT(first_name, " ", last_name) AS customer_name, address.address, city.city, country.country
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id;
5 -----------------------
SELECT CONCAT(first_name, " ", last_name) AS customer_name, address.address, city.city, country.country
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id
WHERE country = "Bolivia"
6 -----------------------
SELECT CONCAT(first_name, " ", last_name) AS customer_name, address.address, city.city, country.country
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id
WHERE country IN ("Bolivia", "Germany", "Greece")
7 -----------------------
SELECT CONCAT(first_name, " ", last_name) AS customer_name, address.address, city.city, country.country
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id
WHERE city = "baku";
8 -----------------------
SELECT CONCAT(first_name, " ", last_name) AS customer_name, address.address, city.city, country.country
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id
WHERE city IN ("baku", "beira", "bergamo");
9 -----------------------
SELECT CONCAT(first_name, " ", last_name) AS customer_name, country.country, length(country.country) AS country_name_length
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id
WHERE length(country.country) < 5
ORDER BY length(CONCAT(first_name, " ", last_name)) DESC;
10 -----------------------
SELECT CONCAT(first_name, " ", last_name) AS customer_name, country.country, city.city, length(city.city) AS city_name_length
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id
WHERE length(city.city) > 10
ORDER BY country;
11 -----------------------
SELECT CONCAT(first_name, " ", last_name) AS customer_name, city.city
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
WHERE city.city LIKE '%ba%';
12 -----------------------
SELECT CONCAT(first_name, " ", last_name) AS customer_name, city.city, length(city.city) AS city_name_length
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
ORDER BY length(city.city) DESC;
13 -----------------------
SELECT CONCAT(first_name, " ", last_name) AS customer_name, city.city, country.country, length(city.city) AS city_name_length, length(country.country) AS country_name_length
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id
WHERE length(country.country) > length(city.city);
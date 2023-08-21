1. How many customers are there for each country?  Have your result display the full country name and the number of customers for each country.
SELECT country.country, COUNT(customer.customer_id) AS total_number_of_customer
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id
GROUP BY country.country
ORDER BY country.country;

2. How many customers are there for each city? Have your result display the full city name, the full country name, as 
well as the number of customers for each city.
SELECT country.country, city.city, COUNT(customer.customer_id) AS number_of_customer_each_city
FROM country
LEFT JOIN city
ON country.country_id = city.country_id
LEFT JOIN address
ON city.city_id = address.city_id
LEFT JOIN customer
ON address.address_id = customer.address_id
GROUP BY city.city
ORDER BY number_of_customer_each_city DESC;

1. Retrieve both the average rental amount, the total rental amount, as well as the total number of transactions for 
each month of each year
SELECT
	CONCAT(
		CASE 
			WHEN MONTH(payment_date) = 1 THEN 'January'
			WHEN MONTH(payment_date) = 2 THEN 'February'
			WHEN MONTH(payment_date) = 3 THEN 'March'
			WHEN MONTH(payment_date) = 4 THEN 'April'
			WHEN MONTH(payment_date) = 5 THEN 'May'
			WHEN MONTH(payment_date) = 6 THEN 'June'
			WHEN MONTH(payment_date) = 7 THEN 'July'
			WHEN MONTH(payment_date) = 8 THEN 'August'
			WHEN MONTH(payment_date) = 9 THEN 'September'
			WHEN MONTH(payment_date) = 10 THEN 'October'
			WHEN MONTH(payment_date) = 11 THEN 'November'
			WHEN MONTH(payment_date) = 12 THEN 'December'
			ELSE 'Invalid month'
		  END,
          '-',
          YEAR(payment_date)
		) AS month_and_year,
        SUM(payment.amount) AS total_rental_amount,
        COUNT(payment.payment_id) AS total_transactions,
        AVG(payment.amount) AS average_rental_amount
FROM payment
GROUP BY month_and_year;

2. Your manager comes and asks you to pull payment report based on the hour of the day. The managers wants to 
know which hour the company earns the most money/payment. Have your sql query generate the top 10 hours of 
the day with the most sales. Have the first row of your result be the hour with the most payments received.

SELECT DATE_FORMAT(payment_date, '%h %p') AS hour_of_the_day, SUM(payment.amount) AS total_payments_received
FROM payment
GROUP BY hour_of_the_day
ORDER BY total_payments_received DESC
LIMIT 10;
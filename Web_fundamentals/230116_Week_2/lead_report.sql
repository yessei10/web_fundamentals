1. What query would you run to get all the sites that client=15 owns?
SELECT domain_name, client_id
FROM sites
WHERE client_id = 15;

2. What query would you run to get total count of domain created for June 2011?
SELECT DATE_FORMAT(created_datetime, '%M') AS month, count(domain_name) AS total_count
FROM sites
WHERE DATE_FORMAT(created_datetime, '%M %Y') = 'June 2011';

3. What query would you run to get the total revenue for the date November 19th 2012?
SELECT DATE(billing.charged_datetime) AS date, SUM(billing.amount) AS revenue
FROM billing
WHERE DATE(billing.charged_datetime) = '2012-11-19';

4. What query would you run to get total revenue earned monthly each year for the client with an id of 1?
SELECT billing.client_id, SUM(billing.amount) AS total_revenue, DATE_FORMAT(charged_datetime, '%M') AS month, DATE_FORMAT(charged_datetime, '%Y') AS year
FROM billing
WHERE billing.client_id = 1
GROUP BY month;
5. What query would you run to get total revenue of each client every month per year? Order it by client id.
SELECT CONCAT(clients.first_name, ' ',clients.last_name) AS client_name, billing.amount AS total_revenue, DATE_FORMAT(billing.charged_datetime, '%M') AS month, DATE_FORMAT(billing.charged_datetime, '%Y') AS year
FROM clients
LEFT JOIN billing
ON clients.client_id = billing.client_id
GROUP BY month
ORDER BY clients.client_id, billing.charged_datetime;

6. What query would you run to get which sites generated leads between March 15, 2011 to April 15, 2011? Show how many leads for each site. 
SELECT sites.domain_name AS website, COUNT(leads.leads_id) AS number_of_leads
FROM sites
LEFT JOIN leads
ON sites.site_id = leads.site_id
WHERE DATE(leads.registered_datetime) BETWEEN '2011-03-15' AND '2011-04-15'
GROUP BY website;


7. What query would you run to show all the site owners, the site name(s), and the total number of leads generated from each site for all time?
SELECT CONCAT(clients.first_name,' ', clients.last_name) AS client_name, sites.domain_name, COUNT(leads.leads_id) AS num_leads
FROM clients
LEFT JOIN sites
ON clients.client_id = sites.client_id
LEFT JOIN leads
ON sites.site_id = leads.site_id
GROUP BY sites.domain_name
ORDER BY clients.client_id, sites.domain_name;

8. What query would you run to get a list of site owners who had leads, and the total of each for the whole 2012?
SELECT CONCAT(clients.first_name,' ', clients.last_name) AS client_name, COUNT(leads.leads_id) AS num_leads
FROM clients
LEFT JOIN sites
ON clients.client_id = sites.client_id
LEFT JOIN leads
ON sites.site_id = leads.site_id
WHERE DATE_FORMAT(leads.registered_datetime, '%Y') = 2012
GROUP BY client_name
ORDER BY clients.client_id

9. What query would you run to get a list of site owners and the total # of leads we've generated for each owner per month for the first half of Year 2012?
SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, COUNT(leads.leads_id) AS num_leads, MONTHNAME(leads.registered_datetime) AS date
FROM clients
LEFT JOIN sites
ON clients.client_id = sites.client_id
LEFT JOIN leads
ON sites.site_id = leads.site_id
WHERE leads.registered_datetime BETWEEN '2012-01-01 00:00:00' AND '2012-06-30 23:59:59'
GROUP BY client_name, date
ORDER BY leads.registered_datetime

10. Write a single query that retrieves all the site names that each client owns and its total count. Group the results so that each row shows a new client. (Tip: use GROUP_CONCAT)
SELECT CONCAT(clients.first_name, ' ',clients.last_name) AS client_name, COUNT(sites.domain_name) AS number_of_sites, GROUP_CONCAT(sites.domain_name SEPARATOR ', ') AS sites
FROM clients
LEFT JOIN sites
ON clients.client_id = sites.client_id
GROUP BY client_name
ORDER BY clients.client_id
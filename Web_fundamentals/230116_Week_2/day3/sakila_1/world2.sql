1 -----------------------
SELECT country.continent, COUNT(*) AS total_countries, AVG(country.lifeexpectancy)
FROM country
WHERE country.lifeexpectancy > 70
GROUP BY country.continent;
2 -----------------------
SELECT country.continent, COUNT(*) AS total_countries, country.lifeexpectancy
FROM country
WHERE country.lifeexpectancy BETWEEN 60 AND 70
GROUP BY country.continent;
3 -----------------------
SELECT country.name, country.lifeexpectancy
FROM country
WHERE country.lifeexpectancy > 75;
4 -----------------------
SELECT country.name, country.lifeexpectancy
FROM country
WHERE country.lifeexpectancy < 40;
5 -----------------------
SELECT country.name, country.population
FROM country
ORDER BY country.population DESC
LIMIT 10;
6 -----------------------
SELECT SUM(country.population) AS total_population
FROM country;
7 -----------------------
SELECT country.continent, SUM(country.population) AS total_population
FROM country
GROUP BY country.continent
HAVING SUM(country.population) > 500000000;
8 -----------------------
SELECT country.continent, COUNT(*) AS country, SUM(country.population) AS total_population, AVG(country.lifeexpectancy) AS life_expectancy
FROM country
GROUP BY country.continent
HAVING AVG(country.lifeexpectancy) < 71;
1 -----------------------
SELECT country.name AS country, COUNT(city.name) AS number_of_cities
FROM country
LEFT JOIN city
ON country.code = city.countrycode
GROUP BY country.name;
2 -----------------------
SELECT country.name, countrylanguage.language, COUNT(countrylanguage.language)
FROM country
LEFT JOIN countrylanguage
ON 	country.code = countrylanguage.countrycode
GROUP BY countrylanguage.language;
3 -----------------------
SELECT countrylanguage.language, COUNT(country.name) AS total_countries, countrylanguage.isofficial
FROM countrylanguage
LEFT JOIN country
ON countrylanguage.countrycode = country.code
WHERE countrylanguage.isofficial = "T"
GROUP BY countrylanguage.language;
4 -----------------------
SELECT country.continent, COUNT(city.name) AS total_cities, AVG(city.population) AS average_cities_population
FROM country
LEFT JOIN city
ON country.code = city.countrycode
GROUP BY country.continent;
5 -----------------------
SELECT countrylanguage.language, SUM(country.population * countrylanguage.percentage / 100) AS SumOfSpeakers 
FROM countrylanguage
LEFT JOIN country
ON countrylanguage.countrycode = country.code
GROUP BY countrylanguage.language
ORDER BY SUM(country.population) DESC;
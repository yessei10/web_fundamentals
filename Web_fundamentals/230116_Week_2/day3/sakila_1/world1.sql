1 -----------------------
SELECT *
FROM country
WHERE continent = "Europe";
2 -----------------------
SELECT *
FROM country
WHERE continent IN ("North America", "Africa");
3 -----------------------
SELECT country.code AS country_code, country.name AS country_name, country.continent, country.population AS country_population, city.name AS city
FROM country
LEFT JOIN city
ON country.code = city.countrycode
WHERE country.population > 100000000;
4 -----------------------
SELECT country.name AS country, countrylanguage.language
FROM country
LEFT JOIN countrylanguage
ON country.code = countrylanguage.countrycode
WHERE language = "Spanish";
5 -----------------------
SELECT country.name AS country, countrylanguage.language, countrylanguage.IsOfficial
FROM country
LEFT JOIN countrylanguage
ON country.code = countrylanguage.countrycode
WHERE countrylanguage.language = "Spanish" AND countrylanguage.IsOfficial = "T";
6 -----------------------
SELECT country.name AS country, countrylanguage.language
FROM country
LEFT JOIN countrylanguage
ON country.code = countrylanguage.countrycode
WHERE (countrylanguage.language = "Spanish" OR countrylanguage.language = "English") AND countrylanguage.IsOfficial = "T";
7 -----------------------
SELECT country.name AS country, countrylanguage.language, countrylanguage.percentage, countrylanguage.isOfficial
FROM country
LEFT JOIN countrylanguage
ON country.code = countrylanguage.countrycode
WHERE (countrylanguage.language = "Arabic" AND countrylanguage.percentage > 30) AND NOT countrylanguage.isOfficial = "T";
8 -----------------------
SELECT country.name AS country, countrylanguage.language, countrylanguage.isOfficial, countrylanguage.percentage
FROM country
LEFT JOIN countrylanguage
ON country.code = countrylanguage.countrycode
WHERE countrylanguage.language = "French" AND countrylanguage.isOfficial = "T" AND countrylanguage.percentage < 50;
9 -----------------------
SELECT country.name AS country, countrylanguage.language, countrylanguage.isOfficial
FROM country
LEFT JOIN countrylanguage
ON country.code = countrylanguage.countrycode
WHERE isOfficial = "T"
ORDER BY countrylanguage.language;
10 -----------------------
SELECT country.name AS country, city.name AS city, countrylanguage.language, countrylanguage.isOfficial
FROM country
LEFT JOIN city
ON country.code = city.countrycode
LEFT JOIN countrylanguage
ON country.code = countrylanguage.countrycode
WHERE countrylanguage.isOfficial = "T"
ORDER BY city.population DESC
LIMIT 100;
11 -----------------------
SELECT country.name AS country, country.lifeexpectancy, city.name AS city, city.population
FROM country
LEFT JOIN city
ON country.code = city.countrycode
WHERE country.lifeexpectancy < 40
ORDER BY city.population DESC
LIMIT 100;
12 -----------------------
SELECT country.name AS country, city.name AS city, country.lifeexpectancy
FROM country
LEFT JOIN city
ON country.code = city.countrycode
LEFT JOIN countrylanguage
ON country.code = countrylanguage.countrycode
WHERE countrylanguage.language = "English"
ORDER BY country.lifeexpectancy DESC
LIMIT 100;
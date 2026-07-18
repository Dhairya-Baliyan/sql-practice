/*Query the total population of all cities in CITY where District is California.*/
SELECT SUM(population)
FROM city
WHERE district = "California";


/*Query the average population of all cities in CITY where District is California.*/
SELECT AVG(population)
FROM city
WHERE district = "California";


/*Query the average population for all cities in CITY, rounded down to the nearest integer.*/
SELECT FLOOR(AVG(population))as avg_population
FROM city;


/*Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.*/
SELECT SUM(population)
FROM city
WHERE countrycode = 'JPN';


/*Query the difference between the maximum and minimum populations in CITY.*/
SELECT 
    MAX(population) - MIN(population) as difference
FROM city;


/*Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  
key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (
using salaries with any zeros removed), 
and the actual average salary.

Write a query calculating the amount of error (i.e.:actual - miscalculated average monthly salaries), and round it up to the next integer.*/
SELECT 
    CEIL(AVG(salary) - AVG(REPLACE(salary, '0', '')))
FROM employees;


/*We define an employee's total earnings to be their monthly salary x months  worked, 
and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
Then print these values as 2 space-separated integers.*/
SELECT 
    months * salary as earnings,
    COUNT(employee_id)
FROM employee
GROUP BY earnings
ORDER BY earnings desc
LIMIT 1;


/*Query the following two values from the STATION table:

The sum of all values in LAT_N rounded to a scale of 2 decimal places.
The sum of all va
*/
SELECT 
    ROUND(SUM(lat_n), 2) as lat,
    ROUND(SUM(long_w), 2) as lon
FROM station;


/*Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 135.2345. 
Truncate your answer to 4 decimal places.*/
SELECT 
    TRUNCATE(SUM(lat_n), 4) as lat_sum
FROM station
WHERE lat_n BETWEEN 38.7880 AND 135.2345;


/*Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. 
Round your answer to 4 decimal places.*/
SELECT 
    ROUND(long_w, 4) as western_longitude
FROM station
WHERE lat_n < 137.2345
ORDER BY lat_n DESC
LIMIT 1;


/*Query the smallest Northern Latitude (LAT_N) from STATION that is greater than . Round your answer to 38.7780 decimal places.*/
SELECT 
    ROUND(MIN(lat_n), 4)
FROM station
WHERE lat_n > 38.7780;


/*Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. 
Round your answer to 4 decimal places.*/
SELECT 
    ROUND(long_w, 4) as western_longitude
FROM station
WHERE lat_n > 38.7780
ORDER BY lat_n ASC
LIMIT 1;


/*Consider P1(a, b) and P2(c, d) to be two points on a 2D plane.

-->a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
-->b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
-->c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
-->d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.*/
SELECT 
    ROUND(MAX(lat_n) - MIN(lat_n) + MAX(long_w) - MIN(long_w), 4) AS manhattan_distance
FROM station;


/*Consider P1(a, b) and P2(c, d) to be two points on a 2D plane where (a, b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and  
(c, d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.*/
SELECT
    TRUNCATE(SQRT(POWER(MAX(lat_n)- MIN(lat_n), 2) + POWER(MAX(long_w)- MIN(long_w), 2)), 4)
FROM station;


/*A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.*/
WITH Rankedstations AS (
    SELECT 
        lat_n,
        ROW_NUMBER() OVER (ORDER BY lat_n ASC) as row_num,
        COUNT(*) OVER () as total_count
    FROM station
)
SELECT 
    ROUND(AVG(lat_n), 4)
FROM Rankedstations
WHERE row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));
/*Query all columns for all American cities in the 
CITY table with populations larger than 100000. 
The CountryCode for America is USA.*/
select *
from city
where population > 100000;

/*Query the NAME field for all American cities in the
CITY table with populations larger than 120000. 
The CountryCode for America is USA.*/
select name s
from city
where population > 120000;

/*Query all columns for a CITY with ID 1661.*/
select *
from city 
where id = 1661;

/*Query all attributes of every Japanese city in the CITY table. 
The COUNTRYCODE for Japan is JPN.*/
select * 
from city
where countrycode = "JPN";

/*Query the names of all the Japanese cities in the CITY table. 
The COUNTRYCODE for Japan is JPN. */
select names
from city
where countrycode = "JPN";

/*Query a list of CITY and STATE from th STATION table*/
select city, state 
from station;

/*Query a list of CITY names from STATION for cities that have an even ID number. 
Print the results in any order, but exclude duplicates from the answer.*/
select distinct city
from station 
where id % 2 = 0;

/*Find the difference between the total number of CITY entries in the table and 
the number of distinct CITY entries in the table.*/
select count(city) - count(distinct city)
from station;

/*Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
Your result cannot contain duplicates.*/
select distinct city
from station 
where lower(substring(city, 1, 1) in ('a', 'e', 'i', 'o', 'u'));
/*Can also be solved using LIKE clause --> like 'a%' and the OR clause*/

/*Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
Your result cannot contain duplicates.*/
select city
from station
where lower(substring(city, -1, 1) in ('a', 'e', 'i', 'o', 'u'));
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

/*Query the list of CITY names from STATION which have vowels 
(i.e., a, e, i, o, and u) as both their first and last characters. 
Your result cannot contain duplicates.*/
select distinct city
from station 
where lower(substring(city, 1, 1) in ('a', 'e', 'i', 'o', 'u'))
    AND lower(substring(city, -1, 1) in ('a', 'e', 'i', 'o', 'u'));

/*Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.*/
select distinct city
from station 
where lower(substr(city, 1, 1) not in ('a', 'e', 'i', 'o', 'u'));

/*Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.*/
select distinct city
from station 
where lower(substr(city, -1, 1) not in ('a', 'e', 'i', 'o', 'u'));

/*Query the list of CITY names from STATION that either do not 
start with vowels or do not end with vowels. Your result cannot contain duplicates.*/
select distinct city 
from station 
where lower(substr(city, 1, 1) not in ('a', 'e', 'i', 'o', 'u'))
    or lower(substr(city, -1, 1) not in ('a', 'e', 'i', 'o', 'u'));

/*Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. 
Your result cannot contain duplicates.*/
select distinct city 
from station 
where lower(substr(city, 1, 1) not in ('a', 'e', 'i', 'o', 'u'))
    and lower(substr(city, -1, 1) not in ('a', 'e', 'i', 'o', 'u'));

/*Query the Name of any student in STUDENTS who scored higher than 75 Marks. 
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters 
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.*/
select name
from students
where marks > 75
order by substr(name, length(name) - 2, 3) asc, id asc;

/*Write a query that prints a list of employee names (i.e.: the name attribute) 
from the Employee table in alphabetical order.*/
select name 
from employee
order by name asc;

/*Write a query that prints a list of employee names (i.e.: the name attribute) 
for employees in Employee having a salary greater than $2000
per month who have been employees for less than 10 months. 
Sort your result by ascending employee_id.*/
select name
from employee
where salary > 2000 and months < 10
order by employee_id asc;
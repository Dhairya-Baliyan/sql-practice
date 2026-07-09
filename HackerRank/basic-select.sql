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
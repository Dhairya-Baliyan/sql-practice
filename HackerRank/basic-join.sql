/*Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.*/
SELECT city.name
FROM city 
JOIN country 
    ON city.countrycode = country.code
WHERE continent = 'Africa';



/*Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations 
(CITY.Population) rounded down to the nearest integer.
*/
SELECT country.continent, FLOOR(AVG(city.population))
FROM city
JOIN country
    ON city.countrycode = country.code
GROUP BY country.continent;





/*Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 
Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

Write a query to help Eve.*/
SELECT 
    CASE WHEN g.grade < 8 THEN NULL
         ELSE s.name
    END AS Name,
    g.grade,
    s.marks
FROM students AS s
JOIN grades AS g
    ON s.marks BETWEEN g.min_mark and g.max_mark
ORDER BY g.grade DESC,
         CASE WHEN g.grade >= 8 THEN s.name END ASC,
         CASE WHEN g.grade < 8 THEN s.marks END ASC;
            



/*Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 
Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.*/
SELECT s.hacker_id, h.name
FROM submissions AS s
JOIN challenges AS c 
    ON s.challenge_id = c.challenge_id
JOIN difficulty AS d
    ON c.difficulty_level = d.difficulty_level
JOIN hackers AS h
    ON s.hacker_id = h.hacker_id
WHERE s.score = d.score
GROUP BY s.hacker_id, h.name
HAVING COUNT(s.challenge_id) > 1
ORDER BY COUNT(s.challenge_id) DESC,
         s.hacker_id ASC;
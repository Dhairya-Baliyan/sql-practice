/*You are given three tables: Students, Friends and Packages. 
Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
Write a query to output the names of those students whose best friends got offered a higher salary than them. 
Names must be ordered by the salary amount offered to the best friends. 
It is guaranteed that no two students got same salary offer.*/
SELECT s.name
FROM students AS s
JOIN friends AS f
    ON s.id = f.id
JOIN packages AS p1
    ON s.id = p1.id
JOIN packages AS p2
    ON f.friend_id = p2.id
WHERE p2.salary > p1.salary
ORDER BY p2.salary ASC;




/*You are given a table, Functions, containing two columns: X and Y.
Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.*/
SELECT f1.x, 
       f1.y
FROM functions AS f1
JOIN functions AS f2
    ON f1.x = f2.y AND f2.x = f1.y
/*We needed to check if f1.x = f1.y or if they are not equal and use aggregate function COUNT()*/
GROUP BY f1.x, f1.y
/*Case 1: if f1.x != f1.y*/
/*Case 2: If f1.x = f1.y then the count should be greater than 1 */
HAVING f1.x < f1.y OR (f1.x = f1.y AND COUNt(*) > 1)
ORDER BY f1.x ASC;


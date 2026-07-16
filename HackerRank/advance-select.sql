/*Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical 
(i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. 
If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.*/
select concat(name, '(', substr(occupation, 1, 1), ')')
from occupations
order by name asc;

select concat('There are a total of ', count(occupation),' ', lower(occupation), 's.')
from occupations
group by occupation
order by count(occupation) asc;






/*Pivot
  the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output should consist of four columns (Doctor, Professor, Singer, and Actor) in that specific order, with their respective names listed alphabetically under each column.
  Note: Print NULL when there are no more names corresponding to an occupation.
*/
select
    max(case when occupation = 'Doctor' then name end) as Doctor,
    max(case when occupation = 'Professor' then name end) as Professor,
    max(case when occupation = 'Singer' then name end) as Singer,
    max(case when occupation = 'Actor' then name end) as Actor
from (
    select 
        name, 
        occupation, 
        row_number() over(partition by occupation order by name) as RowNum
    from Occupations
) as new_table
group by RowNum;







/*You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
*/
select n, 
       case 
        when p is null then 'Root'
        when n in (select distinct p from bst where p is not null) then 'Inner'
        else 'Leaf'
       end
from bst
order by n;






/*Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, 
total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, 
if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.*/
select 
    c.company_code,
    c.founder,
    count(distinct lm.lead_manager_code),
    count(distinct sm.senior_manager_code),
    count(distinct m.manager_code),
    count(distinct e.employee_code)
from company c
left join  lead_manager lm
    on c.company_code = lm.company_code
left join  senior_manager sm
    on c.company_code = sm.company_code
left join  manager m
    on c.company_code = m.company_code
left join  employee e
    on c.company_code = e.company_code
group by c.company_code, c.founder
order by c.company_code asc;
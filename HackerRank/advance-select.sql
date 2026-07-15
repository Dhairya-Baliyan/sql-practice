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

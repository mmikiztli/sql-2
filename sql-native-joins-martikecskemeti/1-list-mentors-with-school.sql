-- Write a query that returns
--   the name of the mentors
--   plus the name and country of the school (joining with the schools table)
--   ordered by the mentors id column

-- columns: mentors.first_name, mentors.last_name, schools.name, schools.country

SELECT first_name,last_name,name,country 
FROM mentors
    JOIN schools
        ON mentors.city = schools.city
ORDER BY mentors.id ASC;
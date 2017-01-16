-- Write a query that returns
--   the name of the school
--   plus the name of contact person at the school (from the mentors table)
--   ordered by the name of the school

-- columns: schools.name, mentors.first_name, mentors.last_name

SELECT name,first_name,last_name
FROM schools
    JOIN mentors
        ON schools.contact_person = mentors.id
ORDER BY schools.name ASC;
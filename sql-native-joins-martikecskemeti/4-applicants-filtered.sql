-- Write a query that returns
--   the first name and the code of the applicants
--   plus the creation_date of the application (joining with the applicants_mentors table)
--   ordered by the creation_date in descending order
--   BUT only for applications later than 2016-01-01

-- columns: applicants.first_name, applicants.application_code, applicants_mentors.creation_date

SELECT first_name,application_code,creation_date 
FROM applicants
    JOIN applicants_mentors
        ON applicants.id = applicants_mentors.applicant_id
WHERE applicants_mentors.creation_date > date '2016-01-01'
ORDER BY applicants_mentors.creation_date DESC;

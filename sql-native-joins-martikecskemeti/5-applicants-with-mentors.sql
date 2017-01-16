-- Write a query that returns
--   the first name and the code of the applicants
--   plus the name of the assigned mentor (joining through the applicants_mentors table)
--   ordered by the applicants id column

-- Show all the applicants, even if they have no assigned mentor in the database!
--   In this case use the string 'None' instead of the mentor name

-- columns: applicants.first_name, applicants.application_code, mentor_first_name, mentor_last_name

SELECT applicants.first_name,application_code,COALESCE(mentors.first_name,'None') 
    AS mentor_first_name,COALESCE(mentors.last_name,'None') AS mentor_last_name
FROM applicants
    LEFT OUTER JOIN applicants_mentors
        ON applicants.id = applicants_mentors.applicant_id
    LEFT OUTER JOIN mentors
        ON mentors.id = applicants_mentors.mentor_id
ORDER BY applicants.id ASC;


CREATE TABLE "applicants_mentors" (
    applicant_id int REFERENCES applicants(id),
    mentor_id int REFERENCES mentors(id),
    creation_date date NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT applicants_mentors_pk PRIMARY KEY (applicant_id, mentor_id)
);

INSERT INTO "applicants_mentors" (applicant_id,mentor_id,creation_date) VALUES (1,1,date '2015-09-28');
INSERT INTO "applicants_mentors" (applicant_id,mentor_id,creation_date) VALUES (2,1,date '2015-10-10');
INSERT INTO "applicants_mentors" (applicant_id,mentor_id,creation_date) VALUES (3,2,date '2015-10-11');
INSERT INTO "applicants_mentors" (applicant_id,mentor_id,creation_date) VALUES (4,3,date '2015-10-11');
INSERT INTO "applicants_mentors" (applicant_id,mentor_id,creation_date) VALUES (5,4,date '2016-01-10');
INSERT INTO "applicants_mentors" (applicant_id,mentor_id,creation_date) VALUES (6,5,date '2016-03-01');
INSERT INTO "applicants_mentors" (applicant_id,mentor_id,creation_date) VALUES (7,5,date '2016-03-12');
INSERT INTO "applicants_mentors" (applicant_id,mentor_id,creation_date) VALUES (8,6,date '2016-04-11');
INSERT INTO "applicants_mentors" (applicant_id,mentor_id,creation_date) VALUES (9,7,date '2016-05-23');

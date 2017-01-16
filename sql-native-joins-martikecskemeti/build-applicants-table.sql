
CREATE TABLE "applicants" (
    id SERIAL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    phone_number varchar(100) NOT NULL,
    email varchar(255) NOT NULL,
    application_code integer NOT NULL,

    CONSTRAINT applicant_pk PRIMARY KEY (id),
    CONSTRAINT application_code_uk UNIQUE (application_code)
);


INSERT INTO "applicants" (first_name,last_name,phone_number,email,application_code) VALUES ('Dominique','Williams','003630/734-4926','dolor@laoreet.co.uk',61823);
INSERT INTO "applicants" (first_name,last_name,phone_number,email,application_code) VALUES ('Jemima','Foreman','003620/834-6898','magna@etultrices.net',58324);
INSERT INTO "applicants" (first_name,last_name,phone_number,email,application_code) VALUES ('Zeph','Massey','003630/216-5351','a.feugiat.tellus@montesnasceturridiculus.co.uk',61349);
INSERT INTO "applicants" (first_name,last_name,phone_number,email,application_code) VALUES ('Joseph','Crawford','003670/923-2669','lacinia.mattis@arcu.co.uk',12916);
INSERT INTO "applicants" (first_name,last_name,phone_number,email,application_code) VALUES ('Ifeoma','Bird','003630/465-8994','diam.duis.mi@orcitinciduntadipiscing.com',65603);
INSERT INTO "applicants" (first_name,last_name,phone_number,email,application_code) VALUES ('Arsenio','Matthews','003620/804-1652','semper.pretium.neque@mauriseu.net',39220);
INSERT INTO "applicants" (first_name,last_name,phone_number,email,application_code) VALUES ('Jemima','Cantu','003620/423-4261','et.risus.quisque@mollis.co.uk',10384);
INSERT INTO "applicants" (first_name,last_name,phone_number,email,application_code) VALUES ('Carol','Arnold','003630/179-1827','dapibus.rutrum@litoratorquent.com',70730);
INSERT INTO "applicants" (first_name,last_name,phone_number,email,application_code) VALUES ('Jane','Forbes','003670/653-5392','janiebaby@adipiscingenimmi.edu',56882);
INSERT INTO "applicants" (first_name,last_name,phone_number,email,application_code) VALUES ('Ursa','William','003620/496-7064','malesuada@mauriseu.net',91220);

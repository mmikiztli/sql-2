
CREATE TABLE "schools" (
    id SERIAL,
    name varchar(255) NOT NULL,
    city varchar(255) NOT NULL,
    country varchar(255) NOT NULL,
    contact_person int NULL,

    CONSTRAINT schools_pk PRIMARY KEY (id)
);


INSERT INTO "schools" (name,city,country,contact_person) VALUES ('Codecool Msc','Miskolc','Hungary',1);
INSERT INTO "schools" (name,city,country,contact_person) VALUES ('Codecool BP','Budapest','Hungary',4);
INSERT INTO "schools" (name,city,country,contact_person) VALUES ('Codecool Krak','Krakow','Poland',7);
INSERT INTO "schools" (name,city,country,contact_person) VALUES ('Codecool Mad','Madrid','Spain',NULL);

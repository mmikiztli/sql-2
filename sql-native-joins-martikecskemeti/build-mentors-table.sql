
CREATE TABLE "mentors" (
    id SERIAL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    nick_name varchar(255) NULL,
    phone_number varchar(100) NOT NULL,
    email varchar(255) NOT NULL,
    city varchar(255) NOT NULL,
    favourite_number integer NULL,

    CONSTRAINT mentors_pk PRIMARY KEY (id)
);


-- Miskolc
INSERT INTO "mentors" (first_name,last_name,nick_name,phone_number,email,city,favourite_number) VALUES ('Attila','Molnár','Atesz','003670/630-0539','attila.molnar@codecool.com','Miskolc',23);
INSERT INTO "mentors" (first_name,last_name,nick_name,phone_number,email,city,favourite_number) VALUES ('Pál','Monoczki','Pali','003630/327-2663','pal.monoczki@codecool.com','Miskolc',NULL);
INSERT INTO "mentors" (first_name,last_name,nick_name,phone_number,email,city,favourite_number) VALUES ('Sándor','Szodoray','Szodi','003620/519-9152','sandor.szodoray@codecool.com','Miskolc',7);
-- Budapest
INSERT INTO "mentors" (first_name,last_name,nick_name,phone_number,email,city,favourite_number) VALUES ('Dániel','Salamon','Dani','003620/508-0706','daniel.salamon@codecool.com','Budapest',4);
INSERT INTO "mentors" (first_name,last_name,nick_name,phone_number,email,city,favourite_number) VALUES ('Miklós','Beöthy','Miki','003630/256-8118','miklos.beothy@codecool.com','Budapest',42);
INSERT INTO "mentors" (first_name,last_name,nick_name,phone_number,email,city,favourite_number) VALUES ('Tamás','Tompa','Tomi','003630/370-0748','tamas.tompa@codecool.com','Budapest',42);
-- Krakow
INSERT INTO "mentors" (first_name,last_name,nick_name,phone_number,email,city,favourite_number) VALUES ('Mateusz','Ostafil','Mateusz','003648/518-664-923','mateusz.ostafil@codecool.com','Krakow', 13);

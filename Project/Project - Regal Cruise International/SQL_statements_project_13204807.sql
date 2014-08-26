/*
* COMP40725 Introduction to Relational Databases & SQL Programming
*
* Welcome to the Final Database Project!
*
* Student name: Noreen A. Lenihan
* Student ID: 13204807
* Course lecturer: Dr. Mark Scanlon
* Course TA: Alex Cronin, PhD candidate
* Submission date: Fri, 25 April 2014
* 
* This file is submittied as partial fulfilment of the project component
* of module COMP40725 Introduction to Relational Databases and SQL Programming.
*
*/

/* Part 1: Database Setup 
*
* The first part of this script is concerned with setting up the database
* and tables and populating each table with appropriate data.
* Importantly, each table and its constituent table attributes
* is fully concordant with the final, revised Entity-Relation
* diagram submitted prior (and later revised) as part of the
* Final Project Specification component. In all cases, apt
* primary and foreign keys are implemented, which are likewise
* clearly demarcated in the initial project specification.
* 
* Note: All SQL statements/queries are produced
* in full cognizance of programming conventions, that is,
* keywords and commands are written in UPPERCASE letters 
* and table/attribue names are in lowercase, as per convention.
*/

-- Table structure for Route entity
CREATE TABLE proj_route (
route_id NUMBER(10) NOT NULL,
route_name NVARCHAR2(20) NULL,
PRIMARY KEY(route_id)
);

-- Create sequence for route table
CREATE SEQUENCE proj_route_seq
START WITH 1
-- Increment by 1 each time
INCREMENT BY 1;

-- Create trigger to auto-increment route_id with each insertion on proj_route table
CREATE OR REPLACE TRIGGER proj_route_INC
BEFORE INSERT ON proj_route
FOR EACH ROW
BEGIN
SELECT proj_route_seq.NEXTVAL
INTO :NEW.route_id
FROM DUAL;
END;
/

-- Dump data for Route table
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'CAR'); -- Route entry for the 'Carribean route'
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'MED'); -- Route entry for the 'Mediterranean' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'ASK'); -- Route entry for the 'Alaskan' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'SAMR'); -- Route entry for the 'South American' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'AUS'); -- Route entry for the 'Australasian' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'DUB'); -- Route entry for the 'Dubai' (and its surrouding enclave) route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'ASI'); -- Route entry for the 'Asian' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'BAH'); -- Route entry for the 'Bahamas' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'SCN'); -- Route entry for the 'Scandivinavian' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'CNR'); -- Route entry for the 'Canary Islands' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'HWI'); -- Route entry for the 'Hawaiian' route

-- Table structure for Port_Country
CREATE TABLE proj_port_country (
port_city NVARCHAR2(30) NOT NULL,
country NVARCHAR2(30) NULL,
PRIMARY KEY(port_name)
);

-- Dump data for Port_Country
INSERT INTO proj_port_country (port_city, country) VALUES ('MEX', 'Mexico'); -- Entry to define that the Mexican port resides in Mexico
INSERT INTO proj_port_country (port_city, country) VALUES ('BRG', 'Barbados'); -- Entry to define that the Bridgetown port resides in Barbados
INSERT INTO proj_port_country (port_city, country) VALUES ('SYN', 'Australia'); -- Entry to define that the Sydney port resides in Australia
INSERT INTO proj_port_country (port_city, country) VALUES ('TAU', 'New Zealand'); -- Entry to define that the Tauranga port resides in New Zealand
INSERT INTO proj_port_country (port_city, country) VALUES ('FLO', 'USA'); -- Entry for the Florida port in the States
INSERT INTO proj_port_country (port_city, country) VALUES ('KET', 'USA'); -- Entry for the Ketchikan port that is part of Alaska that is part of the US
INSERT INTO proj_port_country (port_city, country) VALUES ('JUN', 'USA'); -- Entry for Juneau port, part of the Alaskan state of the US
INSERT INTO proj_port_country (port_city, country) VALUES ('BUE', 'Argentina'); -- Port-country for Buenos Aires and its country, Argentina
INSERT INTO proj_port_country (port_city, country) VALUES ('RIO', 'Brazil'); -- Entry for Rio de Janeiro in Brazil
INSERT INTO proj_port_country (port_city, country) VALUES ('MYK', 'Greece'); -- Entry for Mykonos port in Greece
INSERT INTO proj_port_country (port_city, country) VALUES ('HON', 'USA'); -- Entry for Honolulu port in the US

-- Table structure mapping Port entity
CREATE TABLE proj_port (
port_id NUMBER(10) NOT NULL,
port_city NVARCHAR2(30) NOT NULL,
docking_area NVARCHAR2(10) NULL,
PRIMARY KEY(port_id),
FOREIGN KEY(port_city) REFERENCES proj_port_country(port_city)
);

-- Create sequence for proj_port table
CREATE SEQUENCE proj_port_seq
START WITH 1
-- Increment by 1 each time
INCREMENT BY 1;

-- Create trigger to auto-increment port_id with each insertion on proj_port table
CREATE OR REPLACE TRIGGER proj_port_inc
BEFORE INSERT ON proj_port 
FOR EACH ROW
BEGIN
SELECT proj_port_seq.NEXTVAL
INTO :NEW.port_id
FROM DUAL;
END;
/

-- Dump data for Port table
INSERT INTO proj_port (port_id, port_name, docking_area) VALUES (NULL, 'MEX', 'Section134'); -- Data entry for Mexico port city
INSERT INTO proj_port (port_id, port_name, docking_area) VALUES (NULL, 'BRG', 'Section230'); -- Data entry for Bridgetown port
INSERT INTO proj_port (port_id, port_name, docking_area) VALUES (NULL, 'SYN', 'Section134'); -- Data entry for Sydney port
INSERT INTO proj_port (port_id, port_name, docking_area) VALUES (NULL, 'TAU', 'Section251'); -- Data entry for Tauranga port
INSERT INTO proj_port (port_id, port_name, docking_area) VALUES (NULL, 'FLO', 'Section300'); -- Data entry for Florida port
INSERT INTO proj_port (port_id, port_name, docking_area) VALUES (NULL, 'KET', 'Section890'); -- Data entry for Ketchikan port
INSERT INTO proj_port (port_id, port_name, docking_area) VALUES (NULL, 'JUN', 'Section900'); -- Data entry for Juneau port
INSERT INTO proj_port (port_id, port_name, docking_area) VALUES (NULL, 'BUE', 'Section741'); -- Data entry for Bueno Aries port
INSERT INTO proj_port (port_id, port_name, docking_area) VALUES (NULL, 'RIO', 'Section577'); -- Data entry for Rio de Janeiro port
INSERT INTO proj_port (port_id, port_name, docking_area) VALUES (NULL, 'MYK', 'Section865'); -- Data entry for Mykonos port
INSERT INTO proj_port (port_id, port_name, docking_area) VALUES (NULL, 'HON', 'Section113'); -- Data entry for Honolulu port


-- Table structure for Ship entity
CREATE TABLE proj_ship (
ship_id NUMBER(10) NOT NULL,
ship_name NVARCHAR2(20) NULL,
ship_type NVARCHAR2(20) NULL,
grt NUMBER(10) NULL,
ship_length NUMBER(4) NULL,
ship_speed NUMBER(3) NULL,
ship_capacity NUMBER(5) NULL,
route_id NUMBER(10) NULL,
PRIMARY KEY(ship_id),
FOREIGN KEY(route_id) REFERENCES proj_route(route_id)
);

-- Create sequence for proj_ship table
CREATE SEQUENCE proj_ship_seq
START WITH 1
-- Increment by 1 each time
INCREMENT BY 1;

-- Create trigger to auto-increment ship_id with each insertion on proj_ship table
CREATE OR REPLACE TRIGGER proj_ship_inc
BEFORE INSERT ON proj_ship
FOR EACH ROW
BEGIN
SELECT proj_ship_seq.NEXTVAL
INTO :NEW.ship_id
FROM DUAL;
END;
/

-- Dump data for proj_ship table
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'King of the Sea', 'cruise ship', 225282, 1181, 22, 2800, 1);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Liberte of the Sea', 'cruise ship', 155678, 2011, 30, 4300, 2);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Harmony of the Sea', 'ocean liner', 154380, 1890, 32, 2300, 3);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Unity at Sea', 'cruise ship', 137080, 1100, 24, 2900, 4);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Captain of the Sea', 'ocean liner', 128900, 1112, 20, 1400, 5);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Explorer of the Sea', 'cruise ship', 179800, 1190, 19, 2500, 6);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Breeze of the Sea', 'ocean liner', 166230, 1020, 31, 3500, 7);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Reflector of the Sea', 'cruise ship', 122210, 1111, 29, 2200, 8);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Magic of the Sea', 'cruise ship', 150900, 1300, 18, 2600, 9);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Majesty of the Sea', 'cruise ship', 166980, 1100, 23, 2300, 10);


-- Table structure for Package entity
CREATE TABLE proj_package (
package_id NUMBER(10) NOT NULL,
package_title NVARCHAR2(50) NULL,
depart_date DATE NULL,
arrival_date DATE NULL,
base_price NUMBER(10,2) NULL,
reduced_price NVARCHAR2(2) NULL,
ship_id NUMBER(10) NULL,
PRIMARY KEY(package_id),
FOREIGN KEY(ship_id) REFERENCES proj_ship(ship_id)
);

-- Create sequence for proj_package table
CREATE SEQUENCE proj_pkg_seq
START WITH 1
-- Increment by 1 each time
INCREMENT BY 1;

-- Create trigger to auto-increment package_id with each insertion on proj_package table
CREATE OR REPLACE TRIGGER proj_pkg_inc
BEFORE INSERT ON proj_package 
FOR EACH ROW
BEGIN
SELECT proj_pkg_seq.NEXTVAL
INTO :NEW.package_id
FROM DUAL;
END;
/

-- Dump data for the proj_package table
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Asian Adventure Summer 2014', TO_DATE('15/07/2014', 'DD/MM/YYYY'), TO_DATE('01/08/2014', 'DD/MM/YYYY'), 1599, NULL, 7);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Carribean Cruisin Summer 2014', TO_DATE('23/05/2014', 'DD/MM/YYYY'), TO_DATE('20/06/2014', 'DD/MM/YYYY'), 1999, NULL, 1);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Mediterranean Manna Autumn 2014', TO_DATE('15/08/2014', 'DD/MM/YYYY'), TO_DATE('20/09/2014', 'DD/MM/YYYY'), 799, NULL, 2);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Carribean Cruisin Winter 2014', TO_DATE('02/11/2014', 'DD/MM/YYYY'), TO_DATE('01/12/2014', 'DD/MM/YYYY'), 1450, NULL, 1);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Alaskan Antics Spring 2014', TO_DATE('11/02/2014', 'DD/MM/YYYY'), TO_DATE('12/03/2014', 'DD/MM/YYYY'), 1600, NULL, 3);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Alaskan Antics Autumn 2014', TO_DATE('11/09/2014', 'DD/MM/YYYY'), TO_DATE('12/10/2014', 'DD/MM/YYYY'), 1780, NULL, 3);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'South American Solace Summer 2014', TO_DATE('05/07/2014', 'DD/MM/YYYY'), TO_DATE('31/07/2014', 'DD/MM/YYYY'), 899, NULL, 4);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'South American Solace Autumn 2014', TO_DATE('30/08/2014', 'DD/MM/YYYY'), TO_DATE('15/09/2014', 'DD/MM/YYYY'), 1200, NULL, 4);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Anthem of Australia Spring 2015', TO_DATE('11/03/2015', 'DD/MM/YYYY'), TO_DATE('20/03/2015', 'DD/MM/YYYY'), 650, NULL, 5);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Scandinavian Skies Autumn 2014', TO_DATE('10/08/2014', 'DD/MM/YYYY'), TO_DATE('14/09/2014', 'DD/MM/YYYY'), 1800, NULL, 9);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Baltic Bliss Summer 2014', TO_DATE('10/05/2014', 'DD/MM/YYYY'), TO_DATE('14/06/2014', 'DD/MM/YYYY'), 1800, NULL, NULL);


-- Table structure for Customer entity
CREATE TABLE proj_customer (
customer_id NUMBER(10) NOT NULL,
fname NVARCHAR2(20) NULL,
lname NVARCHAR2(20) NULL,
addr NVARCHAR2(50) NULL,
phone NUMBER(20) NULL,
email NVARCHAR2(30) NULL,
PRIMARY KEY(customer_id)
);

-- Create sequence for proj_customer table
CREATE SEQUENCE proj_cust_seq
START WITH 1
-- Increment by 1 each time
INCREMENT BY 1;

-- Create trigger to auto-increment customer_id with each insertion on proj_customer table
CREATE OR REPLACE TRIGGER proj_cust_inc
BEFORE INSERT ON proj_customer 
FOR EACH ROW
BEGIN
SELECT proj_cust_seq.NEXTVAL
INTO :NEW.customer_id
FROM DUAL;
END;
/

-- Dump data for the proj_customer table
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Christel', 'Vinot',
'31 Lazaar St Paris France', 00351893292, 'cvinot@gmail.com');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Vincent', 'Perquez',
'21 Alpa Apt Rome Italy', 3536712344, 'vperquez@yahoo.com');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Jaime', 'Hartnett',
'10 Church St Irishtown Dublin Ireland', 353875674123, 'jhartnett4@eircom.net');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Ellen', 'Weesley',
'Grapevine Ave Manchester UK', 0012347862, 'elweesley@gmail.com');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Terrence', 'Fitzpatrick',
'14 Hysteria Lane, Baltimore, MA, USA', 0044321456789, 'terryteddybear@mit.com');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Courtney', 'Maples',
'13 The Plaza, Sydney, Australia', 00992345733, 'cmaples@businessneeds.com');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Oliver', 'Beans',
'456 Vancouver Highlands, Vancouver, Canada', 00334567992, 'ollieb@gmail.com');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Jonathan', 'Kurtz',
'Broadstreet Philadelphia USA', 0044567236456, 'jkurtz@drexel.edu');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Martha', 'Beehive',
'103 The Mall, San Francisco, USA', 004453228844, 'mbeehive@ucla.edu');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Peter', 'Freitag',
'123 Alpenstrasse Salzburg Sud, Austria', 001123456723, 'pfreitag@uni-salzburg.at');


-- Table structure for Membership entity
CREATE TABLE proj_membership (
membership_type NVARCHAR2(10) NOT NULL,
percent_add_on NUMBER(6) NULL,
PRIMARY KEY(membership_type)
);

-- Dump data for proj_membership_type
INSERT INTO proj_membership (membership_type, percent_add_on) VALUES ('platinum', 20);
INSERT INTO proj_membership (membership_type, percent_add_on) VALUES ('gold', 15);
INSERT INTO proj_membership (membership_type, percent_add_on) VALUES ('silver', 8);
INSERT INTO proj_membership (membership_type, percent_add_on) VALUES ('bronze', 5);

-- Table structure for Reservation entity
CREATE TABLE proj_reservation (
reservation_id NUMBER(10) NOT NULL,
date_reservation TIMESTAMP NULL,
payment_offer NVARCHAR2(10) NULL,
package_id NUMBER(10) NOT NULL,
customer_id NUMBER(10) NOT NULL,
PRIMARY KEY(reservation_id),
FOREIGN KEY(package_id) REFERENCES proj_package(package_id),
FOREIGN KEY(customer_id) REFERENCES proj_customer(customer_id)
);

-- Create sequence for proj_reservation table
CREATE SEQUENCE proj_reserv_seq
START WITH 1
-- Increment by 1 each time
INCREMENT BY 1;

-- Create trigger to auto-increment reservation_id with each insertion on proj_reservation table
CREATE OR REPLACE TRIGGER proj_reserv_inc
BEFORE INSERT ON proj_reservation
FOR EACH ROW
BEGIN
SELECT proj_reserv_seq.NEXTVAL
INTO :NEW.reservation_id
FROM DUAL;
END;
/

-- Ensure that each customer_id entry in the reservation table is unique,
-- in other words, a customer must only have at most one reservation
ALTER TABLE proj_reservation ADD CONSTRAINT reservation_customer UNIQUE (customer_id);

-- Dump data for proj_reservation table
INSERT INTO proj_reservation (reservation_id, date_reservation, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP, 'FULL PRICE', 1, 1);
INSERT INTO proj_reservation (reservation_id, date_reservation, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 1, 'FULL PRICE', 2, 10);
INSERT INTO proj_reservation (reservation_id, date_reservation, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 2, 'FULL PRICE', 3, 9);
INSERT INTO proj_reservation (reservation_id, date_reservation, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 3, 'FULL PRICE', 4, 5);
INSERT INTO proj_reservation (reservation_id, date_reservation, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 40, 'FULL PRICE', 5, 6);
INSERT INTO proj_reservation (reservation_id, date_reservation, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 34, 'FULL PRICE', 6, 2);
INSERT INTO proj_reservation (reservation_id, date_reservation, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 10, 'FULL PRICE', 7, 7);
INSERT INTO proj_reservation (reservation_id, date_reservation, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 13, 'FULL PRICE', 8, 8);
INSERT INTO proj_reservation (reservation_id, date_reservation, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 11, 'FULL PRICE', 9, 4);
INSERT INTO proj_reservation (reservation_id, date_reservation, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 2, 'FULL PRICE', 10, 3);


-- Table structure for Room_Details table
CREATE TABLE proj_room_details (
room_type NVARCHAR2(20) NOT NULL,
rm_capacity NUMBER(2) NULL,
PRIMARY KEY(room_type)
);

-- Dump data for proj_room_details table
INSERT INTO proj_room_details (room_type, rm_capacity) VALUES ('family room', 5);
INSERT INTO proj_room_details (room_type, rm_capacity) VALUES ('single room', 1);
INSERT INTO proj_room_details (room_type, rm_capacity) VALUES ('double room', 2);
INSERT INTO proj_room_details (room_type, rm_capacity) VALUES ('twin room', 2);
INSERT INTO proj_room_details (room_type, rm_capacity) VALUES ('junior suite', 2);
INSERT INTO proj_room_details (room_type, rm_capacity) VALUES ('penthouse suite', 2);


-- Table structure for proj_room_status table that map the Room_Status entity
CREATE TABLE proj_room_status (
room_class NVARCHAR2(30) NOT NULL,
membership_type NVARCHAR2(10) NOT NULL,
PRIMARY KEY(room_class),
FOREIGN KEY(membership_type) REFERENCES proj_membership(membership_type)
);

-- Dump data for proj_room_status table
INSERT INTO proj_room_status (room_class, membership_type) VALUES ('luxury', 'gold');
INSERT INTO proj_room_status (room_class, membership_type) VALUES ('deluxe with balcony', 'platinum');
INSERT INTO proj_room_status (room_class, membership_type) VALUES ('standard', 'silver');
INSERT INTO proj_room_status (room_class, membership_type) VALUES ('business', 'bronze');
INSERT INTO proj_room_status (room_class, membership_type) VALUES ('executive', 'platinum');
INSERT INTO proj_room_status (room_class, membership_type) VALUES ('ultimate', 'platinum');


-- Table structure to map Room entity
CREATE TABLE proj_room (
room_id NUMBER(10) NOT NULL,
room_type NVARCHAR2(20) NOT NULL,
room_class NVARCHAR2(20) NOT NULL,
ship_id NUMBER(10) NOT NULL,
reservation_id NUMBER(10) NULL,
PRIMARY KEY(room_id),
FOREIGN KEY(ship_id) REFERENCES proj_ship(ship_id),
FOREIGN KEY(reservation_id) REFERENCES proj_reservation(reservation_id),
FOREIGN KEY(room_type) REFERENCES proj_room_details(room_type),
FOREIGN KEY(room_class) REFERENCES proj_room_status(room_class)
);

-- Create sequence for proj_room table
CREATE SEQUENCE proj_room_seq
START WITH 1
-- Increment by 1 each time
INCREMENT BY 1;

-- Create trigger to auto-increment room_id with each insertion on proj_room table
CREATE OR REPLACE TRIGGER proj_room_inc
BEFORE INSERT ON proj_room
FOR EACH ROW
BEGIN
SELECT proj_room_seq.NEXTVAL
INTO :NEW.room_id
FROM DUAL;
END;
/

-- Dump data for proj_room table
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'luxury', 1, 2);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'deluxe with balcony',7, 1);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room' , 'deluxe with balcony', 7, 1);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL,  'double room', 'standard', 2, 3);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'business', 1, 4);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL,  'double room', 'business',3, 5);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'standard',  3, 6);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL,  'junior suite', 'executive', 4, 7);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'luxury', 5, 9);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'ultimate',  9,10);



-- Junction table between Package and Membership tables
CREATE TABLE proj_packagemem (
package_id NUMBER(10) NOT NULL,
membership_type NVARCHAR2(10) NOT NULL,
PRIMARY KEY(package_id, membership_type),
FOREIGN KEY(package_id) REFERENCES proj_package(package_id),
FOREIGN KEY(membership_type) REFERENCES proj_membership(membership_type)
);

INSERT INTO proj_packagemem (package_id, membership_type) VALUES (1, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (1, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (1, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (1, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (2, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (2, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (2, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (2, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (3, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (3, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (3, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (3, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (4, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (4, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (4, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (4, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (5, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (5, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (5, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (5, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (6, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (6, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (6, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (6, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (7, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (7, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (7, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (7, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (8, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (8, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (8, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (8, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (9, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (9, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (9, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (9, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (10, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (10, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (10, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (10, 'bronze');


-- Junction table for Route and Port tables
CREATE TABLE proj_routeport (
route_id NUMBER(10) NOT NULL,
port_id NUMBER(10) NOT NULL,
PRIMARY KEY(route_id, port_id),
FOREIGN KEY(route_id) REFERENCES proj_route(route_id),
FOREIGN KEY(port_id) REFERENCES proj_port(port_id)
);

-- Dump data for proj_routeport table
INSERT INTO proj_routeport (route_id, port_id) VALUES (1, 1);
INSERT INTO proj_routeport (route_id, port_id) VALUES (1, 2);
INSERT INTO proj_routeport (route_id, port_id) VALUES (5, 3);
INSERT INTO proj_routeport (route_id, port_id) VALUES (5, 4);
INSERT INTO proj_routeport (route_id, port_id) VALUES (8, 5);
INSERT INTO proj_routeport (route_id, port_id) VALUES (3, 6);
INSERT INTO proj_routeport (route_id, port_id) VALUES (3, 7);
INSERT INTO proj_routeport (route_id, port_id) VALUES (4, 8);
INSERT INTO proj_routeport (route_id, port_id) VALUES (4, 9);
INSERT INTO proj_routeport (route_id, port_id) VALUES (2, 10);


/* Part 2: Inner Joins */

-- Identify the ship ID and ship name of all ships that service the route around the Carribean
SELECT s.ship_id, s.ship_name FROM proj_ship s INNER JOIN proj_route r ON r.route_id = s.route_id WHERE r.route_name = 'CAR';

-- The ship 'Harmony of the Sea' wants to upgrade its Bronze and Silver category/membership rooms. 
-- How many rooms (aggregate) of these classifications are there aboard this liner?
SELECT count(room_id) FROM (SELECT * FROM proj_room r INNER JOIN proj_room_status rs ON r.room_class = rs.room_class WHERE 
rs.membership_type = 'bronze' OR rs.membership_type = 'silver') x INNER JOIN proj_ship s ON x.ship_id = s.ship_id WHERE s.ship_name = 'Harmony of the Sea';


-- Show all the ports that are visited as part of the Australasian route
SELECT p.port_name FROM proj_port p INNER JOIN proj_routeport rp ON p.port_id = rp.port_id WHERE rp.route_id = (SELECT route_id FROM proj_route WHERE route_name = 'AUS');

--Given that ship number 7, 'Breeze of the Sea', has a capacity of 3,500 passengers, how many
-- reservations does it currently have for its service of the package 'Asian Adventure Summer 2014'?
SELECT count(reservation_id) FROM proj_room r INNER JOIN proj_ship s ON r.ship_id = s.ship_id WHERE r.ship_id = 
(SELECT s.ship_id FROM proj_ship s INNER JOIN proj_package p ON s.ship_id = p.ship_id WHERE p.package_title = 'Asian Adventure Summer 2014') AND r.reservation_id IS NOT NULL;

-- Identify the room types and capacities that customer with reservation number 1 has reserved
SELECT rd.room_type, sum(rm_capacity) FROM proj_room_details rd INNER JOIN proj_room rm ON rm.room_type = rd.room_type WHERE rm.reservation_id = 1 GROUP BY rd.room_type;

-- What room number, room type and room class does Peter Freitag have?
SELECT room_id, room_type, room_class FROM proj_room rm join proj_reservation res ON rm.reservation_id = res.reservation_id WHERE res.customer_id = (SELECT customer_id FROM 
proj_customer cus WHERE cus.fname = 'Peter' AND cus.lname = 'Freitag');

-- Find out all the port cities and countries visited as part of the ALASKAN route
SELECT r.route_name, p.port_name, pc.country FROM proj_routeport rp join proj_route r ON r.route_id = rp.route_id join proj_port p ON p.port_id =
rp.port_id join proj_port_country pc ON pc.port_name = p.port_name WHERE r.route_name = 'ASK';

-- Detail all the room types and classes existing (reserved and nonreserved) on the ship, 'Liberte of the Sea'. (You are unsure of spelling!) 
SELECT * FROM proj_room rm JOIN proj_room_status rs ON rm.room_class = rs.room_class JOIN proj_room_details rd ON rm.room_type = rd.room_type
WHERE rm.ship_id = (SELECT s.ship_id FROM ship s WHERE s.ship_name LIKE '%Lib%';

-- Show all package base prices by membership type chosen in order from highest price to lowest
SELECT package_title, pkgmem.membership_type, (pkg.base_price + (pkg.base_price * (mem.percent_add_on / 100))) AS 
sales_price FROM proj_packagemem pkgmem join proj_package pkg ON pkg.package_id = pkgmem.package_id
join proj_membership mem ON pkgmem.membership_type = mem.membership_type ORDER BY sales_price DESC;


/* Outer Joins */

-- Check how many currently available/unavailable rooms there are for ship 2?
SELECT rm.room_id, rm.room_type, rm.room_class, rm.ship_id, rm.reservation_id, res.customer_id, res.package_id, res.date_reservation FROM 
proj_room rm LEFT OUTER JOIN proj_reservation res ON rm.reservation_id = res.reservation_id WHERE rm.ship_id = 2;

-- List all packages/ships that are currently in the RCI's system including new and exciting packages 
-- in progress
SELECT * FROM proj_package pkg LEFT OUTER JOIN proj_ship sh ON pkg.ship_id = sh.ship_id;

-- List all ships with/out routes
SELECT * FROM proj_ship sh FULL OUTER JOIN proj_route rt on sh.route_id = rt.route_id;

-- List all packages with/out reservations
SELECT * FROM proj_package pkg FULL OUTER JOIN proj_reservation res on pkg.package_id = res.package_id;

-- Show all the ships hosting packages and not hosting package for this year and next
SELECT * FROM proj_package pkg RIGHT OUTER JOIN proj_ship sh ON pkg.ship_id = sh.ship_id;

-- Summary of all rooms that have been reserved and remaining rooms (slots to fill) for package 'Mediterranean Manna Autumn 2014'
SELECT * FROM proj_reservation res RIGHT OUTER JOIN proj_room rm ON res.reservation_id = rm.reservation_id join proj_ship sh ON rm.ship_id = sh.ship_id
WHERE sh.ship_id = (SELECT pkg.ship_id FROM proj_package pkg WHERE pkg.package_title = 'Mediterranean Manna Autumn 2014');

/* ----------------------------- */

/* Cube Query */

-- Generate subtotals for all possible combinations of packages and months 
-- What months of the year have the most expensive packages? When are packages cheapest? What the most expensive package?
-- What's the subtotal for all months (identified by departure date) and the subtotal for all packages and a grand total
SELECT to_char(depart_date, 'MON'), SUM(base_price), package_title FROM proj_package GROUP BY cube (to_char(depart_date, 'MON'), package_title);


-- Get all subtotals of prices for each route and each month of the year 
SELECT to_char(depart_date, 'MON'), SUM(base_price), r.route_name FROM proj_package pkg, proj_route r WHERE r.route_id = 
(SELECT s.route_id FROM proj_ship s WHERE s.ship_id = package.ship_id) GROUP BY cube (to_char(depart_date, 'MON'), r.route_name);


/* Five Sub-queries */

-- What room number, room type and room class does Peter Freitag have?
SELECT room_id, room_type, room_class FROM proj_room rm join proj_reservation res ON rm.reservation_id = res.reservation_id WHERE res.customer_id = 
(SELECT customer_id FROM proj_customer cust WHERE cust.fname = 'Peter' and cust.lname = 'Freitag');

-- Detail all the room types and classes existing (reserved and nonreserved) on the ship, 'Liberte of the Sea'. (You are unsure of spelling!) 
SELECT * FROM proj_room rm JOIN proj_room_status rs ON rm.room_class = rs.room_class JOIN proj_room_details rd ON rm.room_type = rd.room_type
WHERE rm.ship_id = (SELECT s.ship_id FROM proj_ship s WHERE s.ship_name LIKE '%Lib%';

-- Obtain the capacity (for people, not rooms) that reservations for the package, 'Asian Adventure Summer 2014' currently takes up, i.e
-- how many people have booked places on this cruise at the moment.
SELECT sum(rm_capacity) FROM proj_room rm join proj_room_details rd on rm.room_type=rd.room_type WHERE rm.ship_id = (SELECT
ship_id FROM proj_package WHERE package_title = 'Asian Adventure Summer 2014') AND rm.reservation_id IS NOT NULL;

-- One of the managers is requesting all ships that travel the South American route to be refurnished/engine check.
-- He requests all ship information from vessels that cover this route.
SELECT * FROM proj_ship WHERE route_id = (SELECT route_id FROM proj_route WHERE route_name = 'SAMR');

-- The captains of all ships travelling the South American route should be supplied with a current
-- itinerary of all ports to stop at and where to dock
SELECT port_city, docking_area FROM proj_port p JOIN proj_routeport rp ON p.port_id = rp.port_id WHERE rp.route_id = (SELECT 
route_id FROM proj_route WHERE route_name = 'SAMR');

/* PL/SQL procedures */


-- Revert all reserved rooms' availability to null when a package has reached its end date (i.e. ship has arrived
-- at final port)

CREATE OR REPLACE PACKAGE RCI_OPERATIONS_PKG AS
PROCEDURE RoomAvailabilityReset(package_num NUMBER);
PROCEDURE RoomAssignment(reserv_num NUMBER, membership_chosen NVARCHAR2, qty_adults NUMBER, qty_child NUMBER);
PROCEDURE ReservationCancellation(reserv_num NUMBER);
PROCEDURE assignRoom(room_num NUMBER, reserv_num NUMBER);
PROCEDURE LastMinPackageDeal(package_num NUMBER);
PROCEDURE FullReservation(package_num NUMBER, cust_fname NVARCHAR2, 
cust_lname NVARCHAR2, cust_addr NVARCHAR2, cust_phone NUMBER, cust_email NVARCHAR2, membership_chosen NVARCHAR2, qty_adults NUMBER, qty_child NUMBER);
PROCEDURE ShipAssignment(package_num NUMBER, ship_nbr NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY RCI_OPERATIONS_PKG AS
PROCEDURE RoomAvailabilityReset(package_num NUMBER)
IS
num_rooms_reset NUMBER(5);
date_pkg_expired DATE;
BEGIN
SELECT arrival_date INTO date_pkg_expired FROM proj_package WHERE package_id = package_num;
SELECT COUNT(reservation_id) INTO num_rooms_reset FROM proj_room WHERE room.ship_id = (SELECT ship_id FROM
proj_package pkg WHERE pkg.package_id = package_num);
IF sysdate > date_pkg_expired THEN 
	UPDATE proj_room SET reservation_id = NULL WHERE proj_room.ship_id = (SELECT ship_id FROM proj_package pkg WHERE pkg.package_id = package_num);
	DBMS_OUPTUT.PUT_LINE('Number of rooms whose reservation status has reset: ' || num_rooms_reset);
END IF;
END RoomAvailabilityReset;
/


-- Reserve rooms as part of customer's reservation based on their chosen
-- membership and how many people are included in the reservation

PROCEDURE RoomAssignment(reserv_num NUMBER, membership_chosen NVARCHAR2, qty_adults NUMBER, qty_child NUMBER) 
IS 
total_qty NUMBER(3);
TOO_MANY_PERSONS_PER_RESERVATION EXCEPTION;
PRAGMA EXCEPTION_INIT(TOO_MANY_PERSONS_PER_RESERVATION, -20006);
CURSOR cur_room
IS
SELECT r.room_id, r.room_type, r.room_class, rs.membership_type, r.ship_id, r.reservation_id FROM proj_room r JOIN proj_room_status rs ON 
r.room_class = rs.room_class WHERE ship_id = (SELECT ship_id FROM proj_package p WHERE p.package_id = (SELECT package_id FROM proj_reservation res WHERE 
res.reservation_id = reserv_num)) AND rs.membership_type = membership_chosen;
room_row cur_room%ROWTYPE;
BEGIN
SELECT (qty_child + qty_adults) INTO total_qty FROM dual;
OPEN cur_room;
FETCH cur_room INTO room_row;
WHILE cur_room%FOUND AND total_qty >= 1 LOOP
	IF total_qty <= 5 and qty_child >=1 then
		IF room_row.reservation_id IS NULL AND room_row.room_type = 'family room' THEN
		assignRoom(room_Row.room_id, reserv_num);
		SAVEPOINT do_room_assignment;
		total_qty := total_qty - 5;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'penthouse suite' THEN 
		assignRoom(room_Row.room_id, reserv_num);
		SAVEPOINT do_room_assignment;
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'junior suite' THEN
		assignRoom(room_Row.room_id, reserv_num);
		SAVEPOINT do_room_assignment;
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'double room' THEN
		assignRoom(room_Row.room_id, reserv_num);
		SAVEPOINT do_room_assignment;
		total_qty := - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'twin room' THEN
		assignRoom(room_Row.room_id, reserv_num);
		SAVEPOINT do_room_assignment;
		total_qty := total_qty - 2;
		ELSIF room_Row.reservation_id IS NULL AND room_row.room_type = 'single room' THEN
		assignRoom(room_Row.room_id, reserv_num);
		SAVEPOINT do_room_assignment;
		total_qty := total_qty - 1;
		END IF;
	ELSIF total_qty <= 5 AND qty_child = 0 THEN
		IF room_row.reservation_id IS NULL AND room_row.room_type = 'penthouse suite' THEN
		assignRoom(room_Row.room_id, reserv_num);
		SAVEPOINT do_room_assignment;
		total_qty := total_qty - 2;
		ELSIF room_Row.reservation_id IS NULL AND room_row.room_type = 'junior suite' THEN
		assignRoom(room_row.room_id, reserv_num);
		SAVEPOINT do_room_assignment;
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'double room' THEN
		assignRoom(room_row.room_id, reserv_num);
		SAVEPOINT do_room_assignment;
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'twin room' THEN
		assignRoom(room_row.room_id, reserv_num);
		SAVEPOINT do_room_assignment;
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'single room' THEN
		assignRoom(room_row.room_id, reserv_num);
		SAVEPOINT do_room_assignment;
		total_qty := total_qty - 1;
		END IF;
	ELSE
		IF total_qty > 8 THEN
			RAISE TOO_MANY_PERSONS_PER_RESERVATION;
		END IF;
		IF room_row.reservation_id IS NULL AND room_row.room_type = 'penthouse suite' THEN
		assignRoom(room_Row.room_id, reserv_num);
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'junior suite' THEN 
		assignRoom(room_row.room_id, reserv_num);
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'double room' THEN
		assignRoom(room_row.room_id, reserv_num);
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'twin room' THEN
		assignRoom(room_Row.room_id, reserv_num);
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'single room' THEN
		assignRoom(room_row.room_id, reserv_num);
		total_qty := total_qty - 1;
		END IF;

		EXCEPTION 
		WHEN TOO_MANY_PERSONS_PER_RESERVATION THEN
		DBMS_OUTPUT.PUT_LINE('Business policy cannot allow a reservation of more than 8 persons for one reservation.');
		ROLLBACK TO do_room_assignment;

	END IF;
FETCH cur_room INTO room_row;
END LOOP;
CLOSE cur_room;
END RoomAssignment;
/



-- Cancel reservation and free up associated room(s)
PROCEDURE ReservationCancellation(reserv_num NUMBER)
IS
room_reserved NUMBER(3);
room_avail_status NUMBER(10);
cust_num NUMBER(10);
CURSOR cur_reservation_canc IS
SELECT * FROM proj_room WHERE reservation_id = reserv_num;
reserv_canc_row cur_reservation_canc%ROWTYPE;
BEGIN
OPEN cur_reservation_canc;
FETCH cur_reservation_canc INTO reserv_canc_row;
WHILE cur_reservation_canc%FOUND LOOP
	SELECT room_id INTO room_reserved FROM proj_room WHERE proj_room.reservation_id = reserv_num;
	SELECT reservation_id INTO room_avail_status FROM proj_room WHERE proj_room.room_id = room_reserved;
	SELECT customer_id INTO cust_num FROM proj_reservation WHERE proj_reservation.reservation_id = reserv_num;
	IF room_avail_status IS NOT NULL THEN
		UPDATE proj_room SET proj_room.reservation_id = NULL WHERE room_id = room_reserved;
		DBMS_OUTPUT.PUT_LINE('Room number ' || room_reserved || ' is now available again.');
		
	END IF;
FETCH cur_select_pkg INTO pkg_row;
END LOOP;
CLOSE cur_reservation_canc;
DELETE FROM proj_reservation WHERE reservation_id = reserv_num;
DELETE FROM proj_customer WHERE customer_id = cust_num;
END ReservationCancellation;
/

-- Assign a specific reservation ID to a specified room on basis of analysis
-- performed in room_assignment procedure
PROCEDURE assignRoom(room_num NUMBER, reserv_num NUMBER)
IS 
BEGIN
UPDATE proj_room SET reservation_id = reserv_num WHERE room_id = room_num;
DBMS_OUTPUT.PUT_LINE('Room number ' || room_num || ' was successfully assigned to reservation no. ' || reserv_num);
END assignRoom;
/

-- Reduce base price of packages whose departure date is less than 10 days away
-- and capacity is less than or equal 75%
PROCEDURE LastMinPackageDeal(package_num NUMBER)
IS
cur_total_reservations NUMBER(4);
cur_poss_reservations NUMBER(4);
departure_date DATE;
days_left NUMBER(3);
BEGIN
SELECT sum(rm_capacity) INTO cur_total_reservations FROM proj_room rm JOIN proj_room_details rd ON rm.room_type=rd.room_type WHERE rm.ship_id = (SELECT
ship_id FROM proj_package WHERE package_id = package_num) AND rm.reservation_id IS NOT NULL;
SELECT sum(rm_capacity) INTO cur_poss_reservations FROM proj_room rm JOIN proj_room_details rd ON rm.room_type=rd.room_type WHERE rm.ship_id = (SELECT
ship_id FROM proj_package WHERE package_id = package_num);
SELECT depart_date INTO departure_date FROM proj_package WHERE package_id = package_num;
SELECT (departure_date - sysdate) INTO days_left FROM dual;
DBMS_OUTPUT.PUT_LINE('days left is ' || days_left);
IF days_left <= 10 AND (cur_total_reservations <= (cur_poss_reservations * 0.75)) THEN
	UPDATE proj_package SET reduced = 'Y' WHERE package_id = package_num;
	DBMS_OUTPUT.PUT_LINE('Package no. ' || package_num || ' is now selling at reduced price as a last-minute-package-deal');
END IF;

END LastMinPackageDeal;
/


-- Procedure to populate customer table and simultaneously the reservation and room tables
PROCEDURE FullReservation(package_num NUMBER, cust_fname NVARCHAR2, 
cust_lname NVARCHAR2, cust_addr NVARCHAR2, cust_phone NUMBER, cust_email NVARCHAR2, membership_chosen NVARCHAR2, qty_adults NUMBER, qty_child NUMBER)
IS
reduction NVARCHAR2(2);
payment_type NVARCHAR2(10);
reserv_num NUMBER(10);
BEGIN
SELECT reduced_price INTO reduction FROM proj_package WHERE package_id = package_num;
INSERT INTO proj_customer VALUES (NULL, cust_fname, cust_lname, cust_addr, cust_phone, cust_email);
INSERT INTO proj_reservation VALUES (NULL, current_timestamp, package_num, proj_cust_seq.currval, NULL);
SELECT proj_reserv_seq.currval INTO reserv_num FROM dual;
IF reduction = 'Y' THEN
	payment_type := 'SALE';
ELSE
	payment_type := 'FULL PRICE';
END IF;
UPDATE proj_reservation SET payment_offer = payment_type WHERE reservation_id = reserv_num;
RoomAssignment(proj_reserv_seq.currval, membership_chosen, qty_adults, qty_child);
END FullReservation;
/

-- Ship assignment for packages must
-- be stationed at dock and not out at sea hosting another package
-- This procedure is for assigning packages that currently do not
-- have a hosting ship, an appropriate ship.
PROCEDURE ShipAssignment(package_num NUMBER, ship_nbr NUMBER)
IS 
ship_depart_date DATE;
CURSOR cur_select_pkg IS
SELECT * FROM proj_package WHERE ship_id = ship_nbr;
pkg_row cur_select_pkg%ROWTYPE;
BEGIN
SELECT depart_date INTO ship_depart_date FROM proj_package WHERE package_id = package_num;
OPEN cur_select_pkg;
FETCH cur_select_pkg INTO pkg_row;
WHILE cur_select_pkg%FOUND LOOP
IF pkg_row.arrival_date > ship_depart_date THEN
RAISE_APPLICATION_ERROR(-20003, 'Ship not available for package. Still out at sea.');
ELSE
UPDATE proj_package SET ship_id = ship_nbr WHERE package_id = package_num;
END IF;
FETCH cur_select_pkg INTO pkg_row;
END LOOP;
CLOSE cur_select_pkg;
END ShipAssignment;
/

BEGIN -- Initialization
DBMS_OUTPUT.PUT_LINE('Initalizing package...');
END;
/

-- NB. Include code for testing all packages


/* PL/SQL Functions */

-- Calculate total cost of reservation for a specified reservation_id (per room, NOT person)
-- to invoice a customer

CREATE OR REPLACE FUNCTION CalculateTotalReservationCost(reserv_nbr NUMBER)
RETURN NUMBER
IS
reserv_total_cost NUMBER(10,2);
selected_pkg NUMBER(8);
res_price_status NVARCHAR2(10);
pkg_base_price NUMBER(10,2);
persons_rooms_reserved NUMBER(8);
BEGIN
SELECT payment_offer INTO res_price_staus FROM proj_reservation WHERE reservation_id = reserv_nbr;
SELECT package_id INTO selected_pkg FROM proj_reservation WHERE reservation_id = reserv_nbr;
SELECT base_price INTO pkg_base_price FROM proj_package WHERE package_id = selected_pkg;
SELECT sum(rm_capacity) INTO persons_rooms_reserved FROM proj_room rm join proj_room_details rd ON rm.room_type=rd.room_type 
WHERE rm.ship_id = (SELECT ship_id FROM proj_package WHERE package_id = selected_pkg) AND rm.reservation_id = reserv_nbr;
IF res_price_status = 'SALE' THEN
	reserv_total_cost := (pkg_base_price * 0.50);
ELSE
	reserv_total_cost := pkg_base_price;
END IF;

reserv_total_cost := reserv_total_cost * persons_rooms_reserved;

RETURN reserv_total_cost;
END CalculateTotalReservationCost;
/

-- Test for above function
SELECT CalculateTotalReservationCost(3) from dual;

-- Function to calculate total revenue accrued from all the reservations on a selected package
CREATE OR REPLACE FUNCTION TotalRevenueFromPkg(package_num NUMBER)
RETURN NUMBER
IS
total_rev NUMBER(15,2);
CURSOR cur_reservation 
IS
SELECT * FROM proj_reservation WHERE package_id = package_num;
reserv_row cur_reservation%ROWTYPE;
BEGIN
total_rev := 0;
OPEN cur_reservation;
FETCH cur_reservation INTO reserv_row;
WHILE cur_reservation%FOUND LOOP
total_rev := total_rev + CalculateTotalReservationCost(reserv_row.reservation_id);
FETCH cur_reservation INTO reserv_row;
END LOOP;
CLOSE cur_reservation;
RETURN total_rev;
END TotalRevenueFromPkg;
/

-- Test for latest function
SELECT TotalRevenueFromPkg(1) FROM dual;

/* Triggers */


-- Trigger to ensure that reservation can only include packages
-- that have not expired
CREATE OR REPLACE TRIGGER EXPIRED_PACKAGE
BEFORE INSERT OR UPDATE OF PACKAGE_ID ON PROJ_RESERVATION
FOR EACH ROW
DECLARE
package_start_date DATE;
INVALID_PACKAGE EXCEPTION;
--Associate an ORA error number to our user-defined exception
PRAGMA EXCEPTION_INIT(INVALID_PACKAGE, -20001);
BEGIN
SELECT depart_date INTO package_start_date FROM proj_package WHERE package_id = :NEW.package_id;
IF :NEW.PACKAGE_ID IS NOT NULL AND package_start_date < sysdate THEN
	DBMS_OUTPUT.PUT_LINE('This package is unavailable to reserve as it has already departed');
	RAISE INVALID_PACKAGE;
END IF;
EXCEPTION
-- Handle our custom exception, 'INVALID_PACKAGE' by printing package title and departure date
WHEN INVALID_package THEN
	DBMS_OUTPUT.PUT_LINE('Package  number ' || :NEW.package_id || ' departed on ' || package_start_date):
	RAISE;
END;
/

-- Ensure that no package lasts longer than 40 days
CREATE OR REPLACE TRIGGER PKG_EXCEEDS_NORMAL_DURATION
AFTER INSERT OR UPDATE OF ARRIVAL_DATE ON PROJ_PACKAGE
FOR EACH ROW
DECLARE
pkg_duration NUMBER;
BEGIN
pkg_duration := :NEW.arrival_date - :NEW.depart_date;
IF pk_duration > 40 THEN
	DBMS_OUTPUT.PUT_LINE('Package number ' || :NEW.package_id || ' is longer than normal duration. It runs for '
	|| pkg_duration || ' days.');
ELSE
	DBMS_OUTPUT.PUT_LINE('Package number ' || :NEW.package_id || ' runs for ' || pkg_duration || ' which is normal duration. ');
END IF;
END;
/

-- A package's arrival date must necessarily be AFTER its departure date
CREATE OR REPLACE TRIGGER INVALID_PKG_ARRIVAL_DATE
BEFORE INSERT OR UPDATE OF ARRIVAL_DATE ON PROJ_PACKAGE
FOR EACH ROW
DECLARE
INVALID_ARRIVAL_DATE EXCEPTION;
PRAGMA EXCEPTION_INIT(INVALID_ARRIVAL_DATE, -20003);
BEGIN
IF :NEW.ARRIVAL_DATE > :NEW.DEPART_DATE THEN
	DBMS_OUTPUT.PUT_LINE('Package departure date for ' || :NEW.package_title || ' is ' ||
	:NEW.depart_date || ' and arrival date is ' || :NEW.arrival_date);
ELSE
	DBMS_OUTPUT.PUT_LINE('Invalid package arrival date. Arrival date must succeed departure date. ');
	RAISE INVALID_ARRIVAL_DATE;
	END IF;
EXCEPTION
WHEN INVALID_ARRIVAL_DATE THEN
	DBMS_OUTPUT.PUT_LINE('Package  number ' || :NEW.package_id || ' departs on ' || :NEW.depart_date || '. Arrival date of ' || :NEW.arrival_date || ' is before departure date. ');
	RAISE;
END;
/


-- A ship can never change its colors (or route)
CREATE OR REPLACE TRIGGER SHIP_ROUTE_ASSIGNMENT
BEFORE INSERT OR UPDATE OF ROUTE_ID ON PROJ_SHIP
FOR EACH ROW
WHEN (OLD.ROUTE_ID IS NOT NULL AND NEW.ROUTE_ID IS NOT NULL)
DECLARE
SHIP_ROUTE_IMMUTABE EXCEPTION;
PRAGMA EXCEPTION_INIT(SHIP_ROUTE_IMMUTABLE, -20005);
BEGIN
IF :NEW.ROUTE_ID <> :OLD.ROUTE_ID THEN
	RAISE SHIP_ROUTE_IMMUTABLE;
END IF;
EXCEPTION
WHEN SHIP_ROUTE_IMMUTABLE THEN
DBMS_OUTPUT.PUT_LINE('Ship number ' || :NEW.ship_id || ' cannot change from route ' || :OLD.route_id ||
' to ' || :NEW.route_id);
RAISE;
END;
/


/* FINAL DRAFT
* COMP40725 Introduction to Relational Databases & SQL Programming
*
* Welcome to the Final Database Project!
*
* Student name: Noreen A. Lenihan
* Student ID: 13204807
* Course lecturer: Dr. Mark Scanlon
* Course TA: Alex Cronin, PhD candidate
* Submission date: Fri, 25 April 2014 00:00 GMT
* 
* This file is submittied in partial fulfilment of the project component
* of module COMP40725 Introduction to Relational Databases and SQL Programming.
*
*
* Part 1: Database Setup 
*
* The first part of this script is concerned with setting up the database
* and tables and populating each table with appropriate data.
* Importantly, each table and its constituent table attributes
* is fully concordant with the final, revised Entity-Relation
* diagram submitted prior (and later revised) as part of the
* Final Project Specification component. In all cases, apt
* primary and foreign keys are implemented, which are likewise
* clearly demarcated in the initial project specification. 
* In the majority of tables, more than the requested 10 rows of
* actual data was entered to simulate a real-life database,
* and its adoption in a corporate environment. However, where necessary,
* only a limited number of tuples are produced due to the 
* enforcement of business rules. A case in point is the 'proj_membership'
* table which was designed to store only 4 fours due to only
* 4 membership types (primary key) being offered by the business. 
* Since this was documented a priori, and is noted as a busines rule
* since the company's inception (!), the author hopes that this mild
* limitation will be compensated for by other data-rich tables.
* 
* Note: All SQL statements/queries are produced
* in full cognizance of programming conventions, that is,
* keywords and commands are written in UPPERCASE letters 
* and table/attribue names are in lowercase, as per convention.
* 
* First, create workspace entitled 'FINAL_PROJ' on the Application Express workspace
* (web interface). This task falls outside of the remit of sql queries.
*
* 
*/

-- Connect to schema
CONNECT FINAL_PROJ;
-- Enter password credentials

-- As per Oracle docs, we want to display the output (that is, DBMS_OUTPUT PUT_LINE) 
-- of stored procedures or PL/SQL blocks in SQL*Plus.
SET SERVEROUTPUT ON;

-- Set autocommit feature to off to control when Oracle Database 
-- commits pending changes to the database (Reference: Oracle docs)
SET AUTOCOMMIT OFF;

-- Table structure to map Route entity
CREATE TABLE proj_route (
route_id NUMBER(10) NOT NULL,
route_name NVARCHAR2(20) NULL,
PRIMARY KEY(route_id)
);

-- Show table structure to confirm
DESCRIBE proj_route;

-- Create sequence for route table
CREATE SEQUENCE proj_route_seq
START WITH 1
-- Increment by 1 each time
INCREMENT BY 1;

-- Create trigger to auto-increment route_id with each insertion on proj_route table
CREATE OR REPLACE TRIGGER proj_route_inc
BEFORE INSERT ON proj_route
FOR EACH ROW
BEGIN
SELECT proj_route_seq.NEXTVAL
INTO :NEW.route_id
FROM DUAL;
END;
/

-- Dump data for Route table

-- Route entry for the 'Carribean route'
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'CAR'); 
-- Route entry for the 'Mediterranean' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'MED'); 
-- Route entry for the 'Alaskan' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'ASK'); 
-- Route entry for the 'South American' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'SAMR'); 
-- Route entry for the 'Australasian' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'AUS'); 
-- Route entry for the 'Dubai' (and its surrouding enclave) route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'DUB');
-- Route entry for the 'Asian' route 
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'ASI'); 
-- Route entry for the 'Bahamas' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'BAH');
-- Route entry for the 'Scandivinavian' route 
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'SCN'); 
-- Route entry for the 'Canary Islands' route
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'CNR');
-- Route entry for the 'Hawaiian' route 
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'HWI'); 
-- Route entry for the 'Antartican' route 
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'ANT'); 
-- Route entry for the 'Galapagos' route 
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'GAL');
-- Route entry for the 'Transatlantic' route 
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'ATL'); 
-- Route entry for the 'Pacific Coastal' route 
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'PAC'); 
-- Route entry for the 'Transpacific' route 
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'TPAC'); 
-- Route entry for the 'Northeast USA' route 
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'NAMR');
-- Route entry for the 'African' route 
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'AFR'); 
-- Route entry for the 'European' route 
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'EUR');
-- Route entry for the 'Maritime Canada and New England' route 
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'CAN');   
-- Route entry for the 'Around the World' route 
INSERT INTO proj_route (route_id, route_name) VALUES (NULL, 'WOR'); 

-- Apply changes to database
COMMIT;

-- View all data in proj_route table to verify accurate insertions
SELECT * FROM proj_route;

-- Table structure for Port_Country
CREATE TABLE proj_port_country (
port_city NVARCHAR2(30) NOT NULL,
country NVARCHAR2(30) NOT NULL,
PRIMARY KEY(port_city)
);

-- Observe table structure
DESCRIBE proj_port_country;

-- Dump data for Port_Country
-- Entry to define the port included in the Carribean route
INSERT INTO proj_port_country (port_city, country) VALUES ('St John', 'Antigua');
INSERT INTO proj_port_country (port_city, country) VALUES ('Oranjestad', 'Aruba');
INSERT INTO proj_port_country (port_city, country) VALUES ('Bridgetown', 'Barbados');
INSERT INTO proj_port_country (port_city, country) VALUES ('Belize City', 'Belize');
INSERT INTO proj_port_country (port_city, country) VALUES ('Kralendijk', 'Bonaire');
INSERT INTO proj_port_country (port_city, country) VALUES ('Costa Maya', 'Mexico');
INSERT INTO proj_port_country (port_city, country) VALUES ('Cozumel', 'Mexico');
INSERT INTO proj_port_country (port_city, country) VALUES ('Roseau', 'Dominica');
INSERT INTO proj_port_country (port_city, country) VALUES ('St George', 'Grenada');


-- Entry to define the ports included in the Bahamas route 
INSERT INTO proj_port_country (port_city, country) VALUES ('Nassau', 'Bahamas');
INSERT INTO proj_port_country (port_city, country) VALUES ('Little Stirrup Cay', 'Bahamas'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Coca Cay', 'Bahamas'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Freeport', 'Bahamas'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Fort Lauderale', 'USA'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Key West', 'USA'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Princess Cays', 'Bahamas'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Half Moon Cay', 'Bahamas'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Miami', 'Florida'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Great Stirrup Cay', 'Bahamas'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Castaway Cay', 'Bahamas'); 

-- Entry to define the ports covered by the Mediterranean route
INSERT INTO proj_port_country (port_city, country) VALUES ('Athens', 'Greece');
INSERT INTO proj_port_country (port_city, country) VALUES ('Barcelona', 'Spain'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Dubrovnik', 'Croatia'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Istanbul', 'Turkey'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Lisbon', 'Portugal'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Rome', 'Italy'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Saritonni', 'Greece'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Valletta', 'Malta'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Venice', 'Italy');
INSERT INTO proj_port_country (port_city, country) VALUES ('Villefranche-sur-Mer', 'France');  


-- Entry for the ports involved in the Alaskan route
INSERT INTO proj_port_country (port_city, country) VALUES ('Anchorage', 'USA'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Haines', 'USA'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Juneau', 'USA'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Ketchikan', 'USA'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Nome', 'USA'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Seward', 'USA'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Sitka', 'USA'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Valdez', 'USA'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Whittier', 'USA'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('College Fjord', 'USA'); 


-- Entry for the ports that are part of South American
INSERT INTO proj_port_country (port_city, country) VALUES ('Antofagasta', 'Chile');
INSERT INTO proj_port_country (port_city, country) VALUES ('Arica', 'Chile');
INSERT INTO proj_port_country (port_city, country) VALUES ('Belem', 'Brazil');
INSERT INTO proj_port_country (port_city, country) VALUES ('Buenos Aires', 'Argentina');
INSERT INTO proj_port_country (port_city, country) VALUES ('Castro', 'Chile');
INSERT INTO proj_port_country (port_city, country) VALUES ('General San Martin', 'Peru');
INSERT INTO proj_port_country (port_city, country) VALUES ('Los Roques', 'Venezuela');
INSERT INTO proj_port_country (port_city, country) VALUES ('Montevideo', 'Uruguay');
INSERT INTO proj_port_country (port_city, country) VALUES ('Port Stanley', 'Falkland Islands');
INSERT INTO proj_port_country (port_city, country) VALUES ('Rio de Janeiro', 'Brazil');
INSERT INTO proj_port_country (port_city, country) VALUES ('Salvador', 'Brazil');

-- Entry for ports part of the Australasian route
INSERT INTO proj_port_country (port_city, country) VALUES ('Sydney', 'Australia');
INSERT INTO proj_port_country (port_city, country) VALUES ('Brisbane', 'Australia'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Cairns', 'Australia'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Christchurch', 'New Zealand'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Rotorua', 'New Zealand'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Auckland', 'New Zealand'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Wellington', 'New Zealand'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Dunedin', 'New Zealand'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Suva', 'Fiji'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Vavau', 'Tonga'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Tahiti', 'French Polynesia'); 

-- Port-countries for Dubai and its surrounding ports
INSERT INTO proj_port_country (port_city, country) VALUES ('Dubai', 'United Arab Emirates'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Abu Dhabi', 'United Arab Emirates'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Aquaba', 'Jordan'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Haifa', 'Israel'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Jerusalem', 'Israel'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Muscat', 'Oman'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Salalah', 'Oman'); 


-- Entry for ports as part of the Asian route
INSERT INTO proj_port_country (port_city, country) VALUES ('Bali', 'Indonesia'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Bangkok', 'Thailand'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Beijing', 'China'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Mumbai', 'India'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Busan', 'South Korea'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Chan May', 'Vietnam'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Colombo', 'Sri Lanka'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Fukouka', 'Japan'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Da Nang', 'Vietnam'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Hanoi', 'Vietnam'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Kobe', 'Japan'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Kuala Lumpar', 'Malaysia'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Palawan', 'The Philippines'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Shanghai', 'China'); 

-- Entry for ports as part of the Scandinavian route
INSERT INTO proj_port_country (port_city, country) VALUES ('Copenhagen', 'Denmark');
INSERT INTO proj_port_country (port_city, country) VALUES ('Oslo', 'Norway');
INSERT INTO proj_port_country (port_city, country) VALUES ('Aarhus', 'Denmark');
INSERT INTO proj_port_country (port_city, country) VALUES ('Tallin', 'Estonia');
INSERT INTO proj_port_country (port_city, country) VALUES ('Warnemunde', 'Germany');
INSERT INTO proj_port_country (port_city, country) VALUES ('St Petersburg', 'Russia');
INSERT INTO proj_port_country (port_city, country) VALUES ('Helsinki', 'Finland');
INSERT INTO proj_port_country (port_city, country) VALUES ('Stockholm', 'Sweden');


-- Entry for ports part of the Canary Islands
INSERT INTO proj_port_country (port_city, country) VALUES ('Arrecife', 'Lanzarote');
INSERT INTO proj_port_country (port_city, country) VALUES ('Fuerteventura', 'Canary Islands'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Grand Canary Islands', 'Canary Islands'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('La Gomera', 'Canary Islands'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('La Palma', 'Canary Islands'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Santa Cruz Tenerife', 'Canary Islands');  

-- Entry for ports part of the Hawaiian route
INSERT INTO proj_port_country (port_city, country) VALUES ('Hilo', 'Hawaii'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Honolulu', 'Hawaii'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Kauai', 'Hawaii'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Kona', 'Hawaii'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Maui', 'Hawaii'); 


-- Entry for ports part of Antartican cruises
INSERT INTO proj_port_country (port_city, country) VALUES ('Ushuaia', 'Argentina');
INSERT INTO proj_port_country (port_city, country) VALUES ('Wilhelm Archipelago', 'Antartica');
INSERT INTO proj_port_country (port_city, country) VALUES ('Paradise Bay', 'Antartica');
INSERT INTO proj_port_country (port_city, country) VALUES ('Cape Horn', 'Chile');
INSERT INTO proj_port_country (port_city, country) VALUES ('Antartica Peninsula', 'Antartica');
INSERT INTO proj_port_country (port_city, country) VALUES ('Elephant Islands', 'Antartica');
INSERT INTO proj_port_country (port_city, country) VALUES ('South Shetlands Islands', 'Antartica');

-- Entries for ports along the Galapagos route
INSERT INTO proj_port_country (port_city, country) VALUES ('Puerto Velasco', 'Isla Florena'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Baltra', 'Galapagos Islands'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Isabela', 'Galapagos Islands'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('North Seymour', 'Galapagos Islands'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Rabida', 'Galapagos Islands'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Santa Cruz', 'Galapagos Islands'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Santiago', 'Galapagos Islands'); 
INSERT INTO proj_port_country (port_city, country) VALUES ('Fernandina', 'Galapagos Islands'); 

-- Entries for ports along the Transatlantic route
INSERT INTO proj_port_country (port_city, country) VALUES ('New York City', 'USA');
INSERT INTO proj_port_country (port_city, country) VALUES ('Boston', 'USA');
INSERT INTO proj_port_country (port_city, country) VALUES ('Hamburg', 'Germany');


-- Entries for ports along South Pacific coastal route 
INSERT INTO proj_port_country (port_city, country) VALUES ('Bora Bora', 'French Polynesia');
INSERT INTO proj_port_country (port_city, country) VALUES ('Pao Pao', 'Moorea');
INSERT INTO proj_port_country (port_city, country) VALUES ('Pago Pago', 'American Samoa');
INSERT INTO proj_port_country (port_city, country) VALUES ('Avatoru', 'Rangiroa');
INSERT INTO proj_port_country (port_city, country) VALUES ('Nadi', 'Fiji');


-- Entries for ports along Transpacific route
INSERT INTO proj_port_country (port_city, country) VALUES ('Lautoka', 'Fiji');
INSERT INTO proj_port_country (port_city, country) VALUES ('Noumea', 'New Caledonia');


-- Entries for ports in North American cruises
INSERT INTO proj_port_country (port_city, country) VALUES ('Baltimore', 'USA');
INSERT INTO proj_port_country (port_city, country) VALUES ('Cape Liberty', 'USA');
INSERT INTO proj_port_country (port_city, country) VALUES ('Charleston', 'USA');
INSERT INTO proj_port_country (port_city, country) VALUES ('Galveston', 'USA');
INSERT INTO proj_port_country (port_city, country) VALUES ('Los Angeles', 'USA');
INSERT INTO proj_port_country (port_city, country) VALUES ('Philadelphia', 'USA');
INSERT INTO proj_port_country (port_city, country) VALUES ('San Diego', 'USA');
INSERT INTO proj_port_country (port_city, country) VALUES ('San Juan', 'Puerto Rico');
INSERT INTO proj_port_country (port_city, country) VALUES ('Seattle', 'USA');
INSERT INTO proj_port_country (port_city, country) VALUES ('Tampa', 'USA');

-- Entries for ports as part of African route 
INSERT INTO proj_port_country (port_city, country) VALUES ('Accra', 'Ghana');
INSERT INTO proj_port_country (port_city, country) VALUES ('Antsiranana', 'Madagascar');
INSERT INTO proj_port_country (port_city, country) VALUES ('Banjul', 'Gambia');
INSERT INTO proj_port_country (port_city, country) VALUES ('Cape Town', 'South Africa');
INSERT INTO proj_port_country (port_city, country) VALUES ('Dakar', 'Senagal');
INSERT INTO proj_port_country (port_city, country) VALUES ('Durban', 'South Africa');
INSERT INTO proj_port_country (port_city, country) VALUES ('Inhambane', 'Mozambique');
INSERT INTO proj_port_country (port_city, country) VALUES ('Mombasa', 'Kenya');
INSERT INTO proj_port_country (port_city, country) VALUES ('Zanzibar', 'Tanzania');

-- Entries of ports as part of the European cruises
INSERT INTO proj_port_country (port_city, country) VALUES ('South Hampton', 'UK');
INSERT INTO proj_port_country (port_city, country) VALUES ('Paris', 'France');
INSERT INTO proj_port_country (port_city, country) VALUES ('Brugge', 'Belgium');
INSERT INTO proj_port_country (port_city, country) VALUES ('London', 'UK');

-- Entries for ports as part of the Maritime Canada and New England route
INSERT INTO proj_port_country (port_city, country) VALUES ('Baddeck', 'Canada');
INSERT INTO proj_port_country (port_city, country) VALUES ('Coburg Island', 'Canada');
INSERT INTO proj_port_country (port_city, country) VALUES ('Quebec City', 'Canada');
INSERT INTO proj_port_country (port_city, country) VALUES ('Toronto', 'Canada');
INSERT INTO proj_port_country (port_city, country) VALUES ('Halifax', 'Canada');
INSERT INTO proj_port_country (port_city, country) VALUES ('Iqaluit', 'Canada');
INSERT INTO proj_port_country (port_city, country) VALUES ('Kingston', 'USA');
INSERT INTO proj_port_country (port_city, country) VALUES ('Montreal', 'Canada');
INSERT INTO proj_port_country (port_city, country) VALUES ('Nantucket', 'USA');
INSERT INTO proj_port_country (port_city, country) VALUES ('Vancouver BC', 'Canada');

-- Entries for ports as part of the Around-the-World cruises
INSERT INTO proj_port_country (port_city, country) VALUES ('Hong Kong', 'China');

-- Apply changes to DB
COMMIT;

-- View all new data in proj_port_country table
SELECT * FROM proj_port_country;

-- Table structure mapping Port entity
CREATE TABLE proj_port (
port_id NUMBER(10) NOT NULL,
port_city NVARCHAR2(30) NOT NULL,
docking_area NVARCHAR2(10) NULL,
PRIMARY KEY(port_id),
FOREIGN KEY(port_city) REFERENCES proj_port_country(port_city)
);

-- Add a unique constraint to the port_city column to ensure each
-- port city is only included once
ALTER TABLE proj_port ADD CONSTRAINT port_unique UNIQUE (port_city);

-- Show description of table
DESCRIBE proj_port;

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

INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'St John', 'Section100'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Oranjestad', 'Section101'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Bridgetown', 'Section102');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Belize City', 'Section103'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Kralendijk', 'Section104'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Costa Maya', 'Section105'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Cozumel', 'Section106');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Roseau', 'Section107'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'St George', 'Section108');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Nassau', 'Section109'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Little Stirrup Cay', 'Section110'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Coca Cay', 'Section111'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Freeport', 'Section112'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Fort Lauderale', 'Section113'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Key West', 'Section114'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Princess Cays', 'Section115'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Half Moon Cay', 'Section116'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Miami', 'Section117'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Great Stirrup Cay', 'Section118'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Castaway Cay', 'Section119'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Athens', 'Section120'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Barcelona', 'Section121'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Dubrovnik', 'Section122'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Istanbul', 'Section123');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Lisbon', 'Section124');  
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Rome', 'Section125'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Saritonni', 'Section126');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Valletta', 'Section127');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Venice', 'Section128'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Villefranche-sur-Mer', 'Section129');  
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Anchorage', 'Section130');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Haines', 'Section131');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Juneau', 'Section132'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Ketchikan', 'Section133');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Nome', 'Section134');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Seward', 'Section135');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Sitka', 'Section136');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Valdez', 'Section137');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Whittier', 'Section138');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'College Fjord', 'Section139');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Antofagasta', 'Section140');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Arica', 'Section141');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Belem', 'Section142');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Buenos Aires', 'Section143');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Castro', 'Section144'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'General San Martin', 'Section145');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Los Roques', 'Section146');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Montevideo', 'Section147');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Port Stanley', 'Section148');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Rio de Janeiro', 'Section149');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Salvador', 'Section150');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Sydney', 'Section151');   
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Brisbane', 'Section152');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Cairns', 'Section153');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Christchurch', 'Section154');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Rotorua', 'Section155');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Auckland', 'Section156');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Wellington', 'Section157');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Dunedin', 'Section158');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Suva', 'Section159');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Vavau', 'Section160');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Tahiti', 'Section161');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Dubai', 'Section162');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Abu Dhabi', 'Section163');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Aquaba', 'Section164');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Haifa', 'Section165');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Jerusalem', 'Section166');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Muscat', 'Section167');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Salalah', 'Section168'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Bali', 'Section169');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Bangkok', 'Section170');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Beijing', 'Section171');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Mumbai', 'Section172');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Busan', 'Section173');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Chan May', 'Section174');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Colombo', 'Section175');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Fukouka', 'Section176');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Da Nang', 'Section177');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Hanoi', 'Section178');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Kobe', 'Section179');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Kuala Lumpar', 'Section180');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Palawan', 'Section181');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Shanghai', 'Section182');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Copenhagen', 'Section183');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Oslo', 'Section184');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Aarhus', 'Section185');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Tallin', 'Section186');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Warnemunde', 'Section187');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'St Petersburg', 'Section188');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Helsinki', 'Section189');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Stockholm', 'Section190');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Arrecife', 'Section191');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Fuerteventura', 'Section192');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Grand Canary Islands', 'Section193');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'La Gomera', 'Section194');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'La Palma', 'Section195');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Santa Cruz Tenerife', 'Section196');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Hilo', 'Section197');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Honolulu', 'Section198');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Kauai', 'Section199');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Kona', 'Section200');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Maui', 'Section201');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Ushuaia', 'Section202');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Wilhelm Archipelago', 'Section203');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Paradise Bay', 'Section204');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Cape Horn', 'Section205');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Antartica Peninsula', 'Section206');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Elephant Islands', 'Section207');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'South Shetlands Islands', 'Section208'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Puerto Velasco', 'Section209');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Baltra', 'Section210');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Isabela', 'Section211');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'North Seymour', 'Section212');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Rabida', 'Section213');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Santa Cruz', 'Section214');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Santiago', 'Section215');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Fernandina', 'Section216');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'New York City', 'Section217');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Boston', 'Section218');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Hamburg', 'Section219');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Bora Bora', 'Section220');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Pao Pao', 'Section221');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Pago Pago', 'Section222');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Avatoru', 'Section223');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Nadi', 'Section224');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Lautoka', 'Section225');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Noumea', 'Section226');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Baltimore', 'Section227');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Cape Liberty', 'Section228'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Charleston', 'Section229');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Galveston', 'Section230');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Los Angeles', 'Section231');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Philadelphia', 'Section232');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'San Diego', 'Section233');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'San Juan', 'Section234');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Seattle', 'Section235');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Tampa', 'Section236');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Accra', 'Section237');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Antsiranana', 'Section238');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Banjul', 'Section239');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Cape Town', 'Section240');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Dakar', 'Section241');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Durban', 'Section242');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Inhambane', 'Section243');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Mombasa', 'Section244');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Zanzibar', 'Section245');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'South Hampton', 'Section246');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Paris', 'Section248');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Brugge', 'Section249');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'London', 'Section250');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Baddeck', 'Section251');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Coburg Island', 'Section252'); 
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Quebec City', 'Section253');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Halifax', 'Section254');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Iqaluit', 'Section255');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Kingston', 'Section256');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Montreal', 'Section257');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Nantucket', 'Section258');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Toronto', 'Section260');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Vancouver BC', 'Section261');
INSERT INTO proj_port (port_id, port_city, docking_area) VALUES (NULL, 'Hong Kong', 'Section262');
                                                                         
-- Apply data to database and then view table with data
COMMIT;
SELECT * FROM proj_port;


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

DESCRIBE proj_ship;

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
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Commander of the Sea', 'ocean liner', 176980, 1540, 35, 2600, NULL);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Queen Elizabeth II', 'cruise ship', 181900, 1240, 28, 2300, NULL);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'The Hawthorne', 'cruise ship', 176980, 1320, 27, 2100, 11);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Garden of the Sea', 'cruise ship', 165000, 1210, 26, 1800, 12);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Transformer of the Sea', 'cruise ship', 150100, 1342, 25, 3800, 13);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Soul of the Sea', 'ocean liner', 132345, 1940, 21, 3000, 14);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Ruler of the Sea', 'cruise ship', 154180, 1600, 22, 2500, NULL);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Heaven of the Sea', 'ocean liner', 153211, 1623, 27, 2430, 15);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Perfection of the Sea', 'ocean liner', 261123, 1340, 36, 2700, 16);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Zeus of the Sea', 'cruise ship', 251134, 1840, 33, 2200, 17);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Hercules of the Sea', 'ocean liner', 124880, 1250, 33, 1800, 18);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Apollo of the Sea', 'cruise ship', 166980, 1140, 25, 1200, 19);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Dionysus of the Sea', 'ocean liner', 116980, 2240, 29, 2100, 20);
INSERT INTO proj_ship (ship_id, ship_name, ship_type, grt, ship_length, ship_speed, ship_capacity, route_id) VALUES
(NULL, 'Venus of the Sea', 'cruise ship', 136980, 1340, 36, 1970, 21);

COMMIT;
SELECT * FROM proj_ship;


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

DESCRIBE proj_package;

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
(NULL, 'Asian Adventure Spring 2014', TO_DATE('15/03/2014', 'DD/MM/YYYY'), TO_DATE('29/04/2014', 'DD/MM/YYYY'), 1599, NULL, 7);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Carribean Cruisin Spring 2014', TO_DATE('21/04/2014', 'DD/MM/YYYY'), TO_DATE('20/05/2014', 'DD/MM/YYYY'), 1999, NULL, 1);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Mediterranean Manna Spring 2014', TO_DATE('15/03/2014', 'DD/MM/YYYY'), TO_DATE('29/04/2014', 'DD/MM/YYYY'), 799, NULL, 2);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Carribean Cruisin Winter 2014', TO_DATE('02/11/2014', 'DD/MM/YYYY'), TO_DATE('01/12/2014', 'DD/MM/YYYY'), 1450, NULL, 1);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Alaskan Antics Spring 2014', TO_DATE('11/03/2014', 'DD/MM/YYYY'), TO_DATE('30/04/2014', 'DD/MM/YYYY'), 1600, NULL, 3);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Alaskan Antics Autumn 2014', TO_DATE('11/09/2014', 'DD/MM/YYYY'), TO_DATE('12/10/2014', 'DD/MM/YYYY'), 1780, NULL, 3);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'South American Solace Spring 2014', TO_DATE('05/04/2014', 'DD/MM/YYYY'), TO_DATE('31/05/2014', 'DD/MM/YYYY'), 899, NULL, 4);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'South American Solace Autumn 2014', TO_DATE('30/08/2014', 'DD/MM/YYYY'), TO_DATE('15/09/2014', 'DD/MM/YYYY'), 1200, NULL, 4);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Anthem of Australia Spring 2015', TO_DATE('11/03/2015', 'DD/MM/YYYY'), TO_DATE('20/03/2015', 'DD/MM/YYYY'), 650, NULL, 5);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Anthem of Australia Summer 2015', TO_DATE('20/05/2015', 'DD/MM/YYYY'), TO_DATE('11/06/2015', 'DD/MM/YYYY'), 950, NULL, 5);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Scandinavian Skies Autumn 2014', TO_DATE('10/08/2014', 'DD/MM/YYYY'), TO_DATE('14/09/2014', 'DD/MM/YYYY'), 1800, NULL, 9);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Baltic Bliss Summer 2014', TO_DATE('10/05/2014', 'DD/MM/YYYY'), TO_DATE('14/06/2014', 'DD/MM/YYYY'), 1800, NULL, NULL);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Bahamas Bundle of Joy Summer 2014', TO_DATE('22/05/2014', 'DD/MM/YYYY'), TO_DATE('23/06/2014', 'DD/MM/YYYY'), 2200, NULL, NULL);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Dubai Nights Autumn 2014', TO_DATE('10/08/2014', 'DD/MM/YYYY'), TO_DATE('14/09/2014', 'DD/MM/YYYY'), 2900, NULL, NULL);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Dubai Nights Winter 2014', TO_DATE('09/11/2014', 'DD/MM/YYYY'), TO_DATE('15/12/2014', 'DD/MM/YYYY'), 2100, NULL, 6);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Dubai Nights Summer 2014', TO_DATE('22/06/2014', 'DD/MM/YYYY'), TO_DATE('11/07/2014', 'DD/MM/YYYY'), 3300, NULL, 6);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Canary Fairy Summer 2015', TO_DATE('01/06/2014', 'DD/MM/YYYY'), TO_DATE('01/07/2014', 'DD/MM/YYYY'), 3900, NULL, 9);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Hawaiian Heaven Autumn 2014', TO_DATE('15/08/2014', 'DD/MM/YYYY'), TO_DATE('01/09/2014', 'DD/MM/YYYY'), 4500, NULL, 13);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Hawaiian Heaven Winter 2014', TO_DATE('29/11/2014', 'DD/MM/YYYY'), TO_DATE('22/12/2014', 'DD/MM/YYYY'), 3850, NULL, 13);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Antartica Awakens Summer 2014', TO_DATE('08/06/2014', 'DD/MM/YYYY'), TO_DATE('09/07/2014', 'DD/MM/YYYY'), 5100, NULL, 14);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Antartica Awakens Autumn 2014', TO_DATE('13/08/2014', 'DD/MM/YYYY'), TO_DATE('01/09/2014', 'DD/MM/YYYY'), 4600, NULL, 14);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Galapagos Gathering Autumn 2014', TO_DATE('17/08/2014', 'DD/MM/YYYY'), TO_DATE('18/09/2014', 'DD/MM/YYYY'), 5600, NULL, 15);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Transatlantic Titanium Summer 2014', TO_DATE('10/05/2014', 'DD/MM/YYYY'), TO_DATE('11/06/2014', 'DD/MM/YYYY'), 4200, NULL, 16);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'South Pacific Sojourn Winter 2014', TO_DATE('17/11/2014', 'DD/MM/YYYY'), TO_DATE('18/12/2014', 'DD/MM/YYYY'), 4900, NULL, 18);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'Transpacific Travelling Winter 2014', TO_DATE('12/11/2014', 'DD/MM/YYYY'), TO_DATE('29/11/2014', 'DD/MM/YYYY'), 3600, NULL, 19);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'The American Dream Summer 2014', TO_DATE('21/06/2014', 'DD/MM/YYYY'), TO_DATE('10/07/2014', 'DD/MM/YYYY'), 5000, NULL, 20);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'African Wonders Autumn 2014', TO_DATE('01/09/2014', 'DD/MM/YYYY'), TO_DATE('18/10/2014', 'DD/MM/YYYY'), 4600, NULL, 21);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'African Wonders Winter 2014', TO_DATE('25/11/2014', 'DD/MM/YYYY'), TO_DATE('21/12/2014', 'DD/MM/YYYY'), 5700, NULL, 21);
INSERT INTO proj_package (package_id, package_title, depart_date, arrival_date, base_price, reduced_price, ship_id) VALUES
(NULL, 'European Eureka Winter 2014', TO_DATE('01/12/2014', 'DD/MM/YYYY'), TO_DATE('03/01/2015', 'DD/MM/YYYY'), 3800, NULL, 22);



COMMIT;
SELECT * FROM proj_package;


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

DESCRIBE proj_customer;

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
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Ruairi', 'Quinn',
'1 Main St, Monkstown, Dublin, Ireland', 00353872172, 'rquinn@thedail.ie');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Lauren', 'DeBurg',
'23 Rue de Pommes Paris France', 0011244723, 'ldeburg@thesomme.fr');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Kelly', 'Thompson',
'56 Nottingham Ave, Nottingham, UK', 00112345222, 'kellytho@company.co.uk');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Lily', 'May',
'114 Beaver Lake, Baltimore, MA, US', 0022322883, 'lilymay@mit.edu');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Susan', 'Hope',
'10 The Bath, Auckland, New Zealand', 0011422311, 'susiehopes@kiwi.nz');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Britney', 'Albany',
'23 The Highlands, Halifax, Nova Scotia, Canada', 009942882, 'britters@canadacalling.ca');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Scott', 'Daniels',
'24 San Diago, California, USA', 0883223392, 'scottysays@cali.edu');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Donald', 'Bump',
'41 St, New York City, NY, USA', 0977922323, 'dbump@johnjaycollege.edu');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Laura', 'DiFratio',
'31 Prada Strz Prague Czech Republic', 832992322, 'ldifratio@prague.cz');
INSERT INTO proj_customer (customer_id, fname, lname, addr, phone, email) VALUES (NULL, 'Lena', 'Durham',
'32 Jersey Shore, New Jersey, USA', 98399831913, 'hannah@hbo.com');

COMMIT;
SELECT * FROM proj_customer;


-- Table structure for Membership entity
CREATE TABLE proj_membership (
membership_type NVARCHAR2(10) NOT NULL,
percent_add_on NUMBER(6) NULL,
PRIMARY KEY(membership_type)
);

DESCRIBE proj_membership;

-- Dump data for proj_membership_type
INSERT INTO proj_membership (membership_type, percent_add_on) VALUES ('platinum', 20);
INSERT INTO proj_membership (membership_type, percent_add_on) VALUES ('gold', 15);
INSERT INTO proj_membership (membership_type, percent_add_on) VALUES ('silver', 8);
INSERT INTO proj_membership (membership_type, percent_add_on) VALUES ('bronze', 5);

COMMIT;
SELECT * FROM proj_membership;

-- Table structure for Reservation entity
CREATE TABLE proj_reservation (
reservation_id NUMBER(10) NOT NULL,
date_reservation TIMESTAMP NULL,
invoice NUMBER(10,2) NULL,
payment_offer NVARCHAR2(10) NULL,
package_id NUMBER(10) NOT NULL,
customer_id NUMBER(10) NOT NULL,
PRIMARY KEY(reservation_id),
FOREIGN KEY(package_id) REFERENCES proj_package(package_id),
FOREIGN KEY(customer_id) REFERENCES proj_customer(customer_id)
);

DESCRIBE proj_reservation;

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
INSERT INTO proj_reservation (reservation_id, date_reservation, invoice, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 20, NULL, 'FULL PRICE', 1, 1);
INSERT INTO proj_reservation (reservation_id, date_reservation, invoice, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 10, NULL, 'FULL PRICE', 2, 10);
INSERT INTO proj_reservation (reservation_id, date_reservation, invoice, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 20, NULL, 'FULL PRICE', 3, 9);
INSERT INTO proj_reservation (reservation_id, date_reservation, invoice, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 30, NULL, 'FULL PRICE', 3, 5);
INSERT INTO proj_reservation (reservation_id, date_reservation, invoice, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 150, NULL, 'FULL PRICE', 5, 6);
INSERT INTO proj_reservation (reservation_id, date_reservation, invoice, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 34, NULL, 'FULL PRICE', 5, 2);
INSERT INTO proj_reservation (reservation_id, date_reservation, invoice, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 10, NULL, 'FULL PRICE', 7, 7);
INSERT INTO proj_reservation (reservation_id, date_reservation, invoice, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 13, NULL, 'FULL PRICE', 7, 8);
INSERT INTO proj_reservation (reservation_id, date_reservation, invoice, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 11, NULL, 'FULL PRICE', 1, 4);
INSERT INTO proj_reservation (reservation_id, date_reservation, invoice, payment_offer, package_id, customer_id)
VALUES (NULL, CURRENT_TIMESTAMP - 22, NULL, 'FULL PRICE', 1, 3);

COMMIT;
SELECT * FROM proj_reservation;


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

COMMIT;
SELECT * FROM proj_room_details;


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

COMMIT;
SELECT * FROM proj_room_status;


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
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'luxury', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'deluxe with balcony', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'standard', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'business', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'executive', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'ultimate', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'luxury', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'deluxe with balcony', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'standard', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'business', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'executive', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'ultimate', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'luxury', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'deluxe with balcony', 1, 2);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'standard', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'business', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'executive', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'ultimate', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'luxury', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'deluxe with balcony', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'standard', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'business', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'executive', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'ultimate', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'luxury', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'deluxe with balcony', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'standard', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'business', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'executive', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'ultimate', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'luxury', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'deluxe with balcony', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'standard', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'business', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'executive', 1, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'ultimate', 1, NULL);

INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'luxury', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'deluxe with balcony', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'standard', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'business', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'executive', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'ultimate', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'luxury', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'deluxe with balcony', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'standard', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'business', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'executive', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'ultimate', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'luxury', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'deluxe with balcony', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'standard', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'business', 2, 4);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'executive', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'ultimate', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'luxury', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'deluxe with balcony', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'standard', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'business', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'executive', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'ultimate', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'luxury', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'deluxe with balcony', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'standard', 2, 3);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'business', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'executive', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'ultimate', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'luxury', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'deluxe with balcony', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'standard', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'business', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'executive', 2, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'ultimate', 2, NULL);

INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'luxury', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'deluxe with balcony', 3, 6);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'standard', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'business', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'executive', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'ultimate', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'luxury', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'deluxe with balcony', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'standard', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'business', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'executive', 3, 5);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'ultimate', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'luxury', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'deluxe with balcony', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'standard', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'business', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'executive', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'ultimate', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'luxury', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'deluxe with balcony', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'standard', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'business', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'executive', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'ultimate', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'luxury', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'deluxe with balcony', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'standard', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'business', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'executive', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'ultimate', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'luxury', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'deluxe with balcony', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'standard', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'business', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'executive', 3, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'ultimate', 3, NULL);

INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'luxury', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'deluxe with balcony', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'standard', 4, 7);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'business', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'executive', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'ultimate', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'luxury', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'deluxe with balcony', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'standard', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'business', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'executive', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'ultimate', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'luxury', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'deluxe with balcony', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'standard', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'business', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'executive', 4, 8);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'ultimate', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'luxury', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'deluxe with balcony', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'standard', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'business', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'executive', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'ultimate', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'luxury', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'deluxe with balcony', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'standard', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'business', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'executive', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'ultimate', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'luxury', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'deluxe with balcony', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'standard', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'business', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'executive', 4, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'ultimate', 4, NULL);

INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'luxury', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'deluxe with balcony', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'standard', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'business', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'executive', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'ultimate', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'luxury', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'deluxe with balcony', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'standard', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'business', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'executive', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'ultimate', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'luxury', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'deluxe with balcony', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'standard', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'business', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'executive', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'ultimate', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'luxury', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'deluxe with balcony', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'standard', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'business', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'executive', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'ultimate', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'luxury', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'deluxe with balcony', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'standard', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'business', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'executive', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'ultimate', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'luxury', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'deluxe with balcony', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'standard', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'business', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'executive', 5, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'ultimate', 5, NULL);

INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'luxury', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'deluxe with balcony', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'standard', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'business', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'executive', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'ultimate', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'luxury', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'deluxe with balcony', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'standard', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'business', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'executive', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'ultimate', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'luxury', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'deluxe with balcony', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'standard', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'business', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'executive', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'ultimate', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'luxury', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'deluxe with balcony', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'standard', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'business', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'executive', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'ultimate', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'luxury', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'deluxe with balcony', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'standard', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'business', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'executive', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'ultimate', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'luxury', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'deluxe with balcony', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'standard', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'business', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'executive', 6, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'ultimate', 6, NULL);

INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'luxury', 7, 1);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'deluxe with balcony', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'standard', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'business', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'executive', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'family room', 'ultimate', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'luxury', 7, 9);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'deluxe with balcony', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'standard', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'business', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'executive', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'single room', 'ultimate', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'luxury', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'deluxe with balcony', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'standard', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'business', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'executive', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'double room', 'ultimate', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'luxury', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'deluxe with balcony', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'standard', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'business', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'executive', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'twin room', 'ultimate', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'luxury', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'deluxe with balcony', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'standard', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'business', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'executive', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'junior suite', 'ultimate', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'luxury', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'deluxe with balcony', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'standard', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'business', 7, 10);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'executive', 7, NULL);
INSERT INTO proj_room (room_id, room_type, room_class, ship_id, reservation_id) VALUES (NULL, 'penthouse suite', 'ultimate', 7, NULL);

COMMIT;
SELECT * FROM proj_room;



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
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (11, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (11, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (11, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (11, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (12, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (12, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (12, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (12, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (13, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (13, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (13, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (13, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (14, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (14, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (14, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (14, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (15, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (15, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (15, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (15, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (16, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (16, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (16, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (16, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (17, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (17, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (17, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (17, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (18, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (18, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (18, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (18, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (19, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (19, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (19, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (19, 'bronze');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (20, 'platinum');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (20, 'gold');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (20, 'silver');
INSERT INTO proj_packagemem (package_id, membership_type) VALUES (20, 'bronze');

COMMIT;
SELECT * FROM proj_packagemem;


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
INSERT INTO proj_routeport (route_id, port_id) VALUES (1, 3);
INSERT INTO proj_routeport (route_id, port_id) VALUES (1, 4);
INSERT INTO proj_routeport (route_id, port_id) VALUES (1, 5);
INSERT INTO proj_routeport (route_id, port_id) VALUES (1, 6);
INSERT INTO proj_routeport (route_id, port_id) VALUES (1, 7);
INSERT INTO proj_routeport (route_id, port_id) VALUES (1, 8);
INSERT INTO proj_routeport (route_id, port_id) VALUES (1, 9);
INSERT INTO proj_routeport (route_id, port_id) VALUES (2, 21);
INSERT INTO proj_routeport (route_id, port_id) VALUES (2, 22);
INSERT INTO proj_routeport (route_id, port_id) VALUES (2, 23);
INSERT INTO proj_routeport (route_id, port_id) VALUES (2, 24);
INSERT INTO proj_routeport (route_id, port_id) VALUES (2, 25);
INSERT INTO proj_routeport (route_id, port_id) VALUES (2, 26);
INSERT INTO proj_routeport (route_id, port_id) VALUES (2, 27);
INSERT INTO proj_routeport (route_id, port_id) VALUES (2, 28);
INSERT INTO proj_routeport (route_id, port_id) VALUES (2, 29);
INSERT INTO proj_routeport (route_id, port_id) VALUES (2, 30);
INSERT INTO proj_routeport (route_id, port_id) VALUES (3, 31);
INSERT INTO proj_routeport (route_id, port_id) VALUES (3, 32);
INSERT INTO proj_routeport (route_id, port_id) VALUES (3, 33);
INSERT INTO proj_routeport (route_id, port_id) VALUES (3, 34);
INSERT INTO proj_routeport (route_id, port_id) VALUES (3, 35);
INSERT INTO proj_routeport (route_id, port_id) VALUES (3, 36);
INSERT INTO proj_routeport (route_id, port_id) VALUES (3, 37);
INSERT INTO proj_routeport (route_id, port_id) VALUES (3, 38);
INSERT INTO proj_routeport (route_id, port_id) VALUES (3, 39);
INSERT INTO proj_routeport (route_id, port_id) VALUES (3, 40);
INSERT INTO proj_routeport (route_id, port_id) VALUES (4, 41);
INSERT INTO proj_routeport (route_id, port_id) VALUES (4, 42);
INSERT INTO proj_routeport (route_id, port_id) VALUES (4, 43);
INSERT INTO proj_routeport (route_id, port_id) VALUES (4, 44);
INSERT INTO proj_routeport (route_id, port_id) VALUES (4, 45);
INSERT INTO proj_routeport (route_id, port_id) VALUES (4, 46);
INSERT INTO proj_routeport (route_id, port_id) VALUES (4, 47);
INSERT INTO proj_routeport (route_id, port_id) VALUES (4, 48);
INSERT INTO proj_routeport (route_id, port_id) VALUES (4, 49);
INSERT INTO proj_routeport (route_id, port_id) VALUES (4, 50);
INSERT INTO proj_routeport (route_id, port_id) VALUES (4, 51);
INSERT INTO proj_routeport (route_id, port_id) VALUES (5, 52);
INSERT INTO proj_routeport (route_id, port_id) VALUES (5, 53);
INSERT INTO proj_routeport (route_id, port_id) VALUES (5, 54);
INSERT INTO proj_routeport (route_id, port_id) VALUES (5, 55);
INSERT INTO proj_routeport (route_id, port_id) VALUES (5, 56);
INSERT INTO proj_routeport (route_id, port_id) VALUES (5, 57);
INSERT INTO proj_routeport (route_id, port_id) VALUES (5, 58);
INSERT INTO proj_routeport (route_id, port_id) VALUES (5, 59);
INSERT INTO proj_routeport (route_id, port_id) VALUES (5, 60);
INSERT INTO proj_routeport (route_id, port_id) VALUES (5, 61);
INSERT INTO proj_routeport (route_id, port_id) VALUES (5, 62);
INSERT INTO proj_routeport (route_id, port_id) VALUES (6, 63);
INSERT INTO proj_routeport (route_id, port_id) VALUES (6, 64);
INSERT INTO proj_routeport (route_id, port_id) VALUES (6, 65);
INSERT INTO proj_routeport (route_id, port_id) VALUES (6, 66);
INSERT INTO proj_routeport (route_id, port_id) VALUES (6, 67);
INSERT INTO proj_routeport (route_id, port_id) VALUES (6, 68);
INSERT INTO proj_routeport (route_id, port_id) VALUES (6, 69);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 70);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 71);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 72);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 73);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 74);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 75);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 76);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 77);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 78);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 79);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 80);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 81);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 82);
INSERT INTO proj_routeport (route_id, port_id) VALUES (7, 83);
INSERT INTO proj_routeport (route_id, port_id) VALUES (8, 10);
INSERT INTO proj_routeport (route_id, port_id) VALUES (8, 11);
INSERT INTO proj_routeport (route_id, port_id) VALUES (8, 12);
INSERT INTO proj_routeport (route_id, port_id) VALUES (8, 13);
INSERT INTO proj_routeport (route_id, port_id) VALUES (8, 14);
INSERT INTO proj_routeport (route_id, port_id) VALUES (8, 15);
INSERT INTO proj_routeport (route_id, port_id) VALUES (8, 16);
INSERT INTO proj_routeport (route_id, port_id) VALUES (8, 17);
INSERT INTO proj_routeport (route_id, port_id) VALUES (8, 18);
INSERT INTO proj_routeport (route_id, port_id) VALUES (8, 19);
INSERT INTO proj_routeport (route_id, port_id) VALUES (8, 20);
INSERT INTO proj_routeport (route_id, port_id) VALUES (9, 84);
INSERT INTO proj_routeport (route_id, port_id) VALUES (9, 85);
INSERT INTO proj_routeport (route_id, port_id) VALUES (9, 86);
INSERT INTO proj_routeport (route_id, port_id) VALUES (9, 87);
INSERT INTO proj_routeport (route_id, port_id) VALUES (9, 88);
INSERT INTO proj_routeport (route_id, port_id) VALUES (9, 89);
INSERT INTO proj_routeport (route_id, port_id) VALUES (9, 90);
INSERT INTO proj_routeport (route_id, port_id) VALUES (9, 91);
INSERT INTO proj_routeport (route_id, port_id) VALUES (10, 92);
INSERT INTO proj_routeport (route_id, port_id) VALUES (10, 93);
INSERT INTO proj_routeport (route_id, port_id) VALUES (10, 94);
INSERT INTO proj_routeport (route_id, port_id) VALUES (10, 95);
INSERT INTO proj_routeport (route_id, port_id) VALUES (10, 96);
INSERT INTO proj_routeport (route_id, port_id) VALUES (10, 97);
INSERT INTO proj_routeport (route_id, port_id) VALUES (11, 98);
INSERT INTO proj_routeport (route_id, port_id) VALUES (11, 99);
INSERT INTO proj_routeport (route_id, port_id) VALUES (11, 100);
INSERT INTO proj_routeport (route_id, port_id) VALUES (11, 101);
INSERT INTO proj_routeport (route_id, port_id) VALUES (11, 102);
INSERT INTO proj_routeport (route_id, port_id) VALUES (12, 103);
INSERT INTO proj_routeport (route_id, port_id) VALUES (12, 104);
INSERT INTO proj_routeport (route_id, port_id) VALUES (12, 105);
INSERT INTO proj_routeport (route_id, port_id) VALUES (12, 106);
INSERT INTO proj_routeport (route_id, port_id) VALUES (12, 107);
INSERT INTO proj_routeport (route_id, port_id) VALUES (12, 108);
INSERT INTO proj_routeport (route_id, port_id) VALUES (12, 109);
INSERT INTO proj_routeport (route_id, port_id) VALUES (12, 49);
INSERT INTO proj_routeport (route_id, port_id) VALUES (13, 110);
INSERT INTO proj_routeport (route_id, port_id) VALUES (13, 111);
INSERT INTO proj_routeport (route_id, port_id) VALUES (13, 112);
INSERT INTO proj_routeport (route_id, port_id) VALUES (13, 113);
INSERT INTO proj_routeport (route_id, port_id) VALUES (13, 114);
INSERT INTO proj_routeport (route_id, port_id) VALUES (13, 115);
INSERT INTO proj_routeport (route_id, port_id) VALUES (13, 116);
INSERT INTO proj_routeport (route_id, port_id) VALUES (13, 117);
INSERT INTO proj_routeport (route_id, port_id) VALUES (14, 118);
INSERT INTO proj_routeport (route_id, port_id) VALUES (14, 119);
INSERT INTO proj_routeport (route_id, port_id) VALUES (14, 120);
INSERT INTO proj_routeport (route_id, port_id) VALUES (14, 18);
INSERT INTO proj_routeport (route_id, port_id) VALUES (14, 25);
INSERT INTO proj_routeport (route_id, port_id) VALUES (15, 62);
INSERT INTO proj_routeport (route_id, port_id) VALUES (15, 121);
INSERT INTO proj_routeport (route_id, port_id) VALUES (15, 122);
INSERT INTO proj_routeport (route_id, port_id) VALUES (15, 123);
INSERT INTO proj_routeport (route_id, port_id) VALUES (15, 124);
INSERT INTO proj_routeport (route_id, port_id) VALUES (15, 125);
INSERT INTO proj_routeport (route_id, port_id) VALUES (16, 126);
INSERT INTO proj_routeport (route_id, port_id) VALUES (16, 127);
INSERT INTO proj_routeport (route_id, port_id) VALUES (16, 121);
INSERT INTO proj_routeport (route_id, port_id) VALUES (16, 99);
INSERT INTO proj_routeport (route_id, port_id) VALUES (16, 62);
INSERT INTO proj_routeport (route_id, port_id) VALUES (16, 52);
INSERT INTO proj_routeport (route_id, port_id) VALUES (16, 18);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 128);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 129);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 130);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 131);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 132);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 133);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 134);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 135);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 136);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 137);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 118);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 119);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 18);
INSERT INTO proj_routeport (route_id, port_id) VALUES (17, 14);
INSERT INTO proj_routeport (route_id, port_id) VALUES (18, 138);
INSERT INTO proj_routeport (route_id, port_id) VALUES (18, 139);
INSERT INTO proj_routeport (route_id, port_id) VALUES (18, 140);
INSERT INTO proj_routeport (route_id, port_id) VALUES (18, 141);
INSERT INTO proj_routeport (route_id, port_id) VALUES (18, 142);
INSERT INTO proj_routeport (route_id, port_id) VALUES (18, 143);
INSERT INTO proj_routeport (route_id, port_id) VALUES (18, 144);
INSERT INTO proj_routeport (route_id, port_id) VALUES (18, 145);
INSERT INTO proj_routeport (route_id, port_id) VALUES (18, 146);
INSERT INTO proj_routeport (route_id, port_id) VALUES (19, 147);
INSERT INTO proj_routeport (route_id, port_id) VALUES (19, 148);
INSERT INTO proj_routeport (route_id, port_id) VALUES (19, 149);
INSERT INTO proj_routeport (route_id, port_id) VALUES (19, 150);
INSERT INTO proj_routeport (route_id, port_id) VALUES (19, 91);
INSERT INTO proj_routeport (route_id, port_id) VALUES (19, 84);
INSERT INTO proj_routeport (route_id, port_id) VALUES (19, 85);
INSERT INTO proj_routeport (route_id, port_id) VALUES (19, 89);
INSERT INTO proj_routeport (route_id, port_id) VALUES (19, 29);
INSERT INTO proj_routeport (route_id, port_id) VALUES (19, 22);
INSERT INTO proj_routeport (route_id, port_id) VALUES (19, 26);
INSERT INTO proj_routeport (route_id, port_id) VALUES (20, 151);
INSERT INTO proj_routeport (route_id, port_id) VALUES (20, 152);
INSERT INTO proj_routeport (route_id, port_id) VALUES (20, 153);
INSERT INTO proj_routeport (route_id, port_id) VALUES (20, 154);
INSERT INTO proj_routeport (route_id, port_id) VALUES (20, 155);
INSERT INTO proj_routeport (route_id, port_id) VALUES (20, 156);
INSERT INTO proj_routeport (route_id, port_id) VALUES (20, 157);
INSERT INTO proj_routeport (route_id, port_id) VALUES (20, 158);
INSERT INTO proj_routeport (route_id, port_id) VALUES (20, 159);
INSERT INTO proj_routeport (route_id, port_id) VALUES (20, 160);
INSERT INTO proj_routeport (route_id, port_id) VALUES (21, 161);
INSERT INTO proj_routeport (route_id, port_id) VALUES (21, 29);
INSERT INTO proj_routeport (route_id, port_id) VALUES (21, 23);
INSERT INTO proj_routeport (route_id, port_id) VALUES (21, 52);
INSERT INTO proj_routeport (route_id, port_id) VALUES (21, 67);
INSERT INTO proj_routeport (route_id, port_id) VALUES (21, 73);
INSERT INTO proj_routeport (route_id, port_id) VALUES (21, 121);



/* Part 2: Inner Joins */

-- Identify the ship ID and ship name of all ships that service the route around the Carribean
SELECT s.ship_id, s.ship_name FROM proj_ship s INNER JOIN proj_route r ON r.route_id = s.route_id WHERE r.route_name = 'CAR';

-- The ship 'Harmony of the Sea' wants to upgrade its Bronze and Silver category/membership rooms. 
-- How many rooms (aggregate) of these classifications are there aboard this liner?
SELECT count(room_id) FROM (SELECT * FROM proj_room r INNER JOIN proj_room_status rs ON r.room_class = rs.room_class WHERE 
rs.membership_type = 'bronze' OR rs.membership_type = 'silver') x INNER JOIN proj_ship s ON x.ship_id = s.ship_id WHERE s.ship_name = 'Harmony of the Sea';


-- Show all the ports that are visited as part of the Australasian route
SELECT p.port_city FROM proj_port p INNER JOIN proj_routeport rp ON p.port_id = rp.port_id WHERE rp.route_id = (SELECT route_id FROM proj_route WHERE route_name = 'AUS');

--Given that ship number 7, 'Breeze of the Sea', has a capacity of 3,500 passengers, how many
-- rooms does it currently have booked for its service of the package 'Asian Adventure Spring 2014'?
SELECT count(reservation_id) FROM proj_room r INNER JOIN proj_ship s ON r.ship_id = s.ship_id WHERE r.ship_id = 
(SELECT s.ship_id FROM proj_ship s INNER JOIN proj_package p ON s.ship_id = p.ship_id WHERE p.package_title = 'Asian Adventure Spring 2014') AND r.reservation_id IS NOT NULL;

-- Identify the room types and capacities that customer with reservation number 1 has reserved
SELECT rd.room_type, sum(rm_capacity) FROM proj_room_details rd INNER JOIN proj_room rm ON rm.room_type = rd.room_type WHERE rm.reservation_id = 1 GROUP BY rd.room_type;

-- What room number, room type and room class does Peter Freitag have?
SELECT room_id, room_type, room_class FROM proj_room rm join proj_reservation res ON rm.reservation_id = res.reservation_id WHERE res.customer_id = (SELECT customer_id FROM 
proj_customer cus WHERE cus.fname = 'Peter' AND cus.lname = 'Freitag');

-- Find out all the port cities and countries visited as part of the ALASKAN route
SELECT r.route_name, p.port_city, pc.country FROM proj_routeport rp join proj_route r ON r.route_id = rp.route_id join proj_port p ON p.port_id =
rp.port_id join proj_port_country pc ON pc.port_city = p.port_city WHERE r.route_name = 'ASK';

-- Detail all the room types and classes existing (reserved and nonreserved) on the ship, 'Liberte of the Sea'. (You are unsure of spelling!) 
SELECT * FROM proj_room rm JOIN proj_room_status rs ON rm.room_class = rs.room_class JOIN proj_room_details rd ON rm.room_type = rd.room_type
WHERE rm.ship_id = (SELECT s.ship_id FROM proj_ship s WHERE s.ship_name LIKE '%Lib%');

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

-- Summary of all rooms that have been reserved and remaining rooms (slots to fill) for package 'Mediterranean Manna Spring 2014'
SELECT * FROM proj_reservation res RIGHT OUTER JOIN proj_room rm ON res.reservation_id = rm.reservation_id join proj_ship sh ON rm.ship_id = sh.ship_id
WHERE sh.ship_id = (SELECT pkg.ship_id FROM proj_package pkg WHERE pkg.package_title = 'Mediterranean Manna Spring 2014');

/* ----------------------------- */

/* Cube Query */

-- Generate subtotals for all possible combinations of packages and months 
-- What months of the year have the most expensive packages? When are packages cheapest? What the most expensive package?
-- What's the subtotal for all months (identified by departure date) and the subtotal for all packages and a grand total
SELECT to_char(depart_date, 'MON'), SUM(base_price), package_title FROM proj_package GROUP BY cube (to_char(depart_date, 'MON'), package_title);


-- Get all subtotals of prices for each route and each month of the year 
SELECT to_char(depart_date, 'MON'), SUM(base_price), r.route_name FROM proj_package pkg, proj_route r WHERE r.route_id = 
(SELECT s.route_id FROM proj_ship s WHERE s.ship_id = pkg.ship_id) GROUP BY cube (to_char(depart_date, 'MON'), r.route_name);


/* Five Sub-queries */

-- What room number, room type and room class does Peter Freitag have?
SELECT room_id, room_type, room_class FROM proj_room rm join proj_reservation res ON rm.reservation_id = res.reservation_id WHERE res.customer_id = 
(SELECT customer_id FROM proj_customer cust WHERE cust.fname = 'Peter' and cust.lname = 'Freitag');

-- Detail all the room types and classes existing (reserved and nonreserved) on the ship, 'Liberte of the Sea'. (You are unsure of spelling!) 
SELECT * FROM proj_room rm JOIN proj_room_status rs ON rm.room_class = rs.room_class JOIN proj_room_details rd ON rm.room_type = rd.room_type
WHERE rm.ship_id = (SELECT s.ship_id FROM proj_ship s WHERE s.ship_name LIKE '%Lib%');

-- Obtain the capacity (for people, not rooms) that reservations for the package, 'Asian Adventure Spring 2014' currently takes up, i.e
-- how many people have booked places on this cruise at the moment.
SELECT sum(rm_capacity) FROM proj_room rm join proj_room_details rd on rm.room_type=rd.room_type WHERE rm.ship_id = (SELECT
ship_id FROM proj_package WHERE package_title = 'Asian Adventure Spring 2014') AND rm.reservation_id IS NOT NULL;

-- One of the managers is requesting all ships that travel the South American route to be refurnished/engine check.
-- He requests all ship information from vessels that cover this route.
SELECT * FROM proj_ship WHERE route_id = (SELECT route_id FROM proj_route WHERE route_name = 'SAMR');

-- The captains of all ships travelling the South American route should be supplied with a current
-- itinerary of all ports to stop at and where to dock
SELECT port_city, docking_area FROM proj_port p JOIN proj_routeport rp ON p.port_id = rp.port_id WHERE rp.route_id = (SELECT 
route_id FROM proj_route WHERE route_name = 'SAMR');

/* PL/SQL procedures */




-- Create views first to be used in procedures
CREATE OR REPLACE VIEW pkgs_ship_assign_vw AS SELECT 
pkg.package_id, pkg.package_title, pkg.depart_date, pkg.arrival_date, pkg.ship_id, sh.ship_id AS ship_num, 
sh.route_id FROM proj_package pkg full outer join proj_ship sh ON pkg.ship_id = sh.ship_id;

CREATE OR REPLACE PACKAGE RCI_OPERATIONS_PKG AS
PROCEDURE RoomAvailabilityReset(package_num NUMBER);
PROCEDURE RoomAssignment(reserv_num NUMBER, membership_chosen NVARCHAR2, qty_adults NUMBER, qty_child NUMBER);
PROCEDURE ReservationCancellation(reserv_num NUMBER);
PROCEDURE assignRoom(room_num NUMBER, reserv_num NUMBER);
PROCEDURE LastMinPackageDeal(package_num NUMBER);
PROCEDURE FullReservation(package_num NUMBER, cust_fname NVARCHAR2, 
cust_lname NVARCHAR2, cust_addr NVARCHAR2, cust_phone NUMBER, cust_email NVARCHAR2, membership_chosen NVARCHAR2, qty_adults NUMBER, qty_child NUMBER);
PROCEDURE ShipAssignment(package_num NUMBER, ship_nbr NUMBER);
PROCEDURE InvoiceCustomer(reserv_num NUMBER);
END;
/

-- Revert all reserved rooms' availability to null when a package has reached its end date (i.e. ship has arrived
-- at final port)
CREATE OR REPLACE PACKAGE BODY RCI_OPERATIONS_PKG AS
PROCEDURE RoomAvailabilityReset(package_num NUMBER)
IS
INVALID_PACKAGE_NBR EXCEPTION;
PRAGMA EXCEPTION_INIT(INVALID_PACKAGE_NBR, -20009);
num_rooms_reset NUMBER(5);
date_pkg_expired DATE;
count_pkgs NUMBER;
BEGIN
SELECT COUNT(package_id) INTO count_pkgs FROM proj_package where package_id = package_num;
IF count_pkgs = 0 THEN
	RAISE INVALID_PACKAGE_NBR;
END IF;
SELECT arrival_date INTO date_pkg_expired FROM proj_package WHERE package_id = package_num;
SELECT COUNT(reservation_id) INTO num_rooms_reset FROM proj_room WHERE ship_id = (SELECT ship_id FROM
proj_package pkg WHERE pkg.package_id = package_num);
IF sysdate > date_pkg_expired THEN 
	UPDATE proj_room SET reservation_id = NULL WHERE proj_room.ship_id = (SELECT ship_id FROM proj_package pkg WHERE pkg.package_id = package_num);
	DBMS_OUTPUT.PUT_LINE('Number of rooms whose reservation status has reset: ' || num_rooms_reset);
ELSE
	DBMS_OUTPUT.PUT_LINE('Package number ' || package_num || ' has not yet expired.');
END IF;
EXCEPTION
WHEN INVALID_PACKAGE_NBR THEN
DBMS_OUTPUT.PUT_LINE('This package does not exist. Please enter an appropriate package ID.');
RAISE;
END RoomAvailabilityReset;



-- Reserve rooms as part of customer's reservation based on their chosen
-- membership and how many people are included in the reservation

PROCEDURE RoomAssignment(reserv_num NUMBER, membership_chosen NVARCHAR2, qty_adults NUMBER, qty_child NUMBER) 
IS 
total_qty NUMBER(3);
TOO_MANY_PERSONS EXCEPTION;
NO_PERSONS_BOOKED EXCEPTION;
PRAGMA EXCEPTION_INIT(TOO_MANY_PERSONS, -20006);
PRAGMA EXCEPTION_INIT(NO_PERSONS_BOOKED, -20008);
CURSOR cur_room
IS
SELECT r.room_id, r.room_type, r.room_class, rs.membership_type, r.ship_id, r.reservation_id FROM proj_room r JOIN proj_room_status rs ON 
r.room_class = rs.room_class WHERE ship_id = (SELECT ship_id FROM proj_package p WHERE p.package_id = (SELECT package_id FROM proj_reservation res WHERE 
res.reservation_id = reserv_num)) AND rs.membership_type = membership_chosen;
room_row cur_room%ROWTYPE;

BEGIN
SELECT (qty_child + qty_adults) INTO total_qty FROM dual;
IF total_qty < 1 THEN
	RAISE NO_PERSONS_BOOKED;
	DBMS_OUTPUT.PUT_LINE('No persons booked for this reservation.');
END IF;
OPEN cur_room;
FETCH cur_room INTO room_row;
WHILE cur_room%FOUND AND total_qty > 0 LOOP
	SAVEPOINT before_room_assignment;
	IF total_qty <= 8 and qty_child >= 1 then
		IF room_row.reservation_id IS NULL AND room_row.room_type = 'family room' THEN
		assignRoom(room_Row.room_id, reserv_num);
		total_qty := total_qty - 5;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'penthouse suite' THEN 
		assignRoom(room_Row.room_id, reserv_num);
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'junior suite' THEN
		assignRoom(room_Row.room_id, reserv_num);
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'double room' THEN
		assignRoom(room_Row.room_id, reserv_num);
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'twin room' THEN
		assignRoom(room_Row.room_id, reserv_num);
		total_qty := total_qty - 2;
		ELSIF room_Row.reservation_id IS NULL AND room_row.room_type = 'single room' THEN
		assignRoom(room_Row.room_id, reserv_num);
		total_qty := total_qty - 1;
		END IF;
	ELSIF total_qty <= 8 AND qty_child = 0 THEN
		IF room_row.reservation_id IS NULL AND room_row.room_type = 'penthouse suite' THEN
		assignRoom(room_Row.room_id, reserv_num);
		total_qty := total_qty - 2;
		ELSIF room_Row.reservation_id IS NULL AND room_row.room_type = 'junior suite' THEN
		assignRoom(room_row.room_id, reserv_num);
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'double room' THEN
		assignRoom(room_row.room_id, reserv_num);
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'twin room' THEN
		assignRoom(room_row.room_id, reserv_num);
		total_qty := total_qty - 2;
		ELSIF room_row.reservation_id IS NULL AND room_row.room_type = 'single room' THEN
		assignRoom(room_row.room_id, reserv_num);
		total_qty := total_qty - 1;
		END IF;
	
	ELSIF total_qty > 8 THEN
		RAISE TOO_MANY_PERSONS;
		DBMS_OUTPUT.PUT_LINE('Too many people per reservation, sorry.');	
	END IF;
FETCH cur_room INTO room_row;
END LOOP;
EXCEPTION 
WHEN TOO_MANY_PERSONS THEN
DBMS_OUTPUT.PUT_LINE('Business policy cannot allow a reservation of more than 8 persons for one reservation.');
ROLLBACK TO before_room_assignment;
WHEN NO_PERSONS_BOOKED THEN
DBMS_OUTPUT.PUT_LINE('Business policy cannot allow a reservation of ZERO persons for a reservation.');
RAISE;
CLOSE cur_room;
END RoomAssignment;




-- Cancel reservation and free up associated room(s)
PROCEDURE ReservationCancellation(reserv_num NUMBER)
IS
room_reserved NUMBER(3);
cust_num NUMBER(10);
reserv_count NUMBER(5);
NO_SUCH_RESERV EXCEPTION;
PRAGMA EXCEPTION_INIT(NO_SUCH_RESERV, -20010);
CURSOR cur_reservation_canc IS
SELECT * FROM proj_room WHERE reservation_id = reserv_num FOR UPDATE OF reservation_id;
reserv_canc_row cur_reservation_canc%ROWTYPE;
BEGIN
SELECT COUNT(reservation_id) INTO reserv_count FROM proj_reservation WHERE reservation_id = reserv_num;
IF reserv_count = 0 THEN
	RAISE NO_SUCH_RESERV;
END IF;
OPEN cur_reservation_canc;
FETCH cur_reservation_canc INTO reserv_canc_row;
WHILE cur_reservation_canc%FOUND LOOP
	IF reserv_canc_row.reservation_id IS NOT NULL THEN
		UPDATE proj_room SET proj_room.reservation_id = NULL WHERE room_id = reserv_canc_row.room_id;
		DBMS_OUTPUT.PUT_LINE('Room number ' || reserv_canc_row.room_id || ' is now available again.');
		
	END IF;
FETCH cur_reservation_canc INTO reserv_canc_row;
END LOOP;
CLOSE cur_reservation_canc;
SELECT customer_id INTO cust_num FROM proj_reservation where reservation_id = reserv_num;
DELETE FROM proj_reservation WHERE reservation_id = reserv_num;
DELETE FROM proj_customer WHERE customer_id = cust_num;
EXCEPTION
WHEN NO_SUCH_RESERV THEN
	DBMS_OUTPUT.PUT_LINE('You have entered a non-existing reservation ID. Please enter a valid key.');
	RAISE;
END ReservationCancellation;


-- Assign a specific reservation ID to a specified room on basis of analysis
-- performed in room_assignment procedure
PROCEDURE assignRoom(room_num NUMBER, reserv_num NUMBER)
IS
actual_rooms NUMBER(5);
real_res NUMBER(5);
INVALID_RESRV EXCEPTION;
NO_SUCH_ROOM EXCEPTION;
PRAGMA EXCEPTION_INIT(INVALID_RESRV, -20011);
PRAGMA EXCEPTION_INIT(NO_SUCH_ROOM, -20012);
BEGIN
SELECT COUNT(room_id) INTO actual_rooms FROM proj_room WHERE room_id = room_num;
SELECT COUNT(reservation_id) INTO real_res FROM proj_reservation WHERE reservation_id = reserv_num;
IF actual_rooms = 0 THEN
	RAISE NO_SUCH_ROOM;
ELSIF real_res = 0 THEN
	RAISE INVALID_RESRV;
ELSE
	UPDATE proj_room SET reservation_id = reserv_num WHERE room_id = room_num;
	DBMS_OUTPUT.PUT_LINE('Room number ' || room_num || ' was successfully assigned to reservation no. ' || reserv_num);
END IF;
EXCEPTION
WHEN NO_SUCH_ROOM THEN
	DBMS_OUTPUT.PUT_LINE('Invalid room number for reservation request.');
	RAISE;
WHEN INVALID_RESRV THEN
	DBMS_OUTPUT.PUT_LINE('Invalid reservation ID for reservation request.');
	RAISE;
END assignRoom;


-- Reduce base price of packages whose departure date is less than 10 days away
-- and capacity is less than or equal 75%
PROCEDURE LastMinPackageDeal(package_num NUMBER)
IS
cur_total_reservations NUMBER(4);
cur_poss_reservations NUMBER(4);
departure_date DATE;
days_left NUMBER(3);
valid_pkg_count NUMBER(1);
INVALID_PKG_FOR_DEAL EXCEPTION;
PRAGMA EXCEPTION_INIT(INVALID_PKG_FOR_DEAL, -20013);
BEGIN
SELECT COUNT(package_id) INTO valid_pkg_count FROM proj_package WHERE package_id = package_num;
SELECT sum(rm_capacity) INTO cur_total_reservations FROM proj_room rm JOIN proj_room_details rd ON rm.room_type=rd.room_type WHERE rm.ship_id = (SELECT
ship_id FROM proj_package WHERE package_id = package_num) AND rm.reservation_id IS NOT NULL;
SELECT sum(rm_capacity) INTO cur_poss_reservations FROM proj_room rm JOIN proj_room_details rd ON rm.room_type=rd.room_type WHERE rm.ship_id = (SELECT
ship_id FROM proj_package WHERE package_id = package_num);
SELECT depart_date INTO departure_date FROM proj_package WHERE package_id = package_num;
SELECT (departure_date - sysdate) INTO days_left FROM dual;
DBMS_OUTPUT.PUT_LINE('Days left before package commences: ' || days_left);
IF days_left <= 10 AND (cur_total_reservations <= (cur_poss_reservations * 0.75)) THEN
	UPDATE proj_package SET reduced_price = 'Y' WHERE package_id = package_num;
	DBMS_OUTPUT.PUT_LINE('Package no. ' || package_num || ' is now selling at reduced price as a last-minute-package-deal');
ELSE
	DBMS_OUTPUT.PUT_LINE('Package number ' || package_num || ' is ineligible for a last-minute-package-deal.')
END IF;

END LastMinPackageDeal;



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
INSERT INTO proj_reservation VALUES (NULL, current_timestamp, NULL, NULL, package_num, proj_cust_seq.currval);
SELECT proj_reserv_seq.currval INTO reserv_num FROM dual;
IF reduction = 'Y' THEN
	payment_type := 'SALE';
ELSE
	payment_type := 'FULL PRICE';
END IF;
UPDATE proj_reservation SET payment_offer = payment_type WHERE reservation_id = reserv_num;
RoomAssignment(proj_reserv_seq.currval, membership_chosen, qty_adults, qty_child);
END FullReservation;


-- Ship assignment for packages must
-- be stationed at dock and not out at sea hosting another package
-- This procedure is for assigning packages that currently do not
-- have a hosting ship, an appropriate ship.
PROCEDURE ShipAssignment(package_num NUMBER, ship_nbr NUMBER)
IS 
ship_depart_date DATE;
CURSOR cur_select_pkg IS
SELECT * FROM pkgs_ship_assign_vw WHERE ship_num = ship_nbr;
pkg_row cur_select_pkg%ROWTYPE;
BEGIN
SELECT depart_date INTO ship_depart_date FROM pkgs_ship_assign_vw WHERE package_id = package_num;
OPEN cur_select_pkg;
FETCH cur_select_pkg INTO pkg_row;
WHILE cur_select_pkg%FOUND LOOP
IF pkg_row.ship_id IS NULL OR ship_depart_date IS NULL then
UPDATE proj_package SET ship_id = ship_nbr WHERE package_id = package_num;
ELSIF pkg_row.ship_id IS NOT NULL AND pkg_row.arrival_date > ship_depart_date THEN
RAISE_APPLICATION_ERROR(-20003, 'Ship not available for package. Still out at sea.');
ELSE
UPDATE proj_package SET ship_id = ship_nbr WHERE package_id = package_num;
END IF;
FETCH cur_select_pkg INTO pkg_row;
END LOOP;
CLOSE cur_select_pkg;
END ShipAssignment;


PROCEDURE InvoiceCustomer(reserv_num NUMBER)
IS
billing NUMBER(10,2);
BEGIN
billing := CalculateTotalReservationCost(reserv_num);
UPDATE proj_reservation SET invoice = billing WHERE reservation_id = reserv_num;
DBMS_OUTPUT.PUT_LINE('Customer invoiced.');
END InvoiceCustomer;

BEGIN -- Initialization
DBMS_OUTPUT.PUT_LINE('Initalizing package...');
END;
/

-- NB. Include code for testing all packages

-- Test for RoomAvailabilityReset procedure involving manipulation
-- of package 1's arrival data
UPDATE proj_package SET arrival_date = TO_DATE('23/04/2014', 'DD/MM/YYYY') WHERE package_id = 1;
BEGIN
RCI_OPERATIONS_PKG.RoomAvailabilityReset(1);
END;
/

-- and just to make sure..
SELECT * FROM proj_room where reservation_id IS NOT NULL AND ship_id = 7;

-- Test for procedure, RoomAssignment, to automagically assign customers to appropriate rooms
BEGIN
RCI_OPERATIONS_PKG.RoomAssignment(1,'gold',5,3);
END;
/

-- to confirm
SELECT * FROM proj_room where room_id = 223 OR room_id = 229 or room_id = 235 or room_id = 241 or room_id = 247;

-- now unreserve the rooms (as it is technically an expired package)
update proj_room set reservation_id = NULL where reservation_id = 1;

-- test rollback and exception
BEGIN
RCI_OPERATIONS_PKG.RoomAssignment(1,'gold',6,3);
END;
/

-- test for ReservationCancellation procedure
BEGIN
RCI_OPERATIONS_PKG.ReservationCancellation(2);
END;
/

-- ensure
SELECT * FROM proj_room WHERE reservation_id = 2;
SELECT * FROM proj_reservation WHERE reservation_id = 2;
SELECT * FROM proj_customer WHERE customer_id = 10;

-- Test for procedure, LastMinPackage, whereby we need to adjust the departure 
--  date of the package to fit the criteria as follows
UPDATE proj_package SET depart_date = TO_DATE('29/04/2014', 'DD/MM/YYYY') WHERE package_id = 3;

BEGIN
RCI_OPERATIONS_PKG.LastMinPackageDeal(3);
END;
/

SELECT * FROM proj_package;

-- Now, test the procedure, FullReservation
BEGIN
RCI_OPERATIONS_PKG.FullReservation(3, 'Noreen', 'Lenihan', '31 Haddington Rd', 099234023, 'noreen@college.ie', 'platinum', 3, 0);
END;
/

SELECT * FROM proj_customer;
SELECT * FROM proj_reservation;
SELECT * FROM proj_room WHERE room_id IN (44,47,48);

-- Test for procedure, ShipAssignment
-- First, test for a ship who is known to be unavailable for assignment to a package

BEGIN
RCI_OPERATIONS_PKG.ShipAssignment(12,4);
END;
/

-- Now, use a ship that is available 
BEGIN
RCI_OPERATIONS_PKG.ShipAssignment(12,2);
END;
/

-- Also test for a ship that currently is new to the fleet
-- and has had no previous packages
BEGIN
RCI_OPERATIONS_PKG.ShipAssignment(13,8);
END;
/

SELECT * FROM proj_package;

-- Lastly, test the InvoiceCustomer procedure
BEGIN
RCI_OPERATIONS_PKG.InvoiceCustomer(3);
END;
/

-- View to make sure that the customer was properly invoiced
SELECT * FROM proj_reservation;


-- Test Room Assignment procedure again
INSERT INTO PROJ_RESERVATION VALUES (NULL, CURRENT_TIMESTAMP -100, NULL,'FULL PRICE', 1,13);

-- Test to see that we will receive user-defined exception for zero persons in a booking
BEGIN
RCI_OPERATIONS_PKG.RoomAssignment(13,'silver',0,0);
END;
/

-- Test to see that we will receive user-defined exception for >8 persons in a booking
BEGIN
RCI_OPERATIONS_PKG.RoomAssignment(13,'silver',5,5);
END;
/

-- Test to see if rollback functionality worked
select * from proj_room where reservation_id = 13;

-- Test to see that we will perform a regular booking for 7 persons, 4 adults nad 3 kids
BEGIN
RCI_OPERATIONS_PKG.RoomAssignment(13,'silver', 4, 3);
END;
/

-- Overview of all reservations for ship 7 (and notice our new reservations)
select * from proj_room where reservation_id IS NOT NULL;

/* PL/SQL Functions */

-- Create view to facilitate queries
CREATE or replace VIEW FULLRESDETAILS_VW AS SELECT rm.room_id, rm.room_type, rm.room_class, 
rm.reservation_id, res.payment_offer, 
pkg.package_id, pkg.base_price, rd.rm_capacity, mem.membership_type, memtype.percent_add_on 
FROM proj_room rm JOIN proj_reservation res ON rm.reservation_id = res.reservation_id join proj_package pkg 
ON pkg.package_id = res.package_id JOIN proj_room_status mem ON rm.room_class = mem.room_class JOIN proj_membership memtype 
ON memtype.membership_type = mem.membership_type JOIN proj_room_details rd ON rm.room_type = rd.room_type;

-- Calculate total cost of reservation for a specified reservation_id (per room, NOT person)
-- to invoice a customer

CREATE OR REPLACE FUNCTION CalculateTotalReservationCost(reserv_nbr NUMBER)
RETURN NUMBER
IS

reserv_total_cost NUMBER(10,2);
new_pkg_price NUMBER(10);
total_count NUMBER(2);
CURSOR cur_reservation
IS
SELECT * FROM FULLRESDETAILS_VW WHERE reservation_id = reserv_nbr;
reserv_row cur_reservation%ROWTYPE;
BEGIN
OPEN cur_reservation;
FETCH cur_reservation INTO reserv_row;
WHILE cur_reservation%FOUND LOOP
IF reserv_row.payment_offer = 'SALE' THEN
	new_pkg_price := (reserv_row.base_price * 0.50);
	reserv_total_cost := new_pkg_price + (new_pkg_price * (reserv_row.percent_add_on / 100));
	
ELSE
	reserv_total_cost := reserv_row.base_price + (reserv_row.base_price * (reserv_row.percent_add_on / 100));
	DBMS_OUTPUT.PUT_LINE('total per person per room now' || reserv_total_cost);
	

END IF;

FETCH cur_reservation INTO reserv_row;

END LOOP;
CLOSE cur_reservation;

SELECT sum(rm_capacity) INTO total_count FROM fullresdetails_vw where reservation_id = reserv_nbr;
DBMS_OUTPUT.PUT_LINE('total people in this reservation is ' || total_count);
reserv_total_cost := reserv_total_cost * total_count;
RETURN reserv_total_cost;
END CalculateTotalReservationCost;
/

-- Test for above function
SELECT CalculateTotalReservationCost(4) from dual;
SELECT CalculateTotalReservationCost(5) from dual;

-- Function to calculate total revenue accrued from all the reservations on a selected package
CREATE OR REPLACE FUNCTION TotalRevenueFromPkg(package_num NUMBER)
RETURN NUMBER
IS
total_rev NUMBER(15,2);
CURSOR cur_reservation 
IS
SELECT invoice FROM proj_reservation WHERE package_id = package_num;
reserv_row cur_reservation%ROWTYPE;
BEGIN
total_rev := 0;
OPEN cur_reservation;
FETCH cur_reservation INTO reserv_row;
WHILE cur_reservation%FOUND LOOP
total_rev := total_rev + reserv_row.invoice;
FETCH cur_reservation INTO reserv_row;
END LOOP;
CLOSE cur_reservation;
RETURN total_rev;
END TotalRevenueFromPkg;
/


-- before we can test function, all reservations must be invoiced
BEGIN
RCI_OPERATIONS_PKG.InvoiceCustomer(7);
END;
/

BEGIN
RCI_OPERATIONS_PKG.InvoiceCustomer(8);
END;
/


-- Test for latest function
SELECT TotalRevenueFromPkg(7) FROM dual;

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
	DBMS_OUTPUT.PUT_LINE('Package  number ' || :NEW.package_id || ' departed on ' || package_start_date);
	RAISE;
END;
/


-- Testing for Expired Package trigger
BEGIN
RCI_OPERATIONS_PKG.FullReservation(5, 'Libby', 'Downing', '31 Aba Rd, Louth', 1290192, 'libby@yahoo.ie', 'platinum', 3, 2);
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
IF pkg_duration > 40 THEN
	DBMS_OUTPUT.PUT_LINE('Package number ' || :NEW.package_id || ' is longer than normal duration. It runs for '
	|| pkg_duration || ' days.');
ELSE
	DBMS_OUTPUT.PUT_LINE('Package number ' || :NEW.package_id || ' runs for ' || pkg_duration || ' which is normal duration. ');
END IF;
END;
/

-- Test for package duration warning trigger
UPDATE proj_package SET arrival_date = TO_DATE('29/08/2014', 'DD/MM/YYYY') WHERE package_id = 13;


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

-- Test for invalid arrival data
UPDATE proj_package SET arrival_date = TO_DATE('21/05/2014', 'DD/MM/YYYY') WHERE package_id = 13;

-- A ship can never change its colors (or route)
CREATE OR REPLACE TRIGGER SHIP_ROUTE_ASSIGNMENT
BEFORE INSERT OR UPDATE OF ROUTE_ID ON PROJ_SHIP
FOR EACH ROW
WHEN (OLD.ROUTE_ID IS NOT NULL AND NEW.ROUTE_ID IS NOT NULL)
DECLARE
SHIP_ROUTE_IMMUTABLE EXCEPTION;
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

-- Will not work when ship already has assigned different route
UPDATE proj_ship SET route_id = 1 WHERE ship_id = 13;

-- However, will work when ship is new and has not been assigned route yet
UPDATE proj_ship SET route_id = 1 WHERE ship_id = 11;

-- Ensure that no package cannot be assigned a ship that travels a different route
CREATE OR REPLACE TRIGGER PKG_CONSISTENT_SHIP_RT
BEFORE INSERT OR UPDATE OF SHIP_ID ON PROJ_PACKAGE
FOR EACH ROW
WHEN (OLD.SHIP_ID IS NOT NULL AND NEW.SHIP_ID IS NOT NULL)
DECLARE
old_route NUMBER(10);
new_route NUMBER(10);
INCONSISTENT_SHIP_RT EXCEPTION;
PRAGMA EXCEPTION_INIT(INCONSISTENT_SHIP_RT, -20007);
BEGIN
SELECT route_id INTO old_route FROM proj_ship WHERE ship_id = :OLD.ship_id;
SELECT route_id INTO new_route FROM proj_ship WHERE ship_id = :NEW.ship_id;
IF old_route <> new_route THEN
	DBMS_OUTPUT.PUT_LINE('Ship ' || :NEW.ship_id || ' could not be assigned to package ' ||
	:NEW.package_id || ' as ship number ' || :NEW.ship_id || ' travels route number ' || new_route 		|| ' and this package is for route number ' || old_route);
	RAISE INCONSISTENT_SHIP_RT;
ELSE
	DBMS_OUTPUT.PUT_LINE('Package number ' || :NEW.package_id || ' is now hosted by ship ' 		|| :NEW.ship_id || ' which covers route ' || new_route);
END IF;
EXCEPTION
WHEN INCONSISTENT_SHIP_RT THEN
	DBMS_OUTPUT.PUT_LINE('Invalid ship for this package.');
	RAISE;
END;
/

-- Test for trigger that says packages can only be assigned ships whose 
-- route is consistent with the package destinations
BEGIN
RCI_OPERATIONS_PKG.ShipAssignment(15,9);
END;
/

/* End of File */


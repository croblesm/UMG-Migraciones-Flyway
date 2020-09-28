--------------------------------------------------------------------------------- 
-- DEMO 2 --
-- V2: Load regions and countries data
---------------------------------------------------------------------------------

-- Load data into regions table
INSERT INTO regions (region_name) VALUES ('Europe');
INSERT INTO regions (region_name) VALUES ('Americas');
INSERT INTO regions (region_name) VALUES ('Asia');
INSERT INTO regions (region_name) VALUES ('Middle East and Africa');

-- Load data into countries table
-- Europe
INSERT INTO countries (country_id, country_name, region_id) VALUES ('BE','Belgium',1);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('DK','Denmark',1);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('FR','France',1);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('DE','Germany',1);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('IT','Italy',1);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('NL','Netherlands',1);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('CH','Switzerland',1);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('UK','United Kingdom',1);

--Americas
INSERT INTO countries (country_id, country_name, region_id) VALUES ('BR','Brazil',2);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('CA','Canada',2);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('GT','Guatemala',2);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('US','United States of America',2);

-- Asia
INSERT INTO countries (country_id, country_name, region_id) VALUES ('AU','Australia',3);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('HK','HongKong',3);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('JP','Japan',3);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('SG','Singapore',3);

--Middle East and Africa
INSERT INTO countries (country_id, country_name, region_id) VALUES ('EG','Egypt',4);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('IL','Israel',4);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('KW','Kuwait',4);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('NG','Nigeria',4);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('ZM','Zambia',4);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('ZW','Zimbabwe',4);
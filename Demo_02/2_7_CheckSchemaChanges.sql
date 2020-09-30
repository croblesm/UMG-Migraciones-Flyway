--------------------------------------------------------------------------------- 
-- DEMO 1 --
-- Schema changes (Flyway migrations)
---------------------------------------------------------------------------------
-- Checking regions
SELECT * FROM regions;

-- Checking countries
SELECT * FROM countries;

-- Checking both tables
    SELECT
        a.country_name country, 
        b.region_name region 
    FROM 
        countries a 
        INNER JOIN regions b ON a.region_id = b.region_id;

-- Checking flyway schema history
SELECT 
    version,
    description,
    type,
    script,
    installed_by,
    success
FROM flyway_schema_history
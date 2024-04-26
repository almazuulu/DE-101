-- ************************************** 

-- ************************************** region

-- Create sequence id for region table
CREATE SEQUENCE region_region_id_seq;

-- Inserting from orders_general all unique region into region table
INSERT INTO region (region_id, region_name)
SELECT
  nextval('region_region_id_seq'),
  distinct_region
FROM
  (SELECT DISTINCT region as distinct_region FROM orders_general) as distinct_regions;


-- ************************************** ship_mode

-- Create sequence id for ship_mode table
CREATE SEQUENCE ship_mode_id_seq;

INSERT INTO ship_mode (ship_mode_id, ship_mode_name)
SELECT
  nextval('ship_mode_id_seq'),
  distinct_ship_mode
FROM
  (SELECT DISTINCT ship_mode as distinct_ship_mode FROM orders_general) as distinct_ship_mode;


-- ************************************** segment

CREATE SEQUENCE segment_id_seq;

INSERT INTO segment (segment_id, segment_name)
SELECT
  nextval('segment_id_seq'),
  distinct_ship_mode
FROM
  (SELECT DISTINCT ship_mode as distinct_ship_mode FROM orders_general) as distinct_ship_mode;
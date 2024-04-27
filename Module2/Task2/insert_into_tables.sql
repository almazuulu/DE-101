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

-- ************************************** sales
CREATE TABLE sales
(
 sale_id  int NOT NULL,
 sales    double precision NOT NULL,
 quantity int NOT NULL,
 discount double precision NOT NULL,
 profit   double precision NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( sale_id )
);


CREATE SEQUENCE sale_id_seq;

INSERT INTO sales (sale_id, sales, quantity, discount, profit)
SELECT
  nextval('sale_id_seq'),
  og.sales,
  og.quantity,
  og.discount,
  og.profit
FROM
  orders_general AS og;

-- ************************************** state

CREATE SEQUENCE state_id_seq;

INSERT INTO state (state_id, state_name, region_id)
SELECT
  nextval('state_id_seq'),            -- Генерация нового ID для каждой уникальной строки
  og.state,                           -- Названия штатов
  r.region_id                         -- Соответствующий ID региона
FROM
  (SELECT DISTINCT state, region FROM orders_general) as og
LEFT JOIN region r ON r.region_name = og.region  -- Соединение с таблицей region для получения region_id
WHERE
  NOT EXISTS (
    -- Проверка на отсутствие такого же штата с тем же region_id в таблице state
    SELECT 1 FROM state s WHERE s.state_name = og.state AND s.region_id = r.region_id
  );


-- ************************************** geography

CREATE SEQUENCE geography_seq_id;

INSERT INTO geography (geography_id, country, city, postal_code)
SELECT
  nextval('geography_seq_id'),
  og.country,
  og.city,
  og.postal_code
FROM
  (SELECT DISTINCT country, city, postal_code FROM orders_general) AS og;


-- ************************************** category

CREATE SEQUENCE category_id_seq;

INSERT INTO category (category_id, category_name)
SELECT
  nextval('category_id_seq'),
  distinct_category
FROM
  (SELECT DISTINCT category as distinct_category FROM orders_general) as distinct_category;

-- ************************************** sub-category

CREATE SEQUENCE sub_category_id_seq;

INSERT INTO sub_category (sub_category_id, sub_category_name, category_id)
SELECT
  nextval('sub_category_id_seq'),               -- Генерация нового ID для каждой уникальной строки
  og.subcategory,                               -- Названия субкатегорий
  cat.category_id                               -- Соответствующий ID категории
FROM (
  SELECT DISTINCT                               -- Применение DISTINCT на уровне подзапроса
    subcategory, 
    category 
  FROM orders_general
) og
JOIN category cat ON cat.category_name = og.category  -- Соединение с таблицей category для получения category_id
WHERE
  NOT EXISTS (
    -- Проверка на отсутствие такой же субкатегории с тем же category_id в таблице sub_category
    SELECT 1 
    FROM sub_category sc 
    WHERE sc.sub_category_name = og.subcategory AND sc.category_id = cat.category_id
  );


-- ************************************** product
INSERT INTO product (product_id, product_name)
SELECT DISTINCT
  product_id,
  product_name
FROM
  orders_general AS og;


-- ************************************** orders
INSERT INTO orders (order_id, order_date)
SELECT
  og.order_id,
  og.order_date
FROM
  orders_general AS og;


-- ************************************** customer
INSERT INTO customer (customer_id, customer_name, customer_surname)
SELECT DISTINCT
  customer_id,
  split_part(customer_name, ' ', 1) AS first_name,
  split_part(customer_name, ' ', 2) AS last_name
FROM
  orders_general
GROUP BY customer_id, first_name, last_name;

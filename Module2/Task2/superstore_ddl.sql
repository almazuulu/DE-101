-- ************************************** manager

CREATE TABLE manager
(
 manager_id  int NOT NULL,
 name        varchar(50) NOT NULL,
 second_name varchar(50) NOT NULL,
 CONSTRAINT PK_MANAGER_ID PRIMARY KEY ( manager_id )
);


-- ************************************** ship_mode

CREATE TABLE ship_mode
(
 ship_mode_id   int NOT NULL,
 ship_mode_name varchar(50) NOT NULL,
 CONSTRAINT PK_SHIP_MODE PRIMARY KEY ( ship_mode_id )
);

-- ************************************** returns

CREATE TABLE returns
(
 return_id   int NOT NULL,
 return_name varchar(2) NOT NULL,
 CONSTRAINT PK_RETURNS PRIMARY KEY ( return_id )
);

-- ************************************** segment

CREATE TABLE segment
(
 segment_id   int NOT NULL,
 segment_name varchar(50) NOT NULL,
 CONSTRAINT PK_SEGMENT PRIMARY KEY ( segment_id )
);


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

-- ************************************** region

CREATE TABLE region
(
 region_id   int NOT NULL,
 region_name varchar(50) NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( region_id )
);

-- ************************************** "state"

CREATE TABLE state
(
 state_id   int NOT NULL,
 state_name varchar(50) NOT NULL,
 region_id  int NOT NULL,
 CONSTRAINT PK_STATE PRIMARY KEY ( state_id )
);

CREATE INDEX FK_STATE_REGION ON state
(
 region_id
);

-- ************************************** geography

CREATE TABLE geography
(
 geography_id int NOT NULL,
 country      varchar(50) NOT NULL,
 city         varchar(50) NOT NULL,
 "state"      varchar(50) NOT NULL,
 postal_code  int NOT NULL,
 state_id     int NOT NULL,
 CONSTRAINT PK_GEOGRAPHY PRIMARY KEY ( geography_id )
);

CREATE INDEX FK_GEOGRAPHY_STATE ON geography
(
 state_id
);

-- ************************************** category

CREATE TABLE category
(
 category_id   int NOT NULL,
 category_name varchar(50) NOT NULL,
 CONSTRAINT PK_CATEGORY PRIMARY KEY ( category_id )
);


-- ************************************** sub_category

CREATE TABLE sub_category
(
 sub_category_id   int NOT NULL,
 sub_category_name varchar(50) NOT NULL,
 category_id       int NOT NULL,
 CONSTRAINT PK_SUB_CATEGORY PRIMARY KEY ( sub_category_id )
);

CREATE INDEX FK_SUB_CATEGORY_CATEGORY ON sub_category
(
 category_id
);

-- ************************************** product

CREATE TABLE product
(
 product_id   int NOT NULL,
 product_name varchar(100) NOT NULL,
 category_id  int NOT NULL,
 CONSTRAINT PK_PRODUCT PRIMARY KEY ( product_id )
);

CREATE INDEX FK_PRODUCT_CATEGORY ON product
(
 category_id
);

-- ************************************** order_product

CREATE TABLE order_product
(
 order_id   int NOT NULL,
 product_id int NOT NULL

);

CREATE INDEX FK_ORDER_PRODUCT_ORDER ON order_product
(
 order_id
);

CREATE INDEX FK_ORDER_PRODUCT_PRODUCT ON order_product
(
 product_id
);


-- ************************************** orders


CREATE TABLE orders
(
 order_id     int NOT NULL,
 order_date   date NOT NULL,
 ship_mode_id int NOT NULL,
 sale_id      int NOT NULL,
 manager_id   int NOT NULL,
 return_id    int NOT NULL,
 CONSTRAINT PK_ORDERS PRIMARY KEY ( order_id )
);

CREATE INDEX FK_ORDERS_SHIP_MODE ON orders
(
 ship_mode_id
);

CREATE INDEX FK_ORDERS_SALE ON orders
(
 sale_id
);

CREATE INDEX FK_ORDERS_MANAGER ON orders
(
 manager_id
);

CREATE INDEX FK_4 ON orders
(
 return_id
);



-- ************************************** customer

CREATE TABLE customer
(
 customer_id      int NOT NULL,
 customer_name    varchar(50) NOT NULL,
 customer_surname varchar(50) NOT NULL,
 order_id         int NOT NULL,
 geography_id     int NOT NULL,
 segment_id       int NOT NULL,
 CONSTRAINT PK_CUSTOMER PRIMARY KEY ( customer_id )
);

CREATE INDEX FK_CUSTOMER_ORDER ON customer
(
 order_id
);

CREATE INDEX FK_CUSTOMER_SEGMENT ON customer
(
 segment_id
);

CREATE INDEX FK_GEOGRAPHY ON customer
(
 geography_id
);




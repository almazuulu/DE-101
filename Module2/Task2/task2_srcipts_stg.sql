-- TOTAL SALES
SELECT SUM(sales)
FROM stg.orders;

-- TOTAL PROFIT
SELECT SUM(profit)
FROM stg.orders;

-- PROFIT RATIO
SELECT (SUM(profit)/SUM(sales)) as profit_ratio
FROM stg.orders;

-- PROFIT PER ORDER - version 1
SELECT order_id, SUM(profit)
FROM stg.orders
GROUP BY order_id;

-- PROFIT PER ORDER - version 2
SELECT order_id, SUM(profit)
FROM stg.orders
GROUP BY 1
ORDER BY 1;

-- SALES PER CUSTOMER - version 1
SELECT customer_id, SUM(sales)
FROM stg.orders
GROUP BY customer_id
ORDER BY customer_id;

-- SALES PER CUSTOMER - version 2
SELECT customer_id, SUM(sales)
FROM stg.orders
GROUP BY 1
ORDER BY 1;

-- AVERAGE DISCOUNT
SELECT AVG(discount) as AVG_DISCOUNT
FROM stg.orders;

-- MONTHLY SALES BY SEGMENT - version 1
SELECT 
    segment, 
    EXTRACT(month FROM order_date::date) as month_number, 
    SUM(sales) as total_sales
FROM stg.orders
GROUP BY segment, EXTRACT(month FROM order_date::date)
ORDER BY month_number;

-- MONTHLY SALES BY SEGMENT - version 2
SELECT 
    segment, 
    EXTRACT(month FROM order_date::date) as month, 
    SUM(sales) as total_sales
FROM stg.orders
GROUP BY 1, 2
ORDER BY month;

-- MONTHLY SALES BY CATEGORY - version 1
SELECT 
    category, 
    EXTRACT(month FROM order_date::date) as month, 
    SUM(sales) as total_sales
FROM stg.orders
GROUP BY category, EXTRACT(month FROM order_date::date)
ORDER BY month;


-- MONTHLY SALES BY CATEGORY - version 2
SELECT 
    category, 
    EXTRACT(month FROM order_date::date) as month, 
    SUM(sales) as total_sales
FROM stg.orders
GROUP BY 1, 2
ORDER BY month;

-- SALES BY PRODUCT CATEGORY OVER TIME - version 1
SELECT category, SUM(sales)
FROM stg.orders
GROUP BY category
ORDER BY category;

-- SALES BY PRODUCT CATEGORY OVER TIME - version 2
SELECT category, SUM(sales)
FROM stg.orders
GROUP BY 1
ORDER BY 1;

-- SALES AND PROFIT BY CUSTOMER - version 1
SELECT customer_name, SUM(sales) as Sales, SUM(profit) as Profit
FROM stg.orders
GROUP BY customer_name
ORDER BY customer_name;

-- SALES AND PROFIT BY CUSTOMER - version 2
SELECT customer_name, SUM(sales) as Sales, SUM(profit) as Profit
FROM stg.orders
GROUP BY 1
ORDER BY 1;

-- SALES PER REGION - version 1
SELECT region, SUM(SALES)
FROM stg.orders
GROUP BY region
ORDER BY region;

-- SALES PER REGION - version 2
SELECT region, SUM(SALES)
FROM stg.orders
GROUP BY 1
ORDER BY 1;






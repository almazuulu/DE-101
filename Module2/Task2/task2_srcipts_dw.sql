-- TOTAL SALES
SELECT SUM(sales)
FROM dw.sales_fact;

-- TOTAL PROFIT
SELECT SUM(profit)
FROM dw.sales_fact;

-- PROFIT RATIO
SELECT (SUM(profit)/SUM(sales)) as profit_ratio
FROM dw.sales_fact;

-- PROFIT PER ORDER - version 1
SELECT order_id, SUM(profit)
FROM dw.sales_fact
GROUP BY order_id;

-- PROFIT PER ORDER - version 2
SELECT order_id, SUM(profit)
FROM dw.sales_fact
GROUP BY 1
ORDER BY 1;

-- SALES PER CUSTOMER - version 1
SELECT c.customer_name, SUM(sales)
FROM dw.sales_fact s
INNER JOIN dw.customer_dim c USING(cust_id)
GROUP BY c.customer_name
ORDER BY c.customer_name;

-- SALES PER CUSTOMER - version 1
SELECT c.customer_name, SUM(sales)
FROM dw.sales_fact s
INNER JOIN dw.customer_dim c USING(cust_id)
GROUP BY c.customer_name
ORDER BY c.customer_name;

-- AVERAGE DISCOUNT
SELECT AVG(discount) as AVG_DISCOUNT
FROM dw.sales_fact;


-- MONTHLY SALES BY CATEGORY - version 1
SELECT 
    p.category, 
    c.month, 
    SUM(s.sales) AS total_sales
FROM dw.sales_fact s
INNER JOIN dw.calendar_dim c ON s.order_date_id = c.dateid
INNER JOIN dw.product_dim p USING(prod_id)
GROUP BY p.category, c.month
ORDER BY c.month;


-- MONTHLY SALES BY CATEGORY - version 2
SELECT 
    p.category, 
    c.month, 
    SUM(s.sales) AS total_sales
FROM dw.sales_fact s
INNER JOIN dw.calendar_dim c ON s.order_date_id = c.dateid
INNER JOIN dw.product_dim p USING(prod_id)
GROUP BY 1, 2
ORDER BY 2;

-- SALES BY PRODUCT CATEGORY OVER TIME - version 1
SELECT 
    p.category, 
    SUM(s.sales) AS total_sales
FROM dw.sales_fact s
INNER JOIN dw.product_dim p USING(prod_id)
GROUP BY p.category
ORDER BY p.category;

-- SALES BY PRODUCT CATEGORY OVER TIME - version 2
SELECT 
    p.category, 
    SUM(s.sales) AS total_sales
FROM dw.sales_fact s
INNER JOIN dw.product_dim p USING(prod_id)
GROUP BY 1
ORDER BY 1;

-- SALES AND PROFIT BY CUSTOMER - version 1
SELECT c.customer_name, SUM(s.sales) as Sales, SUM(s.profit) as Profit
FROM dw.sales_fact s
INNER JOIN dw.customer_dim c USING(cust_id)
GROUP BY c.customer_name
ORDER BY c.customer_name;

-- SALES AND PROFIT BY CUSTOMER - version 2
SELECT c.customer_name, SUM(s.sales) as Sales, SUM(s.profit) as Profit
FROM dw.sales_fact s
INNER JOIN dw.customer_dim c USING(cust_id)
GROUP BY 1
ORDER BY 1;

-- SALES PER STATE - version 1
SELECT g.state AS State, SUM(SALES) AS TotalSales
FROM dw.sales_fact
INNER JOIN dw.geo_dim AS g USING(geo_id)
GROUP BY g.state
ORDER BY g.state;

-- SALES PER STATE - version 2
SELECT g.state AS State, SUM(SALES) AS TotalSales
FROM dw.sales_fact
INNER JOIN dw.geo_dim AS g USING(geo_id)
GROUP BY 1
ORDER BY 1;






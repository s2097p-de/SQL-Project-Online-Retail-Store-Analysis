-- DQL 

-- All customers
SELECT * FROM customers;

-- Products above 10,000
SELECT * FROM products
WHERE price > 10000;

-- Orders in April
SELECT * FROM orders
WHERE order_date BETWEEN '2023-04-01' AND '2023-04-30';

-- JOINS

-- INNER JOIN: Orders with customer names
SELECT o.order_id, c.name, o.order_date
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- LEFT JOIN: All customers and their orders
SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- FULL ANALYSIS JOIN
SELECT c.name, p.product_name, od.quantity
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON od.product_id = p.product_id;

-- SET
-- Customers from Delhi or Mumbai
SELECT name FROM customers WHERE city = 'Delhi'
UNION
SELECT name FROM customers WHERE city = 'Mumbai';

-- INTERSECT (Common customers - depends on DB support)- NOT SUPPORTED
-- EXCEPT (Customers who never ordered) NOT SUPPORTED
  
  
-- BUSSINESS INSIGHT
-- Total sales per customer
SELECT c.name, SUM(p.price * od.quantity) AS total_sales
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN products p ON od.product_id = p.product_id
GROUP BY c.name;

-- Most sold product
SELECT p.product_name, SUM(od.quantity) AS total_quantity
FROM products p
INNER JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;

-- CASE WHEN (Risk Category Logic)
SELECT 
    order_id,
    risk_score,
    CASE 
        WHEN risk_score > 0.7 THEN 'High Risk'
        WHEN risk_score BETWEEN 0.4 AND 0.7 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category
FROM orders;
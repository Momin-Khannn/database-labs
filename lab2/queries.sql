-- Lab 02: SQL Fundamentals Exercises
-- Author: Momin Ahmad
-- Date: 2026-02-19

-- Query 1: Explore the data [cite: 504]
SELECT * FROM customers LIMIT 5; [cite: 507]
SELECT * FROM products LIMIT 5; [cite: 509]
SELECT * FROM orders LIMIT 5; [cite: 510]
SELECT * FROM order_items LIMIT 5; [cite: 511]

-- Query 2: Select specific columns (Sorted by newest signup) [cite: 515]
SELECT name, city, signup_date 
FROM customers 
ORDER BY signup_date DESC; [cite: 517, 520]

-- Query 3: Filter by status (Delivered orders) [cite: 521]
SELECT order_id, customer_id, total_amount, order_date 
FROM orders 
WHERE status = 'delivered' 
ORDER BY order_date DESC; [cite: 523, 524, 525, 526]

-- Query 4: Filter by price range (Between 1000 and 5000) [cite: 531]
-- Method A: BETWEEN [cite: 533]
SELECT product_name, category, price 
FROM products 
WHERE price BETWEEN 1000 AND 5000 
ORDER BY price; [cite: 534, 535, 536]

-- Method B: Comparison operators [cite: 538]
SELECT product_name, category, price 
FROM products 
WHERE price >= 1000 AND price <= 5000 
ORDER BY price; [cite: 538, 539, 540]

-- Query 5: Top 10 highest-value orders [cite: 542]
SELECT order_id, customer_id, total_amount, status 
FROM orders 
ORDER BY total_amount DESC 
LIMIT 10; [cite: 544, 545, 546]

-- Query 6: Multi-condition filter (2025 delivered orders > 10,000) [cite: 550]
SELECT order_id, customer_id, total_amount, order_date 
FROM orders 
WHERE status = 'delivered' 
AND order_date >= '2025-01-01' 
AND total_amount > 10000 
ORDER BY total_amount DESC; [cite: 552, 553, 554, 555, 556]

-- Query 7: Pattern matching on email (Gmail users) [cite: 561]
SELECT name, email, city 
FROM customers 
WHERE email LIKE '%@gmail.com' 
ORDER BY name; [cite: 563, 564, 565]

-- Query 8: NULL handling (Unshipped orders) [cite: 568]
SELECT order_id, customer_id, order_date, status, total_amount 
FROM orders 
WHERE shipped_date IS NULL 
ORDER BY order_date; [cite: 570, 571, 572]

-- Query 9: Computed column (20% Discount with Rounding) [cite: 578]
SELECT product_name, 
       category, 
       price AS original_price, 
       ROUND(price * 0.80, 2) AS discounted_price, 
       ROUND(price * 0.20, 2) AS you_save 
FROM products 
ORDER BY discounted_price DESC; [cite: 581, 584, 585, 586, 587, 588, 589, 590, 591]

-- Query 10: Bring everything together (Priority categorisation) [cite: 596]
SELECT order_id, 
       customer_id, 
       total_amount, 
       order_date, 
       status, 
CASE 
    WHEN total_amount > 10000 THEN 'URGENT' 
    ELSE 'NORMAL' 
END AS priority 
FROM orders 
WHERE shipped_date IS NULL 
AND order_date >= '2025-01-01' 
ORDER BY total_amount DESC 
LIMIT 5; [cite: 598, 603, 604, 605, 606, 607, 608]

-- Performance Awareness: EXPLAIN ANALYZE for Query 5 [cite: 622]
EXPLAIN ANALYZE 
SELECT order_id, customer_id, total_amount, status 
FROM orders 
ORDER BY total_amount DESC 
LIMIT 10; [cite: 625, 626, 627, 628, 629]

#Cleaning the data
#Checking the overall structure
SELECT * FROM transactions_october LIMIT 10;

#Check the structure of the data
DESCRIBE transactions_october;

#Check for NULL and empty strings
SELECT COUNT(*) FROM transactions_october 
WHERE product_id IS NULL OR product_id = '';
SELECT COUNT(*) FROM transactions_october 
WHERE event_type IS NULL OR event_type = '';
SELECT COUNT(*) FROM transactions_october 
WHERE event_time IS NULL;
SELECT COUNT(*) FROM transactions_october 
WHERE category_id IS NULL OR category_id = '';
SELECT COUNT(*) FROM transactions_october 
WHERE category_code IS NULL OR category_code = '';
SELECT COUNT(*) FROM transactions_october 
WHERE brand IS NULL OR brand = '';
SELECT COUNT(*) FROM transactions_october 
WHERE price IS NULL;
SELECT COUNT(*) FROM transactions_october 
WHERE user_id IS NULL OR user_id = '';
SELECT COUNT(*) FROM transactions_october 
WHERE user_session IS NULL OR user_session = '';

#Replacing NULL and empty values
UPDATE transactions_october
SET category_code = 'N/A'
WHERE category_code = 'missing';

UPDATE transactions_october
SET category_id = 'N/A'
WHERE category_id IS NULL OR category_id = '';

UPDATE transactions_october
SET category_code = 'N/A'
WHERE category_code IS NULL OR category_code = '';

UPDATE transactions_october
SET brand = 'N/A'
WHERE brand IS NULL OR brand = '';

UPDATE transactions_october
SET price = 'N/A'
WHERE price IS NULL;


#Top 5 most viewed product category
USE ecommerce_data;
SELECT category_code, COUNT(*) AS views
FROM transactions_october
WHERE event_type = 'view'
GROUP BY category_code
ORDER BY views DESC
LIMIT 5;

#Top 10 most purchased items
SELECT product_id AS "Product ID", category_code AS "Category", COUNT(*) AS "Number of Purchases" 
FROM transactions_october
WHERE event_type = 'purchase'
GROUP BY product_id, category_code
ORDER BY "Number of Purchases" DESC
LIMIT 10;

#Top 10 brands by number of purchases
SELECT brand AS "Brand", COUNT(*) AS "Total Purchases"
FROM transactions_october
WHERE event_type = 'purchase'
  AND brand IS NOT NULL
GROUP BY brand
ORDER BY "Total Purchases" DESC
LIMIT 10;

#Shows how user engagement moves though the funnel 
SELECT event_type AS "Type of Event", COUNT(*) AS "Count of Event"
FROM transactions_october
WHERE event_type IN ('view', 'cart', 'purchase')
GROUP BY event_type
ORDER BY FIELD(event_type, 'view', 'cart', 'purchase');

#Hourly Distribution of Purchases (Military time format)
SELECT HOUR(event_time) AS "Hour of Day (Military Style)", COUNT(*) AS "Purchase Count"
FROM transactions_october
WHERE event_type = 'purchase'
GROUP BY HOUR(event_time)
ORDER BY "Hour of Day";

#Daily Sales Volume
SELECT DATE(event_time) AS "Sale Date", COUNT(*) AS "Total Purchases"
FROM transactions_october
WHERE event_type = 'purchase'
GROUP BY DATE(event_time)
ORDER BY DATE(event_time);

#Total Revenue by Category
SELECT category_code AS "Category", ROUND(SUM(price), 2) AS "Total Revenue"
FROM transactions_october
WHERE event_type = 'purchase'
GROUP BY category_code
ORDER BY "Total Revenue" DESC;

#Most Active Users (by interaction)
SELECT user_id AS "User ID", COUNT(*) AS Interactions
FROM transactions_october
GROUP BY user_id
ORDER BY Interactions DESC
LIMIT 10;

#Average price by category
SELECT category_code AS "Category", ROUND(AVG(price), 2) AS "Average Price"
FROM transactions_october
GROUP BY category_code
ORDER BY "Average Price" DESC;

#Returning Users vs New Users
SELECT 
  COUNT(DISTINCT user_session) AS "Total Sessions",
  COUNT(DISTINCT user_id) AS "Total Users"
FROM transactions_october;

USE proj;

-- View Table
SELECT * FROM sales;

-- How Many Stores?
SELECT COUNT(DISTINCT Store)
FROM sales;

-- How Many Weeks Are Covered?
SELECT COUNT(DISTINCT Date)
FROM sales;

-- What is the Average Number of Weekly Sales?
SELECT AVG(Weekly_Sales)
FROM sales;

-- What is the Average Number of Sales Weekly by Store?
SELECT Store, AVG(Weekly_Sales)
FROM sales
GROUP BY Store;

-- What are the Monthly Sales by Store?
SELECT Store, MONTH(Date) AS Month, YEAR(Date) AS Year, SUM(Weekly_Sales) AS Yearly_Sales
FROM sales
GROUP BY Store, Month, Year
ORDER BY Store ASC;

-- What are the Yearly Sales by Store?
SELECT Store, YEAR(Date) AS Year, SUM(Weekly_Sales) AS Yearly_Sales
FROM sales
GROUP BY Store, Year
ORDER BY Store ASC;

-- How do Sales Differ on Holidays vs Non-Holidays?
SELECT Holiday_Flag AS Holiday, AVG(Weekly_Sales) AS Sales
FROM sales
GROUP BY Holiday_Flag;

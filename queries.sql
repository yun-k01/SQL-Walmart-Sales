USE proj;

-- View Table
SELECT * FROM sales;

-- Which Month has the Greatest Average Sales?
SELECT MONTH(Date) As Month, AVG(Weekly_Sales) As Sales
FROM sales
GROUP BY MONTH(Date)
ORDER BY Sales DESC
LIMIT 1;

-- Which Year has the Greatest Sales?
SELECT YEAR(Date) As Year, SUM(Weekly_Sales) As Sales
FROM sales
GROUP BY YEAR(Date)
ORDER BY Sales DESC
LIMIT 1;

-- Average Weekly Sales by Store in February 2012
SELECT Store, AVG(Weekly_Sales) AS Avg_Sales
FROM sales
WHERE (YEAR(Date) = 2012 AND MONTH(Date) = 2)
GROUP BY Store;

-- Stores With a Greater Sales than the Average in February 2012
SELECT Store, AVG(Weekly_Sales) AS Avg_Sales
FROM sales
WHERE (YEAR(Date) = 2012 AND MONTH(Date) = 2)
GROUP BY Store
HAVING AVG(Weekly_Sales) > (
    SELECT AVG(Weekly_Sales)
    FROM sales
    WHERE (YEAR(Date) = 2012 AND MONTH(Date) = 2));

-- Stores with a Greater Sales than the Week Before in February 2012
SELECT a.Store, a.Date, a.Weekly_Sales, b.Date AS Prev_Week, b.Weekly_Sales AS Prev_Sales
FROM (
    SELECT Store, Date, Weekly_Sales
    FROM sales
    WHERE (YEAR(Date) = 2012 AND MONTH(Date) = 2)
) a
JOIN sales b
    ON a.Store = b.Store AND a.Date = DATE_ADD(b.DATE, INTERVAL 1 WEEK)
WHERE a.Weekly_Sales > b.Weekly_Sales
ORDER BY a.Store, a.Date;

-- How Does CPI Change by Week in February 2012?
SELECT a.Date, AVG(a.CPI) AS Weekly_CPI, b.Date AS Prev_Week, AVG(b.CPI) AS Prev_CPI, (AVG(a.CPI) - AVG(b.CPI)) AS Diff_CPI
FROM (
    SELECT Date, CPI
    FROM sales
    WHERE (YEAR(Date) = 2012 AND MONTH(Date) = 2)
) a
JOIN sales b
    ON a.Date = DATE_ADD(b.Date, INTERVAL 1 WEEK)
GROUP BY a.Date, b.Date
ORDER BY a.Date;
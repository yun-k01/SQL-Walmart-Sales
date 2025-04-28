CREATE DATABASE proj;
USE proj;

-- DROP TABLE sales;

-- Create Table
CREATE TABLE sales (
    Store INTEGER,
    Date TEXT,
    Weekly_Sales FLOAT,
    Holiday_Flag BOOLEAN,
    Temperature FLOAT,
    Fuel_Price FLOAT,
    CPI FLOAT,
    Unemployment FLOAT
);

-- Load local data
SET GLOBAL local_infile = 1;

-- Load csv
LOAD DATA LOCAL INFILE '/Users/yunkyaw/Desktop/Projects/Walmart_Sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip the header row

-- View Table
SELECT * FROM sales;

-- Convert Date to yyyy-mm-dd and DATE data type
UPDATE sales
SET Date = STR_TO_DATE(Date, '%d-%m-%Y');

ALTER TABLE sales
MODIFY COLUMN Date DATE;

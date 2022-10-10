USE sales;

SELECT * FROM data;

#update date data to date type data
UPDATE data
SET Order_Date = str_to_date(Order_Date, '%d/%m/%Y');

UPDATE data
SET Order_Date = DATE_FORMAT(Order_Date, '%d/%m/%Y');

UPDATE data
SET Ship_Date = str_to_date(Ship_Date, '%d/%m/%Y');

UPDATE data
SET Ship_Date = DATE_FORMAT(Ship_Date, '%d/%m/%Y');

#EDA
#Number of customer in US over States
SELECT COUNT(Customer_ID) as 'Number of Customer', State FROM data
WHERE Country = 'United States'
GROUP BY State
ORDER BY COUNT(Customer_ID) DESC;

#Check the total of sales and profit according to Category in 2013
SELECT Order_Date, State, Category, SubCategory, SUM(Sales), SUM(Profit) FROM data
WHERE Country = 'United States'
Group BY State, Category, SubCategory
HAVING Order_Date < '2014-01-01'
ORDER BY State;

#Check the total of sales and profit according to Category in 2014
SELECT State, Category, SubCategory, SUM(Sales), SUM(Profit) FROM data
WHERE Country = 'United States'
Group BY State, Category, SubCategory
HAVING Order_Date BETWEEN  '2014-01-01' AND '2014-12-31'
ORDER BY State;

#Check the total of sales and profit according to Category in 2015
SELECT State, Category, SubCategory, SUM(Sales), SUM(Profit) FROM data
WHERE Country = 'United States'
Group BY State, Category, SubCategory
HAVING Order_Date BETWEEN  '2015-01-01' AND '2015-12-31'
ORDER BY State;

#Check the total of sales and profit according to Category in 2016
SELECT State, Category, SubCategory, SUM(Sales), SUM(Profit) FROM data
WHERE Country = 'United States'
Group BY State, Category, SubCategory
HAVING Order_Date >  '2016-01-01'
ORDER BY State;

#Check the total, minimum, and maximum value of sales and profit in each region
SELECT Region, SUM(Sales), SUM(Profit) FROM data
WHERE Country = 'United States'
Group BY Region;

SELECT Region, MAX(Sales), MAX(Profit) FROM data
WHERE Country = 'United States'
Group BY Region;

SELECT Region, MIN(Sales), MIN(Profit) FROM data
WHERE Country = 'United States'
Group BY Region;

SELECT State, Category, SubCategory, MIN(Sales), MAX(Sales), MIN(Profit), MAX(Profit)  FROM data
WHERE Country = 'United States'
Group BY State, Category, SubCategory
ORDER BY State;

#Highest number of visit
SELECT Customer_Name, COUNT(Customer_Name) AS 'Number of Visit' FROM data
WHERE Region = 'South'
GROUP BY Customer_Name
ORDER BY COUNT(Customer_Name) DESC;

#Best & Worst selling item
SELECT Product_Name, SUM(Sales) AS 'Product sold' FROM data
GROUP BY Product_Name
ORDER BY SUM(Sales) DESC;

SELECT Product_Name, SUM(Sales) AS 'Product sold' FROM data
GROUP BY Product_Name
ORDER BY SUM(Sales) ASC;

Select * from data;

#Negative Profit
SELECT Product_Name, Profit, Sales FROM data
WHERE Profit < 0
ORDER BY Profit asc
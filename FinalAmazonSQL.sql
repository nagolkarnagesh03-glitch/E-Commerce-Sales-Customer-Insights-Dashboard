USE amazon;


SELECT COUNT(*) FROM amazon;



-- Total Sales-- 
SELECT SUM(TotalAmount) as total_sales 
FROM  amazon;



-- Total Orders
SELECT COUNT(DISTINCT OrderID) FROM amazon;



-- Total Customers


SELECT COUNT(DISTINCT CustomerID) FROM amazon;


-- Sales Trend
SELECT 
    DATE_FORMAT(OrderDate , '%Y-%m') AS Month,
    SUM(TotalAmount) as Sales
FROM amazon
GROUP BY Month
ORDER BY Month;



-- Top Products
SELECT ProductName , SUM(Quantity) as Total_Qty
FROM amazon
GROUP BY ProductName
ORDER BY Total_Qty DESC
LIMIT 10;



-- Category Performance

SELECT Category , 
                 SUM(TotalAmount) as Revenue ,
                 SUM(Quantity) as Units_Sold
FROM amazon
GROUP BY Category
ORDER BY Revenue DESC;




-- Top Customers
SELECT CustomerName ,
		SUM(TotalAmount) as Total_Spent
FROM amazon
GROUP BY CustomerName
ORDER BY Total_Spent DESC
LIMIT 10;



-- Payment Method Analysis 


SELECT PaymentMethod,
COUNT(*) as Orders,
SUM(TotalAmount) as revenue
FROM amazon
GROUP BY PaymentMethod ;


-- Discount Impact
SELECT 
      CASE
          WHEN Discount = 0 THEN "No Discount"
          WHEN Discount < 0.2 THEN "Low Discount"
          ELSE "High Discount"
END AS Discount_Category,
SUM(TotalAmount) as Revenue
FROM amazon
GROUP BY Discount_Category ;   


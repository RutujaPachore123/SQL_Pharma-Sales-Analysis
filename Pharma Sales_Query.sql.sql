-- Q1.What is the total sales amount for all products sold?

SELECT SUM(Totalamount) AS TotalSales 
FROM Sales;


-- Q2.What is the current stock level for each product?

SELECT P.ProductName, i.QuantityInStock
FROM Products AS P 
JOIN Inventory AS i 
ON P.ProductID = i.ProductID;


-- Q3.Which product has generated the highest sales amount?

SELECT p.ProductName, s.ProductID, SUM(s.TotalAmount) AS TotalSales 
FROM Sales s 
JOIN Products p ON s.ProductID = p.ProductID 
GROUP BY p.ProductName, s.ProductID 
ORDER BY TotalSales DESC 
LIMIT 1;


-- Q4.Which suppliers provide a specific product (e.g., ProductID = 101)?

SELECT s.SupplierName 
FROM Suppliers s 
JOIN Products p ON s.ProductID = p.ProductID 
WHERE p.ProductID = 101;


-- Q5.What are the contact details of customers who have made purchases?

SELECT DISTINCT c.CustomerID, c.CustomerName, c.ContactNumber, c.Email
FROM Customers c
JOIN Sales s 
ON c.CustomerID = s.CustomerID;


-- Q6.Which products are running low on stock (e.g., less than 50)?

SELECT p.ProductName, i.QuantityInStock
FROM Products p
JOIN Inventory i
ON p.ProductID = i.ProductID
WHERE i.QuantityInStock < 50;


-- Q7.What is the total sales amount by product category?

SELECT p.Category, SUM(s.TotalAmount) AS TotalSales
FROM Sales s
JOIN Products p
ON s.ProductID = p.ProductID 
GROUP BY p.Category
ORDER BY TotalSales DESC;


-- Q8.Which customers have spent the most money?

SELECT c.CustomerName, SUM(s.TotalAmount) AS TotalSpent
FROM Sales s
JOIN Customers c
ON s.CustomerID = c.CustomerID 
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 5;


-- Q9.What were the total sales on a particular date (e.g., '2024-10-1')?

SELECT SUM(TotalAmount) AS TotalSales
FROM Sales
WHERE SaleDate = '2024-10-01';


-- Q10.Which customers are from a specific location (e.g., 'Mumbai')?

SELECT CustomerName, ContactNumber, Email
FROM Customers
WHERE Location = 'Mumbai';

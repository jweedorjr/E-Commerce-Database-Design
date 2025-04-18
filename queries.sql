
-- SQL Queries for Common Operations

-- Total Sales by Product
SELECT 
    p.ProductName,
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.ProductName;


--Sales by Category
SELECT 
    c.CategoryName,
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
JOIN 
    ProductCategories c ON p.CategoryID = c.CategoryID
GROUP BY 
    c.CategoryName;

--Top Customers by Sales
SELECT 
    cu.FirstName,
    cu.LastName,
    SUM(od.Quantity * od.UnitPrice) AS TotalSpent
FROM 
    OrderDetails od
JOIN 
    Orders o ON od.OrderID = o.OrderID
JOIN 
    Customers cu ON o.CustomerID = cu.CustomerID
GROUP BY 
    cu.FirstName, cu.LastName
ORDER BY 
    TotalSpent DESC;

--Inventory Status
SELECT 
    p.ProductName,
    p.StockQuantity,
    SUM(od.Quantity) AS TotalSold,
    (p.StockQuantity - SUM(od.Quantity)) AS StockRemaining
FROM 
    Products p
LEFT JOIN 
    OrderDetails od ON p.ProductID = od.ProductID
GROUP BY 
    p.ProductName, p.StockQuantity;


-- SQL code for common queries

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

-- Sales by Category
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

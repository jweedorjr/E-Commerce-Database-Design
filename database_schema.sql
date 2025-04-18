
-- Suppliers Table - The Suppliers table stores details of suppliers who provide products for the online store.
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    ContactPhone VARCHAR(15),
    ContactEmail VARCHAR(255)
);




--ProductCategories Table - The ProductCategories table stores categories for the products.
CREATE TABLE ProductCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

-- Products Table -  The Products table stores details of products, including their price, stock quantity, and foreign key references to categories and suppliers.
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    CategoryID INT,
    SupplierID INT,
    CONSTRAINT FK_Category FOREIGN KEY (CategoryID) REFERENCES ProductCategories(CategoryID),
    CONSTRAINT FK_Supplier FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Customers Table - The Customers table stores information about customers, such as their contact details and shipping address.
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(15),
    ShippingAddress VARCHAR(255),
    BillingAddress VARCHAR(255)
);

--Orders Table - The Orders table stores order-related details, including the customer who placed the order, the order date, status, and total amount.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME NOT NULL,
    OrderStatus VARCHAR(50) NOT NULL,  -- e.g., Pending, Shipped, Completed
    TotalAmount DECIMAL(10, 2) NOT NULL,
    PaymentStatus VARCHAR(50),  -- e.g., Paid, Unpaid
    PaymentMethod VARCHAR(50),  -- e.g., Credit Card, PayPal
    ShippingAddress VARCHAR(255),
    BillingAddress VARCHAR(255),
    CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--OrderDetails Table - The OrderDetails table stores each item in an order, including quantity and price.
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_Order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_Product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--ShoppingCart Table - The ShoppingCart table manages the items customers have added to their cart before the final purchase.
CREATE TABLE ShoppingCart (
    CartID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    DateAdded DATETIME NOT NULL,
    CONSTRAINT FK_Customer_Cart FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_Product_Cart FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--Payments Table - The Payments table stores payment information related to completed orders.
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATETIME NOT NULL,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50),  -- e.g., Credit Card, PayPal
    PaymentStatus VARCHAR(50),  -- e.g., Paid, Refunded
    CONSTRAINT FK_Order_Payment FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);



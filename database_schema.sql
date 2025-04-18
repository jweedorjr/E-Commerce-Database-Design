
-- SQL code for creating database schema

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    ContactPhone VARCHAR(15),
    ContactEmail VARCHAR(255)
);

CREATE TABLE ProductCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

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

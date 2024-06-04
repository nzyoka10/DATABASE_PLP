-- Create the database
CREATE DATABASE SalesDB;
GO

-- Use the created database
USE SalesDB;
GO

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,          -- Unique identifier for each order
    ProductID INT,                    -- Identifier for the product
    Quantity INT,                     -- Quantity of the product ordered
    Price DECIMAL(10, 2)              -- Price of the product
);

-- Populate the Orders table with sample data
INSERT INTO Orders (OrderID, ProductID, Quantity, Price)
VALUES 
(1, 101, 10, 15.50),  -- Order 1: Product 101, Quantity 10, Price 15.50
(2, 102, 5, 22.30),   -- Order 2: Product 102, Quantity 5, Price 22.30
(3, 103, 20, 8.99),   -- Order 3: Product 103, Quantity 20, Price 8.99
(4, 104, 15, 12.45);  -- Order 4: Product 104, Quantity 15, Price 12.45

-- Task 1: Calculate the total quantity of products sold
SELECT SUM(Quantity) AS TotalQuantitySold
FROM Orders;

-- Task 2: Find the average price of products
SELECT AVG(Price) AS AveragePrice
FROM Orders;

-- Task 3: Identify the product with the highest price
SELECT TOP 1 ProductID, Price
FROM Orders
ORDER BY Price DESC;

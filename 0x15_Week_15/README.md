###### Week 15 -- Assignment

### Overview

- Create a database with a table named Orders. 
- Populate this table with sample data and write SQL queries to perform specific tasks related to the data.

##### Instructions below

#### Step 1: Create the Database and Table

1. **Create the database**:
    ```sql
        CREATE DATABASE SalesDB;
        GO
    ```

2. **Use the created database**:
    ```sql
        USE SalesDB;
        GO
    ```

3. **Create the Orders table**:
    ```sql
        CREATE TABLE Orders (
            OrderID INT PRIMARY KEY,
            ProductID INT,
            Quantity INT,
            Price DECIMAL(10, 2)
        );
    ```

#### Step 2: Populate the Table with Sample Data

1. **Insert sample data into the Orders table**:
    ```sql
        INSERT INTO Orders (OrderID, ProductID, Quantity, Price)
        VALUES 
        (1, 101, 10, 15.50),
        (2, 102, 5, 22.30),
        (3, 103, 20, 8.99),
        (4, 104, 15, 12.45);
    ```

#### Step 3: Write SQL Queries to Perform the Tasks

1. **Calculate the total quantity of products sold**:
    ```sql
        SELECT SUM(Quantity) AS TotalQuantitySold
        FROM Orders;
    ```

2. **Find the average price of products**:
    ```sql
        SELECT AVG(Price) AS AveragePrice
        FROM Orders;
    ```

3. **Identify the product with the highest price**:
    ```sql
        SELECT TOP 1 ProductID, Price
        FROM Orders
        ORDER BY Price DESC;
    ```

## **`Note`**

- The SQL scripts are correctly formatted and tested in `Microsoft SQL Server Management Studio` *`(SSMS)`*.



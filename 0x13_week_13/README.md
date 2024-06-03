###### Week 13 - Assignment
## SQL Conditional Expressions

### Task Overview

- In this assignment, create a database and a table named `Employees`, populate it with sample data, and perform specific SQL queries to manipulate and analyze the data.

#### Let's do it

1. **Create the Database and Table**
    - Create a database named `CompanyDB`.
    - Create a table named `Employees` with the following columns:
        - `EmployeeID` (INT, Primary Key, Auto Increment)
        - `FirstName` (NVARCHAR(50))
        - `LastName` (NVARCHAR(50))
        - `Salary` (DECIMAL(10, 2))
        - `BonusPercentage` (DECIMAL(5, 2))

2. **Populate the Table with Sample Data**
    - Insert sample data into the `Employees` table.

3. **SQL Queries**
    - Create a new column named `TotalCompensation` using the `CASE` statement. The `TotalCompensation` is the sum of `Salary` and a bonus calculated based on the `BonusPercentage` (e.g., if `BonusPercentage` is 10, the bonus is 10% of the `Salary`).
    - Identify employees with a `TotalCompensation` greater than $80,000.
    - Update the `FirstName` of employees with a `TotalCompensation` less than $60,000 to 'LowCompensation'.

### `SQL Script`

- Below is the SQL script to complete the assignment:

```SQL
-- 1. Create the database
CREATE DATABASE CompanyDB;
GO

-- Use the created database
USE CompanyDB;
GO

-- 2. Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Salary DECIMAL(10, 2),
    BonusPercentage DECIMAL(5, 2)
);
GO

-- 3. Populate the table with sample data
INSERT INTO Employees (FirstName, LastName, Salary, BonusPercentage)
VALUES 
('John', 'Doe', 70000, 10),
('Jane', 'Smith', 90000, 5),
('Emily', 'Jones', 40000, 12),
('Michael', 'Brown', 60000, 8),
('Sarah', 'Davis', 85000, 15);
GO

-- 4. Add the TotalCompensation column
ALTER TABLE Employees ADD TotalCompensation DECIMAL(10, 2);
GO

-- 5. Update the TotalCompensation column using the CASE statement
UPDATE Employees
SET TotalCompensation = CASE
    WHEN BonusPercentage IS NOT NULL THEN Salary + (Salary * BonusPercentage / 100)
    ELSE Salary
END;
GO

-- 6. Identify employees with a TotalCompensation greater than $80,000
SELECT *
FROM Employees
WHERE TotalCompensation > 80000;
GO

-- 7. Update the FirstName of employees with a TotalCompensation less than $60,000 to 'LowCompensation'
UPDATE Employees
SET FirstName = 'LowCompensation'
WHERE TotalCompensation < 60000;
GO

-- 8. Verify the updates
SELECT * FROM Employees;
GO

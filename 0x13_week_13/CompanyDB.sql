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

-- 4. Update the TotalCompensation column using the CASE statement
UPDATE Employees
SET TotalCompensation = CASE
    WHEN BonusPercentage IS NOT NULL THEN Salary + (Salary * BonusPercentage / 100)
    ELSE Salary
END;
GO

-- 5. Identify employees with a TotalCompensation greater than $80,000
SELECT *
FROM Employees
WHERE TotalCompensation > 80000;
GO

-- 6. Update the FirstName of employees with a TotalCompensation less than $60,000 to 'LowCompensation'
UPDATE Employees
SET FirstName = 'LowCompensation'
WHERE TotalCompensation < 60000;
GO

-- Verify the updates
SELECT * FROM Employees;
GO

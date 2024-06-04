-- Create the database
CREATE DATABASE Company_DB;
GO

-- Use the created database
USE Company_DB;
GO

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);

-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(50),
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);

-- Create the Salaries table
CREATE TABLE (
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    Salary DECIMAL(10, 2)
);

-- Populate the Departments table with sample data
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES 
(1, 'Sales'),
(2, 'Marketing'),
(3, 'Finance');

-- Populate the Employees table with sample data
INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID)
VALUES 
(101, 'John Doe', 1),
(102, 'Jane Smith', 2),
(103, 'Michael Brown', 2),
(104, 'Emily Johnson', 3);

-- Populate the Salaries table with sample data
INSERT INTO Salaries (EmployeeID, Salary)
VALUES 
(101, 60000),
(102, 70000),
(103, 75000),
(104, 80000);

-- Retrieve a list of employees with their corresponding department names using an appropriate join
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Calculate the average salary for each department
SELECT d.DepartmentName, AVG(s.Salary) AS AverageSalary
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
LEFT JOIN Salaries s ON e.EmployeeID = s.EmployeeID
GROUP BY d.DepartmentName;

-- Identify employees who do not belong to any department
SELECT EmployeeName
FROM Employees
WHERE DepartmentID IS NULL;

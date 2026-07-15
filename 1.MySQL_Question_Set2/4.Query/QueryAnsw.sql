CREATE DATABASE BusinessDB;

USE BusinessDB;

-- Create Employees Table
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
Name VARCHAR(50),
Age INT,
Salary INT,
DepartmentID INT
);

-- Create Departments Table
CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);

-- Create Sales Table
CREATE TABLE Sales (
SaleID INT PRIMARY KEY,
CustomerID INT,
Amount DECIMAL(10,2),
SaleDate DATE
);

-- Create Products Table
CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Price DECIMAL(10,2)
);

-- Create Orders Table
CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerName VARCHAR(100),
OrderDate DATE,
OrderAmount DECIMAL(10,2)
);

-- Insert Data into Employees Table
INSERT INTO Employees (EmployeeID, Name, Age, Salary, DepartmentID)
VALUES
(1, 'John', 30, 60000, 101),
(2, 'Emily', 25, 48000, 102),
(3, 'Michael', 40, 75000, 103),
(4, 'Sara', 35, 56000, 101),
(5, 'David', 28, 49000, 102),
(6, 'Robert', 45, 90000, 103),
(7, 'Sophia', 29, 51000, 102);

-- Insert Data into Departments Table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT');

-- Insert Data into Sales Table
INSERT INTO Sales (SaleID, CustomerID, Amount, SaleDate)
VALUES
(1, 101, 4500.00, '2023-03-15'),
(2, 102, 5500.00, '2023-03-16'),
(3, 103, 7000.00, '2023-03-17'),
(4, 104, 3000.00, '2023-03-18'),
(5, 105, 6000.00, '2023-03-19');

-- Insert Data into Products Table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES
(1, 'Laptop', 1000.00),
(2, 'Mobile', 500.00),
(3, 'Tablet', 300.00),
(4, 'Headphones', 100.00),
(5, 'Smartwatch', 200.00);

-- Insert Data into Orders Table
INSERT INTO Orders (OrderID, CustomerName, OrderDate, OrderAmount)
VALUES
(1, 'John', '2023-05-01', 500.00),
(2, 'Emily', '2023-05-02', 700.00),
(3, 'Michael', '2023-05-03', 1200.00),
(4, 'Sara', '2023-05-04', 450.00),
(5, 'David', '2023-05-05', 900.00),
(6, 'John', '2023-05-06', 600.00),
(7, 'Emily', '2023-05-07', 750.00);

-- 1.Retrieve all employees whose salary is greater than 60000.
SELECT EmployeeID, Name, Salary
FROM Employees
WHERE Salary > 60000;

-- 2.Calculate the total sales amount for each customer from the sales table.
SELECT CustomerID,
	SUM(Amount) as Total_sales
FROM Sales
GROUP BY CustomerID;

-- 3.Retrieve the names and salaries of all employees working in the Finance department
SELECT e.Name, e.Salary
FROM Departments d
Inner join Employees e on d.DepartmentID = e.DepartmentID
WHERE d.DepartmentName = 'Finance';

-- 4.Find the total sales amount made on 2023-03-17 from the sales table.
SELECT SUM(Amount) AS TotalSales
FROM Sales 
WHERE SaleDate = '2023-03-17';

-- 5.Get the names of customers who have placed an order of more than 600 from the orders table.
SELECT CustomerName, OrderAmount
FROM Orders
WHERE OrderAmount > 600;




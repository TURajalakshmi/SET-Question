CREATE DATABASE company_db;

USE company_db;

-- Departments
CREATE TABLE departments (
department_id INT PRIMARY KEY AUTO_INCREMENT,
department_name VARCHAR(50) NOT NULL
);

-- Employees
CREATE TABLE employees (
employee_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
age INT NOT NULL,
salary INT NOT NULL,
department_id INT,
FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

-- Products
CREATE TABLE products (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50) NOT NULL,
price DECIMAL(10,2) NOT NULL
);

-- customers
CREATE TABLE customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(50) NOT NULL
);

-- sales
CREATE TABLE sales (
sale_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
amount DECIMAL(10,2) NOT NULL,
sale_date DATE NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

-- orders
CREATE TABLE orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(50) NOT NULL,
order_date DATE NOT NULL,
order_amount DECIMAL(10, 2) NOT NULL
);

-- Insert sample data
INSERT INTO departments (department_id, department_name)
VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT'),
(104, 'Marketing');

INSERT INTO employees (name, age, salary, department_id)
VALUES
('John', 30, 60000, 101),
('Emily', 25, 48000, 102),
('Michael', 40, 75000, 103),
('Sara', 35, 56000, 101),
('David', 28, 49000, 102);

INSERT INTO products (product_name, price)
VALUES
('Laptop', 1000),
('Mobile', 500),
('Tablet', 300),
('Headphones', 100),
('Smartwatch', 200);

INSERT INTO customers (customer_id, customer_name)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Alice Johnson'),
(104, NULL),
(105, 'Robert Brown');

ALTER TABLE customers
MODIFY customer_name VARCHAR(50);

INSERT INTO sales (sale_id, customer_id, amount, sale_date)
VALUES
(1, 101, 4500.00, '2023-03-15'),
(2, 102, 5500.00, '2023-03-16'),
(3, 103, 7000.00, '2023-03-17'),
(4, 104, 3000.00, '2023-03-18'),
(5, 105, 6000.00, '2023-03-19');

INSERT INTO orders (customer_name, order_date, order_amount)
VALUES
('John', '2023-05-01', 500),
('Emily', '2023-05-02', 700),
('Michael', '2023-05-03', 1200),
('Sara', '2023-05-04', 450),
('David', '2023-05-05', 900);

-- Syntax Error Identification
SELECT name, age 
FROM employees 
WHERE salary >= 50000;

-- Logical Error Detection
SELECT * FROM orders 
WHERE order_date IN ( '2023-05-01' , '2023-05-02');

-- Performance Optimization
CREATE INDEX idx_sales_amount ON sales(amount);

SELECT *FROM sales
WHERE amount > 5000;

-- Data Type Mismatch
SELECT * FROM products 
WHERE price = 100;

-- Incorrect Join Condition
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d. department_id;

--  Incorrect NULL Handling
SELECT * FROM customers
WHERE customer_name IS NULL;

-- Incorrect Use of Aggregate Functions
SELECT customer_id, 
SUM(amount) AS total_sales
FROM sales
GROUP BY customer_id;

-- Incorrect Column Selection
SELECT order_id, customer_name
FROM orders;




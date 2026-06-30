CREATE DATABASE sales_management_db;

USE sales_management_db;

-- Create Departments Table

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    salary INT NOT NULL,
    department_id INT,
FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    sale_date DATE NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    order_date DATE NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL
);

-- SQL Data Insertion

INSERT INTO departments (department_id, department_name)
VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT');

INSERT INTO employees (name, age, salary, department_id)
VALUES
('John', 30, 60000, 101),
('Emily', 25, 48000, 102),
('Michael', 40, 75000, 103),
('Sara', 35, 56000, 101),
('David', 28, 49000, 102),
('Robert', 45, 90000, 103),
('Sophia', 29, 51000, 102);

INSERT INTO sales (customer_id, amount, sale_date)
VALUES
(101, 4500.00, '2023-03-15'),
(102, 5500.00, '2023-03-16'),
(103, 7000.00, '2023-03-17'),
(104, 3000.00, '2023-03-18'),
(105, 6000.00, '2023-03-19');

INSERT INTO products (product_name, price)
VALUES
('Laptop', 1000),
('Mobile', 500),
('Tablet', 300),
('Headphones', 100),
('Smartwatch', 200);

INSERT INTO orders (customer_name, order_date, order_amount)
VALUES
('John', '2023-05-01', 500),
('Emily', '2023-05-02', 700),
('Michael', '2023-05-03', 1200),
('Sara', '2023-05-04', 450),
('David', '2023-05-05', 900),
('John', '2023-05-06', 600),
('Emily', '2023-05-07', 750);

-- Question 1: Retrieve Employee Details
-- Retrieve all employees whose salary is greater than 60000.

SELECT employee_id, name, salary
FROM employees
WHERE salary > 60000;

-- Question 2: Find Total Sales Per Customer
-- Calculate the total sales amount for each customer from the sales table.

SELECT customer_id,
SUM(amount) AS total_sales
FROM sales
GROUP BY customer_id;

-- Question 3: Employee Salary in Finance Department
-- Retrieve the names and salaries of all employees working in the 'Finance' department.

SELECT departments.department_id, departments.department_name, employees. name, employees.salary
FROM departments
INNER JOIN employees on departments.department_id = employees.department_id
WHERE departments.department_name = 'Finance';

-- Question 4: Total Sales on a Specific Date
-- Find the total sales amount made on '2023-03-17'.

SELECT SUM(amount) AS total_sales
FROM sales
WHERE sale_date = '2023-03-17';

-- Question 5: High-Value Orders
-- Get the names of customers who have placed an order of more than 600.

SELECT customer_name, order_amount
FROM orders
WHERE order_amount > 600;



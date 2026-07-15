CREATE DATABASE company_management_db;

USE company_management_db;

-- Creating departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

SELECT * FROM employees;

-- Creating employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,	
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    salary INT NOT NULL,
    department_id INT,
FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

-- Creating customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

-- Creating sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    amount DECIMAL(10,2) NOT NULL,
    sale_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

-- Creating products table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    price INT
);

-- Creating orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    order_date DATE,
    order_amount INT
);


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

SELECT * FROM employees;

INSERT INTO customers (customer_id, customer_name)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Alice Johnson'),
(104, NULL),
(105, 'Robert Brown');


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
('David', '2023-05-05', 900);


-- 1. Retrieve Employees in Finance Department
SELECT e.name, e.age, e.salary
FROM employees e
INNER JOIN departments d  ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';



-- 2. Calculate Total Sales for Each Customer
SELECT customer_id,
	SUM(amount) AS total_sales
FROM sales
GROUP BY customer_id;



-- 3. Find Products Priced Over the Average Price
-- Incorrect Code
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG (price) FROM products);



-- 4. Get Customers Who Have Placed Orders Over 1000
-- Incorrect Code
SELECT DISTINCT customer_name
FROM orders
WHERE order_amount > 1000;



-- 5. Find Total Sales for Each Customer
-- Incorrect Code
SELECT customer_id, 
	SUM(amount) as total_sales
FROM sales
GROUP BY customer_id;

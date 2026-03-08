DROP DATABASE IF EXISTS company_practice;
CREATE DATABASE company_practice;
USE company_practice;

DROP TABLE IF EXISTS departments;

CREATE TABLE departments (dept_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Marketing'),
(5,'Sales');

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT
);

INSERT INTO employees VALUES
(1,'Alice',60000,1,NULL),
(2,'Bob',55000,2,1),
(3,'Charlie',50000,2,1),
(4,'David',45000,3,2),
(5,'Eva',70000,1,1),
(6,'Frank',40000,NULL,2);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount INT
); 

INSERT INTO orders VALUES
(1,'Rahul',2000),
(2,'Ankit',4000),
(3,'Rahul',1500),
(4,'Priya',3000),
(5,'Ankit',2500);


SELECT e.emp_id, e.name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
UNION
SELECT e.emp_id, e.name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;


SELECT e.emp_id, e.name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
UNION 
SELECT e.emp_id, e.name, d.department_name
FROM employees e
RIGHT JOIN departments  d
ON e.dept_id = d.dept_id;

SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
UNION
SELECT e.name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.emp_id = d.dept_id;


SELECT e.emp_id
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.department_name IS NULL;


SELECT d.department_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
WHERE e.emp_id  IS NULL;


SELECT e.emp_id, e.name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
UNION
SELECT e.emp_id, e.name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

SELECT e.emp_id AS employee , m.emp_id AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

SELECT e.name AS employee, m.emp_id AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id
WHERE e.name IS NULL;


SELECT m.emp_id AS manager, e.name AS employee
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id; 


SELECT e.name AS employee, m.emp_id AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id
WHERE m.name = 'Charlie';

SELECT e.name AS employee, m.name AS manager
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id;


SELECT m.name AS manager, COUNT(e.emp_id) AS num_employees
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
GROUP BY m.name;


SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

SELECT DISTINCT m.name AS manager
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id;
















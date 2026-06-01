CREATE DATABASE PracticeDB;
USE PracticeDB;

-- Department Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales');

-- Employee Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    salary INT,
    city VARCHAR(30),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(101, 'Amit', 30000, 'Jaipur', 1),
(102, 'Neha', 45000, 'Delhi', 2),
(103, 'Ravi', 50000, 'Mumbai', 2),
(104, 'Priya', 35000, 'Jaipur', 3),
(105, 'Karan', 60000, 'Delhi', 3),
(106, 'Sneha', 40000, 'Mumbai', 1);

-- Customer Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(30),
    city VARCHAR(30)
);

INSERT INTO customers VALUES
(1, 'Raj', 'Delhi'),
(2, 'Simran', 'Mumbai'),
(3, 'Aman', 'Jaipur');

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(1001, 1, 12000),
(1002, 2, 15000),
(1003, 1, 18000),
(1004, 3, 10000);

select * from employees;
select * from departments;
select * from customers;
select * from orders;

-- ----------------------------------------------------------------------------------------------------------------

-- JOIN'S QUESTION

-- Question 1: Display employee names with department names.
select e.emp_name , d.dept_name from employees as e join departments as d on e.dept_id = d.dept_id;
-- Question 2: Show all employees with their department details.
select e.emp_name ,d.dept_id, d.dept_name from employees as e join departments as d on e.dept_id = d.dept_id;
-- Question 3: Display customer names with their order amount.
select c.customer_name , o.amount from customers as c join orders as o on c.customer_id = o.customer_id;
-- Question 4: Show all orders with customer names.
select o.order_id , c.customer_name from orders as o join customers as c on o.customer_id = c.customer_id;
-- Question 5: Find employees working in IT department.
select e.emp_name , d.dept_name from employees as e join departments as d on e.dept_id = d.dept_id where d.dept_name = 'IT';
-- Question 6: Show employee name and city with department name.
select e.emp_name , e.city , d.dept_name from employees as e join departments as d on e.dept_id = d.dept_id;
-- Question 7: Display customers who placed orders above 12000.
	select c.customer_name , o.amount from customers as c join orders as o on c.customer_id = o.customer_id where o.amount > 12000;
-- Question 8: Show department-wise employee count using JOIN.
select d.dept_name , count(e.emp_id) from departments as d join employees as e on d.dept_id = e.dept_id group by d.dept_name; 
-- Question 9: Find highest salary employee with department name.
select e.emp_name , d.dept_name , e.salary from employees as e join departments as d on e.dept_id = d.dept_id where e.salary = (select max(salary) from employees);
-- Question 10: Display all customers even if they have no orders.
select c.customer_name , o.order_id from customers as c left join orders as o on c.customer_id = o.customer_id;
-- Question 11: Show employees from Delhi with department name.
select e.emp_name , e.city , d.dept_name from employees as e join departments as d on e.dept_id = d.dept_id where e.city = 'Delhi';
-- Question 12: Display customer name and total order amount.
select c.customer_name , sum(o.amount) as total_amount from customers as c join orders as o on c.customer_id = o.customer_id group by c.customer_name;
-- Question 13: Find employees earning more than 40000 with department names.
select e.emp_name , e.salary , d.dept_name from employees as e join departments as d on e.dept_id = d.dept_id where e.salary > 40000;
-- Question 14: Show all departments and their employees.
select d.dept_name , e.emp_name from departments as d join employees as e on d.dept_id = e.dept_id order by dept_name;
-- Question 15: Find departments without employees.
select d.dept_name  from departments as d left join employees		 as e on d.dept_id = e.dept_id where e.dept_id is null;
-- Question 16: Show customer city and order amount.
select c.city , o.amount from customers as c join orders as o on c.customer_id = o.customer_id;
-- Question 17: Display employees and departments sorted by salary.
select e.emp_name , d.dept_name , e.salary as salary from employees as e join departments as d on e.dept_id = d.dept_id order by salary;
-- Question 18: Find employee with maximum salary in each department.
select d.dept_name , max(e.salary) from departments as d join employees as e on d.dept_id = e.dept_id group by d.dept_name;
-- Question 19: Show customers who placed more than one order.
select c.customer_name , count(o.order_id) from customers as c join orders as o on c.customer_id = o.customer_id group by c.customer_name having count(o.order_id) > 1;
-- Question 20: Display employee details with department IDs.
select e.emp_name , d.dept_id , d.dept_name from employees as e join departments as d on e.dept_id = d.dept_id order by d.dept_id;
-- Question 21: Find total order amount city-wise using JOIN.
SELECT c.city , sum(o.amount) from customers as c join orders as o on c.customer_id = o.customer_id group by c.city;
-- Question 22: Show department names and average salary.
select d.dept_name , avg(e.salary) as avg_salary from departments as d join employees as e on d.dept_id = e.dept_id group by d.dept_name;
-- Question 23: Find employees whose salary is above department average.
select e.emp_name , e.salary , d.dept_name from employees as e join departments as d on e.dept_id = d.dept_id where e.salary >
(select avg(salary) from employees where dept_id = d.dept_id);
-- Question 24: Display all employee and department records using LEFT JOIN.
select e.emp_id , e.emp_name , d.dept_name from employees as e left join departments as d on e.dept_id = d.dept_id;
-- Question 25: Show employee names with department names and salaries.
select e.emp_name , d.dept_name , e.salary from employees as e join departments as d on e.dept_id = d.dept_id;
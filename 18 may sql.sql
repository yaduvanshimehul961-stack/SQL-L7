use shadidb;
-- partition by
show databases;
select * from employees;
select *, sum(salary) over(partition by department), sum(salary) over() from employees;

select *, sum(salary) over(partition by department) from employees;

select *, sum(salary) over(partition by manager_id) from employees;

select *, sum(salary) over(partition by emp_id) from employees;

select *, sum(salary) over(partition by department order by salary) from employees;

select *, sum(salary) over(partition by department),(salary/ sum(salary) over(partition by department))*100 from employees;


-- Windows 

create database windowsdb;
use windowsdb;


-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
 
-- ============================================
--  Insert sample data (12 employees)
-- ============================================
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2020),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);

select * from employees;

select *, sum(salary) over(partition by hire_year order by salary)from employees;

select *, max(salary) over(partition by dept order by hire_year) from employees;

select *, avg(salary) over(partition by dept),
case
    when salary > avg(salary) over(partition by dept) then 'above avg salary'
    else 'less than avg salary'
end as salary_status
from employees;

select *, row_number() over() from employees;

select *, row_number() over(order by emp_id) from employees;

select *, row_number() over(partition by dept) from employees;

select*, rank() over(partition by dept order by salary desc) from employees;

-- diff b/w windows function an group by
-- row,rank, dense rank
-- diff b/w where and having clause 
-- types of jions in sql
-- natural join and cartition join(cross join)
-- super key, primary key,unique key,foreign key
    
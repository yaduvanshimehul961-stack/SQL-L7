use shadidb;

-- Create Table
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT
);
-- Insert Data
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);

select * from employees;

select avg(salary) from employees;
select * from employees where salary>(select avg (salary) from employees);

select max(salary) from employees;
select * from employees where salary=(select max(salary) from employees);

select salary from employees where emp_id=101;
select * from employees where salary>(select salary from employees where emp_id=101);

select min(salary) from employees;
select department from employees where salary=(select min(salary) from employees);

-- multi row subquery:

select department from employees where name='Alice' or name='Bob';
select * from employees
where department in (select department from employees where name='Alice' or name='Bob');


select salary from employees where  emp_id=103 or emp_id=105;
select * from employees where salary not in (select salary from employees where emp_id=103 or emp_id=105);

-- ANY OPERATOR:
select * from employees where salary >ANY (select salary from employees where emp_id=103 or emp_id=105);

select * from employees where department ='hr';
select * from employees where salary>any(select salary from employees where department='hr');
select * from employees where salary>all(select salary from employees where department='hr');

select * from employees where department ='IT';
select * from employees where salary>any(select salary from employees where department='IT');
select * from employees where salary>all(select salary from employees where department='IT');

-- QUESTION :

-- FIND THE EMPLOYEE DETAIL WHO WORKS  IT DEPARTMENT AND HAVE THE SALARY  GREATER THAN EMP_ID 101 ? 
SELECT salary from employees where emp_id=101 and department = 'IT' ;
select * from employees where salary >(SELECT salary from employees where emp_id=101) and department='IT';

-- FIND THE NAME OF A PERSON WHO'S SALARY IS GREATER THAN ALL THE SALARY OF HR OT IT DEPARTMENT ?
select salary from employees where department='HR' or department='IT';
select name,department from employees where salary >all
(select salary from employees where department='HR' or department='IT');


-- FIND THE EMPLOYEE ID AND THE EMPLOYEE NAME OF THE USER WHOS SALARY IS GREATER THAN THE SLARY OF ANY EMPLOYEE WORKING UDER THE MANAGER ID 101 ?
select name, salary, manager_id department from employees where manager_id=101;
select emp_id, name from employees where salary>any(select  salary from employees where manager_id=101); 
-- FIND OUT THE SECOND HIGHEST SALARY FROM THIS TABLE ?
select max(salary) from employees where salary < (select max(salary) from employees);
create database joinpractice;

use joinpractice;


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);



INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');



INSERT INTO employees VALUES
(101, 'Alice', 70000, 1, NULL),
(102, 'Bob', 60000, 2, 101),
(103, 'Charlie', 55000, 2, 102),
(104, 'David', 50000, 3, 101),
(105, 'Eva', 45000, 4, 104),
(106, 'Frank', 75000, 1, 101),
(107, 'Grace', 80000, 2, 102),
(108, 'Helen', 62000, 3, 104),
(109, 'Ian', 47000, 4, 105),
(110, 'Jack', 53000, 2, 102),
(111, 'Kevin', 49000, 3, 104),
(112, 'Laura', 72000, 1, 101),
(113, 'Mike', 58000, 4, 105),
(114, 'Nina', 61000, 2, 107),
(115, 'Oscar', 52000, NULL, 101);


/*
Display employee names along with their department names.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |



Display all employees and their department names, including employees without departments.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |
| Oscar    | NULL      |


Find the number of employees in each department.
| dept_name | total_employees |
| --------- | --------------- |
| HR        | 3               |
| IT        | 5               |
| Finance   | 3               |
| Sales     | 3               |



Display all departments and the total salary paid in each department.
| dept_name | total_salary |
| --------- | ------------ |
| HR        | 217000       |
| IT        | 309000       |
| Finance   | 161000       |
| Sales     | 150000       |




Find how many employees report to each manager.
| manager | team_size |
| ------- | --------- |
| Alice   | 5         |
| Bob     | 4         |
| David   | 4         |
| Eva     | 2         |
| Grace   | 1         |



Display average salary department-wise where average salary is greater than 60000.
| dept_name | avg_salary |
| --------- | ---------- |
| HR        | 72333.33   |
| IT        | 61800      |





*/

select *  from employees;
select * from departments;

-- question 1 
select e.emp_name , d.dept_name from employees as e join departments as d on e.dept_id = d.dept_id;

-- question 2 
select e.emp_name , d.dept_name from employees as e left join departments as d on e.dept_id = d.dept_id;

-- question 3
select d.dept_name , count(e.dept_id) as total_employees from employees as e join departments as 
d on e.dept_id = d.dept_id group by d.dept_name;

-- question 4 
select d.dept_name , sum(e.salary) as total_salary from employees as e join departments as d on e.dept_id = d.dept_id 
group by d.dept_name;

-- question 5 
select m.emp_name ,count(*) from employees  as e join employees as m on e.manager_id = m.emp_id 
group by m.emp_name;

-- question 6 
select d.dept_name , avg(e.salary) as avg_salary from employees as e join departments as d on e.dept_id = d.dept_id 
group by d.dept_name having avg(e.salary) > 60000;

-- ------------------------------------------------------------------------------------------------------------------------



use sakila;

select * from actor;
select * from film_actor;
select * from film;

-- QUESTION:

-- question 1 : select actor_id ,actor_name and film id for which actor has worked 
select a.actor_id ,a.first_name ,fa.film_id from actor as a join film_actor as fa on a.actor_id = fa.actor_id;

-- question 2 : get the film_id , the film_title and the actor _id 
select fa.film_id , f.title , fa.actor_id from film_actor as fa join film as f on fa.film_id = f.film_id;

-- question 3: find the actor_id , actor_name and the movie he has work
SELECT a.actor_id, a.first_name AS actor_name, f.title AS movie_name FROM actor AS a JOIN film_actor AS fa
ON a.actor_id = fa.actor_id JOIN film AS f ON fa.film_id = f.film_id;

-- only for the movie whos length is greater then 120 
select a.actor_id, a.first_name as actor_name, f.title as movie_name from actor as a join film_actor as fa 
on a.actor_id = fa.actor_id
join film as f on fa.film_id = f.film_id where f.length > 120;

-- get the actor_id , the actor_name and the total number of movie he has worked
select a.actor_id , a.first_name , count(fa.film_id) from actor as a join film_actor as fa 
on a.actor_id = fa.actor_id group by a.actor_id , a.first_name  ;

-- get the film title and the number of actors that hve work on that film
select f.title , count(fa.film_id) as total_actor from film as f join film_actor as fa on f.film_id = fa.film_id group by f.title;
use windowsdb;
select *, row_number() over (order by salary),
rank() over(order by salary),
dense_rank() over(order by salary) from employees;

select *, 
rank() over(partition by dept order by salary) from employees;

select *, 
rank() over(partition by dept order by hire_year) from employees;

select * from employees as e where salary =(
select max(Salary) from employees where dept = e.dept);

-- max
select * from
(select *, max(salary) over(partition by dept) as deptsalary from employees) as trh
where salary=deptsalary;

select * from 
( select *, rank() over(partition by dept order by salary desc) as rnk from employees) as temp
where rnk=1;

-- correlated subquery ek aisi subquery hoti hai jo outer query par depend karti hai.

-- Inner query outer query ki har row ke liye execute hoti hai. also called as depended sub query.

-- generally the out column is refer the nested.alter

select * from
(select *, dense_rank() over(order by salary desc) as drank from employees) as xyz
where drank=2;

select * from employees where salary=
(select max(salary) from employees where salary < ( select max(salary) from employees));
  
-- select min(salary) from employees where salary > (select min(salary) from employees)

select * from employees where salary =
 (select min(salary) from employees where salary > 
(select min(salary) from employees where salary >
 (select min(salary) from employees where salary >
(select min(salary) from employees))));

select * from
(select *, dense_rank() over(order by salary ) as drank from employees) as xyz
where drank=4;

-- rows between

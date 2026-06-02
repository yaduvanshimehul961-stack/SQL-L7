-- cte (comman table expression)
-- sorting a result on a temporary

select * from sakila.film_actor;
select actor_id , count(*) as t  from sakila .film_actor 
group by actor_id 
having t>1;

with test as 
(select actor_id, count(film_id) as moviescount
from sakila.film_actor group by  actor_id)

select sum(moviescount) from test  where actor_id>10;


use windowsdb;
select * from  employees; 

-- precedence order in sql 
-- from/join > where > group by > having > select > distinct > order by > limit/offset.. 
select * from employees as e where salary = ( select max(salary) from employees where dept= e.dept);

select * from 
(select *, max(salary) over(partition by dept) as deptmax from employees) as temp 
where salary = deptmax;

--  below is with cte 
with cte as 
(select *, max(salary) over(partition by dept) as deptmax from employees)

select * from cte  where salary = deptmax;

with  xyz as
(select dept, max(salary) as deptmax from employees group by dept)

select * from employees join xyz where employees.dept = xyz.dept and employees.salary=xyz.deptmax ;


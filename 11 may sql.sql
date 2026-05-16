-- SUBQUERY : is a type of query where a query is present within another query.
-- this subquery also call as nested subquery.
-- subquery has two parts : 1.outer query
--                          2.inner query(execute first)

create database shadidb;

use shadidb;
 
create table biodata(id int, name varchar(20),age int);
 
insert into biodata values(1, 'rahul', 28), (2,'anjali', 28),(3,'aishwarya', 40), (4,'naina',23);

select age from biodata where  name ='RAHUL';

select * from biodata where age =29;

select * from biodata where age =(select age from biodata where  name ='RAHUL');

select max(age) from biodata;

select * from biodata where age =40;

select * from biodata where age =(select max(age) from biodata);

-- find the name of 
select char_length(name) from biodata where name='rahul';

select name from biodata where 
char_length(name) = (select char_length(name) from biodata where name='rahul');

-- SINGLE ROW QUERY : IN WHICH INNER QUERY RETURNS ONLY ONE ROW. 

use sakila;
select * from film;

-- movie where the rental rate is same for the movie of african egg?

SELECT title, rental_rate FROM film WHERE rental_rate = (SELECT rental_rate FROM film WHERE title = 'AFRICAN EGG'); -- dynamic condition


-- 	QUESTION

-- GET THE MOVIE ID AND THE MOVIE NAME WHERE THE RENTAL RATE IS EQUAL THE MIN RATE ?
SELECT film_id, title FROM film WHERE rental_rate = ( SELECT MIN(rental_rate)FROM film); 

-- GET THE MOVIE ID AND DURATOIN WHERE THE DURATION IS GREATER THAN  AVG DURATION OF THE MOVIES ?
select film_id , title , rental_duration from film where rental_duration >
(select avg(rental_duration) from film);
-- GET THE MOVIE ID FOR THE MOVIES WHERE THE RELEASE YEAR THE MOVIE SHOULD BE THE  EQUAL  TO THE ALONE TRIP AND 
-- RATING SHOULD BE THE SAME AS TO  
-- OF THE APOLLO TEEN 
select film_id from film where release_year = 
(select release_year from film where title = 'ALONE TRIP') AND rating = (select rating from film where title = 'APOLLO TEEN') ;


-- MULTI ROW SUBQUERY (nested query) : if it return more than one row.
-- NOT USE ARITHMATIC OPERATION.

use shadidb;
select * from biodata;

select age from biodata where name = 'anjali' or name = 'aishwarya';

select *  from biodata where  age in (select age from biodata where name = 'anjali' or name = 'aishwarya');

-- I need to find the name for rahul where the age is != age of anjali or aishwariya ?

select *  from biodata where  age  not  in (select age from biodata where name = 'anjali' or name = 'aishwarya'); 

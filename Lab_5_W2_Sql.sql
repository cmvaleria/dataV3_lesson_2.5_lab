-- 1) Select all the actors with the first name ‘Scarlett’.

USE sakila;

select * from actor
where first_name = 'Scarlett';

-- 2) How many films (movies) are available for rent and how many films have been rented?


select count(title) from film;
-- 1000 films available;

select sum(rental_rate) from film;
-- 2980 films rented;


-- 3) What are the shortest and longest movie duration? Name the values max_duration and min_duration.

select * from film;

select min(rental_duration) as min_duration ,  max(rental_duration) as max_duration from film;
-- min: 3 and max: 7

-- 4) What's the average movie duration expressed in format (hours, minutes)?
select * from film;

select round(avg(length),0) as avarage_movie_hours, round((avg(length)-round(avg(length),0))*60,0) as avarage_movie_minutes from film;

-- 115 hrs 16 min

-- 5) How many distinct (different) actors' last names are there?

select * from actor;
select distinct(last_name) from actor;

select count(distinct(last_name)) as different_last_names from actor;

-- 121 different names

-- 6) Since how many days has the company been operating (check DATEDIFF() function)?

-- not really sure what is the table that give me this information, i will suppost this will be the difference from the frist and last paymebt.

use sakila;
select * from payment;
select max(payment_date) from payment;
SELECT DATE(max(payment_date)) from payment; -- '2006-02-14'
SELECT DATE(min(payment_date)) from payment; -- '2005-05-24'

SELECT DATEDIFF(day, DATE(min(payment_date)), DATE(max(payment_date))) from payment;

SELECT DATEDIFF(day, '2005-05-24', '2006-02-14'); 

-- not working, using to much time on this :/ 

-- 7) Show rental info with additional columns month and weekday. Get 20 results.

select *, month(rental_date) as rental_month, date_format(rental_date, '%W') as rental_weekday  from rental
limit 20;


-- 8) Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *, month(rental_date) as rental_month,  date_format(rental_date, '%W') as rental_weekday,  
case 
when DATE_FORMAT(rental_date, '%W') in ('Sunday', 'Saturday') then 'weekend'
else 'workday'
end as day_type 
from rental;


-- 9) Get release years.

select release_year from film;

-- 10) Get all films with ARMAGEDDON in the title.

select title from film 
where title LIKE '%ARMAGEDDON%';


-- 11) Get all films which title ends with APOLLO.

select title from film 
WHERE title LIKE '%APOLLO';

-- 12) Get 10 the longest films.

select * from film 
order by length desc
limit 10;

-- 13) How many films include Behind the Scenes content?

select count(special_features) from film 
where special_features = 'Behind the Scenes'

-- 70 films

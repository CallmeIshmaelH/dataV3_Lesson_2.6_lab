
-- 1. In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
-- These three actors have the same last name. 
-- So we do not want to include this last name in our output. 
-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

select * from sakila.actor group by last_name having count(last_name) = 1;

-- 2. Which last names appear more than once? 
-- We would use the same logic as in the previous question but this time we want to include 
-- the last names of the actors where the last name was present more than once.

select *, count(last_name) as 'Count of last name' from sakila.actor group by last_name having count(last_name)>1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.

select count(rental_id) as 'Rentals Processed', staff_id from sakila.rental group by staff_id; 

-- 4. Using the film table, find out how many films were released each year.

select count(film_id), release_year from sakila.film group by year(release_year) order by year(release_year) asc;

-- 5. Using the film table, find out for each rating how many films were there.

select count(film_id) as 'Count of films', rating from sakila.film group by rating order by count(film_id);

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places 

select round(AVG(`length`),2) as 'Average duration', rating from sakila.film group by rating order by rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?

select rating, round(AVG(`length`),2) as 'Average duration' from sakila.film group by rating;

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.
select title, `length`, case 
when `length`> 115 then 'Longer than Average'
when `length`between 90 and 100 then 'Shorter than Average'
when  `length` between 75 and 90  then 'Standard Length'
else 'Short film'
end as 'rank' from sakila.film where `length` is not null and `length` <> 0;

select * from sakila.film where `length` is not null; 
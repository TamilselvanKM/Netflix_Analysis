select * from Netflix;

-- 15 Business problems & solutions

--1. Count the number of Movies vs TV Shows

select type,count(*) as Total_content from Netflix
group by type;

--2. Find the most common rating for movies and TV shows

select type,rating from
(select type,rating, count(*), rank() over(partition by type order by count(*) desc) as ranking
from Netflix
group by 1,2) as t1
where ranking = 1;

--3. List all movies released in a specific year (e.g., 2020)

select type,title,release_year from Netflix
where type = 'Movie' and release_year = 2020;

--4. Find the top 5 countries with the most content on Netflix

select
unnest(string_to_array(country,',')) as new_country,
count(show_id) as Total_content
from Netflix
group by 1
order by 2 desc
limit 5;

--5. Identify the longest movie

select * from Netflix
where type = 'Movie' and duration = (select max(duration) from Netflix);

--6. Find content added in the last 5 years

select * from Netflix
where to_date(date_added,'Month DD, YYYY')>= current_date - interval '5 years';

--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

select * from Netflix
where director = 'Rajiv Chilaka';

--8. List all TV shows with more than 5 seasons

select * from Netflix
where type = 'TV Show' and split_part(duration,' ',1):: numeric > 5;

--9. Count the number of content items in each genre

select 
unnest(string_to_array(listed_in,',')) as genre,
count(show_id) as Total_content 
from Netflix
group by 1;

--10.Find each year and the average numbers of content release in India on netflix. 
--return top 5 year with highest avg content release!

select 
extract(year from to_date(date_added,'Month DD, YYYY')) as year,
count(*) as yearly_content,
cast(
  count(*):: numeric/(select count(*) from Netflix where country = 'India')*100:: numeric
  as decimal(10,2)
)as avg_content_per_year
from Netflix
where country = 'India'
group by 1
order by 3 desc
limit 5;

--11. List all movies that are documentaries

select * from Netflix
where listed_in ilike '%documentaries';

--12. Find all content without a director

select * from Netflix
where director is null;

--13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

select * from Netflix
where casts ilike '%salman khan%'
and release_year> extract(year from current_date) - 10;

--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

select 
unnest(string_to_array(casts,',')) as actors,
count(*) as Total_content
from Netflix
where country ilike '%india%'
group by 1
order by 2 desc
limit 10;

15.
Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.

with new_table as
(select *, 
case
    when 
	    description ilike '%kill%' or 
		description ilike '%violence%' then 'Bad_content'
		else 'Good_content'
	end category
from Netflix
)
select 
      category,
	  count(*) as Total_content
from new_table
group by 1;
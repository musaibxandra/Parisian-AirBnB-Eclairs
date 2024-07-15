
-- FROM THE PARIS LISTINGS DATA.
-- Grouping the paris listings by neighbourhood and calculating the average price 
-- while being orderd by price in ascending.

select neighbourhood, round(avg(price),2) from paris_listings
group by neighbourhood
order by avg(price) asc

-- Filtering the data down to the most expensive neighourhood and grouping by accommodates
-- calculating the average price for each, sorting by price in ascending order.
	
with cte as (
	select neighbourhood, accommodates, round(avg(price),2) as average_price from paris_listings
	group by neighbourhood, accommodates
	order by average_price asc
)
select * from cte
where neighbourhood = 'Elysee'

-- Is there any chance the Regulations 
-- Implemented in 2015 impacted the listings in Paris?

select extract(year from host_since::date), round(avg(price),2) as year from paris_listings
group by extract(year from host_since::date)
order by year

-- Does the number of Accomodations 
-- (Guests the Listing can accomodate) have an effect on Price?

select accommodates, round(avg(price),2) from paris_listings
group by accommodates
order by avg(price) asc

-- What are the most Expensive Neighbourhoods in paris?

SELECT neighbourhood, AVG(price) AS average_price
FROM paris_listings
GROUP BY neighbourhood
ORDER BY average_price DESC
LIMIT 1;

-- Whether certain property types receive consistently 
-- higher review scores if so what are these property types?

SELECT property_type, AVG(review_scores_rating) AS average_review_score
FROM paris_listings
GROUP BY property_type
HAVING AVG(review_scores_rating) IS NOT NULL
ORDER BY average_review_score DESC;












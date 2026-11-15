--The SQL flavour used for this project is sqliteonline.com

--I explored the dataset Top200RichestPersonintheWorld

SELECT * 
FROM Top200RichestPersonintheWorld;

--Below are the different analysis performed to extract information 

-- 1. Retrieve the 20 richest billionaires. 
SELECT * 
FROM Top200RichestPersonintheWorld
order by networth_billion DESC
LIMIT 20;

-- 2. Identify the five youngest billionaires. 

SELECT * 
FROM Top200RichestPersonintheWorld
order by age ASC
LIMIT 5;

-- 3. Calculate the average age and average net worth

SELECT AVG (age) AS average_age,
AVG (networth_billion) AS average_net
FROM Top200RichestPersonintheWorld
;


-- 4. Identify the five most represented countries. 
SELECT country, COUNT(*) as representation
FROM Top200RichestPersonintheWorld
GROUP BY country
order by representation DESC
limit 5
;

-- 5. Calculate the combined net worth of billionaires from each country. 
SELECT country, SUM(networth_billion) as combined_net_worth
FROM Top200RichestPersonintheWorld
GROUP BY country
;

-- 6. Identify the five industries with the highest number of billionaires. 
SELECT industry, COUNT(*) as billionaires
FROM Top200RichestPersonintheWorld
GROUP BY industry
order by billionaires DESC
limit 5
;

-- 7. Find countries with at least five billionaires. 
SELECT country, COUNT(*) as billionaires
FROM Top200RichestPersonintheWorld
GROUP BY country
HAVING COUNT(*)  >  4
;

-- 8. Calculate the total wealth of billionaires younger than 50. 
SELECT sum(networth_billion) AS total_wealth
FROM Top200RichestPersonintheWorld
WHERE age < 50;

-- 9. Identify billionaires whose net worth exceeds the overall average net worth. 
SELECT name, networth_billion
 FROM Top200RichestPersonintheWorld
 WHere networth_billion > (SELECT AVG(networth_billion)
                FROm Top200RichestPersonintheWorld);
                
-- 10. Identify the industry with the highest average net worth. 
SELECT industry, AVG(networth_billion) as highest_average_net_worth
FROM Top200RichestPersonintheWorld
GROUP BY industry
order by highest_average_net_worth DESC
limit 1;

-- 11. Identify the second highest billionaire. 
SELECT name, networth_billion AS second_highest
 FROM Top200RichestPersonintheWorld
 WHere networth_billion < (SELECT MAX(networth_billion)
                FROm Top200RichestPersonintheWorld) 
ORDER BY networth_billion DESC
LIMIT 1;

--12. Retrieve the names and net worths of billionaires whose net worth is between $50 billion and $100 billion.Top200RichestPersonintheWorld
SELECT name, networth_billion 
FROM Top200RichestPersonintheWorld
WHERE networth_billion BETWEEN 50 AND 100;



-- 13. Calculate the difference between the highest and lowest net worth in the dataset.Top200RichestPersonintheWorld
SELECT MAX(networth_billion) - MIN(networth_billion) AS difference
FROM Top200RichestPersonintheWorld;

-- 14. Identify the youngest billionaire in each industry.
SELECT industry, name, age AS youngest_age
FROM Top200RichestPersonintheWorld t
WHERE age = (
    SELECT MIN(age)
    FROM Top200RichestPersonintheWorld
    WHERE industry = t.industry
);



/*
Here is an example data analyst project using the provided data sources with 10 sample SQL queries
*/

--Join the corruption and cost of living tables to see if there is a relationship between corruption and cost of living.
Select cor.country, cor.corruption_index, c.cost_index
from corruption cor 
join cost_of_living c on cor.country=c.country
    
-- Find the top 10 countries by GDP per capita.

SELECT TOP 10 country, gdp_per_capita
FROM richest_countries
ORDER BY gdp_per_capita DESC

-- Calculate tourism revenue as a percentage of GDP for each country.

SELECT t.country, CAST(t.receipts_in_billions AS decimal(10,2))/r.gdp_per_capita*100 AS tourism_pct_gdp
FROM tourism t 
JOIN richest_countries r ON t.country = r.country
ORDER BY tourism_pct_gdp DESC

-- Join unemployment and corruption to see if there is a relationship.

SELECT u.country, u.unemployment_rate, c.corruption_index
FROM unemployment u
JOIN corruption c ON u.country = c.country

-- Join corruption and unemployment data to find average unemployment rate by corruption index.


    SELECT 
  c.corruption_index, 
  AVG(u.unemployment_rate) AS avg_unemployment_rate
FROM corruption c
INNER JOIN unemployment u 
  ON c.country = u.country 
GROUP BY c.corruption_index
ORDER BY c.corruption_index
    
-- Calculate tourism revenue as percentage of GDP to identify most tourism dependent countries.

SELECT 
  t.country,
  t.receipts_in_billions / rc.gdp_per_capita * 100 AS tourism_pct_gdp
FROM tourism t
INNER JOIN richest_countries rc
  ON t.country = rc.country
ORDER BY tourism_pct_gdp DESC

-- Join cost of living and GDP per capita and calculate purchasing power index as percentage of GDP per capita

SELECT
  col.country,
  col.purchasing_power_index / rc.gdp_per_capita * 100 AS purchase_power_pct_gdp
FROM cost_of_living col
INNER JOIN richest_countries rc
  ON col.country = rc.country
ORDER BY purchase_power_pct_gdp DESC

-- Average corruption index by region

SELECT
  region,
  AVG(c.corruption_index) AS avg_corruption_index
FROM corruption c
INNER JOIN countries cnt
  ON c.country = cnt.country
GROUP BY region
ORDER BY avg_corruption_index

-- Rank countries by receipts per tourist

SELECT 
  country,
  receipts_per_tourist
FROM tourism
ORDER BY receipts_per_tourist DESC

-- Unemployment rate differences between countries by year

SELECT
  c1.country AS country1,
  c2.country AS country2,
  c1.year,
  c1.unemployment_rate AS rate1, 
  c2.unemployment_rate AS rate2,
  c1.unemployment_rate - c2.unemployment_rate AS rate_diff
FROM unemployment c1
INNER JOIN unemployment c2
  ON c1.year = c2.year AND c1.country <> c2.country
ORDER BY year

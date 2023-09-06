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
-- Calculate tourism revenue as percentage of GDP to identify most tourism dependent countries.
-- Join cost of living and GDP per capita and calculate purchasing power index as percentage of GDP per capita
-- Average corruption index by region
-- Rank countries by receipts per tourist
-- Unemployment rate differences between countries by year

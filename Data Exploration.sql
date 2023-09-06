# Here is an example data analyst project using the provided data sources with 10 sample SQL queries

## Join the corruption and cost of living tables to see if there is a relationship between corruption and cost of living.
  Select cor.country, cor.corruption_index, c.cost_index
from corruption cor 
join cost_of_living c on cor.country=c.country
# Find the top 10 countries by GDP per capita.
# Calculate tourism revenue as a percentage of GDP for each country.
# Join unemployment and corruption to see if there is a relationship.
# Join corruption and unemployment data to find average unemployment rate by corruption index.
# Calculate tourism revenue as percentage of GDP to identify most tourism dependent countries.
# Join cost of living and GDP per capita and calculate purchasing power index as percentage of GDP per capita
# Average corruption index by region
# Rank countries by receipts per tourist
# Unemployment rate differences between countries by year

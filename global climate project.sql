create database project;
use project;
SELECT * FROM project.climate;

# --------------------------------- Trend Analysis ---------------------------------------------------

# 1) Temperature trend over years---------------------------------------

SELECT date, round(AVG(avgtemperature),2) AS avg_temp
FROM climate
GROUP BY date
ORDER BY date;

# 2) CO₂ trend over time-------------------------------------------------

SELECT (date) as year,round( AVG(co2emissions),2) AS avg_co2
FROM climate
GROUP BY YEAR
ORDER BY year;

# 3) Rainfall trend-----------------------------------------

SELECT (date) AS year, round(AVG(rainfall),2) AS avg_rainfall
FROM climate
GROUP BY YEAR
ORDER BY year;

# --------------------------------------------Identify Environmental Problems------------------------------

# 1) countries with dangerously high CO₂-----------------------------------------

SELECT (date) as YEAR ,country ,round(AVG(co2emissions),2) AS avg_co2
FROM climate
GROUP BY country,YEAR
order by YEAR,avg_co2 desc;  


# ----------------------------------------------------------------------------------------------------------------

# Countries with population,avg_temperature and average co2 emission over years----------------------
SELECT
    distinct(date) AS year,country,avg(population) as avg_population,
    round(AVG(avgtemperature),2) AS avg_temp,
    round(AVG(co2emissions),2) AS avg_co2
FROM climate
GROUP BY YEAR ,country
ORDER BY YEAR ,avg_population;

# -----------------------------------------------------------------------------------------------------------------

# Correlation between co2 and temperature---------------------------------------------------------

SELECT
    (date) AS year,
    round(AVG(avgtemperature),2) AS avg_temp,
    round(AVG(co2emissions),2) AS avg_co2
FROM climate
GROUP BY YEAR
ORDER BY year desc;

# -------------------------------------------------------------------------------------------------------

# countries with most Reneawable energies by years ---------------------------------------------------------------------

select (date) as YEAR, country, round(avg(renewable_energy),2) as avg_renewable_energy
from climate
group by YEAR,country
order by avg_renewable_energy desc;

# countries where average extreme weather events happend --------------------------------------------------------------

select (date) as YEAR, country,round(avg(Extreme_weather_events),1) as avg_extreme_weather_events
from climate
group by YEAR,country
order by YEAR,avg_extreme_weather_events desc;

# countries with average forest area percentage by year---------------------------------------------------------------------------

select (date) as YEAR, country,round(max(forest_area),1) as max_forest_area
from climate
group by YEAR,country
order by YEAR,max_forest_area desc;

# countries with maximum sea level rise and max rainfall by year---------------------------------------------------------------------

select (date) as YEAR,country, max(sealevelrise) as max_sea_level_rise, max(rainfall) as max_rainfall
from climate
group by YEAR,country
order by YEAR,max_sea_level_rise desc,max_rainfall desc;


-- Q1. How many days of data are recorded in total?
SELECT COUNT(DISTINCT date) AS total_days
FROM clean_weather;

Q1 - Total unique days recorded
-----------------------
Result: 
365 unique days

Insight:
The dataset covers 365 unique days — so I have one year of clean weather data.

-- Q2. What was the highest temperature recorded, and on what date did it occur? 
SELECT date, tmax_f
FROM clean_weather
ORDER BY tmax_f DESC
LIMIT 1;

Q2 - Highest temperature and date
--------------------------------
Result:
109 highest temperature, and occurred in 2023-01-22.

Insight:
Identified the highest temperature, and the highest temperature recorded was 109 on 2023-01-22.


-- Q3. What was the lowest temperature recorded, and on what date did it occur? 
SELECT date, tmin_f
FROM clean_weather
WHERE tmin_f  BETWEEN -50 AND 130 
ORDER BY tmin_f ASC
LIMIT 1;

Q3 - Lowest temperature recorded
--------------------------------
Result: 
2023-04-26 = -50.0

Insight: 
The dataset originally showed a minimum temperature of -88°F, but this is beyond realistic
bounds for non-polar regions and likely represents missing or erroneous data.
Identified the lowest realistic daily minimum temperature after applying data filters 
to remove invalid readings (below -50°F or above 130°F). 
Lowest valid temperature recorded was -50.0°F on 2023-04-26.

-- Q4. How many days each year had "extreme heat" days (temperature > 90°F)? 
SELECT 
	strftime('%Y', date) AS year,
	COUNT(DISTINCT date) AS extreme_heat_days
FROM clean_weather
WHERE tmax_f > 90 
GROUP BY year
ORDER BY year;

Q4 - Extreme Heat Days
---------------------
Result: 
2023 → 25 days with temperature > 90°F

Insight:
In 2023, there was 25 days with temperature exceeding 90°F, suggesting a moderate frequency
of extreme heat events across the recorded stations. 
This could indicate a few significant heatwaves but not a persistently hot climate.

-- Q5. How many days each year had "extreme cold" (temperature < 32°F)? 
SELECT 
	strftime('%Y', date) AS year,
	COUNT(DISTINCT date) AS extreme_cold_days
FROM clean_weather
WHERE tmin_f < 32
GROUP BY year
ORDER BY year;

Q5 - Extreme Cold Days 
---------------------
Result: 
2023 → 209 extreme cold days

Insight:
Over half the recorded days in 2023 had minimum temperatures below freezing (32°F).
This indicates a predominantly cold region or extended winter period, with relatively few heat events. 

-- Q6. What is the average wind speed for each year? 
SELECT 
	strftime('%Y', date) AS year,
	ROUND(AVG(wspd_mph), 2) AS avg_wind_speed
FROM clean_weather
GROUP BY year
ORDER BY year;

Q6 - Average Wind Speed per year
------------------------------
Result:
2023 → 5.04 mph

Insight: 
Average wind speed in 2023 was 5.04 mph, indicating generally calm conditions. 
The value is consistent with typical inland or urban wind speeds. 

-- Q7. On how many days did wind speed exceed 20 mph?
SELECT strftime('%Y', date) AS year,
	COUNT(DISTINCT date) AS high_wind_days
FROM clean_weather
WHERE wspd_mph > 20
GROUP BY year
ORDER BY year;

Q7 - High Wind Days
------------------
Result: 
2023 → 104 days with wind speeds > 20 mph

Insight: 
Approximately 29% of days in 2023 had winds (> 20 mph),
Indicating that windy conditions were relatively common in this dataset.
This may reflect the synthetic nature of the "Sample Station" data, which
could include a higher proportion of extreme events. 


-- Q8. How many "extreme weather days" (temp > 90°F, temp < 32°F, OR wind > 20 mph) occurred each year? 
SELECT 
	strftime('%Y', date) AS year,
	COUNT(DISTINCT date) AS extreme_weather_days
FROM clean_weather
WHERE tmax_f > 90 OR tmin_f < 32 OR wspd_mph > 20
GROUP BY year
ORDER BY year;

Q8 - Extreme Weather Days
------------------------
Result: 
2023 → 260 extreme weather days

Insight: 
Roughly 71% of the year (260 out of 365 days) experienced at least one extreme condition. 
Such a high occurrence suggests that the dataset is designed for analysis practice, simulating
frequent extreme events rather than reflecting an actual regional climate.

-- Q9. Which month had the highest number of extreme weather days across the dataset?
SELECT
	strftime('%Y', date) AS year,
	strftime('%m', date) AS month,
	COUNT(DISTINCT date) AS extreme_days
FROM clean_weather
WHERE tmax_f > 90 OR tmin_f < 32 OR wspd_mph > 20
GROUP BY year, month
ORDER BY extreme_days DESC
LIMIT 1;

Q9 - Month with Most Extreme Weather Days
----------------------------------------
Result: 
october 2023 → 28 extreme weather days

Insights: 
October had the highest frequency of extreme weather, with 28 days 
(about 90% of the month) affected by heat, cold, or wind extremes. 
This concentration may represent seasonal transitions or simulated weather variability. 

-- Q10. What percentage of all recorded days were extreme weather days? 
WITH 
	extreme_days AS (
	SELECT COUNT(DISTINCT date) AS num_extreme_days
	FROM clean_weather
	WHERE tmax_f > 90 OR tmin_f < 32 OR wspd_mph  > 20
),
total_days AS (
	SELECT COUNT(DISTINCT date) AS num_total_days
	FROM clean_weather
)
SELECT 
	ROUND((e.num_extreme_days * 100.0 / t.num_total_days), 2) AS extreme_weather
FROM extreme_days e, total_days t;

Q10 - Percentage of Extreme Weather Days
---------------------------------------
Result:
71.23%

Insight:
Roughly 71% of all days in the dataset qualified as extreme weather days confirming that the dataset was built
to highlight diverse and frequent weather extreme, rather than the real-world climatological balance. 



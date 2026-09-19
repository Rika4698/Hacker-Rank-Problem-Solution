/*
Enter your query here.
*/

SELECT TRUNCATE(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

-- TRUNCATE(SUM(LAT_N), 4)

-- TRUNCATE(value, 4) keeps 4 digits after the decimal point and simply removes the remaining digits.

-- For example:

-- 36354.81356789
--         ↓
-- 36354.8135
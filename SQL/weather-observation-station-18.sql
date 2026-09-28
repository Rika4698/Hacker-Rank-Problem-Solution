/*
Enter your query here.
*/

SELECT ROUND(ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W)), 4)
FROM STATION;


-- Manhattan distance is: |x₂ - x₁| + |y₂ - y₁|

-- So here:

-- |MAX(LAT_N) - MIN(LAT_N)| + |MAX(LONG_W) - MIN(LONG_W)|

-- That's why we write:

-- ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W))

-- ABS() gives the absolute value, so the result is always positive.

-- For example: ABS(10 - 50) = 40 instead of -40.

-- Shortcut to remember:
-- Manhattan Distance = latitude difference + longitude difference.
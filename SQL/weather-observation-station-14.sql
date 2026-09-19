/*
Enter your query here.
*/

SELECT TRUNCATE(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

-- MAX(LAT_N)

-- MAX() finds the largest LAT_N among those filtered values.
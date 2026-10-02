/*
Enter your query here.
*/

SELECT ROUND(AVG(LAT_N), 4)
FROM (
    SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
    COUNT(*) OVER () AS total
    FROM STATION
    
) AS ranked
WHERE rn IN (
    FLOOR((total + 1) / 2), FLOOR((total + 2) / 2)
);


-- ROW_NUMBER() gives every row a position.

-- The complete logic
-- LAT_N
--   ↓
-- ORDER BY LAT_N
--   ↓
-- ROW_NUMBER()
--   ↓
-- Find total rows
--   ↓
-- Find middle position(s)
--   ↓
-- AVG(middle value(s))
--   ↓
-- ROUND to 4 decimals


-- MEDIAN() is not a standard MySQL aggregate function, so we calculate the median using ROW_NUMBER(), COUNT(), and AVG().
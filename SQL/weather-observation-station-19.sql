/*
Enter your query here.
*/

SELECT ROUND(SQRT(POWER(MAX(LAT_N) - MIN(LAT_N), 2) + POWER(MAX(LONG_W) - MIN(LONG_W), 2)), 4)
FROM STATION;

-- POWER(MAX(LAT_N) - MIN(LAT_N), 2)

-- POWER(x, 2) means: x²

-- POWER(latitude_difference, 2) + POWER(longitude_difference, 2)

-- This follows the Euclidean distance formula: √((x₂ - x₁)² + (y₂ - y₁)²)
-- √(latitude difference² + longitude difference²)

-- SQRT(...)

-- SQRT() means square root.

-- So:

-- SQRT(
--     POWER(MAX(LAT_N) - MIN(LAT_N), 2)
--     +
--     POWER(MAX(LONG_W) - MIN(LONG_W), 2)
-- )

-- calculates the Euclidean distance.
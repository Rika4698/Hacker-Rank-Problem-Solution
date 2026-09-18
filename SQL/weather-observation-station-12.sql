/*
Enter your query here.
*/

SELECT DISTINCT CITY
FROM STATION 
WHERE LEFT(CITY, 1) NOT IN ('A', 'E', 'I', 'O', 'U')
AND RIGHT(CITY, 1) NOT IN ('A', 'E', 'I', 'O', 'U');

-- RIGHT(CITY, 1)

-- Here:

-- CITY → the column
-- 1 → take only one character
-- RIGHT() → start from the right

-- For example:

-- London → n
-- Dhaka  → a
-- Tokyo  → o
-- Paris  → s

-- RIGHT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U')

-- means:

-- The last character is a vowel.

-- RIGHT(CITY, 1) NOT IN ('A', 'E', 'I', 'O', 'U')

-- means:

-- The last character is NOT a vowel.
/*
Enter your query here.
*/
WITH RECURSIVE nums AS (
    SELECT 2 AS n
    UNION ALL 
    SELECT n + 1 
    FROM nums
    WHERE n < 1000
),
Primes AS (
    SELECT n
    FROM nums a 
    WHERE NOT EXISTS (
        SELECT 1
        FROM nums b
        WHERE b.n > 1
        AND b.n < a.n 
        AND a.n % b.n = 0
    )
)

SELECT GROUP_CONCAT(n ORDER BY n SEPARATOR '&')
FROM Primes;

-- GROUP_CONCAT(n ORDER BY n SEPARATOR '&')

-- Here:

-- GROUP_CONCAT() → combines multiple rows into one string
-- ORDER BY n → keeps numbers ascending
-- SEPARATOR '&' → puts & between numbers

-- For example:

-- GROUP_CONCAT(n SEPARATOR '&')

-- produces:

-- 2&3&5&7

-- Final structure to remember
-- WITH RECURSIVE
--        ↓
-- Generate numbers

-- NOT EXISTS
--        ↓
-- Remove numbers having divisors

-- GROUP_CONCAT()
--        ↓
-- Put all primes into one line

-- SEPARATOR '&'
--        ↓
-- 2&3&5&7
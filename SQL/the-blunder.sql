/*
Enter your query here.
*/
SELECT CEIL(
    AVG(Salary) - AVG(REPLACE(Salary, '0', ''))
)

FROM EMPLOYEES;

-- The problem says to round the error up to the next integer.

-- MySQL has: CEIL()

-- Example: SELECT CEIL(10.2);

-- Result: 11

-- REPLACE(SALARY, '0', '')
-- REPLACE(SALARY, '0', '')

-- Removes every zero from the salary.

-- For example:

-- 1000 → 1
-- 20500 → 255
-- 50000 → 5

-- Think of the query like this:

--              EMPLOYEES
--                  |
--         ┌────────┴────────┐
--         ↓                 ↓
--    SALARY            REPLACE()
--         ↓                 ↓
--  AVG(SALARY)      AVG(wrong salary)
--         ↓                 ↓
--         └────────┬────────┘
--                  ↓
--              Difference
--                  ↓
--                CEIL()
--                  ↓
--               ANSWER



-- REPLACE() → removes 0
-- AVG()     → calculates average
-- CEIL()    → rounds upward
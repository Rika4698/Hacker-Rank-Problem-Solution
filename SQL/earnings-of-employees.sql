/*
Enter your query here.
*/
SELECT MAX(months * salary), count(*)
FROM Employee
WHERE months * salary = (
    SELECT MAX(months * salary)
    FROM Employee
);

-- Think of it :

-- Step 1:
-- months × salary
--         ↓
--    earnings

-- Step 2:
-- MAX(earnings)
--         ↓
-- maximum earning

-- Step 3:
-- COUNT employees
-- whose earnings = maximum
SELECT
    t.stock_code
FROM price_today AS t
INNER JOIN price_tomorrow AS tm
    ON t.stock_code = tm.stock_code
WHERE tm.price > t.price
ORDER BY t.stock_code ASC;

-- INNER JOIN

-- An INNER JOIN returns rows where the stock_code exists in both tables.

-- price_today
--      +
-- price_tomorrow
--      ↓
--    JOIN
--      ↓
-- Match stock_code
--      ↓
-- Compare prices
--      ↓
-- tomorrow > today
--      ↓
-- Keep profitable stocks
--      ↓
-- Sort stock_code ASC
--      ↓
-- Final result
SELECT
    t.stock_code
FROM price_today AS t
INNER JOIN price_tomorrow AS tm
    ON t.stock_code = tm.stock_code
WHERE tm.price > t.price
ORDER BY t.stock_code ASC;
# Compare previous and current year turnover and calculate growth
SELECT
    current_year.period,
    current_year.series_id,
    current_year.turnover AS current_turnover,
    prior_year.turnover AS prior_year_turnover,
    ROUND(
        (current_year.turnover - prior_year.turnover)
        / prior_year.turnover * 100, 2
    ) AS growth_pct
FROM retail_sales AS current_year
# JOIN queries match each row with its equivalent previous year row within same series. 
# Any row misses previous year data will be excluded.
JOIN retail_sales AS prior_year
    ON current_year.series_id = prior_year.series_id
    AND current_year.period = DATE_ADD(prior_year.period, INTERVAL 1 YEAR)
ORDER BY current_year.series_id, current_year.period;


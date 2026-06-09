# Find out months where turnover drops more than 20% 
SELECT
    a.series_id,
    a.period AS current_period,
    a.turnover AS current_turnover,
    b.turnover AS prev_turnover,
    ROUND(
        (a.turnover - b.turnover) / b.turnover * 100, 2
    ) AS mom_change_pct
FROM retail_sales AS a
JOIN retail_sales AS b
    ON a.series_id = b.series_id
    AND a.period = DATE_ADD(b.period, INTERVAL 1 MONTH)
WHERE
    (a.turnover - b.turnover) / b.turnover * 100 < -20
ORDER BY mom_change_pct ASC;

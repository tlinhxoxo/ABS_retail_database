# Annual Turnover by series as columns
SELECT
# Select random series to sum up each year's turnover rate
    YEAR(period) AS year,
    SUM(CASE WHEN series_id = 'A3348591K' THEN turnover ELSE 0 END) AS series_A3348591K,
    SUM(CASE WHEN series_id = 'A3348600A' THEN turnover ELSE 0 END) AS series_A3348600A
FROM retail_sales
GROUP BY YEAR(period)
ORDER BY year;
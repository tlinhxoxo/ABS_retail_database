# Calculate total and average turnover for each series
SELECT
    series_id,
    SUM(turnover) AS total_turnover,
    AVG(turnover) AS avg_turnover,
    COUNT(*) AS months_recorded
FROM retail_sales
GROUP BY series_id
ORDER BY total_turnover DESC;
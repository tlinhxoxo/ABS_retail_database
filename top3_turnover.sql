# Find top 3 ranked highest turnover by series
SELECT
    a.series_id,
    a.period,
    a.turnover
FROM retail_sales AS a
# Using LEFT JOIN will preserve the row contains the highest rate in the table eventhough b returns NULL.
LEFT JOIN retail_sales AS b
    ON a.series_id = b.series_id
    AND b.turnover > a.turnover
GROUP BY a.series_id, a.period, a.turnover
HAVING COUNT(b.turnover) < 3
ORDER BY a.series_id, a.turnover DESC;


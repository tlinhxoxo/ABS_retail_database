# ABS_retail_database

Analysed Australian retail turnover data sourced from the Australian Bureau of Statistics (ABS), spanning April 1982 to June 2025 across 21 retail series. The project covers the full analytical workflow from data wrangling through to business-ready SQL outputs.
Tools: Python, MySQL Workbench Dataset: ABS Retail Trade, Monthly Turnover.

# Dataset
Source: Australian Bureau of Statistics (ABS) — Retail Trade
Coverage: April 1982 to June 2025
Series: 21 retail turnover series
Columns: period, series_id, turnover
Rows: 10,703

# Project structure
retail-sales-sql/
│
│
├── cleaning/
│└── clean_abs.py
|
│── data/
|   └── retail_sales_clean.csv
|
├── queries/
│   ├── 1_avg&total_turnover.sql
│   ├── 2_compare_prior_year.sql
│   ├── 3_top3_turnover.sql
│   └── 4_turnover_eachyear.sql
|   └── 5_monthly_change_anomalities.sql
│
└── README.md

# Queries overview
1. Basic summary grouped by series
Total turnover, average turnover, and month count grouped by series. Useful for identifying which retail series contributes the most revenue over time.
2. Compare to prior year
Calculate the percentage change in turnover compared to the same month in the prior year. Built using a self-join on series_id and a 12-month date interval.
3. Top 3 turnover
Rank the highest turnover months within each series by using LEFT JOIN where each row is compared against peers with a higher turnover value, and filtered to rows with fewer than 3 competitors.
4. Turnover each year
Reshape the data from long format (one row per series per month) into wide format (one row per year, each series as its own column). Use conditional aggregation with CASE WHEN inside SUM() to simulate a pivot table, which is useful for presenting multi-series comparisons in a single stakeholder-ready table.
5. Monthly change anomalities
Order months where turnover dropped by more than 20% compared to the prior month. Uses a self-join on a 1-month date interval to bring in the previous month's value, then filters on the percentage change threshold.

# How to Run
1. Clone this repository
2. Execute queries from createdb.sql to create data base for the data
3. Import data/ retail_sales_clean.csv into your MySQL database
4. Execute queries from the queries/ folder in order

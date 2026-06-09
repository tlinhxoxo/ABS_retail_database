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
├── data/
│   └── retail_sales_clean.csv
│
├── cleaning/
│   └── data_cleaning.py
│
├── queries/
│   ├── 01_basic_aggregation.sql
│   ├── 02_yoy_growth_self_join.sql
│   ├── 03_top3_ranking_self_join.sql
│   └── 04_anomaly_detection_self_join.sql
│
└── README.md

# Queries overview



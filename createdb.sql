CREATE DATABASE retail_sales_db;
USE retail_sales_db;

CREATE TABLE retail_sales (
    period      DATE,
    series_id   VARCHAR(20),
    turnover    DECIMAL(10, 1)
);
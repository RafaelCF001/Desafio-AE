{{ config(materialized='table') }}

SELECT DISTINCT
    CAST(t1.order_date AS DATE) AS date_key,
    DATE_PART(YEAR, t1.order_date) AS order_year,
    DATE_PART(MONTH, t1.order_date) AS order_month_number,
    DATE_PART(DAYOFWEEK, t1.order_date) AS order_day_of_week,
    DATE_PART(QUARTER, t1.order_date) AS order_quarter
FROM
    {{ ref('stg_sa_salesorderheader') }} t1

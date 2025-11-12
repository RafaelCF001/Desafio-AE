SELECT *
FROM {{ ref('fct_sales_orders') }}
WHERE order_date > CURRENT_DATE() OR YEAR(order_date) < 2000
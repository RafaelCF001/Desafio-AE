SELECT *
FROM {{ ref('fct_sales_orders') }}
WHERE quantidade_comprada < 0
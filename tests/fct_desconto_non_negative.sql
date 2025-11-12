SELECT *
FROM {{ ref('fct_sales_orders') }}
WHERE desconto_produto < 0
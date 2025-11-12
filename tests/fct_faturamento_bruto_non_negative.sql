SELECT *
FROM {{ ref('fct_sales_orders') }}
WHERE faturamento_bruto_produto < 0
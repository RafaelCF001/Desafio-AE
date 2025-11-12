SELECT *
FROM {{ ref('fct_sales_orders') }}
WHERE valor_total_negociado_linha < 0
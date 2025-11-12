SELECT sales_order_detail_id, COUNT(*) as cnt
FROM {{ ref('fct_sales_orders') }}
GROUP BY sales_order_detail_id
HAVING cnt > 1
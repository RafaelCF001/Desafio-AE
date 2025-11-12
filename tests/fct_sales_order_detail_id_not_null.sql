SELECT COUNT(*) as null_pks
FROM {{ ref('fct_sales_orders') }}
WHERE sales_order_detail_id IS NULL
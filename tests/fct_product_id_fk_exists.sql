SELECT f.*
FROM {{ ref('fct_sales_orders') }} f
LEFT JOIN {{ ref('dim_product') }} d ON f.product_id = d.product_id
WHERE d.product_id IS NULL
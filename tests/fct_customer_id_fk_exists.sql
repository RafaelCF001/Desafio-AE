SELECT f.*
FROM {{ ref('fct_sales_orders') }} f
LEFT JOIN {{ ref('dim_customer') }} d ON f.customer_id = d.customer_id
WHERE d.customer_id IS NULL
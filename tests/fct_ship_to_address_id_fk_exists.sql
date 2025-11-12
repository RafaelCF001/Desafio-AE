SELECT f.*
FROM {{ ref('fct_sales_orders') }} f
LEFT JOIN {{ ref('dim_location') }} d ON f.ship_to_address_id = d.ship_to_address_id
WHERE f.ship_to_address_id IS NOT NULL AND d.ship_to_address_id IS NULL
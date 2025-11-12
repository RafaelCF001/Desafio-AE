SELECT product_id, COUNT(*) as cnt
FROM {{ ref('dim_product') }}
GROUP BY product_id
HAVING cnt > 1
SELECT customer_id, COUNT(*) as cnt
FROM {{ ref('dim_customer') }}
GROUP BY customer_id
HAVING cnt > 1
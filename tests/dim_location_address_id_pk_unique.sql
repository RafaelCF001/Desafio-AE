SELECT ship_to_address_id, COUNT(*) as cnt
FROM {{ ref('dim_location') }}
GROUP BY ship_to_address_id
HAVING cnt > 1
SELECT date_key, COUNT(*) as cnt
FROM {{ ref('dim_date') }}
GROUP BY date_key
HAVING cnt > 1
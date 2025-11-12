SELECT credit_card_id, COUNT(*) as cnt
FROM {{ ref('dim_credit_card') }}
GROUP BY credit_card_id
HAVING cnt > 1
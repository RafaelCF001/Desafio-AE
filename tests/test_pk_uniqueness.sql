
-- dim_customer
SELECT customer_id, COUNT(*) as cnt
FROM {{ ref('dim_customer') }}
GROUP BY customer_id
HAVING cnt > 1;

-- dim_product
SELECT product_id, COUNT(*) as cnt
FROM {{ ref('dim_product') }}
GROUP BY product_id
HAVING cnt > 1;

-- dim_location
SELECT ship_to_address_id, COUNT(*) as cnt
FROM {{ ref('dim_location') }}
GROUP BY ship_to_address_id
HAVING cnt > 1;

-- dim_credit_card
SELECT credit_card_id, COUNT(*) as cnt
FROM {{ ref('dim_credit_card') }}
GROUP BY credit_card_id
HAVING cnt > 1;

-- dim_date
SELECT date_key, COUNT(*) as cnt
FROM {{ ref('dim_date') }}
GROUP BY date_key
HAVING cnt > 1;

-- fct_sales_orders (unique_key = sales_order_detail_id)
SELECT sales_order_detail_id, COUNT(*) as cnt
FROM {{ ref('fct_sales_orders') }}
GROUP BY sales_order_detail_id
HAVING cnt > 1;

-- Verificar NULLs em PKs
SELECT COUNT(*) as null_pks
FROM {{ ref('fct_sales_orders') }}
WHERE sales_order_detail_id IS NULL;

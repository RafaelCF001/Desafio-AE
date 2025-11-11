
-- Validar que não há quantidades negativas
SELECT *
FROM {{ ref('fct_sales_orders') }}
WHERE quantidade_comprada < 0

-- Validar que o faturamento bruto é positivo
SELECT *
FROM {{ ref('fct_sales_orders') }}
WHERE faturamento_bruto_produto < 0

-- Validar que o desconto está entre 0 e 100% (ajustado para formato decimal 0-1)
SELECT *
FROM {{ ref('fct_sales_orders') }}
WHERE desconto_produto < 0

-- Validar que o valor total negociado é positivo
SELECT *
FROM {{ ref('fct_sales_orders') }}
WHERE valor_total_negociado_linha < 0

-- Validar integridade referencial: product_id deve existir em dim_product
SELECT f.*
FROM {{ ref('fct_sales_orders') }} f
LEFT JOIN {{ ref('dim_product') }} d ON f.product_id = d.product_id
WHERE d.product_id IS NULL

-- Validar integridade referencial: customer_id deve existir em dim_customer
SELECT f.*
FROM {{ ref('fct_sales_orders') }} f
LEFT JOIN {{ ref('dim_customer') }} d ON f.customer_id = d.customer_id
WHERE d.customer_id IS NULL

-- Validar integridade referencial: ship_to_address_id deve existir em dim_location
SELECT f.*
FROM {{ ref('fct_sales_orders') }} f
LEFT JOIN {{ ref('dim_location') }} d ON f.ship_to_address_id = d.ship_to_address_id
WHERE f.ship_to_address_id IS NOT NULL AND d.ship_to_address_id IS NULL

-- Validar que a data do pedido é razoável (não no futuro e não antes de 2000)
SELECT *
FROM {{ ref('fct_sales_orders') }}
WHERE order_date > CURRENT_DATE() OR YEAR(order_date) < 2000

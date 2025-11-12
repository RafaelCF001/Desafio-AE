-- Validar que não há quantidades negativas
select *
from {{ ref("fct_sales_orders") }}
where quantidade_comprada < 0

-- Validar que o faturamento bruto é positivo
select *
from {{ ref("fct_sales_orders") }}
where faturamento_bruto_produto < 0

-- Validar que o desconto está entre 0 e 100% (ajustado para formato decimal 0-1)
select *
from {{ ref("fct_sales_orders") }}
where desconto_produto < 0

-- Validar que o valor total negociado é positivo
select *
from {{ ref("fct_sales_orders") }}
where valor_total_negociado_linha < 0

-- Validar integridade referencial: product_id deve existir em dim_product
select f.*
from {{ ref("fct_sales_orders") }} f
left join {{ ref("dim_product") }} d on f.product_id = d.product_id
where d.product_id is null

-- Validar integridade referencial: customer_id deve existir em dim_customer
select f.*
from {{ ref("fct_sales_orders") }} f
left join {{ ref("dim_customer") }} d on f.customer_id = d.customer_id
where d.customer_id is null

-- Validar integridade referencial: ship_to_address_id deve existir em dim_location
select f.*
from {{ ref("fct_sales_orders") }} f
left join {{ ref("dim_location") }} d on f.ship_to_address_id = d.ship_to_address_id
where f.ship_to_address_id is not null and d.ship_to_address_id is null

-- Validar que a data do pedido é razoável (não no futuro e não antes de 2000)
select *
from {{ ref("fct_sales_orders") }}
where order_date > current_date() or year(order_date) < 2000

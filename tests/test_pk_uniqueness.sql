-- dim_customer
select customer_id, count(*) as cnt
from {{ ref("dim_customer") }}
group by customer_id
having cnt > 1
;

-- dim_product
select product_id, count(*) as cnt
from {{ ref("dim_product") }}
group by product_id
having cnt > 1
;

-- dim_location
select ship_to_address_id, count(*) as cnt
from {{ ref("dim_location") }}
group by ship_to_address_id
having cnt > 1
;

-- dim_credit_card
select credit_card_id, count(*) as cnt
from {{ ref("dim_credit_card") }}
group by credit_card_id
having cnt > 1
;

-- dim_date
select date_key, count(*) as cnt
from {{ ref("dim_date") }}
group by date_key
having cnt > 1
;

-- fct_sales_orders (unique_key = sales_order_detail_id)
select sales_order_detail_id, count(*) as cnt
from {{ ref("fct_sales_orders") }}
group by sales_order_detail_id
having cnt > 1
;

-- Verificar NULLs em PKs
select count(*) as null_pks
from {{ ref("fct_sales_orders") }}
where sales_order_detail_id is null
;

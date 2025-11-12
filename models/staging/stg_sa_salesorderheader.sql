{{ config(materialized="view") }}

select
    salesorderid as sales_order_id,
    customerid as customer_id,
    creditcardid as credit_card_id,
    shiptoaddressid as ship_to_address_id,
    cast(orderdate as timestamp_ntz) as order_date,
    status as status_code,
    subtotal as sub_total,
    freight as freight,
    modifieddate as modified_date
from {{ source("raw_adventure_works", "sales_salesorderheader") }}

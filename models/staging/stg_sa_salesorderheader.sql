{{config(materialized='view')}}

SELECT 
    salesorderid as sales_order_id,
    customerid as customer_id,
    -- credit_card_id can be NULL (optional payment method); keep as-is for optional LEFT JOINs
    creditcardid as credit_card_id,
    shiptoaddressid as ship_to_address_id,
    CAST(soh.orderdate as TIMESTAMP_NTZ) as order_date,
    status as status_code, 
    subtotal as sub_total,
    freight as freight,
    modifieddate as modified_date
FROM {{source('raw_adventure_works', 'sales_salesorderheader')}}

credit_card_id being null 
{{config(materialized='view')}}

SELECT 
    salesorderid as sales_order_id,
    salesreasonid as sales_reason_id
FROM {{source('raw_adventure_works', 'sales_salesorderheadersalesreason')}}
 
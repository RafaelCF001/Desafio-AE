{{config(materialized='view')}}
SELECT 
    salesreasonid as sales_reason_id,
    name as sales_reason_name,
    reasontype as reason_type
FROM {{source('raw_adventure_works', 'sales_salesreason')}}

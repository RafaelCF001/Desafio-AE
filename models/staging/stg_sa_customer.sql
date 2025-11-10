{{config(materialized='view')}}

SELECT
    customerid as customer_id,
    personid as person_id,
    storeid as store_id
FROM {{source('raw_adventure_works', 'sales_customer')}} 
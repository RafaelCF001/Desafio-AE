{{config(materialized='view')}}

SELECT
    customerid AS customer_id,
    COALESCE(personid, 0) AS person_id,
    COALESCE(storeid, 0) AS store_id
FROM {{source('raw_adventure_works', 'sales_customer')}}
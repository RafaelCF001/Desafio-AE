{{config(materialized='view')}}
SELECT 
    addressid as address_id,
    city as city,
    stateprovinceid as state_province_id
FROM {{source('raw_adventure_works', 'person_address')}}
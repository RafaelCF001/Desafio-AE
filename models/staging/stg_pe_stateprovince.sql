{{config(materialized='view')}}
SELECT 
    stateprovinceid as state_province_id,
    name as state_province_name,
    countryregioncode as country_region_code
FROM {{source('raw_adventure_works', 'person_stateprovince')}}
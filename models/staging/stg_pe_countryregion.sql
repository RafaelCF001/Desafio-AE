{{config(materialized='view')}}
SELECT 
    countryregioncode as country_region_code,
    name as country_region_name
FROM {{source('raw_adventure_works', 'person_countryregion')}}
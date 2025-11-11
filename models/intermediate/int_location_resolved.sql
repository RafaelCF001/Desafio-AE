{{ config(materialized='view') }}


SELECT
    t1.address_id,
    t1.city,
    t2.state_province_name,
    t3.country_region_name AS country_name
FROM
    {{ ref('stg_pe_address') }} t1 
INNER JOIN
    {{ ref('stg_pe_stateprovince') }} t2
    ON t1.state_province_id = t2.state_province_id
INNER JOIN
    {{ ref('stg_pe_countryregion') }} t3 
    ON t2.country_region_code = t3.country_region_code

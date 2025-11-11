{{ config(materialized='table') }}

SELECT
    address_id AS ship_to_address_id,
    city,
    state_province_name AS state,
    country_name AS country
FROM
    {{ ref('int_location_resolved') }}

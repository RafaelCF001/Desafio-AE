{{config(materialized='view')}}

SELECT 
    businessentityid as business_entity_id,
    firstname as first_name, 
    middlename as middle_name,
    lastname as last_name
FROM {{source('raw_adventure_works', 'person_person')}}
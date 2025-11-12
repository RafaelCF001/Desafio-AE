{{config(materialized='view')}}
SELECT 
    PRODUCTSUBCATEGORYID as product_subcategory_id,
    PRODUCTCATEGORYID as product_category_id,
    name as name,
    modifieddate as modified_date
FROM {{ source('raw_adventure_works', 'production_productsubcategory') }}


{{config(materialized='view')}}
SELECT 
    productid as product_id,
    name as product_name,
    productsubcategoryid as product_subcategory_id  
FROM {{source('raw_adventure_works', 'production_product')}}
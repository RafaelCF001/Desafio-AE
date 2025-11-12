{{config(materialized='view')}}
SELECT 
    productid as product_id,
    name as product_name,
    COALESCE(productsubcategoryid, 0) as product_subcategory_id  
FROM {{source('raw_adventure_works', 'production_product')}}

41 % null on product_subcategory_id
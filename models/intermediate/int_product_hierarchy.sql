{{ config(materialized='view') }}

SELECT
    t1.product_id,
    t1.product_name,
    t1.product_subcategory_id,
    t2.name AS product_subcategory_name
FROM
    {{ ref('stg_pr_product') }} t1
LEFT JOIN
    {{ ref('stg_pr_productsubcategory') }} t2
    ON t1.product_subcategory_id = t2.product_subcategory_id

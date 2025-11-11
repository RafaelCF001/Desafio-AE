{{ config(materialized='table') }}


SELECT
    t1.product_id,
    t1.product_name,
    t2.product_subcategory_id,
    t2.product_subcategory_name
FROM
    {{ ref('stg_pr_product') }} t1
LEFT JOIN
    {{ ref('int_product_hierarchy') }} t2
    ON t1.product_id = t2.product_id

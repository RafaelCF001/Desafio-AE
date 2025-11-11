{{ config(materialized='table') }}

SELECT
    t1.customer_id,
    t1.person_id,
    t1.store_id,
    t2.full_customer_name AS customer_name
FROM
    {{ ref('stg_sa_customer') }} t1
LEFT JOIN
    {{ ref('int_customer_names') }} t2
    ON t1.customer_id = t2.customer_id

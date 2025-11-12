{{ config(materialized='view') }}

-- Resolve customer names for Person-type customers; Store-type customers will have NULL names
WITH customer_person_join AS (
    SELECT
        t1.customer_id,
        t1.store_id,
        t1.customer_type,
        t2.first_name,
        t2.middle_name,
        t2.last_name
    FROM
        {{ ref('stg_sa_customer') }} t1
    LEFT JOIN
        {{ ref('stg_pe_person') }} t2
        ON t1.person_id = t2.business_entity_id
    WHERE
        t1.customer_type = 1
)

SELECT
    customer_id,
    store_id,
    customer_type,
    CASE
        WHEN customer_type = 1 THEN first_name || ' ' || COALESCE(middle_name || ' ', '') || last_name
        ELSE 'Store Customer'
    END AS full_customer_name
FROM
    customer_person_join
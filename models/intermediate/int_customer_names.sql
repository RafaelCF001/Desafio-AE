{{ config(materialized='view') }}


WITH customer_person_join AS (
    SELECT
        t1.customer_id,
        t1.store_id,
        t2.first_name,
        t2.middle_name,
        t2.last_name
    FROM
        {{ ref('stg_sa_customer') }} t1
    INNER JOIN
        {{ ref('stg_pe_person') }} t2
        ON t1.person_id = t2.business_entity_id
    WHERE
        t1.person_id IS NOT NULL 
)

SELECT
    customer_id,
    store_id,
    -- Concatenação de nomes. COALESCE é usado para tratar MiddleName (que pode ser NULL) de forma limpa.
    first_name || ' ' || COALESCE(middle_name || ' ', '') || last_name AS full_customer_name
FROM
    customer_person_join

{{ config(materialized='table') }}

SELECT
    credit_card_id,
    card_type
FROM
    {{ ref('stg_sa_credit_card') }}

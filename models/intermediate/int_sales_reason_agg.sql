{{ config(materialized='view') }}

SELECT
    t1.sales_order_id,
    LISTAGG(t2.sales_reason_name, ', ') WITHIN GROUP (ORDER BY t2.sales_reason_name) AS aggregated_sales_reasons
FROM
    {{ ref('stg_sa_salesreason_ref') }} t1
INNER JOIN
    {{ ref('stg_sa_salesreason') }} t2
    ON t1.sales_reason_id = t2.sales_reason_id
GROUP BY
    t1.sales_order_id

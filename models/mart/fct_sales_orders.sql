{{ config(
    materialized='table',
    snowflake_warehouse='COMPUTE_WH',
    unique_key=['sales_order_detail_id']
) }}

SELECT
    SOD.sales_order_id,
    SOD.sales_order_detail_id,

    SOD.product_id,
    SOH.customer_id,
    SOH.credit_card_id,
    SOH.ship_to_address_id,
    
    CAST(SOH.order_date AS DATE) AS order_date,
    DATE_PART(YEAR, SOH.order_date) AS order_year,
    DATE_PART(MONTH, SOH.order_date) AS order_month,

    DIM_C.customer_name,

    DIM_P.product_name,

    DIM_L.city,
    DIM_L.state,
    DIM_L.country,

    DIM_CC.card_type,
    SOH.status_code AS status_pedido,

    INT_SR.aggregated_sales_reasons AS motivo_venda,

    SOD.order_qty AS quantidade_comprada, 
    
    (SOD.order_qty * SOD.unit_price) AS faturamento_bruto_produto, 
    
    (SOD.unit_price_discount * SOD.order_qty * SOD.unit_price) AS desconto_produto, 
    
    SOD.caculated_line_total AS valor_total_negociado_linha 
    
FROM
    {{ ref('stg_sa_salesorderdetail') }} SOD
INNER JOIN
    {{ ref('stg_sa_salesorderheader') }} SOH
    ON SOD.sales_order_id = SOH.sales_order_id
LEFT JOIN
    {{ ref('dim_customer') }} DIM_C
    ON SOH.customer_id = DIM_C.customer_id
LEFT JOIN
    {{ ref('dim_product') }} DIM_P
    ON SOD.product_id = DIM_P.product_id
LEFT JOIN
    {{ ref('dim_location') }} DIM_L
    ON SOH.ship_to_address_id = DIM_L.ship_to_address_id
LEFT JOIN
    {{ ref('dim_credit_card') }} DIM_CC
    ON SOH.credit_card_id = DIM_CC.credit_card_id
LEFT JOIN
    {{ ref('int_sales_reason_agg') }} INT_SR
    ON SOH.sales_order_id = INT_SR.sales_order_id

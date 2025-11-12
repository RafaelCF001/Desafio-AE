{{
    config(
        materialized="table",
        unique_key=["sales_order_detail_id"],
    )
}}

select
    sod.sales_order_id,
    sod.sales_order_detail_id,

    sod.product_id,
    soh.customer_id,
    soh.credit_card_id,
    soh.ship_to_address_id,

    cast(soh.order_date as date) as order_date,
    date_part(year, soh.order_date) as order_year,
    date_part(month, soh.order_date) as order_month,

    dim_c.customer_name,

    dim_p.product_name,

    dim_l.city,
    dim_l.state,
    dim_l.country,

    dim_cc.card_type,
    soh.status_code as status_pedido,

    int_sr.aggregated_sales_reasons as motivo_venda,

    sod.order_qty as quantidade_comprada,

    (sod.order_qty * sod.unit_price) as faturamento_bruto_produto,

    (sod.unit_price_discount * sod.order_qty * sod.unit_price) as desconto_produto,

    sod.caculated_line_total as valor_total_negociado_linha

from {{ ref("stg_sa_salesorderdetail") }} sod
inner join
    {{ ref("stg_sa_salesorderheader") }} soh on sod.sales_order_id = soh.sales_order_id
left join {{ ref("dim_customer") }} dim_c on soh.customer_id = dim_c.customer_id
left join {{ ref("dim_product") }} dim_p on sod.product_id = dim_p.product_id
left join
    {{ ref("dim_location") }} dim_l on soh.ship_to_address_id = dim_l.ship_to_address_id
left join
    {{ ref("dim_credit_card") }} dim_cc on soh.credit_card_id = dim_cc.credit_card_id
left join
    {{ ref("int_sales_reason_agg") }} int_sr
    on soh.sales_order_id = int_sr.sales_order_id

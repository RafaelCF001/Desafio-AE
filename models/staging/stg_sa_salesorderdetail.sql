{{config(materialized='view')}}

SELECT 
    salesorderid as sales_order_id,
    salesorderdetailid as sales_order_detail_id,
    productid as product_id,
    orderqty as order_qty,
    unitprice as unit_price,
    unitpricediscount as unit_price_discount,
    (unitprice * (1.0 - unitpricediscount) * orderqty) as caculated_line_total,
    modifieddate as modified_date
FROM {{source('raw_adventure_works', 'sales_salesorderdetail')}}
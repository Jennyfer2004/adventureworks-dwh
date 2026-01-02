{{ config(materialized='table') }}

select
    salesorderid,
    salesorderdetailid,
    carriertrackingnumber,
    orderqty,
    productid,
    specialofferid,
    unitprice,
    unitpricediscount,
    (unitprice * (1.0 - unitpricediscount)) * orderqty as linetotal
from {{ source('bronze', 'core_salesorderdetail') }}
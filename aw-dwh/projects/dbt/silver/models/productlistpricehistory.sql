{{ config(materialized='table') }}

select
    productid,
    startdate,
    enddate,
    listprice
from {{ source('bronze', 'core_productlistpricehistory') }}
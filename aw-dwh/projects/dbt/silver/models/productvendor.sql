{{ config(materialized='table') }}

select
    productid,
    businessentityid,
    averageleadtime,
    standardprice,
    lastreceiptcost,
    lastreceiptdate,
    minorderqty,
    maxorderqty,
    onorderqty,
    unitmeasurecode
from {{ source('bronze', 'core_productvendor') }}
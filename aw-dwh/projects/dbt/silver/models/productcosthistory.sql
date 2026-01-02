{{ config(materialized='table') }}

select
    productid,
    startdate,
    enddate,
    standardcost
from {{ source('bronze', 'core_productcosthistory') }}
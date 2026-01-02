{{ config(materialized='table') }}

select
    productid,
    locationid,
    shelf,
    bin,
    quantity
from {{ source('bronze', 'core_productinventory') }}
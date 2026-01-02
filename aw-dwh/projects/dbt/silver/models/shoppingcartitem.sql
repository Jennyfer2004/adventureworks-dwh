{{ config(materialized='table') }}

select
    shoppingcartitemid,
    shoppingcartid,
    quantity,
    productid,
    datecreated
from {{ source('bronze', 'core_shoppingcartitem') }}
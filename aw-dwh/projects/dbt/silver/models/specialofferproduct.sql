{{ config(materialized='table') }}

select
    specialofferid,
    productid
from {{ source('bronze', 'core_specialofferproduct') }}
{{ config(materialized='table') }}

select
    specialofferid,
    description,
    discountpct,
    type,
    category,
    startdate,
    enddate,
    minqty,
    maxqty
from {{ source('bronze', 'core_specialoffer') }}
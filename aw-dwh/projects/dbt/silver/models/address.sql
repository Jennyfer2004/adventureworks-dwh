{{ config(materialized='table') }}

select
    addressid,
    addressline1,
    addressline2,
    city,
    stateprovinceid,
    postalcode,
    spatiallocation
from {{ source('bronze', 'core_address') }}
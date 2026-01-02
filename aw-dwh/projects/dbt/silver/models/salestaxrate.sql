{{ config(materialized='table') }}

select
    salestaxrateid,
    stateprovinceid,
    taxtype,
    taxrate,
    name
from {{ source('bronze', 'core_salestaxrate') }}
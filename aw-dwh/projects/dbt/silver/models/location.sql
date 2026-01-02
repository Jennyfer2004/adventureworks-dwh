{{ config(materialized='table') }}

select
    locationid,
    name,
    costrate,
    availability
from {{ source('bronze', 'core_location') }}
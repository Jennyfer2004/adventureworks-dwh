{{ config(materialized='table') }}

select
    shipmethodid,
    name,
    shipbase,
    shiprate
from {{ source('bronze', 'core_shipmethod') }}
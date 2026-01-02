{{ config(materialized='table') }}

select
    businessentityid,
    territoryid,
    startdate,
    enddate
from {{ source('bronze', 'core_salesterritoryhistory') }}
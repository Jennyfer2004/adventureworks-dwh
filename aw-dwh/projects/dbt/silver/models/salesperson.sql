{{ config(materialized='table') }}

select
    businessentityid,
    territoryid,
    salesquota,
    bonus,
    commissionpct,
    salesytd,
    saleslastyear
from {{ source('bronze', 'core_salesperson') }}
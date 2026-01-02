{{ config(materialized='table') }}

select
    businessentityid,
    quotadate,
    salesquota
from {{ source('bronze', 'core_salespersonquotahistory') }}
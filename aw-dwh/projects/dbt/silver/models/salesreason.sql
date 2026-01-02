{{ config(materialized='table') }}

select
    salesreasonid,
    name,
    reasontype
from {{ source('bronze', 'core_salesreason') }}
{{ config(materialized='table') }}

select
    salesorderid,
    salesreasonid
from {{ source('bronze', 'core_salesorderheadersalesreason') }}
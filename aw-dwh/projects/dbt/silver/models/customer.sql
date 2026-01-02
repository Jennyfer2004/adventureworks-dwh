{{ config(materialized='table') }}

select
    customerid,
    personid,
    storeid,
    territoryid,
    accountnumber
from {{ source('bronze', 'core_customer') }}
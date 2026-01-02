{{ config(materialized='table') }}

select
    currencycode,
    name
from {{ source('bronze', 'core_currency') }}
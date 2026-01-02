{{ config(materialized='table') }}

select
    creditcardid,
    cardtype,
    cardnumber,
    expmonth,
    expyear
from {{ source('bronze', 'core_creditcard') }}
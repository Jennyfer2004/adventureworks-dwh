{{ config(materialized='table') }}

select
    businessentityid,
    creditcardid
from {{ source('bronze', 'core_personcreditcard') }}
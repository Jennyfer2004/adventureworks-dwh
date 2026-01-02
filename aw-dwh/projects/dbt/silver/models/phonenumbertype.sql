{{ config(materialized='table') }}

select
    phonenumbertypeid,
    name
from {{ source('bronze', 'core_phonenumbertype') }}
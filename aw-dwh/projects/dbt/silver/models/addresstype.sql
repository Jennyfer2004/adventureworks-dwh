{{ config(materialized='table') }}

select 
    addresstypeid, 
    name
from {{ source('bronze', 'core_addresstype') }}

{{ config(materialized='table') }}

select
    businessentityid,
    addressid,
    addresstypeid
from {{ source('bronze', 'core_businessentityaddress') }}
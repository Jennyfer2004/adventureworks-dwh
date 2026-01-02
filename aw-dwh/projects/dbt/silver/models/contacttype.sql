{{ config(materialized='table') }}

select
    contacttypeid,
    name
from {{ source('bronze', 'core_contacttype') }}
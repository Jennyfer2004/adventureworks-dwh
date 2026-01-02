{{ config(materialized='table') }}

select
    businessentityid
from {{ source('bronze', 'core_businessentity') }}
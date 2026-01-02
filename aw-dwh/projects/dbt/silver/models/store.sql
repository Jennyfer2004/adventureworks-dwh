{{ config(materialized='table') }}

select
    businessentityid,
    name,
    salespersonid,
    demographics
from {{ source('bronze', 'core_store') }}
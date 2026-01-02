{{ config(materialized='table') }}

select
    productmodelid,
    name,
    catalogdescription,
    instructions
from {{ source('bronze', 'core_productmodel') }}
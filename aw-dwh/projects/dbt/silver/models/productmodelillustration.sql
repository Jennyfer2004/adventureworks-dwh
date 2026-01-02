{{ config(materialized='table') }}

select
    productmodelid,
    illustrationid
from {{ source('bronze', 'core_productmodelillustration') }}
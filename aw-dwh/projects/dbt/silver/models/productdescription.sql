{{ config(materialized='table') }}

select
    productdescriptionid,
    description
from {{ source('bronze', 'core_productdescription') }}
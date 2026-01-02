{{ config(materialized='table') }}

select
    productcategoryid,
    name
from {{ source('bronze', 'core_productcategory') }}
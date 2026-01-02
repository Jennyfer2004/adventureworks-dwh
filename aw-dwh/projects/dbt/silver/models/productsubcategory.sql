{{ config(materialized='table') }}

select
    productsubcategoryid,
    productcategoryid,
    name
from {{ source('bronze', 'core_productsubcategory') }}
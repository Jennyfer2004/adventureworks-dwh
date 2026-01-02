{{ config(materialized='table') }}

select
    productid,
    productphotoid,
    "primary"
from {{ source('bronze', 'core_productproductphoto') }}
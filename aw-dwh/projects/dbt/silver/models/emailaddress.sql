{{ config(materialized='table') }}

select
    businessentityid,
    emailaddressid,
    emailaddress
from {{ source('bronze', 'core_emailaddress') }}
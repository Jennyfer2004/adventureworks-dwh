{{ config(materialized='table') }}

select
    businessentityid,
    passwordhash,
    passwordsalt
from {{ source('bronze', 'core_password') }}
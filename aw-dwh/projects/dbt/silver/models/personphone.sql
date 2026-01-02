{{ config(materialized='table') }}

select
    businessentityid,
    phonenumber,
    phonenumbertypeid
from {{ source('bronze', 'core_personphone') }}
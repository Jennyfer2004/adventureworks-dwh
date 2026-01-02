{{ config(materialized='table') }}

select
    businessentityid,
    personid,
    contacttypeid
from {{ source('bronze', 'core_businessentitycontact') }}
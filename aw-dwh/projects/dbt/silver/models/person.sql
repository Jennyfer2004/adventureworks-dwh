{{ config(materialized='table') }}

select
    businessentityid,
    persontype,
    namestyle,
    title,
    firstname,
    middlename,
    lastname,
    suffix,
    emailpromotion,
    additionalcontactinfo,
    demographics
from {{ source('bronze', 'core_person') }}
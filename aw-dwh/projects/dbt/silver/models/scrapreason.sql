{{ config(materialized='table') }}

select
    scrapreasonid,
    name
from {{ source('bronze', 'core_scrapreason') }}
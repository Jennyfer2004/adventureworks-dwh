{{ config(materialized='table') }}

select
    unitmeasurecode,
    name
from {{ source('bronze', 'core_unitmeasure') }}
{{ config(materialized='table') }}

select
    illustrationid,
    diagram
from {{ source('bronze', 'core_illustration') }}
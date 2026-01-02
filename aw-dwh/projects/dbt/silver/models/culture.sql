{{ config(materialized='table') }}

select
    case
        when cultureid is null then 'inv' -- fix Namibia null country region code
        else cultureid
    end as cultureid,
    name
from {{ source('bronze', 'core_culture') }}
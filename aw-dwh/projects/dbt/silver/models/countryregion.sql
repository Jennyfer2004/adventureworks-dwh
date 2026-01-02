{{ config(materialized='table') }}

select
    case
        when countryregioncode is null then 'NA' -- fix Namibia null country region code
        else countryregioncode
    end as countryregioncode,
    name
from {{ source('bronze', 'core_countryregion') }}
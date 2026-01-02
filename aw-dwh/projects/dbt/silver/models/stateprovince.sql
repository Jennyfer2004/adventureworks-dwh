{{ config(materialized='table') }}

select
    stateprovinceid,
    stateprovincecode,
    case
        when countryregioncode is null then 'NA' -- fix Namibia null country region code
        else countryregioncode
    end as countryregioncode,
    isonlystateprovinceflag,
    name,
    territoryid
from {{ source('bronze', 'core_stateprovince') }}
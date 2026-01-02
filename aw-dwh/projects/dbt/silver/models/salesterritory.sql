{{ config(materialized='table') }}

select
    territoryid,
    name,
    case
        when countryregioncode is null then 'NA' -- fix Namibia null country region code
        else countryregioncode
    end as countryregioncode,
    "group",
    salesytd,
    saleslastyear,
    costytd,
    costlastyear
from {{ source('bronze', 'core_salesterritory') }}
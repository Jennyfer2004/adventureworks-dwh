{{ config(materialized='table') }}

select
    productmodelid,
    productdescriptionid,
    case
        when cultureid is null then 'inv' -- fix Namibia null country region code
        else cultureid
    end as cultureid
from {{ source('bronze', 'core_productmodelproductdescriptionculture') }}
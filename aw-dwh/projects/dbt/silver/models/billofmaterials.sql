{{ config(materialized='table') }}

select
    billofmaterialsid,
    productassemblyid,
    componentid,
    startdate,
    enddate,
    unitmeasurecode,
    bomlevel,
    perassemblyqty
from {{ source('bronze', 'core_billofmaterials') }}
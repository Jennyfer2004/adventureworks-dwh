{{ config(materialized='table') }}

select
    productid,
    name,
    productnumber,
    makeflag,
    finishedgoodsflag,
    color,
    safetystocklevel,
    reorderpoint,
    standardcost,
    listprice,
    size,
    sizeunitmeasurecode,
    weightunitmeasurecode,
    weight,
    daystomanufacture,
    productline,
    class,
    style,
    productsubcategoryid,
    productmodelid,
    sellstartdate,
    sellenddate,
    discontinueddate
from {{ source('bronze', 'core_product') }}
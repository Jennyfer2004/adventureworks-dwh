{{ config(materialized='table') }}

select
    purchaseorderid,
    revisionnumber,
    status,
    employeeid,
    vendorid,
    shipmethodid,
    orderdate,
    shipdate,
    subtotal,
    taxamt,
    freight,
    totaldue
from {{ source('bronze', 'core_purchaseorderheader') }}
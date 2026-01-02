{{ config(materialized='table') }}

select
    transactionid,
    productid,
    referenceorderid,
    referenceorderlineid,
    transactiondate,
    transactiontype,
    quantity,
    actualcost
from {{ source('bronze', 'core_transactionhistoryarchive') }}
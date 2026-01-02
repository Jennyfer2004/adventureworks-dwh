{{ config(materialized='table') }}

select
    workorderid,
    productid,
    operationsequence,
    locationid,
    scheduledstartdate,
    scheduledenddate,
    actualstartdate,
    actualenddate,
    actualresourcehrs,
    plannedcost,
    actualcost
from {{ source('bronze', 'core_workorderrouting') }}
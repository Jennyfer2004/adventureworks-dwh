{{ config(materialized='table') }}

select
    workorderid,
    productid,
    orderqty,
    scrappedqty,
    orderqty - scrappedqty as stockedqty,
    startdate,
    enddate,
    duedate,
    scrapreasonid
from {{ source('bronze', 'core_workorder') }}
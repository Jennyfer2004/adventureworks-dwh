{{ config(materialized='table') }}

select
    purchaseorderid,
    purchaseorderdetailid,
    duedate,
    orderqty,
    productid,
    unitprice,
    orderqty * unitprice as linetotal,
    receivedqty,
    rejectedqty,
    receivedqty - rejectedqty as stockedqty
from {{ source('bronze', 'core_purchaseorderdetail') }}
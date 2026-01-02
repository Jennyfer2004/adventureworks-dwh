{{ config(materialized='table') }}

select
    salesorderid,
    revisionnumber,
    orderdate,
    duedate,
    shipdate,
    status,
    onlineorderflag,
    salesordernumber,
    purchaseordernumber,
    accountnumber,
    customerid,
    salespersonid,
    territoryid,
    billtoaddressid,
    shiptoaddressid,
    shipmethodid,
    creditcardid,
    creditcardapprovalcode,
    currencyrateid,
    subtotal,
    taxamt,
    freight,
    totaldue,
    comment
from {{ source('bronze', 'core_salesorderheader') }}
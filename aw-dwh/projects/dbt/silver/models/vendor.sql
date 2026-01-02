{{ config(materialized='table') }}

select
    businessentityid,
    accountnumber,
    name,
    creditrating,
    preferredvendorstatus,
    activeflag,
    purchasingwebserviceurl
from {{ source('bronze', 'core_vendor') }}
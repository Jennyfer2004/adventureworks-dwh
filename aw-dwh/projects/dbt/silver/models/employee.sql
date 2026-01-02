{{ config(materialized='table') }}

select
    businessentityid,
    nationalidnumber,
    loginid,
    jobtitle,
    birthdate,
    maritalstatus,
    gender,
    hiredate,
    salariedflag,
    vacationhours,
    sickleavehours,
    currentflag
from {{ source('bronze', 'core_employee') }}
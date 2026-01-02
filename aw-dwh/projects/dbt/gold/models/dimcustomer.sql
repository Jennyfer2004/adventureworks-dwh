{{ config(
    materialized='table'
) }}

with customer as (
    select *
    from {{ source('silver', 'customer') }}
),

person as (
    select *
    from {{ source('silver', 'person') }}
)

select
    {{ dbt_utils.generate_surrogate_key([
        "'aw_core'",
        "p.businessentityid"
    ]) }} as customerid,
    c.customerid as altcustomerid,
    p.persontype,
    p.title,
    p.firstname,
    p.middlename,
    p.lastname,
    p.emailpromotion
from customer c
inner join person p
    on p.businessentityid = c.personid
where c.storeid is null

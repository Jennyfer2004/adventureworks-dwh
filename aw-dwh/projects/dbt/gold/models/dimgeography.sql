{{ config(
    materialized='table'
) }}
with address as (
    select *
    from {{ source('silver', 'address') }}
),
stateprovince as (
    select *
    from {{ source('silver', 'stateprovince') }}
),
territory as (
    select *
    from {{ source('silver', 'salesterritory') }}
),
country as (
    select *
    from {{ source('silver', 'countryregion') }}
)
select
    row_number() over () as geographyid,
    a.city,
    a.postalcode,
    sp.name as stateprovincename,
    sp.stateprovincecode,
    st.name as territory,
    cr.name as countryname,
    st.countryregioncode as countrycode,
    st."group" as groupname  -- rename to avoid reserved keyword issues
from address a
inner join stateprovince sp
    on a.stateprovinceid = sp.stateprovinceid
inner join territory st
    on st.territoryid = sp.territoryid
inner join country cr
    on cr.countryregioncode = st.countryregioncode
group by 
    a.city,
    a.postalcode,
    sp.name,
    sp.stateprovincecode,
    st.name,
    cr.name,
    st.countryregioncode,
    st."group"

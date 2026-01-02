{{ config(
    materialized='table'
) }}
with territory as (
    select *
    from {{ source('silver', 'salesterritory') }}
),
country as (
    select *
    from {{ source('silver', 'countryregion') }}
)
select
    row_number() over () as salesterritoryid,
    st.territoryid as altsalesterritoryid,
    st.name as territory,
    cr.name as countryname,
    st.countryregioncode as countrycode,
    st."group" as groupname  -- rename to avoid reserved keyword issues
from territory st
inner join country cr
    on cr.countryregioncode = st.countryregioncode
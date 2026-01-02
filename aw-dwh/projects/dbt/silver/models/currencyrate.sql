{{ config(materialized='table') }}

select
    currencyrateid,
    currencyratedate,
    fromcurrencycode,
    tocurrencycode,
    averagerate,
    endofdayrate
from {{ source('bronze', 'core_currencyrate') }}
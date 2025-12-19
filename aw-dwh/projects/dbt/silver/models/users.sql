{{ config(materialized='table') }}

select 
    id
from {{ source('bronze', 'review_users') }}

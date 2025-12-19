{{ config(materialized='table') }}

select 
    id,
    product,
    rating,
    date,
    userid
from {{ source('bronze', 'review_reviews') }}

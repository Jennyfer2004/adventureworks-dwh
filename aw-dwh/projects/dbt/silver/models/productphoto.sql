{{ config(materialized='table') }}

select
    productphotoid,
    thumbnailphoto,
    thumbnailphotofilename,
    largephoto,
    largephotofilename
from {{ source('bronze', 'core_productphoto') }}
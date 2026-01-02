{{ config(materialized='table') }}

select
    jobcandidateid,
    businessentityid,
    resume
from {{ source('bronze', 'core_jobcandidate') }}
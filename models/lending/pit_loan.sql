{{ config(materialized='table') }}

select
    loan_hk,
    max(load_date) as pit_load_date
from {{ ref('sat_loan_details') }}
group by loan_hk

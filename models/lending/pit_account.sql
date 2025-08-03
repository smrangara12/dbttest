{{ config(materialized='table') }}

select
    account_hk,
    max(load_date) as pit_load_date
from {{ ref('sat_account_balance') }}
group by account_hk

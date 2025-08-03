{{ config(materialized='table') }}

select
    a.account_hk,
    a.pit_load_date,
    b.customer_hk
from {{ ref('pit_account') }} a
left join {{ ref('link_account_customer') }} b
  on a.account_hk = b.account_hk

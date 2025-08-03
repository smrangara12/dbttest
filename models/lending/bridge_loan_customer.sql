{{ config(materialized='table') }}

select
    a.loan_hk,
    a.pit_load_date,
    b.customer_hk
from {{ ref('pit_loan') }} a
left join {{ ref('link_loan_customer') }} b
  on a.loan_hk = b.loan_hk

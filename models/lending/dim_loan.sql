{{ config(materialized='view') }}

select
    l.loan_id,
    s.principal_amount,
    s.interest_rate,
    s.loan_term_days,
    s.active_flag
from {{ ref('hub_loan') }} l
join {{ ref('bv_loan_summary') }} s
    on l.loan_hk = s.loan_hk
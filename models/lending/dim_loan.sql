select
    h.loan_hk as loan_key,
    h.loan_id,
    s.loan_type,
    s.loan_amount,
    s.interest_rate,
    s.effective_date
from {{ ref('hub_loan') }} h
left join {{ ref('sat_loan_details') }} s
  on h.loan_hk = s.loan_hk

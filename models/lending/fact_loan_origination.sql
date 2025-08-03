select
    l.loan_customer_link_hk as fact_key,
    l.load_date as origination_date,
    c.customer_key,
    d.loan_key,
    d.loan_amount,
    d.interest_rate
from {{ ref('link_loan_customer') }} l
join {{ ref('dim_customer') }} c
  on l.customer_hk = c.customer_key
join {{ ref('dim_loan') }} d
  on l.loan_hk = d.loan_key

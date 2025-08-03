select
    l.account_customer_link_hk as fact_key,
    a.account_key,
    c.customer_key,
    s.balance,
    s.load_date
from {{ ref('link_account_customer') }} l
join {{ ref('dim_account') }} a
  on l.account_hk = a.account_key
join {{ ref('dim_customer') }} c
  on l.customer_hk = c.customer_key
join {{ ref('sat_account_balance') }} s
  on l.account_hk = s.account_hk

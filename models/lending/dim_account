select
    h.account_hk as account_key,
    h.account_id,
    s.account_type,
    s.balance
from {{ ref('hub_account') }} h
left join {{ ref('sat_account_balance') }} s
  on h.account_hk = s.account_hk

{{ config(materialized='incremental') }}

select
    u.customer_id,
    u.credit_limit,
    u.outstanding_balance,
    round((u.outstanding_balance / u.credit_limit)::numeric, 2) as utilization_ratio,
    u.utilization_month
from credit_utilization u
<<<<<<< HEAD
=======

>>>>>>> d5351df8a9241cbb3135570ed7c407fce9dd3539

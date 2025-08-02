{{ config(materialized='incremental') }}

select
    r.repayment_id,
    r.loan_id,
    r.payment_amount,
    r.payment_date,
    r.principal_component,
    r.interest_component,
    current_timestamp as load_date
from loan_payments r



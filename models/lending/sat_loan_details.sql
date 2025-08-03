{{ config(materialized='incremental') }}

select
    {{ dbt_utils.generate_surrogate_key(['loan_id']) }} as loan_hk,
    {{ dbt_utils.generate_surrogate_key(['loan_id', 'loan_type', 'loan_amount', 'interest_rate']) }} as loan_hashdiff,
    loan_type,
    loan_amount,
    interest_rate,
    effective_date,
    current_timestamp as load_date,
    'loan_source' as record_source
from {{ ref('stg_corebank_loans') }}

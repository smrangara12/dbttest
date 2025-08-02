{{ config(materialized='incremental') }}

select
    {{ dbt_utils.generate_surrogate_key('loan_id') }} as loan_hk,
    interest_rate,
    principal_amount,
    disbursement_date,
    maturity_date,
    status,
    {{ dbt_utils.generate_surrogate_key(['loan_id', 'interest_rate', 'principal_amount']) }} as hashdiff,
    current_timestamp as load_date,
    '{{ invocation_id }}' as record_source
from {{ ref('stg_corebank_loans') }}




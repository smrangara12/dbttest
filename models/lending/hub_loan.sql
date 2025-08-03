{{ config(materialized='incremental') }}

select
    {{ dbt_utils.generate_surrogate_key(['loan_id']) }} as loan_hk,
    loan_id,
    current_timestamp as load_date,
    'loan_source' as record_source
from {{ ref('stg_corebank_loans') }}





